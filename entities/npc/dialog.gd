extends Reference
class_name NPCDialog

var speech = [". . ."]

var i = 0

func next():
	var text = speech[i]
	i += 1
	if i == len(speech):
		i = 0
	return text

func has_next():
	return i != 0
