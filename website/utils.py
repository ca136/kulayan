import hashlib
import time

def create_user(request):
  pass

def generate_user_hash():
  hash = hashlib.sha1()
  hash.update(str(time.time()))
  return hash.hexdigest()[:10]