extends Node2D

class_name Enemy


export(int) var walk_speed
onready var damage_area: StaticBody2D = get_node("DamageArea")


func _physics_process(delta: float) -> void:
	position.x -= delta * walk_speed


func on_screen_exited() -> void:
	queue_free()



func on_body_entered(body):
	if body is Bird :
		# dar play no audio
		queue_free()
		#get_tree().call_group("Interface", "update_score")

func set_speed(speed: int) -> void:
	walk_speed = speed

func game_over() -> void:
	damage_area.get_node("Collision").set_deferred("disabled", true)
	set_physics_process(false)
