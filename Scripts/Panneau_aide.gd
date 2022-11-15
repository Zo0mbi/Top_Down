extends Area2D

onready var _texte_aide = $Label
var text_aide="W A S D pour se deplacer. espace pour attaque"
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Panneau_aide_body_entered(body):
	if body.name=="Joueur":
		_texte_aide.set_text(text_aide)


func _on_Panneau_aide_body_exited(body):
	if body.name=="Joueur":
		_texte_aide.set_text("")
