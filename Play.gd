extends Button

var original_position
var hovering = false
var animation_timer
var animation_speed = 0.1
var amplitude = 10.0

func _ready():
	original_position = position
	animation_timer = Timer.new()
	animation_timer.wait_time = animation_speed
	animation_timer.one_shot = false
	add_child(animation_timer)
	animation_timer.connect("timeout", self, "_on_animation_timer_timeout")

func _on_mouse_entered():
	hovering = true
	animation_timer.start()

func _on_mouse_exited():
	hovering = false
	animation_timer.stop()
	position = original_position

func _on_animation_timer_timeout():
	position.y = original_position.y + sin(animation_timer.time_elapsed * 5) * amplitude
