extends CharacterBody2D

var speed = 35 # Supposed to be 50 100 for testing
@onready var playerWalkingAudioStream = $AudioStreamPlayer2D_walking

var current_dir = "none"

var going_out = true

var shadow_stop = false

var player = null

var player_chase = false

func shadowman2():
	pass
	
func deathtouch(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	if global.aggro ==true:
		player_chase = true
	if player_chase == true:
		#print("Player Being Chased")
		#print("Player Position: x:", player.position.x, " y: ", player.position.y)
		#print("Shawdowman Position: x:", position.x, " y: ", position.y) 
		
		if position.x < player.position.x && position.y < player.position.y:
			#print("SHADOW MAN: walking 1")
			$AnimatedSprite2D.play("walking_down")
			velocity.x = speed/2
			velocity.y = speed
			#print("Player moving UP, speed = " + str(speed))
			#if !playerWalkingAudioStream.playing:
				#playerWalkingAudioStream.play()
		elif position.x < player.position.x && position.y > player.position.y:
			#print("SHADOW MAN: walking 2")
			$AnimatedSprite2D.play("walking_up")
			velocity.x = speed/2
			velocity.y = -speed
			#print("Player moving UP, speed = " + str(speed))
			#if !playerWalkingAudioStream.playing:
				#playerWalkingAudioStream.play()
		elif position.x > player.position.x && position.y < player.position.y:
			#print("SHADOW MAN: walking 3")
			$AnimatedSprite2D.play("walking_down")
			velocity.x = -speed/2
			velocity.y = speed
			#print("Player moving UP, speed = " + str(speed))
			#if !playerWalkingAudioStream.playing:
				#playerWalkingAudioStream.play()
		elif position.x > player.position.x && position.y > player.position.y:
			#print("SHADOW MAN: walking 4")
			$AnimatedSprite2D.play("walking_up")
			velocity.x = -speed/2
			velocity.y = -speed
			#print("Player moving UP, speed = " + str(speed))
			#if !playerWalkingAudioStream.playing:
				#playerWalkingAudioStream.play()
		elif position.x > player.position.x && position.y == player.position.y:
			#print("SHADOW MAN: walking 3")
			$AnimatedSprite2D.play("walking_left")
			velocity.x = -speed/2
			velocity.y = speed
			#print("Player moving UP, speed = " + str(speed))
			#if !playerWalkingAudioStream.playing:
				#playerWalkingAudioStream.play()
		elif position.x > player.position.x && position.y == player.position.y:
			#print("SHADOW MAN: walking 4")
			$AnimatedSprite2D.play("walking_right")
			velocity.x = -speed/2
			velocity.y = -speed
			#print("Player moving UP, speed = " + str(speed))
			#if !playerWalkingAudioStream.playing:
				#playerWalkingAudioStream.play()
		move_and_slide()
	
		


#print("Script Running")



func _ready():
	$AnimatedSprite2D.play("walking_down")

func _on_detection_area_body_entered(body: Node2D) -> void:
		print("Player Detected")
		player = body


func _on_shadow_hitbox_body_entered(body: Node2D) -> void:
	print("Shadowman Touched ME!")
	if  player_chase == true:
		print("Player Chased")
		print("X Close: ", abs(position.x - player.position.x), " Y Close: ", abs(position.y - player.position.y))
		if  (abs(position.x - player.position.x)) < 15  && (abs(position.y - player.position.y)) < 15:
			global.transition_scene = true
			if global.current_scene == "road_9":
				print("Change Scene DEATH -- GP Script func 106")
				global.chase_started = false
				global.aggro = false
				get_tree().change_scene_to_file("res://scenes/road_10.tscn")
				global.finish_changescenes()
