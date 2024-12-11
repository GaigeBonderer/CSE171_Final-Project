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

	
func _on_trans_road_2_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		print("Player entered road 2 -- CS Script func 13")
		global.transition_scene = true


func _on_trans_road_2_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		print("Player Exited road 2 -- CS Script func 19")
		global.transition_scene = false
		
func change_scene():
	if global.transition_scene == true:
		if global.current_scene == "crash_site":
			print("Change Scene called -- CS Script func 24")
			get_tree().change_scene_to_file("res://scenes/road_2.tscn")
			global.finish_changescenes()


func _on_spawn_shadow_man_body_entered(body: Node2D) -> void:
	if body.has_method("player") && global.shadow_man_already_triggered == false:
		global.cutscene = true;
		global.shadow_man_move = true
