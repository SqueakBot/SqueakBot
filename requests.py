import argparse
import locale
import logging
import json

from aiy.board import Board, Led
from aiy.cloudspeech import CloudSpeechClient
import aiy.voice.tts

import requests
response = requests.get('http://172.16.14.24:3000/questions/challenges')
print(response.json())

jsonResponse = response.json()
def listToString(jsonResponse):
    strl = " "
    for ele in jsonResponse:
      strl += ele
    return strl

# Write function on pi to make a request on the signin route
responseSignin = requests.get('http://172.16.14.24:3000/signin')
# 
# Persit a token

def get_hints(language_code):
  if language_code.startswith('en_'):
      return ('turn on the light', 
              'hey squeakbot', 
              'turn off the light',
              'blink the light',
              'goodbye',
              'repeat after me',
              'give me a challenge')
      return None

def locale_language():
    language, _ = locale.getdefaultlocale()
    return language

##################################################

logging.info('You said: "%s" ' % text)
text = text.lower()
if 'turn on the light' in text:
  board.led.state = Led.on
elif 'hey squeakbot' in text: 
  squeaker = text.replace('hey squeakbot', 'Hello, you can ask me: give me a challenge or repeat the question', 1)
  aiy.voice.tts.say(squeaker)
elif 'give me challenge' in text: 
  squeaker = text.replace('give me a challenge', listToString(jsonResponse), 1)
  aiy.voice.tts.say(squeaker)
elif 'new challenge' in text:
  # Think of async/promise needed to wait for new Q from DB 
  squeaker = text.replace('new challenge', listToString(?????????), 1)
  aiy.voice.tts.say(squeaker)
