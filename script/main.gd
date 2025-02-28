extends Node3D

var old_line : int = 0
var new_line : int = 40

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	redraw_board()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func redraw_board() -> void:
	$GridMap.clear()
	for z in range(old_line,new_line):
		for x in range(-10,10):
			$GridMap.set_cell_item(Vector3i(x,0,z), 2)

func add_line() -> void:
	
	new_line += 1
	for x in range(-10,10):
		$GridMap.set_cell_item(Vector3i(x,0,new_line+1), 2)
		
func del_line() -> void:
	for x in range(-10,10):
		$GridMap.set_cell_item(Vector3i(x,0,old_line), -1)
	old_line += 1
