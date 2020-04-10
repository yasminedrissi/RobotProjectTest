# This Python file uses the following encoding: utf-8
import random, string

def getRandomNameRepo():
    a = ''.join(random.choice(string.ascii_lowercase + string.digits) for i in range(6))
    repo = a + '_repo'
    return repo