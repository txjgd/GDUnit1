extends Area2D

@export var Radius :float = 64
@export var Speed :float = 200
@export var Target :CharacterBody2D

@onready var Host = get_parent()

var is_chasing :bool = false

func _ready():
	$Range.shape.radius = Radius


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if is_chasing:
		var direction = Host.position.direction_to( Target.position ).normalized()
		Host.velocity = direction * Speed
		Host.move_and_slide()

		for i in Host.get_slide_collision_count():
			var collision = Host.get_slide_collision(i)
			if collision.get_collider() == Target:
				var game = get_tree()
				print( game )
				game.quit()


func _on_body_entered(body):
	if body == Target:
		is_chasing = true

func _on_body_exited(body):
	if body == Target:
		is_chasing = false
