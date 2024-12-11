extends CharacterBody2D

const speed = 100 # Supposed to be 50 100 for testing
@onready var playerWalkingAudioStream = $AudioStreamPlayer2D_walking

var current_dir = "none"

#print("Script Running")

func player():
	pass

func _ready():
	$AnimatedSprite2D.play("idle_down")

func _physics_process(delta):
		#print("Phys process")
		player_movement(delta)
		
func player_movement(delta):
	
	#print("Script Running, speed = " + str(speed))
	if Input.is_action_pressed("ui_right"):
		current_dir = "right"
		play_anim(1)
		velocity.x = speed
		velocity.y = 0
		#print("Player moving RIGHT, speed = " + str(speed))
		if !playerWalkingAudioStream.playing:
			playerWalkingAudioStream.play()
	elif Input.is_action_pressed("ui_left"):
		current_dir = "left"
		play_anim(1)
		velocity.x = -speed
		velocity.y = 0
		#print("Player moving LEFT, speed = " + str(speed))
		if !playerWalkingAudioStream.playing:
			playerWalkingAudioStream.play()
	else:
		play_anim(0)
		velocity.x = 0
		velocity.y = 0
		playerWalkingAudioStream.stop()
		
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
