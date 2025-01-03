class_name EnemyChaseMovement
extends Node

@export var Speed :float = 200
@export var Target :Node
@onready var Host = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var heading = Host.position.direction_to( Target.position ).normalized()
	#var heading = (Target.position - Host.position).normalized()
	Host.velocity = heading * Speed
	Host.move_and_slide()
