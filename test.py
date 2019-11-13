import requests
r = requests.get('http://172.16.14.24:3000/question')
print(r.json())