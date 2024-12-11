extends Node2D
@onready var musicAudioStreamBG = $AudioStreamPlayer_BGM # Reference to the Audio node
var BGM = true

@onready var test_cutscene = $test_cutscene # Reference to the Timer node
@onready var test_cutscene_end = $test_cutscene_end # Reference to the Timer node

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

	
func _on_trans_road_2_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		print("Player entered road 2 -- CS Script func 13")
		global.transition_scene = true
		print("global.transition_scene: ", global.transition_scene, " -- CS Script func 27")
		
func change_scene():
	if global.transition_scene == true:
		print("Change Scene 1 -- CS Script func 37")
		if global.current_scene == "crash_site":
			print("Change Scene 2 -- CS Script func 39")
			get_tree().change_scene_to_file("res://scenes/road_2.tscn")
			global.finish_changescenes()
			
# test cutscene / timer
#func _on_test_cutscene_timeout() -> void:
	#print("Cutscene timer finished -- CS Script func 41")
	#global.cutscene = true  # Set the global cutscene variable to true
	#print("global.cutscene set to: ", global.cutscene, " -- CS Script func 43")
	#
#func _on_test_cutscene_end_timeout() -> void:
	#print("Cutscene timer finished -- CS Script func 41")
	#global.cutscene = false  # Set the global cutscene variable to true
	#print("global.cutscene set to: ", global.cutscene, " -- CS Script func 43")
