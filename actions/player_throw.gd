class_name PlayerThrow
extends Node

@export var Rate :float = 1
@onready var Host = get_parent()
@onready var Actor = get_parent().get_node( "Actor" )

var elapsed :float = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	elapsed += delta
	if elapsed < Rate:
		return

	if Input.is_action_just_pressed( "ui_select" ):
		print("throwing....")
		var dir = Actor.calculate( "get_last_direction" )
		Actor.perform( "throw", dir )
		elapsed = 0
