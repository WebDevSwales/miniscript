Sprite.m = 0
Sprite.speak = function
	for a in s.indexes
		t = time
		letter = new Sprite
		letter.image = file.loadImage("/usr/sprites/" +s[a]+".png")
		letter.x= self.x + 10 + (a*10)
		letter.y= self.y + 10
		letter.m = t
		display(4).sprites.push letter
		letters.push self
	end for
end function

jeff = new Sprite
jeff.image = file.loadImage("/usr/sprites/" + str(ceil(rnd*5))+".png")
jeff.x = floor(rnd*500)
jeff.y = floor(rnd*500)
jeff.scale = 2

andrew = new Sprite
andrew.image = file.loadImage("/usr/sprites/" + str(ceil(rnd*5))+".png")
andrew.x = floor(rnd*500)
andrew.y = floor(rnd*500)
andrew.scale = 2
