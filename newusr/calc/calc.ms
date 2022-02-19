things = [["grizzly Bear",300],["Soda Bottle",0.19],["Ford Escort mkI",805],["'the Rock'",118]]
things.push(["Apache Helicopter",5165])
things.push(["Snorlax",460])
things.push(["Hercules the Liger",418])
things.push(["Kiber Crystal",0.17])
things.push(["Manhole cover",70])
things.push(["Kratos",109])
things.push(["The killer whale",3500])

sorted = []
number  = 0

for i in range (5165,1)
	for j in range(0,things.len-1)
		if things[j][1] == i then
			sorted.push(things[j])
		end if
	end for
end for

sorted.push(things[1])
sorted.push(things[7])

file.writeLines("Array.txt",sorted.join(","))


main = function
	clear
	print "welcome to the comparocalculator!!!"
	wait 1
	print "where you can compare anything!!!!!!!"
	wait 2 
	print "within a very specific list..."
	number = input("How heavy is the thing you want to compare?" + char(13)).val
	
	compare number
	
	
	
end function


compare = function(number)
	for i in sorted.indexes
		print number + "kgs is roughly "+round(number/sorted[i][1],2)+" "+sorted[i][0]+"'s"
	end for
	redo
end function

redo = function
	print " "
	print "do you have another thing to compare weight? y/n"
	k = key.get
	
	if k == "y" then
		main		
	end if
end function


welcome

