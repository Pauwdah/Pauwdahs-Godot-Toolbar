# addons/toggle_process_plugin/toggle_process_plugin.gd
@tool
extends EditorPlugin

var panel 
const TOOL_PANEL = preload("res://addons/Pauwdahs Toolbar/tool_panel.tscn")


func _enter_tree(): 
	# Create the toggle button and add it to the editor's toolbar
	panel = TOOL_PANEL.instantiate()
	panel.undo_redo =get_undo_redo()
	add_control_to_dock(EditorPlugin.DOCK_SLOT_LEFT_BL, panel)
	pass


func _exit_tree():
	# Remove the button when the plugin is disabled
	remove_control_from_docks(panel)
	panel.queue_free()
	pass
