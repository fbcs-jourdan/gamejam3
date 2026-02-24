extends GridMap

var light = preload("res://light_curved_2.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# find all of the lights using the light-curved-2 mesh
	var lights := get_used_cells_by_item(56)
	
	# replace all occurences of the light-curved-2 mesh
	# with instances of the light_curved_2 scene
	for pos in lights:	
		var world_pos = to_global(map_to_local(pos))
		var new_light := light.instantiate()
		add_child(new_light)
		new_light.global_position = world_pos
		
		# get the direction the light is facing
		# this I hard coded, not sure how to tell direction any other way
		# if you see it printing, add another elif and figure out the rotation angle
		var orientation = get_cell_item_orientation(pos)
		if orientation == 0:
			new_light.rotation.y = 0
		elif orientation == 22:
			new_light.rotation.y = -90
		elif orientation == 19:
			new_light.rotation.y = -90
		else:
			print('open road_tiles.gd and add orientation: ' +str(orientation))
		
		set_cell_item(pos, -1)
