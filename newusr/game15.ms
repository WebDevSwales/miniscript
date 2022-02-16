success = []
puzzle = []
emptyCell = " "

clear
print "max rows = 17."
rows = input("how many rows do you want? ").val


setup = function()
	for i in range(1,rows*rows)
		success.push(i)
	end for
	
	success[success.len-1] = " "
	m = str(success[-2]).len
	
	for i in success.indexes
		success[i] = ("   " + success[i])[-m:]
	end for
	
	success[success.len-1]
	
	for i in success
		puzzle.push(i)
	end for
	
	
	for i in range (0,500*rows)
		startSwap = ceil(rnd*4)-1
		move(startSwap)
	end for
	
end function	

game = function(moves=0)
	moves = moves
	//puzzle = puzzle.indexOf("  ")
	
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
	end if
	
	if puzzle == success then
		print "success"
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
	
end function

setup
showBoard
game