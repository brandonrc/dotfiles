# /bin/python3

import os
import random
import string

def randomStringDigits(stringLength=10):
    """Generate a random string of letters and digits """
    lettersAndDigits = string.ascii_letters + string.digits
    return ''.join(random.choice(lettersAndDigits) for i in range(stringLength))

#Variables
port = random.randint(30000,50000)
name = randomStringDigits(10)

startDocker = 'docker run -d --name ' + str(name) + ' -p ' + str(port) + ':6901 consol/ubuntu-xfce-vnc'

print(startDocker)

os.system(startDocker)
