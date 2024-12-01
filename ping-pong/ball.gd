extends RigidBody3D

const MAX_TORQUE = 40.0

func _process(delta: float) -> void:
	var vertical_axis: float = Input.get_axis("ball_north", "ball_south")
	var horizontal_axis: float = Input.get_axis("ball_east", "ball_west")
	var combined_axis: Vector3 = Vector3(vertical_axis, 0.0, horizontal_axis)
	
	set_constant_torque(combined_axis * MAX_TORQUE)
