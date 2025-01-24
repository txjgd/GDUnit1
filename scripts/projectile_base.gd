extends Area2D

@export var Speed :float = 200
@export var Direction :Vector2 = Vector2.UP
@export var Power :float = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	position += Direction * Speed * delta
	pass
	


func _on_body_entered(body):
	print(body)
	var actor = body.get_node("Actor")
	if actor:
		actor.perform( "take_hit", Power )
	queue_free()
	pass # Replace with function body.
