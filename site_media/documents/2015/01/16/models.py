from django.db import models

# Create your models here.

class head_banner(models.Model):
    def filePath(instance, filename):
        #val=u"head_banner_img/" + smart_unicode(filename)
        val = u"head_banner_img/" + str(filename)
        return val
    name = models.CharField(max_length=200)
    STATUS_CHOICES = (
        ('ACTIVE', 'Active'),
        ('INACTIVE', 'Inactive'),
        )
    status = models.CharField(max_length=8,
        choices=STATUS_CHOICES,
        default='ACTIVE')
    create_date = models.DateTimeField(null=True, blank=True, verbose_name="")
    url = models.CharField(max_length=200)
    images = models.FileField(upload_to=filePath, max_length=255, blank=True, null=True, default='',
        verbose_name=u"image")
    modified_date = models.DateTimeField(null=True, blank=True, verbose_name="modified")
    order = models.DecimalField(max_digits=65, decimal_places=0, null=True, blank=True, verbose_name=u"order")




