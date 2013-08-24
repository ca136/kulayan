# Create your views here.

from django.shortcuts import render
from website.models import Product, Category
from datetime import datetime

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

    product = Product.objects.get(pk=product_id)
    product.colors = []
    for stock in product.stock_items.all():
        for color in stock.colors.all():
            if color not in product.colors:
                product.colors.append(color)

    template_data['product'] = product
    return render(request, 'product.html', template_data)

def shop(request, category=""):
    template_data = {}
    template_data['categories'] = Category.objects.all()
    category_instance = ''
    if category:
        category_instance = Category.objects.get(slug__iexact=category)
        products = Product.objects.filter(category=category_instance)
    else:
        products = Product.objects.filter(publish_date__gte=datetime.now())
    template_data['products'] = products
    template_data['category'] = category_instance
    return render(request, 'products.html', template_data)


def cart(request):
    return ""

def checkout(request):
    return ""

def confirmation(request):
    return ""
