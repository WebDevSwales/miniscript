// tiody up code, move objects for importing
//build the password strength checker
//

k = null
color1 = "#FF0023"
color2 = "#BA57D9"
color3 = "#726CF0"
color4 = "#57AAD9"
default = "#74FCCD"

//more loading phrases, move this out for importing
loadingPhrase = []
loadingPhrase.push "dotting the i's                            "
loadingPhrase.push "crossing the t's                           "
loadingPhrase.push "swapping O with 0                          "
loadingPhrase.push "counting to 9                              "
loadingPhrase.push "napping...                                 "
loadingPhrase.push "wondering why loaidn goes by 7.14 each time"
loadingPhrase.push "finding the C                              "

safetyNet = 0
LowerCase = {}
UpperCase = {}
SpecialChar = {}
text.color = default

character = {}
character.low = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"," "]
character.high = ["A", "B", "C", "D", "E", "F", "G", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W","X","Y","Z"]
character.spec = [" ","/","!","<",">","?","@","{","+","*","~",".",",",":"," ","/","!","<",">","?","@","{","+","*","~",".",",",":"]
character.num = [1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9,0]
character.full = []
character.unique = []
character.init = function
	self.full = []
	for l in self.low.indexes
		self.full.push self.low[l]
	end for
	for h in self.high.indexes
		self.full.push self.high[h]
	end for
	for s in self.spec.indexes
		self.full.push self.spec[s]
	end for
	for n in self.num.indexes
		self.full.push str(self.num[n])
	end for
	
end function

character.shuffle = function
	sp = character.spec
	nu = character.num
	self.unique = self.full[:]
	mod = self.unique.len-1
	
	user.uniqueUserCode = 1
	uuC = user.uniqueUserCode
	usnC = user.usernameCode
	
	percent = 0
	for i in usnC
		uuC = uuC * ((usnC[0]+1)+(usnC[1]+2)+(usnC[2]+3))
	end for
	
	while uuC < 1000
		uuC = uuC*(uuC/10)
	end while
	while uuC > 1000000
		uuC = uuC/str(uuC).len
	end while
	uuC = round(uuC,0)
	user.uniqueUserCode = uuC
	for i in range(0,uuC)
		if i%3 == 0 then			
			self.swap((i)%self.unique.len-1,(i+41)%self.unique.len-1)
			self.swap((i)%self.unique.len-1,(i+21)%self.unique.len-1)
		else if i%3 == 1 then
			self.swap((i)%self.unique.len-1,(i+36)%self.unique.len-1)
			self.swap((i)%self.unique.len-1,(i+23)%self.unique.len-1)
		else if i%3 == 2 then
			self.swap((i)%self.unique.len-1,(i+47)%self.unique.len-1)
			self.swap((i)%self.unique.len-1,(i+6)%self.unique.len-1)
			self.swap((i)%self.unique.len-1,(i+27)%self.unique.len-1)
		end if
		
		//add time delta later
		if i%ceil(uuC/14) == 0 then
			text.row = 19
			text.color = color3
			print "loading:"+percent+"%     "
			percent = percent + 7.14
		end if
		if i%ceil(uuC/10) == 0 then
			text.row = 20
			text.color = color2
			print loadingPhrase[floor(rnd*loadingPhrase.len)]
		end if
		
	end for
	text.row = 19
	print
	text.color = "#FFD700"
	print "loading: complete!"
	text.color = default
end function

character.swap = function(first,second)
	
	f = self.unique[first]
	s = self.unique[second]
	
	self.unique[second] = f
	self.unique[first] = s
end function

//tidy up and optimise
generate = function
	user.password = ""
	while not key.pressed("escape")
		clear
		user.wordCode = []
		print user.word
		user.getCodeWord
		print user.wordCode
		k = key.get
		if k.code == 8 then
			user.word = slice(user.word,0,-1)
		else
			user.word = user.word + k
		end if
		wait 0.1
	end while
end function

user = {}
user.username = null
user.usernameCode = []
user.word = ""
user.wordCode = []
user.password=""
user.uniqueUserCode=0
user.init = function
	if self.username == null then
		clear
		print "username must be atleast 3 characters long"
		self.username = input("please insert username"+char(13))
		if self.username.len < 3 then
			print"sorry, username to short"
			self.username = null
			input
			user.init
		end if
		self.getCodePass
		character.shuffle
		print "thank you user " + self.username
		print
		print "press any key to continue"
		key.get
	end if
	if self.word != "" then
		user.usernameCode = []
		user.word = ""
		user.wordCode = []
		user.password=""
	end if
end function

user.getWord = function
	print
	self.word = input("please enter word for password generation"+char(13))
	print "word entered: " + self.word
	print
end function

//check if this function needs to do username and word
user.getCodeWord = function
	if self.word.len < 1 then
		return
	end if
	
	for i in self.word
		if character.full.indexOf(i) >= 0 then
			self.wordCode.push character.full.indexOf(i)
		end if
	end for
end function

user.getCodePass = function
	if self.username.len < 1 then
		print "error:there is no username"
		exit
	end if
	self.usernameCode = []
	for i in self.username
		if character.full.indexOf(i) >= 0 then
			self.usernameCode.push character.full.indexOf(i)
		end if
	end for
end function

dis = {}
dis.home = function
	clear
	op=""
	text.color = default
	print "please select option"+char(13)
	print "new (P)assword : new (U)ser : (H)elp : U(s)er profile"
	text.row = 0
	text.color = color1
	print "user pin: " + user.username + "       last password Generated:" + user.password
	text.color = default
	text.row = 20
	op = key.get
	if op.lower == "p" then
		user.init
		user.getCodePass
		generate
		dis.generate
	else if op.lower == "u" then
		user.username = null
		user.init
	else if op.lower == "h" then
		self.help
	else if op.lower == "s" then
		dis.profile
	else
		text.color = color1
		text.row = 20
		print "invalid key"
		wait 0.3
		text.color = default
		dis.home
	end if
	dis.home
end function
// make this better
dis.help = function
	clear
	text.color = color2
	if not k then
		print "welcome to the mini tutorial"
		print "press any key to continue"
		key.get
	end if
	clear
	print "anytime you see a letter in brackets () press this key to select the option"
	print "(c)ontinue"
	outer.k = key.get
	if k != "c" then
		print "invalid key"
		print "try pressing ""c"""
		wait 0.5
		dis.help
	end if
	clear
	print "we use a list of 72 characters"
	print "and shuffle it using your usernamecode"
	print "to produce a unique permutation of the list"
	print ""
	text.color = color4
	print "fun fact:"
	print "there are 61,234,460,000,000,002,924,372,733,486,468,196,564,082,558,694,319,812,061,945,776,367,906,292,883,313,910,222,216,669,559,867,846,950,912 possible permutations of this list"
	
end function

dis.generate = function
	clear
	text.color = color1
	print"user Pin: "
	print user.username
	print
	text.color = color3
	print"code word: " 
	print user.word
	print
	text.color = color4
	print"generated password: "
	print user.password
	print
	print"copy and paste password now"
	input
	print "go to (u)nique permutation of characters"
	op = key.get
	if op == "u" then
		dis.yourChars
	end if
end function

//more username tips please
dis.profile = function
	clear
	if not user.username then
		print "no user to display"
		print"return home"
		key.get
		dis.home
	end if
	text.color = default
	print "welcome"
	print "your username is " + user.username
	if user.username.len < 7 then
		text.color = color1
		print "you should consider a longer username"
		print
	else
		text.color = color3
		print "this is a good enough username"
		print
	end if
	text.color = color2
	print "your unique character list is"
	print character.unique
	text.color = default
	
	print
	print
	print "press any key to return to main menu"
	key.get
	dis.home
end function

dis.yourChars = function
	clear
	print "your character set is:"
	print character.unique
	print
	print"press any key to return to main menu"
	key.get
end function


character.init
dis.home