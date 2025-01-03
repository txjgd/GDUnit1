extends Path2D

@export var Node_Enabled :bool = true
@export var Speed :float = 200
@export var Target :Node2D

func _ready():
	$PathFollow2D/RemoteTransform2D.remote_path = Target.get_path()
	print( $PathFollow2D/RemoteTransform2D.remote_path )

func _physics_process(delta):
	if Node_Enabled:
		$PathFollow2D.progress += Speed * delta
		#print( $PathFollow2D/Sprite2D.position )
	pass
