extends Node


var ui_values = {
	base_dim = {
		x = 1.0, # width
		y = 2.0, # height
		z = 1.0, # depth
	},
	
	board_dim = {
		x = 1, # length
		y = 0.0381,
		z = 0.0889, 
	}
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var ui = get_node("../UI/ScrollContainer/VBoxContainer")

	var width: SpinBox = ui.get_node("WidthInput/Input")
	width.value_changed.connect(_on_width_change)

	var depth: SpinBox = ui.get_node("DepthInput/Input")
	depth.value_changed.connect(_on_depth_change)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_width_change(new_width):
	print("width ", new_width)
	ui_values.base_dim.x = new_width

func _on_depth_change(new_depth):
	print("depth ", new_depth)
	ui_values.base_dim.z = new_depth
