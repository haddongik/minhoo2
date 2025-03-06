extends Area3D

var dir : Vector3 = Vector3.ZERO
var is_moving : bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	dir = Vector3.ZERO
	if Input.is_action_pressed("ui_up"):
		dir = Vector3.BACK
	elif Input.is_action_pressed("ui_left"):
		dir = Vector3.RIGHT
	elif Input.is_action_pressed("ui_right"):
		dir = Vector3.LEFT
		
	if dir == Vector3.BACK:
		get_parent().set_z_player(int(global_position.z))
	
	if dir != Vector3.ZERO and not is_moving:
		is_moving = true
		var a = global_position
		var b = a + dir

		var tween = create_tween()  # SceneTreeTween 생성
		tween.set_trans(Tween.TRANS_BOUNCE)  # BOUNCE 효과 적용
		tween.set_ease(Tween.EASE_OUT)  # EASE_OUT (천천히 멈추는 효과)
		tween.tween_property(self, "position", b, 0.1)
		print("sss", b)
		await tween.finished
		is_moving = false
