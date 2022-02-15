success = ["1 ","2 ","3 ","4 ","5 ","6 ","7 ","8 ","9 ","10","11","12","13","14","15","  "]
puzzle = ["1 ","2 ","3 ","4 ","5 ","6 ","7 ","8 ","9 ","10","11","12","13","14","15","  "]

setup = function()
	for i in range (0,500)
		startSwap = ceil(rnd*4)-1
		move(startSwap)
	end for
end function	

game = function(moves=0)
	moves = moves
	puzzle = puzzle.indexOf("  ")
	k = key.get
	if k.code == 19 then
		print k.code
		move(0)
	else if k.code == 20 then
		print k.code
		move(1)
	else if k.code == 17 then
		print k.code
		move(3)
	else if k.code == 18 then
		print k.code
		move(2) 
	end if
	
	if puzzle == success then
		print "success"
		exit
	end if
	
	game(moves)
end function

showBoard = function()
	clear
	for i in range (0,puzzle.len-1,4)
		print puzzle[i:i+4].join
	end for
end function

swap = function(one,two)
	temp = puzzle[one]
	puzzle[one] = puzzle[two]
	puzzle[two] = temp
	showBoard
	
end function

move = function(direction)
	xPos = puzzle.indexOf("  ")
	
	if direction == 0 and xPos > 3 then
		swap(xPos,xPos-4)
		
	else if direction == 1 and xPos < 12 then
		swap(xPos,xPos+4)
		
	else if direction == 3 and xPos % 4 != 0then
		swap(xPos,xPos-1)
		
	else if direction == 2 and xPos % 4 != 3 then
		swap(xPos,xPos+1)
	end if
	showBoard
end function

setup
showBoard
game