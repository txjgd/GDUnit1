extends Node
class_name Actor

@onready var Host = get_parent()

var components = []

func _ready():
	for node in Host.get_children():
		if node != self:
			components.append( node )
	pass

func calculate( method :String ):
	for comp in components:
		if comp.has_method( method ):
			var callable = Callable( comp, method )
			return callable.call()
	
func perform( method :String, arg ):
	for comp in components:
		if comp.has_method( method ):
			var callable = Callable( comp, method )
			callable.call( arg )
			return
	pass
