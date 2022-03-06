Sprite.death = time + 10

spr = new Sprite
spr.image = file.loadImage("/sys/pics/Wumpus.png")
spr.x = 500
spr.y = 250

display(4).sprites.push spr



while not key.pressed("escape")
	if display(4).sprites.len then
		for s in display(4).sprites
			
			if s.death < time then
				display(4).sprites.remove 0
			end if
		end for
	end if
	if mouse.button then
		spr = new Sprite
		spr.image = file.loadImage("/sys/pics/Wumpus.png")
		spr.x = mouse.x
		spr.y = mouse.y
		spr.death = time + 5
		display(4).sprites.push spr
		wait 0.1
	end if
	yield
end while
