extends Area


func _ready():
	pass


func _on_gol1_body_entered(body):
	if body.name == 'Ball':
		$"/root/Global".p2 = $"/root/Global".p2 + 1
		print($"/root/Global".p1)
