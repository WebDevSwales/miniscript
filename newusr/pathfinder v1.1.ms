import "mapUtil"
toCheck=[]
checked=[]
block=[[13,35],[14,35],[15,35]]
costArray=[]

findNeighbours = function(x=22,y=22,destinX=38,destinY=10,cle=true)
	if cle == true then
		clear
		x = ceil(rnd*68)
		y = ceil(rnd*25)
		destinX = ceil(rnd*68)
		destinY = ceil(rnd*25)
	end if
	
	text.setCell destinX,destinY,"g"
	
	if x == destinX and y == destinY then
		clearArray(toCheck)
		clearArray(checked)
		text.setCell x,y,"s"
		print "success"
		input "run again y/n"
		if input == "Y" or input == "y" then
			findNeighbours
		end if
		exit
	end if
	
	checked.push([x,y])
	
	text.setCell x,y,"o"
	if x > 1 then
		cost = abs(x-1-destinX)+abs(y-destinY)
		
		toCheck.push([x-1,y,cost])
		text.setCell x-1,y,cost
	end if
	
	if x < 68 then
		cost = abs(x+1-destinX)+abs(y-destinY)
		
		toCheck.push([x+1,y,cost])
		text.setCell x-1,y,cost
	end if
	
	if y > 1 then
		cost = abs(x-destinX)+abs(y-1-destinY)
		
		toCheck.push([x,y-1,cost])
		text.setCell x-1,y,cost
	end if
	
	if y < 28 then
		cost = abs(x-destinX)+abs(y+1-destinY)
		toCheck.push([x,y+1,cost])
		text.setCell x-1,y,cost
	end if
	
	for i in range(checked.len-1,0)	
		for j in range(toCheck.len-1,0)
			if str(toCheck[j][0]) == str(checked[i][0]) and str(toCheck[j][1]) == str(checked[i][1]) then
				toCheck.remove(j)
			end if
		end for
	end for
	
	file.writeLines "result",checked
	
	if toCheck.len > 0 then
		for i in range (0,100)
			for j in range (0,toCheck.len-1)
				if str(toCheck[j][2]) == str(i) then
					findNeighbours(toCheck[j][0],toCheck[j][1],destinX,destinY,false)
					//costArray.push(toCheck[j])
				end if	
			end for
		end for
	end if
	
	if toCheck.len > 0 then
		for i in range (0,100)
			for j in range (0,toCheck.len-1)
				if str(toCheck[j][3]) == str(i) then
					//findNeighbours(toCheck[j][0],toCheck[j][1],destinX,destinY,false)
					//cost.push(toCheck[j])
				end if	
			end for
		end for
	end if
	
	if toCheck.len > 0 then
		
		findNeighbours(toCheck[0][0],toCheck[0][1],destinX,destinY,false)
	end if
	
	print "I think something went wrong"
	
end function

clearArray = function(array)
	while array.len>0
		array.remove(0)
	end while
end function

findNeighbours