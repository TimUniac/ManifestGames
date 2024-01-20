extends HSlider


func _on_value_changed(value):
	GlobalWorldEnvironment.environment.adjustment_brightness = value 
