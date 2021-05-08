extends Node2D

var old = 0
onready var _wall=preload("res://wall.tscn")

func _ready() -> void:
	randomize()
	pass # Replace with function body.

func _process(delta: float) -> void:
	$sol.position.x = $player.position.x

	var p = stepify($player.position.x, 640)
	print(p)
	if p != old:
		old = p
		var w = _wall.instance()
		add_child(w)
		w.position.x = p + 640
		w.position.y = randi()% 8 * -64
		
	$CanvasLayer/Label2.text = str(int(($player.position.x - 640) / 640)).pad_zeros(6)
		
	if Input.is_action_just_pressed("enter"):get_tree().reload_current_scene()
		



func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()



func _on_Area2D_body_entered(body: Node) -> void:
	$player.set_physics_process(false)
	$CanvasLayer/Label.visible = true
	

