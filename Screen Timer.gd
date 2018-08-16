extends RichTextLabel

var is_running = false
var is_paused = false


func _process(delta):
	clear()
	if(is_running):
		add_text(global.get_time(delta))
	elif(is_paused):
		add_text(global.get_time(0))
	else:
		add_text("00:00.00")
	if(Input.is_action_just_pressed("ui_up")):
		start_timer()
	if(Input.is_action_just_pressed("ui_cancel")):
		pause_timer()
	if(Input.is_action_just_pressed("ui_page_down")):
		stop_timer()

func pause_timer():
	is_running = false
	is_paused = true

func start_timer():
	is_running = true
	is_paused = false
	
func stop_timer():
	is_running = false
	is_paused = false
	global.reset_timer()