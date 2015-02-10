from django import forms
from django.conf import settings
from django.utils.safestring import mark_safe

class FckEditor(forms.Textarea):
	class Media:
		js = (
			'js/fckeditor/fckeditor.js',
		)

	def __init__(self, *args, **kwargs):
		attrs = kwargs.setdefault('attrs', {})
		if 'cols' not in attrs:
			attrs['cols'] = 58
		if 'rows' not in attrs:
			attrs['rows'] = 8
		super(FckEditor, self).__init__(*args, **kwargs)

	def render(self, name, value, attrs=None):
		rendered = super(FckEditor, self).render(name, value, attrs)
		return rendered + mark_safe(u'''<script type="text/javascript">
			var allPageTags = document.getElementsByTagName("textarea");
			var editors = new Array();
			for (i = 0; i < allPageTags.length; i++) {
				var oFCKeditor = new FCKeditor(allPageTags[i].id);
				oFCKeditor.BasePath = "%sjs/fckeditor/";
				oFCKeditor.Height = "400";
				oFCKeditor.ReplaceTextarea();
				editors.push(oFCKeditor);
			}
            </script>''' % settings.MEDIA_URL)

