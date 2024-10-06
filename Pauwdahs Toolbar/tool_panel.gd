@tool
extends VBoxContainer

var undo_redo : EditorUndoRedoManager

func _on_process_toggle_button_pressed():
	var editor_selection = EditorInterface.get_selection()
	var selected_nodes = editor_selection.get_selected_nodes()
	
	
	undo_redo.create_action("Pauwdahs Toolbar: Process Toggle")
	
	for node in selected_nodes:
		if node is Node:
			
			var strarting_mode = node.process_mode
			if node.process_mode == 4:
				node.process_mode = Node.PROCESS_MODE_INHERIT
				
			else:
				node.process_mode = Node.PROCESS_MODE_DISABLED
				
				
			
			undo_redo.add_do_property(node, "process_mode", node.process_mode)
			undo_redo.add_undo_property(node, "process_mode", strarting_mode)
			
	
	undo_redo.commit_action()
	pass # Replace with function body.


func _on_physics_process_toggle_button_pressed():
	var editor_selection = EditorInterface.get_selection()
	var selected_nodes = editor_selection.get_selected_nodes()
	
	undo_redo.create_action("Pauwdahs Toolbar: Physics Toggle")
	for node in selected_nodes:
		if node is Node:
			var strarting_mode = node.physics_interpolation_mode
			
			if node.physics_interpolation_mode == 2:
				node.physics_interpolation_mode = Node.PHYSICS_INTERPOLATION_MODE_INHERIT
			else:
				node.physics_interpolation_mode = Node.PHYSICS_INTERPOLATION_MODE_OFF
		
			undo_redo.add_do_property(node, "is_physics_processing", node.physics_interpolation_mode)
			undo_redo.add_undo_property(node, "is_physics_processing", strarting_mode)
		
	undo_redo.commit_action()
	pass # Replace with function body.
