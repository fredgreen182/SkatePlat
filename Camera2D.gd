extends Camera2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

const ZOOM_SPEED = 0.015
const MIN_ZOOM = 1.5
const MAX_ZOOM = 1

var player_speed
var custom_zoom = MAX_ZOOM

func _process(delta):
	player_speed = abs(get_node("..").motion.x)
	if(player_speed>1000):
		custom_zoom = lerp(custom_zoom, MIN_ZOOM, ZOOM_SPEED)
	if(player_speed<1000):
		custom_zoom = lerp(custom_zoom, MAX_ZOOM, ZOOM_SPEED)
	set_zoom(Vector2(custom_zoom,custom_zoom))
	print(get_zoom())

