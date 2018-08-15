extends RichTextLabel

var stopwatch = 0
var minutes = 0
var seconds = 0
var milliseconds = 0
var is_running = false
var is_paused = false



func _process(delta):
	clear()
	if(is_running):
		add_text(get_time(delta))
	elif(is_paused):
		add_text(get_time(0))
	else:
		add_text("00:00.00")
	connect("level_started", self, "start_timer")
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
	stopwatch = 0

func get_time(delta):
	stopwatch += delta
	stopwatch = stepify(stopwatch, 0.01)
	return get_minutes(stopwatch) + ":" + get_seconds(stopwatch) + "." + get_milliseconds(stopwatch)

func get_minutes(time):
	minutes = time / 60
	minutes = int(minutes)
	if(minutes < 10):
		minutes = "0" + str(minutes)
	else:
		minutes = str(minutes)
	return minutes

func get_seconds(time):
	seconds = fmod(stopwatch, 60)
	seconds = int(seconds)
	if(seconds < 10):
		seconds = "0" + str(seconds)
	else:
		seconds = str(seconds)
	return seconds
	
func get_milliseconds(time):
	milliseconds = fmod(time, 1)
	if(milliseconds==0):
		milliseconds = "00"
	elif(str(milliseconds).length()<4):
		milliseconds = str(milliseconds)
		milliseconds = milliseconds.right(2) + "0"
	else:
		milliseconds = str(milliseconds)
		milliseconds = milliseconds.right(2)
	return milliseconds