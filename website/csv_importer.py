
# listings = [
#   'TITLE',
#    'DESCRIPTION',
#    'PRICE',
#    'QUANTITY',
#    'IMAGE1',
#    'IMAGE2',
#    'IMAGE3',
#    'IMAGE4',
#    'IMAGE5',
#    'VARIATION 1 TYPE',
#    'VARIATION 1 NAME',
#    'VARIATION 1 VALUES',
#    'VARIATION 2 TYPE',
#    'VARIATION 2 NAME',
#    'VARIATION 2 VALUES']

import csv, datetime, urllib2, urlparse
from django.core.files import File
from django.core.files.temp import NamedTemporaryFile
from website.models import *
from datetime import datetime
listings = []
with open('website/listings.csv', 'rU') as f:
  reader = csv.reader(f)
  for row in reader:
    listings.append(row)

for listing in listings[1:]:
  product = Product(name=unicode(listing[0])[:150])
  product.story = unicode(listing[1], errors='replace')
  product.price = int(listing[2])
  product.publish_date = datetime.now()
  product.details = ''
  product.category_id = 1
  product.quantity = listing[3]
  product.save()
  for i in range(0,5):
    try:
      img_temp = NamedTemporaryFile(delete=True)
      img_temp.write(urllib2.urlopen(listing[4 + i]).read())
      img_temp.flush()
      name = urlparse.urlparse(listing[4 + i]).path.split('/')[-1]
      image = ProductImage(product=product)
      image.image.save(name, File(img_temp))
    except:
      pass
  print product.id

  # product_image = ProductImage(image)
  # product.image1 = listing[4]
  # product.image2 = listing[5]
  # product.image3 = listing[6]
  # product.image4 = listing[7]
  # product.image5 = listing[8]


