extends KinematicBody2D

export var speed = 80
export var friction = 0.18
export var acceleration = 0.1

var velocity = Vector2()
var current_animation = "default"

var player_moving=false
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
	var _delta=delta
	
func _physics_process(_delta):
	var direction = get_input()
	deplacer_personnage(direction)

#Sert a normaliser le mouvement ainsi que de mettre un simili effet de continuiter du mouvement sur un arret.
#Modifie l'animation dependament du mouvement.
func deplacer_personnage(direction):
	if direction.length() > 0:
		velocity = lerp(velocity, direction.normalized() * speed, acceleration)
		player_moving=true
	else:
		velocity = lerp(velocity, Vector2.ZERO, friction)
		player_moving=false
	velocity = move_and_slide(velocity)

func player_manager():
	if Input.is_action_pressed('player_right'):
		_animated_sprite.scale.x=1
	if Input.is_action_pressed('player_left'):
		_animated_sprite.scale.x=-1
	if Input.is_action_pressed('player_attaque'):
		player_animation_manager("Attaque")

func _on_AnimatedSprite_animation_finished():
	player_animation_manager("default")
	if player_moving:
		_animated_sprite.play("Run")
func player_animation_manager(animation):
	_animated_sprite.play(animation)
