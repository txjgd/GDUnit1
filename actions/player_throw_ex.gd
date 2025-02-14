class_name PlayerThrowEx
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

	if (Input.is_action_just_pressed( "ui_select" ) or
		Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)):
		print("throwing....")
		var mouse = Host.get_global_mouse_position()
		var dir = Host.position.direction_to( mouse ).normalized()
		Actor.perform( "throw", dir )
		elapsed = 0
