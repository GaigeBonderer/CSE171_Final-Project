extends CharacterBody2D

const speed = 50
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
	elif Input.is_action_pressed("ui_down"):
		current_dir = "down"
		play_anim(1)
		velocity.x = 0
		velocity.y = speed
		#print("Player moving DOWN, speed = " + str(speed))
		if !playerWalkingAudioStream.playing:
			playerWalkingAudioStream.play()
	elif Input.is_action_pressed("ui_up"):
		current_dir = "up"
		play_anim(1)
		velocity.x = 0
		velocity.y = -speed
		#print("Player moving UP, speed = " + str(speed))
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
	elif dir == "down":
		if movement == 1:
			anim.play("walking_down")
		elif movement == 0:
			anim.play("idle_down")
	elif dir == "up":
		if movement == 1:
			anim.play("walking_up")
		elif movement == 0:
			anim.play("idle_up")
		
 

#Code generated by game engine (below)

#const SPEED = 300.0
#const JUMP_VELOCITY = -400.0
#
#
#func _physics_process(delta: float) -> void:
	## Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta
#
	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
#
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#var direction := Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
#
	#move_and_slide()
