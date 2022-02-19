success = []
puzzle = []
data = []
moves = 0
rows = 0
highScore = 100000
loaded = file.readLines ("data.txt")


newGame = function()
	print " Welcome to Slider"
	print " do you want to [l]oad or start a [n]ew game"
	k = key.get
	
	//110 is l
	if k.code == 110 or k == "L" then
		//if new game go to setup
		print "new game"
		wait 1
		setup
		//108 is n
	else if k.code == 108 or k == "N" then
		//if load game go to loading
		print "load game"
	else 
		print "invalid key dummy"
		newGame
	end if
	
end function



setup = function()
	//set value for success
	clear
	print "new Game setup"
	print "how many rows are you wanting?"
	
	o = input("max 17")
	rows = o.val
	outer.rows = rows
	
	//setting the range
	for i in range(1,rows*rows)
		success.push(i)
	end for
	
	//change the last index of success
	success[success.len-1] = " "
	
	//ensure all numbers are same text length
	m = str(success[-2]).len
	
	for i in success.indexes
		success[i] = ("  " + success[i])[-m:]
	end for
	
	//set puzzle
	for i in success
		puzzle.push(i)
	end for
	
	//shuffle puzzle
	for i in range (1, rows*rows*20)
		s = floor(rnd*4)
		move(s)
	end for
	
	//send that over to the game
	game
end function



loading = function()
	
	
end function

game = function
	moves = moves +1
	showBoard
	print " "
	print "current moves:" + moves
	print "highScore("+rows+"):" + highScore[rows-1]
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
	game
end function



showBoard =  function()
	clear
	for i in range (0,puzzle.len-1,rows)
		print puzzle[i:i+rows].join
	end for
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



swap = function(one,two)
	temp = puzzle[one]
	puzzle[one] = puzzle[two]
	puzzle[two] = temp	
end function



newGame