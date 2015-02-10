from django.contrib import admin
from content_banner.models import *

# Register your models here.
class imageInline(admin.StackedInline):
    model = content_banner
    extra = 1


class content_bannerAdmin(admin.ModelAdmin):
    list_display = ('name','category','create_date')
    search_fields = ('title','description',)
    ordering = ('create_date',)
    list_filter = ('status',)
    inline = (imageInline)

admin.site.register(content_banner, content_bannerAdmin)
