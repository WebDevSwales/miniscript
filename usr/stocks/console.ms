clear
display(5).clear
display(6).mode = displayMode.sprite
backDis = display(6)
backDis.clear

underlay = new Sprite
underlay.image = file.loadImage("/usr/sprites/background.png")

overlay = new Sprite
overlay.image = file.loadImage("/usr/sprites/stocksBar.png")

main = new Sprite
main.image = file.loadImage("/usr/sprites/main.png")

main.x = (main.image.width/2)+30
main.y = main.image.height

overlay.x = 810
overlay.y = (overlay.image.height/2)+30

underlay.x = underlay.image.width/2
underlay.y = underlay.image.height/2

backDis.sprites.push underlay
backDis.sprites.push overlay
backDis.sprites.push main

text.row = 23
text.column = 49
print "Stock"
text.column = 49
print " online Store"
text.column = 49
print "Price"
text.column = 49
print " 30"