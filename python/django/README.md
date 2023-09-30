# Django

> Sometimes time spent reinventing the wheel results in a revolutionary new rolling device. But sometimes it just amounts to time spent reinventing the wheel. - Steve Krug

---

### Models
```
from django.db import models
import uuid

class MyModel(models.Model):
    # Primitives
    char_field = models.CharField(max_length=120)
    text_field = models.TextField()
    integer_field = models.IntegerField()
    boolean_field = models.BooleanField()
    decimal_field = models.DecimalField(max_digits=5, decimal_places=2)

    # Validated/Specialized
    url = models.URLField(max_length=200)
    uuid = models.UUIDField(primary_key=True, default=uuid.uuid4)
    email = models.EmailField(max_length=254)
    json_data = models.JSONField()
    ip_address = models.GenericIPAddressField(protocol='both')

    # Time and Date
    timedelta_field = models.DurationField()
    time_field = models.TimeField(auto_now=False)
    datetime_field = models.DateTimeField(auto_now=False)
    date_field = models.DateField(auto_now=False)

    # Relationships
    foreign_key = models.ForeignKey(OtherObject, on_delete=models.CASCADE)
    many_to_many = models.ManyToManyField(OtherObject)
    one_to_one = models.OneToOneField(OtherObject, on_delete=models.CASCADE)

    # Override the save method
    def save(self, *args, **kwargs):
        # Make changes before save
        self.title = self.title.capitalize()

        # Call the parent method
        super(MyModel, self).save(*args, **kwards)

        # Do something after the save (send email, etc)
```

### Admin Panel
```
from django.contrib import admin
from .models import MyModel

class MyModelAdmin(admin.ModelAdmin):
    fields = ['url', 'email']  # Fields for add/edit/show page

admin.site.register(MyModel, MyModelAdmin)
```

### Routing

In `project_folder/urls.py`:

```
from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('app_name.urls'))
]
```

In `app_name/urls.py`:

```
from django.urls import path
from . import views

urlpatterns = [
    path('members/', views.members, name='members')
    path('articles/', views.articles, name='articles')
    path('articles/<uuid:article_uuid>/', views.article),
]

# <str:str_var>
# <uuid:uuid_var>
# <int:int_var>
```

### Base Template

This is the `base.html` template:

```
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="style.css">
    <title>{% block title %}My title{% endblock %}</title>
</head>
<body>
    <div id="sidebar">
        {% block sidebar %}
        <p>Child templates can override me!</p>
        {% endblock %}
    </div>

    <div id="content">
        {% block content %}
        {% endblock %}
    </div>
</body>
</html>
```

### HTML Templates
```
{% extends "base.html" %}

{% block title %}I override the base title!{% endblock %}

{% block content %}
{% for entry in blog_entries %}
    <h2>{{ entry.title }}</h2>
    <p>{{ entry.body }}</p>
{% endfor %}
{% endblock %}
```

### Template Filters
```
{{ value|default: "nothing" }}  # Render "nothing" if value is None/False
{{ value|length }}  # Renders the length of value
{{ value|filesizeformat }}  # Renders human-readable file size from number of bytes

# Humanize numbers (requires django.contrib.humanize in INSTALLED_APPS)
{% load humanize %}

{{ 45000|intcomma }}  # Renders humanized number

# Passing urls to templates
{% url 'some-url-name' arg1=v1 arg2=v2 %}

# Another example
path('client/<int:id>/', app_views.client, name='app-views-client')

{% url 'app-views-client' client.id %}
```

### HTML Forms with CSRF Protection
```
<form method="post" action="/post_me">
    {% csrf_token %}
    <label for="fname">First name:</label>
    <input type="text" id="fname" name="fname"></input>
    <input type="submit" value="Submit"></input>
</form>
```

### Creating Class-Based Forms

In `forms.py` in an app folder:

```
from django import forms


class ContactForm(forms.Form):
    subject = forms.CharField(max_length=100)
    message = forms.CharField(widget=forms.Textarea)
    sender = forms.EmailField()
    cc_myself = forms.BooleanField(required=False)
```

Each form has a corresponding widget class, which renders the form to an HTML
template.

### Rendering Forms in HTML Templates

In the template file:

```
<form action='...'>
    {{ form.as_div }}
</form>
```

Which results in the following being rendered:

```
<form action='...'>
    <div>
        <label for="id_subject">Subject:</label>
        <input type="text" name="subject" maxlength="100" required
            id="id_subject">
    </div>
    ...
</form>
```

### Class-Based Views

Add the view to the `urls.py` in the app folder:

```
from django.urls import path
from .views import MyClassView

urlconfig = [
    path('my_class_view/', MyClassView.as_view()),
]
```

Using the default `View` class:

```
from django.http import HttpResponseRedirect
from django.shortcuts import render
from django.views import View

class MyClassView(View):
    def get(self, request, *args, **kwargs):
        return render(request, template_name, context=context, content_type=None, status=None)

    def post(self, request, *args, **kwargs):
        return render(request, template_name, context=context, content_type=None, status=None)
```

Using the `TemplateView` class:

```
from django.views.generic.base import TemplateView
from articles.models import Article

class HomePageView(TemplateView):
    template_name = 'home.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['latest_articles'] = Article.objects.all()[:5]
        return context
```

Using the `ListView` class:

```
from django.utils import timezone
from django.views.generic.list import ListView

from articles.models import Article

class ArticleListView(ListView):
    model = Article
    paginate_by = 100  # If pagination is desired

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["now"] = timezone.now()
        return context

# path('articles/', ArticleListView.as_view(), name='article-list'),
# Template file would be in myapp/article_list.html
```

### Forms

Create the form in the `myapp/forms.py` file:

```
from django import forms
from django.core.exceptions import ValidationError

class ContactForm(forms.Form):
    subject = forms.CharField(max_length=100)
    message = forms.CharField(widget=forms.Textarea)
    sender = forms.EmailField()
    cc_myself = forms.BooleanField(required=False)

    def clean_subject(self):
        data = self.cleaned_data['subject']
        if data == 'URGENT':
            raise ValidationError('Subject cannot be URGENT')

        return data

    def clean(self):
        subject = self.cleaned_data['subject']
        message = self.cleaned_data['message']
        if subject == message:
            raise ValidationError('Subject and message cannot be the same!')
```

Use the form in a template:

```
from django.shortcuts import render
from .forms import ContactForm

def contact_view(request):
    context = {}
    context['form'] = ContactForm()
    return render(request, 'contact.html', context)
```

Finally, in the `contact.html` file:
```
<form action="" method="post">
    {% csrf_token %}
    {{ form }}
    <input type="submit" value="Submit">
</form>
```

### Authentication

The default user model:

```
from django.contrib.auth.models import User

# Create a user
user = User.objects.create_user('my_username', email='my_email@gmail.com')

user.first_name = 'Johnny'
user.last_name = 'Appleseed'

# Set a password
# Handles hashing
user.set_password(new_password)

user.save()

# Check a user's password
user.check_password(input_pass)  # Returns True if successful
```

The authentication flow:

```
from django.contrib.auth import authenticate

user = authenticate(username='johnny', password='secret')
if user is not None:
    # Backend authenticated the credentials
else:
    # No backend authenticated the credentials
```

Using the built-in authentication views in the `urls.py` file:

```
from django.urls import path
from django.contrib.auth import views as auth_views

urlpatterns = [
    path('login/', auth_views.LoginView.as_view(template_name='login.html')),
    path('logout/', auth_views.LogoutView.as_view(template_name='logout.html')),
    path('change-password/', auth_views.PasswordChangeView.as_view(template_name='change_password.html')),
    path('change-password/done/', auth_views.PasswordChangeDoneView.as_view(template_name='change_password_done.html')),
    path('password-reset/', auth_views.PasswordResetView.as_view(template_name='password_reset.html')),
    path('password-reset/done/', auth_views.PasswordResetDoneView.as_view(template_name='password_reset_done.html')),
    path('password-reset/confirm', auth_views.PasswordResetConfirmView.as_view(template_name='password_reset_confirm.html')),
]
```

Enforce authentication in function-based views:

```
from django.contrib.auth.decorators import login_required


# Will use settings.LOGIN_URL as the redirect url
# settings.LOGIN_URL is '/accounts/login/' by default
@login_required()
def my_view(request):
    ...
```

Enforce authentication in class-based views with a mixin:

```
from django.contrib.auth.mixins import LoginRequiredMixin


class MyView(LoginRequiredMixin, View):
    # Similar options to @login_required()
    # login_url = '/login/'
    # redirect_field_name = 'redirect_to'
```
