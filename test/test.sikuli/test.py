from sikuli import *
from subprocess import Popen

Popen(["google-chrome", 
            "--no-default-browser-check", 
            "--make-default-browser" 
            "--no-sandbox", 
            "--start-maximized", 
            "--disable-save-password-bubble", 
            #"--proxy-server=http://proxy:8080", 
            "http://www.google.com?q=kkochubey1 sikuli novnc"])

click("1449713909820.png")

click("kkochubevll.png")

exists("PUBLICAUTOMA.png")