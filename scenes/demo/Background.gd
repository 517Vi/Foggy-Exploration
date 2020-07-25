extends Node

onready var timer = get_node("Timer")
var count = 0;

func _ready():
	var player = AudioStreamPlayer.new();
	self.add_child(player)
	player.stream = load("res://Sounds/Howling winds sounds effects for 15 minutes.ogg")
	player.play()
	timer.set_wait_time(.7)
func _process(delta):
	#Footstep sound stuff
	if Input.is_action_just_pressed("move_down") or Input.is_action_just_pressed("move_up") or Input.is_action_just_pressed("move_left") or Input.is_action_just_pressed("move_right"):
			timer.start()
			print("start")
	if Input.is_action_just_released("move_down") or Input.is_action_just_released("move_up") or Input.is_action_just_released("move_left") or Input.is_action_just_released("move_right"):
		if not(Input.is_action_pressed("move_down") or  Input.is_action_pressed("move_up") or  Input.is_action_pressed("move_left") or  Input.is_action_pressed("move_right")):
			timer.stop()
			print("stop")
			
func _on_Timer_timeout():
	var footstep = AudioStreamPlayer.new();
	self.add_child(footstep)
	if count%3 == 0:
		footstep.stream = load("res://Sounds/foot_stone_walk_dry0.wav")
	elif count%3 == 1:
		footstep.stream = load("res://Sounds/foot_stone_walk_dry1.wav")
	else:
		footstep.stream = load("res://Sounds/foot_stone_walk_dry2.wav")
	count= count+1
	#loops through 3 different sound effects
	footstep.play()
