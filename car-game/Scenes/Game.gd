extends Node2D

var car_scene: PackedScene = preload("res://Scenes/Car.tscn")
var score: int = 999

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	var car = car_scene.instantiate()
	var pos_marker = $CarStartPositions.get_children().pick_random()
	car.position = pos_marker.position
	$Objects.add_child(car)
	car.connect("body_entered", _on_car_body_entered)
	
	score -= 1
	$CanvasLayer/Label.text = 'Score: ' + str(score)

func _on_car_body_entered(_body: Node2D) -> void:
	call_deferred("go_to_title")

func _on_finish_area_body_entered(_body: Node2D) -> void:
	if score > Global.Score:
		Global.Score = score
	call_deferred("go_to_title")
	
func go_to_title():
	get_tree().change_scene_to_file("res://Scenes/title.tscn")
