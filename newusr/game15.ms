gameState = []
success = []
puzzle = []
emptyCell = " "
moves = 5
highScore = 5
data = []
loaded = file.readLines ("data.txt")

setup = function()
	for i in range(1,rows*rows)
		success.push(i)
	end for
	
	success[success.len-1] = " "
	m = str(success[-2]).len
	
	for i in success.indexes
		success[i] = ("   " + success[i])[-m:]
	end for
	
	for i in success
		puzzle.push(i)
	end for
	
	
	for i in range (0,500*rows)
		startSwap = ceil(rnd*4)-1
		move(startSwap)
	end for
	showBoard
	game
end function	

game = function(moves)
	moves = moves
	print " "
	print "current moves:" + moves
	print "highScore:" + highScore
	print "[q]uit"
	
	k = key.get
	if k.code == 19 then
		print k.code
		move(1)
	else if k.code == 20 then
		print k.code
		move(0)
	else if k.code == 17 then
		print k.code
		move(2)
	else if k.code == 18 then
		print k.code
		move(3) 
	else if k.code == 113 then
		quitter = input("are you sure you wanna [q]uit?y/n")
		if quitter == "y" then
			saving = input("save progress? y/n")
			if saving == "y" then
				save
			end if
			clear
			exit
		end if
	end if
	
	if puzzle == success then
		for name in file.children("/usr/images")
			path = "/usr/images/"+name
			img = file.loadImage(path)
			gfx.drawImage img, 0, 0, gfx.width, gfx.height, 0, 0, img.width, img.height
			wait 0.1
		end for
		exit
	end if
	showBoard
	
	game(moves)
end function

showBoard = function()
	clear
	
	for i in range (0,puzzle.len-1,rows)
		print puzzle[i:i+rows].join
	end for
	
end function

swap = function(one,two)
	temp = puzzle[one]
	puzzle[one] = puzzle[two]
	puzzle[two] = temp	
end function

move = function(direction)
	xPos = puzzle.indexOf(success[success.len-1])
	
	if direction == 0 and xPos > rows-1 then
		swap(xPos,xPos-rows)
		
	else if direction == 1 and xPos < puzzle.len - rows then
		swap(xPos,xPos+rows)
		
	else if direction == 3 and xPos % rows != 0then
		swap(xPos,xPos-1)
		
	else if direction == 2 and xPos % rows != rows-1 then
		swap(xPos,xPos+1)
	end if
	print xPos
	
end function

save = function()
	clear
	pushPuzzle = puzzle.join(",")	
	pushSuccess = success.join(",")			
	data.push(highScore)
	data.push(moves)
	data.push(pushPuzzle)
	data.push(rows)
	data.push(pushSuccess)
	file.writeLines "data.txt",data
	print "game saved"
	exit
end function

clear
print "max rows = 17."
newGame = input("[L]oad or [N]ew game?")

if newGame == "L" then
	
	highscore = loaded[0].val
	moves = loaded[1].val
	puzzle = loaded[2].split(",")
	rows = loaded[3].val
	success = loaded[4].split(",")
	clear
	showBoard
	game(moves)
	
else if newGame == "N" then
	print "starting new game"
	rows = input("how many rows do you want? ").val
	setup
	if rows > 17 then
		input "this is to large a puzzle for anyone, start again"
		run
	end if
else if newGame != "N" or "L" then
	print "incorrect key starting new game"
end if