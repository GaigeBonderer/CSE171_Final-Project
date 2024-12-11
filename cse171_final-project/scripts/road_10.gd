extends Node2D



func _ready() -> void:
	global.cutscene = true
	DialogueManager.show_example_dialogue_balloon(load("res://crash_site_text.dialogue"), "Finale")


func _process(delta: float) -> void:
	pass
	
