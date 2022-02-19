import "json"

//objects = json.parse(file.open("data.json").read)
//objects = json.parse(http.get("https://pastebin.com/raw/6KmQqMan"))

//postData = {}
//postData.api_dev_key 		= "7K2qouwvq7NNQkz5l8P1aktjZ8OdE9Vk"
//postData.api_user_name 		= "SaveTheSwales"
//postData.api_user_password 	= "56pluns656pluns6"

//userKey = http.post("https://pastebin.com/api/api_login.php", postData)
//print userKey

postData = {}
postData.api_dev_key = "7K2qouwvq7NNQkz5l8P1aktjZ8OdE9Vk"
postData.api_userkey = "78105757daf83ba45aef46c01ff10a0f"
postData.api_option = "list"

result = http.post("https://pastebin.com/api/api_post.php", postData)
print result
input""

welcome = function
	clear
	print "welcome to the wonderful comparacalacalator"
	//wait 2
	print "choose any weight you like to see how many of a random thing that would be"
	//wait 2
	print "but beware, some of the answers may be too amazing"
	//wait 2
	print "there are currently "+objects.len+" items which can compare"
	//wait 2
	print " "
	getData
end function



getData = function
	print " "
	
	n = input("please input the name of the item you want to compare"+char(13))
	ns = input("please input the plural of this item"+char(13))
	w = input("please input the weight of the object in grams please"+char(13)).val
	showData(n,w,ns)
end function

showData = function(n,w,ns)
	clear
	c1 = objects[""+floor(rnd*objects.len)+""]
	c2 = objects[""+floor(rnd*objects.len)+""]
	c3 = objects[""+floor(rnd*objects.len)+""]
	dv1 = w/c1.weight
	dv2 = w/c2.weight
	dv3 = w/c3.weight
	
	print "the "+n+" is equal to "+ dv1 +" "+c1.name
	print "or"
	print dv2 +" "+c2.name
	print "or"
	print dv3 +" "+c3.name
	print "show more comparisons?(y/n)"
	k = key.get
	if k == "y" then
		showData(n,w,ns)
	end if
	addToDatabase(ns,w)
end function

addToDatabase = function(ns,w)
	print " "
	print "Would you like to add this item to our database? (y/n)"
	k = key.get
	if k == "y"then
		print "please confirm (y/n):"+ ns +":"+w+"g"
		k=key.get
		if k == "y" then
			for i in range(0,1000)
				if objects.hasIndex(str(i)) then
					continue
				else
					objects[str(i)] = {}
					objects[str(i)].name = ns
					objects[str(i)].weight = w
					
					//http.post("https://www.npoint.io/docs/619399ad85201b172763",objects)
					
					break
				end if
			end for
		end if
	end if
	print "GoodBye"
	exit
end function


welcome

