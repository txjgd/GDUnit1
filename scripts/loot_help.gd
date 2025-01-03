extends Area2D

@export var Target :CharacterBody2D



func _on_body_entered(body):
	if Target and body == Target:
		queue_free()
