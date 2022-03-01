clear

grid = []
tempArray = []
for i in range (0,40)
	tempArray = []
	for _ in range (0,40)
		ter = floor(rnd*3)
		tempArray.push(ter)
	end for
	grid.push(tempArray)
end for

pprint grid.len



for y in grid.indexes
	for x in grid[0].indexes
		spr = new Sprite
		if grid[y][x] == 0 then
			spr.image = file.loadImage("/usr/sprites/grass1.png")
		else if grid[y][x] == 1 then
			spr.image = file.loadImage("/usr/sprites/grass2.png")
		else if grid[y][x] == 2 then
			spr.image = file.loadImage("/usr/sprites/grass3.png")
		end if
		display(4).sprites.push spr
		spr.x = (x*32)
		spr.y = (y*32)
	end for
end for

john = new Sprite
john.image = file.loadImage("/usr/sprites/john.png")
display(4).sprites.push john
john.x = 960/2
john.y = 640/2

jo = new Sprite
jo.image = file.loadImage("/usr/sprites/john.png")
display(4).sprites.push jo
jo.x = 577
jo.y = 400
 
people = []
people.push(john)
people.push(jo)


move = function
	for p in range(0,people.len-1)
		people[p].x = people[p].x + ceil(rnd*10) 
		people[p].y = people[p].y + ceil(rnd*10)
		people[p].x = people[p].x - ceil(rnd*10) 
		people[p].y = people[p].y - ceil(rnd*10)
	end for
	wait 0.5
	jo = new Sprite
	jo.image = file.loadImage("/usr/sprites/john.png")
	display(4).sprites.push jo
	jo.x = ceil(rnd*960)
	jo.y = ceil(rnd*640)
	people.push(jo)
	print people.len
end function

for i in range (0,100)
	move
end for