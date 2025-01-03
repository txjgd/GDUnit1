class_name FaceMovementDirection
extends Node

@onready var Host = get_parent()

var old_position :Vector2 

# Called when the node enters the scene tree for the first time.
func _ready():
	old_position = Host.position
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var direction = old_position.direction_to( Host.position )
	var angle = direction.angle() - 1.570796

	#var direction = Host.velocity.normalized()
	#var angle = Host.velocity.angle() - 1.570796
	Host.get_node( "Vision" ).rotation = angle
	old_position = Host.position
	pass
