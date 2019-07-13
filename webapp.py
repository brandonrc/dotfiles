from flask import Flask,redirect
from flask import request
from flask import jsonify
import os
import random
import string
import time


app = Flask(__name__)

def randomStringDigits(stringLength=10):
    """Generate a random string of letters and digits """
    lettersAndDigits = string.ascii_letters + string.digits
    return ''.join(random.choice(lettersAndDigits) for i in range(stringLength))

@app.route('/')
def hello_world():
    #Variables
    port = random.randint(30000,50000)
    name = randomStringDigits(10)
    host = '10.1.1.136'

    startDocker = 'docker run -d --name ' + str(name) + ' -p ' + str(port) + ':6901 consol/ubuntu-xfce-vnc'
    url = 'http://' + str(host) + ':'+ str(port) + '/?password=vncpassword'

    os.system(startDocker)
    time.sleep(1)

    return redirect(url)

@app.route("/get_my_ip",methods=["GET"])
def get_my_ip():
    return jsonify({'ip': request.remote_addr}),200
