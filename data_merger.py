import bottle
from bottle import route, run, response ,static_file,get, post, request,template,redirect
import os



URL = "https://geocode.search.hereapi.com/v1/geocode"
#location = input("Enter the location here: ") #taking user input
api_key = 'd7qyuWHVaDSj8__qx-KAVeP1AWzTWQMHFHbEnX0zT7Q' # Acquire from developer.here.com
PARAMS = {'apikey':api_key }

# sending get request and saving the response as response object
#r = requests.get(url = URL, params = PARAMS)
#data = r.json()

#pandas==0.20.3pkg-resources==0.0.0


from json import dumps

import pandas as pd
import csv

dicts =  {'location': 'Centre', 'date': '2020-05-15', 'total_cases': '0', 'new_cases': '0', 'total_deaths': '0', 'new_deaths': '0', 'population': '0', 'latitude': '0', 'longitude': '0'}


app = application = bottle.default_app()

_allow_origin = '*'
_allow_methods = 'PUT, GET, POST, DELETE, OPTIONS'
_allow_headers = 'Authorization, Origin, Accept, Content-Type, X-Requested-With'

@app.hook('after_request')
def enable_cors():
    '''Add headers to enable CORS'''

    response.headers['Access-Control-Allow-Origin'] = _allow_origin
    response.headers['Access-Control-Allow-Methods'] = _allow_methods
    response.headers['Access-Control-Allow-Headers'] = _allow_headers

'''
@app.get('/<filepath:path>')
def server_static(filepath):
    return static_file(filepath, root='./') '''

@app.get('/')
def home():

    global dicts
    return template('home.tpl',dicts = dicts)

@app.post('/getCountry')
def getCountry():
    country = request.forms.get('country')
    dict = {}
    global dicts
    import csv
    ifile  = open('new.csv', "r")
    read = csv.reader(ifile)
    row = [row for row in read if row[0] == country]
    row = row[0]
    dict['location'] = row[0]
    dict['date'] = row[1]
    dict['total_cases'] = row[2]
    dict['new_cases'] = row[3]
    dict['total_deaths'] = row[4]
    dict['new_deaths'] = row[5]
    dict['population'] = row[10]
    dict['latitude'] = row[11]
    dict['longitude'] = row[12]
    dicts = dict
    #response.content_type = 'application/json'
    redirect("/")

if os.environ.get('APP_LOCATION') == 'heroku':
    run(host="0.0.0.0", port=int(os.environ.get("PORT", 5000)))
else:
    run(host='localhost', port=8000, debug=True)
