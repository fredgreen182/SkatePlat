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
		milliseconds = milliseconds.right(1) + "0"
	else:
		milliseconds = str(milliseconds)
		milliseconds = milliseconds.right(2)
	print(milliseconds)
	return milliseconds