extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	



func _on_start_pressed() -> void:
	print("Start button pressed -- SS script func 17")
	global.transition_scene = true
	get_tree().change_scene_to_file("res://scenes/crash_site.tscn")
	global.finish_changescenes()
	


func _on_options_pressed() -> void:
	pass # Replace with function body.


func _on_quit_pressed() -> void:
	pass # Replace with function body.
