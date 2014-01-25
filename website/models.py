from django.contrib.auth.models import User
from django.db import models
from django.db.models.signals import pre_save, post_save
from django.dispatch import receiver
from django.template.defaultfilters import slugify

from datetime import datetime
import string
import random
import re
from unicodedata import normalize

### E-commerce Models

class Category(models.Model):
  name = models.CharField(max_length=128)
  slug = models.CharField(max_length=128, blank=True, null=True)
  def __unicode__(self):
    return self.name

  def get_url(self):
    return '/shop/{0}/'.format(self.slug)


class SubCategory(models.Model):
  name = models.CharField(max_length=128)
  category = models.ForeignKey(Category)
  def __unicode__(self):
    return self.name


class ProductImage(models.Model):
  height = models.PositiveIntegerField(blank=True, null=True)
  width = models.PositiveIntegerField(blank=True, null=True)
  image = models.ImageField(upload_to=lambda i, fn: 'images/products/%s' % (fn), \
    height_field='height', width_field='width', blank=True, null=True)
  product = models.ForeignKey('Product', related_name='images', blank=True, null=True)
  order = models.PositiveSmallIntegerField(default=0)

  class Meta:
    ordering = ['order']

  def get_json(self):
    return { 'url': self.image.url }

class Thumbnail(models.Model):
  image = models.ImageField(upload_to=lambda i, fn: 'images/thumbs/%s' % (fn), blank=True, null=True)
  product = models.ForeignKey('Product', related_name="thumbnail", blank=True, null=True)


class Color(models.Model):
  name = models.CharField(max_length=30)
  code = models.CharField(max_length=10)

  def __unicode__(self):
    return self.name

  def get_json(self):
    return {
      'name': self.name,
      'code': self.code
    }


class Product(models.Model):
  SALE_DOLLAR_VALUE = 0
  SALE_PERCENTAGE_VALUE = 1

  SALE_CHOICES = (
    (SALE_DOLLAR_VALUE, 'Dollar Value Sale'),
    (SALE_PERCENTAGE_VALUE, 'Percentage Value Sale'))

  name = models.CharField(max_length=128)
  sku = models.CharField(max_length=32)
  story = models.TextField()
  details = models.TextField()

  publish_date = models.DateField()
  price = models.IntegerField()

  sale_type = models.PositiveSmallIntegerField(null=True, blank=True, choices=SALE_CHOICES)
  sale_value = models.IntegerField(null=True, blank=True)
  sale_end_date = models.DateField(null=True, blank=True)

  category = models.ForeignKey(Category)
  sub_category = models.ForeignKey(SubCategory, null=True, blank=True)

  def __unicode__(self):
    return unicode(self.name)

  def get_url(self):
    return '/product/{0}/{1}/'.format(self.id, slugify(self.name))

  def get_json(self):
    colors = []
    for stock in self.stock_items.all():
      for color in stock.colors.all():
        if color not in colors:
          colors.append(color)

    return {
      'name': self.name,
      'sku': self.name,
      'story': self.story,
      'details': self.details,
      'url': self.get_url(),
      'publish_date': self.publish_date.isoformat(),
      'price': self.price,
      'sale_value': self.sale_value,
      'images': [ {
        'url': image.get_json()['url'],
        'height': image.height,
        'width': image.width
      } for image in self.images.all() ],
      'stock_items': [ stock_item.get_json() for stock_item in self.stock_items.all() ],
      'colors': [ color.get_json() for color in colors ]
    }

  class Meta:
    ordering = ['-publish_date']


class StockItem(models.Model):
  SIZES = (
    (0, 'Extra Small'),
    (1, 'Small'),
    (2, 'Medium'),
    (3, 'Large'),
    (4, 'Extra Large'))

  SIZES_ABR = (
    (0, 'XS'),
    (1, 'S'),
    (2, 'M'),
    (3, 'L'),
    (4, 'XL'))

  size = models.PositiveSmallIntegerField(choices=SIZES)
  stock = models.PositiveIntegerField(default=0)
  product = models.ForeignKey(Product, related_name='stock_items')
  colors = models.ManyToManyField(Color, null=True, blank=True)

  class Meta:
    unique_together = ['product', 'size']

  def get_size_name(self):
    return [size for size in self.SIZES if size[0] == self.size][0][1]

  def get_json(self):
    return {
      'size': self.size,
      'stock': self.stock,
      'size_value': self.get_size_value(),
      'color': [ color.get_json() for color in self.colors.all() ]
    }

  def get_size_value(self):
    return [size for size in self.SIZES_ABR if size[0] == self.size][0][1]

class Cart(models.Model):
  user = models.ForeignKey(User, unique=True, related_name='cart')
  cart_date = models.DateTimeField(auto_now_add=True)
  active = models.BooleanField(default=True)

  def get_json(self):
    return {
      'active': self.active,
      'cart_date': self.cart_date.isoformat(),
      'cart_items': [ cart_item.get_json() for cart_item in self.cart_items.all() ],
    }


class CartItem(models.Model):
  stock_item = models.ForeignKey(StockItem)
  quantity = models.PositiveIntegerField(default=1)
  price_per = models.DecimalField(max_digits=8, decimal_places=2)
  cart = models.ForeignKey(Cart, related_name='cart_items')

  def get_json(self):
    return {
      'price_per': self.price_per,
      'quantity': self.quantity,
      'stock_item': self.stock_item.get_json(),
    }


class Promo(models.Model):
  code = models.CharField(max_length=10)
  percent_off = models.FloatField(null=True, blank=True)
  flat_discount = models.FloatField(null=True, blank=True)
  available = models.BooleanField(default=True)

  def __unicode__(self):
    return self.code


class Order(models.Model):
  PENDING = 0
  SHIPPED = 1

  STATUS_CHOICES = (
    (PENDING, 'pending'),
    (SHIPPED, 'shipped')
  )

  user = models.ForeignKey(User)
  order_date = models.DateTimeField(auto_now_add=True)
  order_number = models.CharField(max_length=32, unique=True)
  status = models.PositiveSmallIntegerField(default=PENDING, choices=STATUS_CHOICES)
  salestax = models.DecimalField(max_digits=8, decimal_places=2, null=True)
  promo = models.ForeignKey(Promo, null=True, blank=True)
  discount = models.DecimalField(max_digits=8, decimal_places=2, null=True)
  total_price = models.DecimalField(max_digits=8, decimal_places=2, null=True)
  instructions = models.TextField(blank=True)

  shipping_name = models.CharField(max_length=64)
  shipping_address = models.CharField(max_length=128)
  shipping_city = models.CharField(max_length=64)
  shipping_state = models.CharField(max_length=20)
  shipping_country = models.CharField(max_length=32)
  shipping_postal_code = models.CharField(max_length=16)
  shipping_phone = models.CharField(max_length=20)

  class Meta:
    ordering = ['status', 'order_date']

  def __unicode__(self):
    return self.order_number


class OrderItem(models.Model):
  PENDING = 0
  SHIPPED = 1
  # if more statuses are added, the update function in OrderItemHandler
  # will need to be examined for marking order as shipped

  STATUS_CHOICES = (
    (PENDING, 'pending'),
    (SHIPPED, 'shipped')
  )

  name = models.CharField(max_length=128)

  order = models.ForeignKey(Order, related_name='orderitems')
  product = models.ForeignKey(Product, blank=True, null=True, on_delete=models.SET_NULL)
  status = models.PositiveSmallIntegerField(default=PENDING, choices=STATUS_CHOICES)


class SalesTax(models.Model):
  city = models.CharField(max_length=128)
  county = models.CharField(max_length=128)
  ltr = models.DecimalField(max_digits=4, decimal_places=2)
  gtr = models.DecimalField(max_digits=4, decimal_places=2)


# General Models
class UserProfile(models.Model):
  user = models.OneToOneField(User, related_name='profile')
  optin = models.BooleanField(default=True)
  session = models.CharField(max_length=128, blank=True, null=True)

  shipping_address = models.CharField(max_length=128, blank=True, null=True)
  shipping_city = models.CharField(max_length=64, blank=True, null=True)
  shipping_state = models.CharField(max_length=20, blank=True, null=True)
  shipping_country = models.CharField(max_length=32, blank=True, null=True)
  shipping_postal_code = models.CharField(max_length=16, blank=True, null=True)
  shipping_phone = models.CharField(max_length=20, blank=True, null=True)


  ref = models.ForeignKey(User, blank=True, null=True)
  ref_key = models.CharField(max_length=6, blank=True, null=True)
  promo_code = models.ForeignKey(Promo, blank=True, null=True)
  # de-normalized for efficiency
  referral_count = models.PositiveIntegerField(default=0)

  def set_referral(self, referrer):
    if self.ref != referrer:
      if self.ref and self.ref.profile.referral_count > 1:
        self.ref.profile.referral_count = self.ref.profile.referral_count - 1
        self.ref.profile.save()
      self.ref = referrer
      self.save()

      if referrer:
        referrer.profile.referral_count += 1
        referrer.profile.save()

  def __unicode__(self):
    return self.user.email


# Generate a referrer key
def generate_ref_key():
  return ''.join(random.choice(string.digits + string.ascii_uppercase) for x in range(6))

def create_user_profile(sender, instance, created, **kwargs):
  if created:
    key = generate_ref_key()
    # Generate unique key
    while 1:
      try:
        UserProfile.objects.get(ref_key=key)
        key = generate_ref_key()
      except UserProfile.DoesNotExist:
        break

    UserProfile.objects.create(user=instance, ref_key=key)

@receiver(pre_save, sender=Category)
def create_slug(sender, instance, **kwargs):
  print(instance)
  instance.slug = slugify(instance.name)


post_save.connect(create_user_profile, sender=User, dispatch_uid='website.models.create_user_profile')

_punct_re = re.compile(r'[\t !"#$%&\'()*\-/<=>?@\[\\\]^_`{|},.:+]+')

def slugify2(text, delim=u'-'):
  """Generates an slightly worse ASCII-only slug."""
  result = []
  for word in _punct_re.split(text.lower()):
    word = normalize('NFKD', word).encode('ascii', 'ignore')
    if word:
      result.append(word)
  return unicode(delim.join(result))
