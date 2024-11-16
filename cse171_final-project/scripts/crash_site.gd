extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	change_scene()
	
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
