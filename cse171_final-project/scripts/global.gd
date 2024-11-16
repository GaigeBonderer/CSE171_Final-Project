extends Node

var current_scene = "crash_site"

var transition_scene = false

var player_exit_road_posx = 0
var player_exit_road_posy = 0
var player_start_road_posx = 0
var player_start_road_posy = 0

func finish_changescenes():
	print("Finish_Changescenes called -- G Script func 12")
	print("transition_scene Status: " + str(transition_scene))
	if transition_scene == true:
		transition_scene = false
		if current_scene == "crash_site":
			current_scene = "road_2"
			print("Finish_Changescenes all true -- G Script func 12")
			print("transition_scene Status: " + str(transition_scene))
			print("current_scene Status: " + str(current_scene))
		else:
			current_scene = "crash_site"
			print("Finish_Changescenes some FAILED -- G Script func 12")
			

# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#pass # Replace with function body.
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass
