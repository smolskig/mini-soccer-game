extends Area


func _ready():
	pass


func _on_gol2_body_entered(body):
	if body.name == 'Ball':
		$"/root/Global".p1 = $"/root/Global".p1 + 1

