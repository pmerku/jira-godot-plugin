@tool
class_name Jira extends EditorPlugin

const main_panel: PackedScene = preload("res://addons/jira_plugin/jira.tscn");

const main_panel_name: String = "Jira";
#const main_panel_icon: Texture2D = preload("res://icon.svg"); # TODO icon

var main_panel_instance: Control;

func _enter_tree() -> void:
	main_panel_instance = main_panel.instantiate();
	
	# add the main panel to the editor main viewport
	EditorInterface.get_editor_main_screen().add_child(main_panel_instance);
	
	# hide the main panel. !! this is required !!
	_make_visible(false);


func _exit_tree() -> void:
	if main_panel_instance != null:
		main_panel_instance.queue_free();


func _has_main_screen() -> bool:
	return true;


func _make_visible(visible: bool) -> void:
	if main_panel_instance != null:
		main_panel_instance.visible = visible;


func _get_plugin_name() -> String:
	return main_panel_name;


func _get_plugin_icon() -> Texture2D:
	# must return a texture for the icon
	#return main_panel_icon;
	
	return get_editor_interface().get_base_control().get_theme_icon("Node", "EditorIcons");
