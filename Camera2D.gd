extends Camera2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

const ZOOM_SPEED = 0.015
const MIN_ZOOM = 1.5
const MAX_ZOOM = 1
const MAX_OFFSET = 400

var player_motion
var custom_zoom = MAX_ZOOM
var custom_offset = 0
var current_offset

func _process(delta):
	player_motion = get_node("..").motion
	change_position(player_motion)
	change_zoom(abs(player_motion.x))
	

func change_position(motion):
	current_offset = get_offset()
	if(motion.x>400):
		custom_offset = lerp(current_offset.x,MAX_OFFSET,ZOOM_SPEED)
		set_offset(Vector2(custom_offset,current_offset.y))
	elif(motion.x<-400):
		custom_offset = lerp(current_offset.x,-MAX_OFFSET,ZOOM_SPEED)
		set_offset(Vector2(custom_offset,current_offset.y))
	elif(motion.x>-200||motion.x<200):
		custom_offset = lerp(current_offset.x,0,ZOOM_SPEED)
		set_offset(Vector2(custom_offset,current_offset.y))

func change_zoom(speed):
	if(speed>1000):
		custom_zoom = lerp(custom_zoom, MIN_ZOOM, ZOOM_SPEED)
	if(speed<800):
		custom_zoom = lerp(custom_zoom, MAX_ZOOM, ZOOM_SPEED)
	set_zoom(Vector2(custom_zoom,custom_zoom))