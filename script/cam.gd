extends CharacterBody3D

@export var speed := 1.0

var old_line : int = 0
var new_line : int = 0

func _physics_process(delta: float) -> void:
	velocity = speed * Vector3.BACK
	move_and_slide()
	
	new_line =  int(global_position.z)
	if old_line != new_line:
		old_line = new_line
		get_parent().add_line()
		get_parent().del_line()
		print(new_line)
	
