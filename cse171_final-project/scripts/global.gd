extends Node

var cutscene = true  # cutscene specific

var shadow_man_move = false    # Shadow man scene specific
var shadow_man_already_triggered = false

var crash_site_text = true   #  Dialogue Specific
var crash_site_text_one_time = false
var player_past_entry = false
var welcome_back_enetered_already = false
var road_blocked_entered_already = false
var maze_entered_already = false
var moon_already_spotted = false
var chase_started = false

var enddialogue = false
var enddialogue_jumpscare = false

var aggro = false

var current_scene = "start_screen"

var transition_scene = false

var player_exit_road_posx = 0
var player_exit_road_posy = 0
var player_start_road_posx = 0
var player_start_road_posy = 0
	
		

func finish_changescenes():
	print("Finish_Changescenes called -- G Script func 13")
	print("transition_scene Status: " + str(transition_scene))
	if transition_scene == true:
		transition_scene = false
		if current_scene == "crash_site":
			current_scene = "road_2"
			player_past_entry = false
			print("Finish_Changescenes road 2 trans -- G Script func 19")
			print("transition_scene Status: " + str(transition_scene))
			print("current_scene Status: " + str(current_scene))
			print("-------------------------------------------------------------------------------")
		elif current_scene == "start_screen":
			current_scene = "crash_site"
			player_past_entry = false
			print("Finish_Changescenes Start button -- G Script func 25")
			print("transition_scene Status: " + str(transition_scene))
			print("current_scene Status: " + str(current_scene))
			print("-------------------------------------------------------------------------------")
		elif current_scene == "road_2":
			current_scene = "road_3"
			player_past_entry = false
			print("Finish_Changescenes road 3 Trans -- G Script func 31")
			print("transition_scene Status: " + str(transition_scene))
			print("current_scene Status: " + str(current_scene))
			print("-------------------------------------------------------------------------------")
		elif current_scene == "road_3":
			current_scene = "road_4"
			player_past_entry = false
			print("Finish_Changescenes road 4 Trans -- G Script func 51")
			print("transition_scene Status: " + str(transition_scene))
			print("current_scene Status: " + str(current_scene))
			print("-------------------------------------------------------------------------------")
		elif current_scene == "road_4":
			current_scene = "road_5"
			player_past_entry = false
			print("Finish_Changescenes road 5 Trans -- G Script func 51")
			print("transition_scene Status: " + str(transition_scene))
			print("current_scene Status: " + str(current_scene))
			print("-------------------------------------------------------------------------------")
		elif current_scene == "road_5":
			current_scene = "road_6"
			player_past_entry = false
			print("Finish_Changescenes road 6 Trans -- G Script func 51")
			print("transition_scene Status: " + str(transition_scene))
			print("current_scene Status: " + str(current_scene))
			print("-------------------------------------------------------------------------------")
		elif current_scene == "road_6":
			current_scene = "road_7"
			player_past_entry = false
			print("Finish_Changescenes road 7 Trans -- G Script func 51")
			print("transition_scene Status: " + str(transition_scene))
			print("current_scene Status: " + str(current_scene))
			print("-------------------------------------------------------------------------------")
		elif current_scene == "road_7":
			current_scene = "road_8"
			player_past_entry = false
			print("Finish_Changescenes road 8 Trans -- G Script func 51")
			print("transition_scene Status: " + str(transition_scene))
			print("current_scene Status: " + str(current_scene))
			print("-------------------------------------------------------------------------------")
		elif current_scene == "road_8":
			current_scene = "road_9"
			player_past_entry = false
			print("Finish_Changescenes road 9 Trans -- G Script func 51")
			print("transition_scene Status: " + str(transition_scene))
			print("current_scene Status: " + str(current_scene))
			print("-------------------------------------------------------------------------------")
		elif current_scene == "road_9":
			current_scene = "road_10"
			player_past_entry = false
			print("Finish_Changescenes road 10 Trans -- G Script func 51")
			print("transition_scene Status: " + str(transition_scene))
			print("current_scene Status: " + str(current_scene))
			print("-------------------------------------------------------------------------------")
		else:
			current_scene = "crash_site"
			print("Finish_Changescenes some FAILED -- G Script func 37")
			

# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#pass # Replace with function body.
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass
