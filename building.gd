extends Node3D


var _data

@export var ANIM_SPEED = 5
var foundation: MeshInstance3D

var building = {}

func set_dim(sizeable, new_size, delta):
	sizeable.size = sizeable.size.lerp(new_size, delta * ANIM_SPEED)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_data = get_node("../_data")

	print(_data.ui_values)
	create_wall("left_wall")
	create_wall("back_wall")
	
	print(building)

	foundation = $FoundationMesh
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	set_dim(foundation.mesh, Vector3(_data.ui_values.base_dim.x, foundation.mesh.size.y, _data.ui_values.base_dim.z), delta)

	position_back_wall(delta)
	#position_wall("left_wall", delta)
	

func position_back_wall(delta):
	var base = building.back_wall.base_board
	#base.mesh.size = Vector3(_data.ui_values.board_dim.z, _data.ui_values.board_dim.y, _data.ui_values.base_dim.z), delta)
	set_dim(base.mesh, Vector3(_data.ui_values.board_dim.z, _data.ui_values.board_dim.y, _data.ui_values.base_dim.z), delta)
	base.position = Vector3(-(foundation.mesh.size.x / 2) + (_data.ui_values.board_dim.z / 2), foundation.mesh.size.y + (_data.ui_values.board_dim.y / 2), 0)

func position_wall(wall_name, delta):
	var base = building[wall_name].base_board
	set_dim(base.mesh, Vector3(_data.ui_values.base_dim.x - (_data.ui_values.board_dim.z * 2), _data.ui_values.board_dim.y, _data.ui_values.board_dim.z), delta)
	base.position = Vector3(0, foundation.mesh.size.y + (_data.ui_values.board_dim.y / 2), (foundation.mesh.size.z / 2) - (_data.ui_values.board_dim.z / 2))
	

# Instantiate

func create_wall(wall_name):
	building[wall_name] = {}
	building[wall_name].base_board = create_new_board(Vector3.ZERO)
	

var board_scene = preload("res://components/board.tscn")
func create_new_board(the_position):
	var new_instance = board_scene.instantiate()
	new_instance.position = the_position
	self.add_child(new_instance)
	return new_instance
