# Create your views here.

from django.shortcuts import render
from website.models import Product, Category, Cart
from django.contrib.auth.models import User
from datetime import datetime
import json
import stripe
from django.conf import settings
from django.core.paginator import Paginator

from django.http import HttpResponse, HttpResponseRedirect

from utils import generate_user_hash

def login(request):
  return ""

def logout(request):
  return ""

def register(request):
  return ""

def home(request):
  template_data = {}
  template_data['categories'] = Category.objects.all()
  template_data['user'] = request.user
  return render(request, 'index.html', template_data)

def about(request):
  return ""

def product(request, product_id, product_name):
  template_data = {}
  template_data['categories'] = Category.objects.all()

  # try:
  print(request.session.session_key)
  print(request.session._session_key)
  print(dir(request.session))

  session_key = request.session.session_key

  try:
    user = User.objects.get(profile__session=session_key)
  except User.DoesNotExist:
    user = User(username=generate_user_hash())
    user.save()
    user.profile.session = session_key
    user.profile.save()

  try:
    bag = user.cart.all()[0]
  except:
    bag = Cart(user=user)
    bag.save()
  template_data['bag'] = json.dumps(bag.get_json())

  product = Product.objects.get(pk=product_id)
  product.colors = []
  for stock in product.stock_items.all():
    for color in stock.colors.all():
      if color not in product.colors:
        product.colors.append(color)


  template_data['product'] = product
  template_data['productJSON'] = json.dumps(product.get_json())
  return render(request, 'product.html', template_data)

def shop(request, category=""):
  template_data = {}
  template_data['categories'] = Category.objects.all()

  products = Product.objects.filter(publish_date__lte=datetime.now())

  category_instance = ''
  if category:
    category_instance = Category.objects.get(slug__iexact=category)
    products = products.filter(category=category_instance)
  else:
    products = products.filter(publish_date__lte=datetime.now())

  template_data['products'] = [ json.dumps(product.get_json()) for product in products ]

  # REMOVING PAGINATION ON BACKEND AND SENDING ALL
  # PRODUCT DATA FOR THE FRONTEND TO DEAL WITH
  #
  # paginator = Paginator(products, 20)
  # page_number = request.GET.get('page', 1)
  # page = paginator.page(page_number)
  # try:
  #   page_objects = page.object_list
  # except:
  #   return HttpResponseBadRequest(mimetype="json")

  # print 'PAGE NUMBER', page_number
  # template_data['page'] = page
  # template_data['products'] = page_objects
  # template_data['category'] = category_instance
  return render(request, 'products.html', template_data)


def bag(request):
  template_data = {}
  template_data['categories'] = Category.objects.all()

  if request.user.cart.all():
    bag = request.user.cart.all()[0]
  else:
    bag = Cart(user=request.user)
    bag.save()

  if request.method == 'POST':
    stock_id = request.POST.get('stock_id')
    stock_item = StockItem.objects.get(pk=stock_id)

    # NOW NEED TO ADD NEW CART ITEMS TO BAG
    cart_item = CartItem(stock_item=stock_item, quantity=1,
      price_per=stock_item.product.price, cart=bag)
    cart_item.save()

  template_data['bag'] = bag
  return render(request, 'bag.html', template_data)

def checkout(request):
  if request.method == u'POST':
    stripe.api_key = "sk_test_AEdHaIntz1aeKwSLHsN8ENpZ"
    data = json.loads(request.body)

    response = stripe.Charge.create(
      amount = data['total'] + data['salesTax'],
      currency = 'usd',
      card = data['token'], # obtained with Stripe.js
      description = 'Charge for test@example.com'
    )

    data = json.dumps(response)
    return HttpResponse(data, mimetype='application/json')

def confirmation(request):
  return ""
