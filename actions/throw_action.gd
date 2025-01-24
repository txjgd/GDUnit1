extends Node
class_name ThrowAction

@export var Speed :float = 200
@export var Power :float = 10

@export var projectile :PackedScene
@onready var Host = get_parent()

func throw( toward :Vector2 ):
	var proj = projectile.instantiate()
	proj.position = Host.position + (toward * 48)
	proj.Direction = toward
	proj.Speed = Speed
	proj.Power = Power
	owner.add_child( proj )
	pass


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
