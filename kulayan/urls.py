from django.conf.urls import patterns, include, url
from django.conf import settings
from django.conf.urls.static import static
from django.views.generic import TemplateView

import admin_tools

# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
  url(r'^admin_tools/', include('admin_tools.urls')),
  # Examples:
  url(r'^$', 'website.views.home', name='home'),
  url(r'^shop/(?P<category>[-\w]+)/$', 'website.views.shop'),
  url(r'^shop/$', 'website.views.shop'),
  url(r'^bag/$', 'website.views.bag'),
  url(r'^checkout/$', 'website.views.checkout'),
  url(r'^about/$', TemplateView.as_view(template_name='about.html')),

  url(r'^product/(?P<product_id>\d+)/(?P<product_name>[-\w]+)/$', 'website.views.product'),

  url(r'^admin/doc/', include('django.contrib.admindocs.urls')),
  url(r'^admin/', include(admin.site.urls)),
) + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
