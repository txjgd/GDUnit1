extends Node
class_name StunWhenHitAction

@export var length :float = 5

@onready var Host = get_parent()
@onready var Actor = get_parent().get_node( "Actor" )

func take_hit( amt :float ):
	Actor.perform( "stun", length )
	pass
