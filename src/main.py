from gpiozero import LED, Button
from time import sleep
from signal import pause

def when_pressed():
    print("toggling status")
    led.toggle()

led = LED(17)
button = Button(4, bounce_time=0.3)

button.when_pressed = when_pressed

pause()