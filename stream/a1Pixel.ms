import "character"
clear
people = []
letters=[]
s = "lewis is cool"
lastTime = 1



for p in character
	people.push p.value
end for

for p in people
	display(4).sprites.push p
	p.speak
end for

world = {}
world.speed = 0.1

for a in s.indexes
	letter = new Sprite
	letter.image = file.loadImage("/usr/sprites/" +s[a]+".png")
	letter.x= 100 + (a*10)
	letter.y= 100
	display(4).sprites.push letter
end for


while not key.pressed("escape")
	if time > lastTime + 1 then
		
		for p in people
			p.x = p.x + (floor(rnd*3)-1)
			p.y = p.y + (floor(rnd*3)-1)
			p.speak
		end for
		
		while	letter.len > 0		
			
			display(4).sprites.remove display(4).sprites.indexOf(letters[l])
			
		end while
	end if
	lastTime = time
	
end while