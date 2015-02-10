from django import forms

class imageUserForm(forms.Form):
    imagePath = forms.FileField(
        label='Select profile image',
    )

