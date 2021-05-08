extends RigidBody2D


var speed := 3
var vel   := Vector2.ZERO

func _physics_process(delta: float) -> void:
	vel = Vector2.ZERO
	if Input.is_action_just_pressed("ui_accept"):
		vel.y = -1000
		
	vel.x = speed
	apply_central_impulse(vel)
