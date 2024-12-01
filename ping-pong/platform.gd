extends StaticBody3D

const CLAMP_ANGLE = 0.15
const ROTATION_CHANGE_SPEED = 1.5
const MAX_OFFSET = 20.0
const MIN_ROTATION = Vector3(-CLAMP_ANGLE, -INF, -CLAMP_ANGLE)
const MAX_ROTATION = Vector3(CLAMP_ANGLE, INF, CLAMP_ANGLE)
const MIN_POSITION = Vector3(-MAX_OFFSET, 0.0, -MAX_OFFSET)
const MAX_POSITION = Vector3(MAX_OFFSET, 0.0, MAX_OFFSET)
const ROTATION_SPEED = 0.1

func _process(delta: float) -> void:
	var vertical_axis: float = Input.get_axis("platform_rotation_north", "platform_rotation_south")
	var horizontal_axis: float = Input.get_axis("platform_rotation_east", "platform_rotation_west")
	var rotation_direction: float = Input.get_axis("platform_rotate_anticlockwise", "platform_rotate_clockwise")
	
	var combined_axis: Vector3 = Vector3(vertical_axis, 0.0, horizontal_axis)
	var current_rotation: Vector3 = get_rotation()
	var changed_rotation: Vector3 = current_rotation + combined_axis * delta * ROTATION_CHANGE_SPEED
	var clamped_rotation: Vector3 = changed_rotation.clamp(MIN_ROTATION, MAX_ROTATION)
	
	var mesh_rotation = $Mesh.get_rotation().y
	
	set_rotation(clamped_rotation)
	#set_constant_angular_velocity(Vector3(0.0, rotation_direction * ROTATION_SPEED, 0.0))
	#$Mesh.set_rotation(Vector3(0.0, mesh_rotation + rotation_direction * ROTATION_SPEED * delta, 0.0))
