import "mapUtil"
import "listUtil"

toCheck=[]
checked=[]
costArray=[]
pathArray=[]

findNeighbours = function(x=22,y=22,destinX=38,destinY=10,cle=true,path=pathArray)
	
	if cle == true then
		x = ceil(rnd*68)
		y = ceil(rnd*25)
		destinX = ceil(rnd*68)
		destinY = ceil(rnd*25)
		path = pathArray
		
		if blockers.indexOf([x,y]) then
			overlay = blockers.indexOf([x,y])
			blockers.remove(overlay)
		end if
		
	end if
	text.setCellColor destinX,destinY,color.white
	text.setCell destinX,destinY,"g"
	
	if x == destinX and y == destinY then
		clearArray(toCheck)
		clearArray(checked)
		text.setCell x,y,"s"
		file.writeLines "result.txt",path
		print "success"
		exit
	end if
	
	checked.push([x,y])
	path.push([x,y])
	
	text.setCellColor x,y,color.blue
	text.setCell x,y,"o"
	
	if not blockers.indexOf([x-1,y]) then
		if x > 1 then
			cost = abs(x-1-destinX)+abs(y-destinY)
			p = path.deepCopy
			p.push([x-1,y])
			toCheck.push([x-1,y,cost,path])
			text.setCell x-1,y,"x"
		end if
	end if
	
	if not blockers.indexOf([x+1,y]) then
		if x < 68 then
			cost = abs(x+1-destinX)+abs(y-destinY)
			p = path.deepCopy
			p.push([x+1,y])
			toCheck.push([x+1,y,cost,path])
			text.setCell x+1,y,"x"
		end if
	end if
	if not blockers.indexOf([x,y-1]) then
		if y > 1 then
			cost = abs(x-destinX)+abs(y-1-destinY)
			p = path.deepCopy
			p.push([x,y-1])
			toCheck.push([x,y-1,cost,path])
			text.setCell x,y-1,"x"
		end if
	end if
	
	if not blockers.indexOf([x,y+1]) then
		if y < 28 then
			cost = abs(x-destinX)+abs(y+1-destinY)
			p = path.deepCopy
			p.push([x,y+1])
			toCheck.push([x,y+1,cost,path])
			text.setCell x,y+1,"x"
		end if
	end if
	
	for i in range(checked.len-1,0)	
		for j in range(toCheck.len-1,0)
			if str(toCheck[j][0]) == str(checked[i][0]) and str(toCheck[j][1]) == str(checked[i][1]) then
				toCheck.remove(j)
			end if
		end for
	end for
	
	for i in range(blockers-1,0)	
		for j in range(toCheck.len-1,0)
			if str(toCheck[j][0]) == str(blockers[i][0]) and str(toCheck[j][1]) == str(blockers[i][1]) then
				print blockers[i][0]
				toCheck.remove(j)
			end if
		end for
	end for
	
	file.writeLines "result",checked
	
	
	
	if toCheck.len > 0 then
		for i in range (0,100)
			for j in range (0,toCheck.len-1)
				if str(toCheck[j][2]) == str(i) then
					
					findNeighbours(toCheck[j][0],toCheck[j][1],destinX,destinY,false,toCheck[j][3])
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

blockers = []
placeblocks = function()
	for i in range (0,600)
		blockers.push([ceil(rnd*68),ceil(rnd*26)])
	end for
	
	for b in blockers
		text.setCellColor b[0],b[1],color.red
		text.setCell b[0],b[1],"B"
		
	end for
end function

clear
placeblocks
findNeighbours