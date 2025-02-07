extends Area2D

@export var Radius :float = 64
@export var Speed :float = 200
@export var Target :CharacterBody2D

@onready var Host = get_parent()
@onready var Anim = get_parent().get_node("AnimationPlayer")

var is_chasing :bool = false

var last_direction :Vector2 = Vector2( 0, 1 )
var stun_time :float = 0
var elapsed :float = 0

func _ready():
	$Range.shape.radius = Radius


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if stun_time:
		elapsed += delta
		
	if elapsed < stun_time:
		return

	stun_time = 0
	
	if is_chasing:
		var direction = Host.position.direction_to( Target.position ).normalized()
		Host.velocity = direction * Speed
		last_direction = direction
		Host.move_and_slide()

		for i in Host.get_slide_collision_count():
			var collision = Host.get_slide_collision(i)
			if collision.get_collider() == Target:
				var game = get_tree()
				print( game )
				game.quit()


func _on_body_entered(body):
	if body == Target:
		Anim.play( "alert" )
		#await Anim.animation_finished
		is_chasing = true

func _on_body_exited(body):
	if body == Target:
		is_chasing = false

func get_last_direction():
	return last_direction

func stun( length :float ):
	Anim.play( "shake" )
	stun_time = length
	elapsed = 0
	is_chasing = false
