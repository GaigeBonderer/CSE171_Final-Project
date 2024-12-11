extends Node2D
@onready var musicAudioStreamBG = $AudioStreamPlayer_BGM
var BGM = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	change_scene()
	update_music_stats()

func update_music_stats():
	if BGM:
		if !musicAudioStreamBG.playing:
			musicAudioStreamBG.play()
	else:
		musicAudioStreamBG.stop()

	
func _on_trans_road_9_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		print("Player entered road 9 -- R8 Script func 25")
		global.transition_scene = true
		print("global.transition_scene: ", global.transition_scene, " -- R8 Script func 27")

func change_scene():
	if global.transition_scene == true:
		print("Change Scene 1 -- R8 Script func 31")
		if global.current_scene == "road_8":
			print("Change Scene 2 -- R8 Script func 33")
			get_tree().change_scene_to_file("res://scenes/road_9.tscn")
			global.finish_changescenes()


func _on_no_return_body_entered(body: Node2D) -> void:
	print("Player Past Entry: ", global.player_past_entry)
	if global.player_past_entry == true:
		print("No Return Entered -- R5 Script 41 ")
		global.cutscene = true
		DialogueManager.show_example_dialogue_balloon(load("res://crash_site_text.dialogue"), "no_return")


func _on_blood_moon_body_entered(body: Node2D) -> void:
	if global.moon_already_spotted == false && global.player_past_entry == true:
		global.cutscene = true
		DialogueManager.show_example_dialogue_balloon(load("res://crash_site_text.dialogue"), "blood_moon")


func _on_chase_body_entered(body: Node2D) -> void:
	if global.chase_started == false && global.player_past_entry == true:
		global.cutscene = true
		DialogueManager.show_example_dialogue_balloon(load("res://crash_site_text.dialogue"), "being_followed")
