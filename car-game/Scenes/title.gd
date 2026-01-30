extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$HiScore.text = "Hi Score: " + str(Global.Score)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("space"):
		get_tree().change_scene_to_file("res://Scenes/Game.tscn")
