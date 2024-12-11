extends CharacterBody2D

var speed = 25 # Supposed to be 50 100 for testing
@onready var playerWalkingAudioStream = $AudioStreamPlayer2D_walking

var current_dir = "none"

var going_out = true

var shadow_stop = false


#print("Script Running")

func player():
	pass

func _ready():
	$AnimatedSprite2D.play("idle_down")

func _physics_process(delta):
		#print("Phys process")
		movescary(delta)
		
func movescary(delta):
	
	if global.shadow_man_move == true && going_out == true:
		current_dir = "right"
		play_anim(1)
		velocity.x = speed
		velocity.y = 0
		#print("Position x: ", position.x, " -- SM Script 27")
		if !playerWalkingAudioStream.playing:
			playerWalkingAudioStream.play()
	if position.x >= -77 && going_out == true:
			velocity.x = 0
			velocity.y = 0
			play_anim(0) # Play idle animation
			going_out = false
			speed = 50
	if global.shadow_man_move == true && going_out == false:
		#print("Move Scary 2 returning -- SM Script 46")
		current_dir = "left"
		play_anim(1)
		velocity.x = -speed
		velocity.y = 0
		#print("Position x: ", position.x, " -- SM Script 51")
		if !playerWalkingAudioStream.playing:
			playerWalkingAudioStream.play()
	if position.x <= -158 && going_out == false && shadow_stop == false:
		#print("Move Scary 2 End -- SM Script 55")
		playerWalkingAudioStream.stop()
		global.shadow_man_already_triggered = true
		shadow_stop = true
		velocity.x = 0
		velocity.y = 0
		play_anim(0) # Play idle animation
		DialogueManager.show_example_dialogue_balloon(load("res://crash_site_text.dialogue"), "shadowman")
		global.shadow_man_move = false
		global.cutscene = false
		
	move_and_slide()
		
		
		
func play_anim(movement):
	var dir = current_dir
	var anim = $AnimatedSprite2D
	
	if dir == "right":
		#anim.flih_h = false # not needed since specified left/right walk/idle
		if movement == 1:
			anim.play("walking_right")
		elif movement == 0:
			anim.play("idle_right")
	elif dir == "left":
		if movement == 1:
			anim.play("walking_left")
		elif movement == 0:
			anim.play("idle_left")
