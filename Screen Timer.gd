extends RichTextLabel

var stopwatch = 0
var minutes = 0
var seconds = 0
var milliseconds = 0

func _process(delta):
	clear()
	add_text(get_time(delta))



func get_time(delta):
	stopwatch += delta
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
	milliseconds = fmod(stopwatch, 60)
	milliseconds = stepify(milliseconds, 0.01)
	milliseconds = str(milliseconds).right(2)
	return milliseconds