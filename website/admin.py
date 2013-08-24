from django.contrib import admin
from website.models import Product, Category, SubCategory, Promo, \
        UserProfile, ProductImage, Thumbnail, StockItem, Color

#https://docs.djangoproject.com/en/1.5/intro/tutorial02/#adding-related-objects

# SIMPLE MODEL_ADMIN
#class ProductAdmin(admin.ModelAdmin):
#    fields = ['pub_date', 'question']

# MORE ADVANCED PRODUCT ADMIN
#class ProductAdmin(admin.ModelAdmin):
#    fieldsets = [
#        (None,               {'fields': ['question']}),
#        ('Date information', {'fields': ['pub_date'], 'classes': ['collapse']}),
#    ]

class ProductImageInline(admin.StackedInline):
    model = ProductImage
    extra = 1


class ThumbnailInline(admin.StackedInline):
    model = Thumbnail
    extra = 1


class StockInline(admin.StackedInline):
    model = StockItem
    extra = 5


class ProductAdmin(admin.ModelAdmin):
    inlines = [ThumbnailInline,ProductImageInline,StockInline]


admin.site.register(Product, ProductAdmin)

admin.site.register(Category)
admin.site.register(SubCategory)
admin.site.register(Promo)
admin.site.register(UserProfile)
admin.site.register(Color)


