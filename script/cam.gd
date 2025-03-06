extends CharacterBody3D

@export var speed := 1.0

var old_line : int = 0
var new_line : int = 0

func _physics_process(delta: float) -> void:
	var ratio := 0
	var player_z = get_parent().z_player
	var diff = player_z - int(self.global_position.z)
	
	if diff > 20:
		ratio = diff/5
	
	velocity = lerp(velocity, (speed + ratio) * Vector3.BACK, 0.05)
	move_and_slide()
	
	new_line =  int(global_position.z)
	if old_line != new_line:
		old_line = new_line
		get_parent().add_line()
		get_parent().del_line()
		print(new_line)
	
