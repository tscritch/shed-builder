extends Node3D

var _data

var foundation: MeshInstance3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_data = get_node("../_data")

	print(_data.ui_values)

	foundation = $FoundationMesh


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	foundation.mesh.size.x = _data.ui_values["width"]
	foundation.mesh.size.z = _data.ui_values["depth"]
