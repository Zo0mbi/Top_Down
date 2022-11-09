extends KinematicBody2D

export var speed = 80
export var friction = 0.18
export var acceleration = 0.1

var velocity = Vector2()

onready var _animated_sprite = $AnimatedSprite

#Methode pour sortir les inputs du joueurs
func get_input():
	var input = Vector2()
	if Input.is_action_pressed('player_right'):
		input.x += 1
	if Input.is_action_pressed('player_left'):
		input.x += -1
	if Input.is_action_pressed('player_down'):
		input.y += 1
	if Input.is_action_pressed('player_up'):
		input.y -= 1
	return input

func _process(delta):
	player_manager()
	
func _physics_process(_delta):
	#Sert a normaliser le mouvement ainsi que de mettre un simili effet de continuiter du mouvement sur un arret.
	#Modifie l'animation dependament du mouvement.
	var direction = get_input()
	if direction.length() > 0:
		velocity = lerp(velocity, direction.normalized() * speed, acceleration)
		_animated_sprite.play("Run")
	else:
		velocity = lerp(velocity, Vector2.ZERO, friction)
		_animated_sprite.play("default")
		if Input.is_action_pressed('player_attaque'):
			_animated_sprite.play("Attaque")
	velocity = move_and_slide(velocity)


func player_manager():
	if Input.is_action_pressed('player_right'):
		_animated_sprite.scale.x=1
	if Input.is_action_pressed('player_left'):
		_animated_sprite.scale.x=-1
