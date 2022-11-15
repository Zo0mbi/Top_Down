extends KinematicBody2D

var is_moving = true
var is_dead = false
var speed = 25
onready var obj = get_parent().get_node("Joueur")
onready var _animted_slime = $AnimatedSprite

func _physics_process(delta):
	deplacer_slime(delta)
#Reste a implementer le if contact avec joueur se deplacer a linverse.
func deplacer_slime(delta):
	deplacer_vers_joueur(delta)
	_animted_slime.play("movement")

func deplacer_vers_joueur(delta):
	var dir = (obj.global_position - global_position).normalized()
	move_and_collide(dir * speed * delta)

func deplacer_opposer_joueur(delta):
	var dir = (obj.global_position - global_position).normalized()
	move_and_collide(-dir * speed * delta)
