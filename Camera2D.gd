extends Camera2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var player_motion
var variable_zoom = 1

func _process(delta):
	player_motion = abs(get_node("..").motion.x)
	if(player_motion>1000):
		variable_zoom = player_motion/1000
	set_zoom(Vector2(variable_zoom,variable_zoom))
	print(get_zoom())

