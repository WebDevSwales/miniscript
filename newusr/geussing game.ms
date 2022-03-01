clear
guess = 0
goal = ceil(rnd*10)
print "try and guess the number 1-10" + char(13)
guess = input().val

while guess != goal
	print "incorrect, try Again" + char(13)
	guess = input().val	
end while

print "congrats, you win!"
exit