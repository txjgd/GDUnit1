class_name PlayerMovement
extends Node

@export var Speed :float = 200

@onready var Host = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	Host.velocity = direction * Speed
	Host.move_and_slide()