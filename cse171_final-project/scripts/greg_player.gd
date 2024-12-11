extends CharacterBody2D

const speed = 50 # Supposed to be 50, higher for testing
@onready var playerWalkingAudioStream = $AudioStreamPlayer2D_walking

var current_dir = "none"

#print("Script Running")

func player():
	pass

func _ready():
	$AnimatedSprite2D.play("idle_down")

func _physics_process(delta):
	if position.y <= 205:
		global.player_past_entry = true
		#print("Player Passed Entry -- GP Script 19")
	if global.crash_site_text == true && global.crash_site_text_one_time == false:
		global.crash_site_text_one_time = true
		DialogueManager.show_example_dialogue_balloon(load("res://crash_site_text.dialogue"), "crash_site_text")
		return
	if global.enddialogue == true:
		global.enddialogue = false
		global.transition_scene = true
		global.crash_site_text = true
		get_tree().change_scene_to_file("res://scenes/crash_site.tscn")
		global.finish_changescenes()
	if global.enddialogue_jumpscare == true:
		global.enddialogue_jumpscare = false
		global.transition_scene = true
		get_tree().change_scene_to_file("res://scenes/jump_scare.tscn")
		global.finish_changescenes()
	player_movement(delta)
		
func player_movement(delta):
	
	#print("Script Running, speed = " + str(speed))
	if global.cutscene == true:
		play_anim(0)
		velocity.x = 0
		velocity.y = 0
		playerWalkingAudioStream.stop()
	elif Input.is_action_pressed("ui_right"):
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

var shadow_touch = false

func _on_player_hitbox_body_entered(body: Node2D) -> void:
	print("Method Check: ", body.has_method("shadowman2"))
	if body.has_method("shadowman2") || body.has_method("deathtouch"):
		global.transition_scene = true
		if global.current_scene == "road_9":
			print("Change Scene DEATH -- GP Script func 106")
			global.chase_started = false
			global.aggro = false
			get_tree().change_scene_to_file("res://scenes/road_10.tscn")
			global.finish_changescenes()
