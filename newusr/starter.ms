env.importPaths = file.readLines("/usr/data/Import/imports.conf") //grabs entire data folder
import "ammo_data" //imports ammo_data file
import "training_dummy"
import "player_config"
import "level_1"

help = function()
	print "'shoot left arm\right arm\chest' to shoot arrow at body chosen body part"
	print "'reload' to reload arrows."
	print "'store' to go to the store."
	
	input("press 'Enter' to return") //returns to while loop
end function

scores = function()
	print "total score: " + dummy.score_board
	
	input("press 'enter' to return")
end function

arrows = new ammo_data.arrow //allows use of just 'arrows' instead of writing the full ammo_data.arrow string
dummy = new training_dummy.trainer_d //allows use of dummy instead of typing 'training_dummy.trainer_d' to call it
money = new player_config.cash
fishing = new level_1.quest1

questboard = function()
	print "1: " + fishing.name + fishing.reward + "per catch!"
	
	questb = input("select: ")
	
	if questb == "1" then
		fishing.prologue
	end if
end function

while true //keeps program open
	print "type 'help' for help"
	
	player = input("|>: ") //takes user input and converts to string
	
	if player == "help" then //checks if player types 'help'
		help
	else if player == "shoot head" then //checks if the player types 'shoot'
		arrows.shoot_head
	else if player == "shoot left arm" then
		arrows.shoot_left
	else if player == "shoot right arm" then
		arrows.shoot_right
	else if player == "shoot chest" then
		arrows.shoot_chest
	else if player == "reload" then //checks if the player types 'reload'
		arrows.reload_a
	else if player == "check ammo" then
		clear
		print arrows.Aamount + " arrows left."
	else if player == "store" then
		arrows.shop
	else if player == "scoreboard" then
		scores()
	else if player == "quests" then
		questboard()
	end if
end while