# stadiums/admin.py
from django.contrib import admin
from .models import Stadium

class StadiumAdmin(admin.ModelAdmin):
    list_display = ('stdName', 'stdNumberOfPlayer', 'stdUrlPicture', 'stdDescripLocation', 'stdProcedure', 'stdClosedId', 'stdClosedDate', 'stdClosedNote')
    search_fields = ('stdName', 'stdDescripLocation')

admin.site.register(Stadium, StadiumAdmin)