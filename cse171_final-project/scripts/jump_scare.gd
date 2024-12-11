extends Node2D
@onready var musicAudioStreamBG = $AudioStreamPlayer_BGM
var BGM = true


func _ready() -> void:
	musicAudioStreamBG.play()
#func _process(delta: float) -> void:
	#update_music_stats()
#
#func update_music_stats():
	#if BGM:
		#if !musicAudioStreamBG.playing:
			#musicAudioStreamBG.play()
	#else:
		#musicAudioStreamBG.stop()
