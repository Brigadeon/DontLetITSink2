extends AudioStreamPlayer

signal self_stream
var offset = 0



func remove_self():
	queue_free()
	

func play_sound(sound_stream):
	self_stream(sound_stream)
	connect("finished, self ,remove_self")
	play(offset)
	
func _ready():
	pass #Replace with function body.
# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
