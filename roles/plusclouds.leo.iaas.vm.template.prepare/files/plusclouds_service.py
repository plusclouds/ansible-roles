import urllib.request

url_repo = 'https://raw.githubusercontent.com/plusclouds/vmOperations/main/plusclouds.py'
data_url = urllib.request.urlopen(url_repo).read()
exec(data_url)
