from django.http import HttpResponse
from .models import Visit

def ping(request):
    ip = request.META.get('REMOTE_ADDR')
    Visit.objects.create(ip=ip)
    return HttpResponse("pong")

def visits(request):
    count = Visit.objects.count()
    return HttpResponse(str(count))

def health(request):
    return HttpResponse("OK")