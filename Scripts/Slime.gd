extends KinematicBody2D

var is_moving = true
var is_dead = false
var speed = 25
onready var obj = get_parent().get_node("Joueur")


func _physics_process(delta):
	deplacer_slime(delta)
#Reste a implementer le if contact avec joueur se deplacer a linverse.
func deplacer_slime(delta):
	deplacer_vers_joueur(delta)

func deplacer_vers_joueur(delta):
	var dir = (obj.global_position - global_position).normalized()
	move_and_collide(dir * speed * delta)

func deplacer_opposer_joueur(delta):
	var dir = (obj.global_position - global_position).normalized()
	move_and_collide(-dir * speed * delta)
