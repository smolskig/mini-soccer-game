extends KinematicBody

const gravity = 20
const speed = 5

var motion = Vector3(0,1,0)
var maxSpeed = 20 
var chute = false

export (String) var player = ''
export (String) var left_input = ''
export (String) var right_input = ''
export (String) var up_input = ''
export (String) var down_input = ''
export (String) var jump_input = ''
export (String) var run_input = ''

#export (int, 0, 1000) var inertia = 100

func _ready():
	var material = $MeshInstance.get_surface_material(0)
	if player == 'player 1':
		material.albedo_color = Color('#af59ce')
	elif player == 'player 2':
		material.albedo_color = Color('#0046ff')

func _physics_process(delta):
	motion.y =- gravity
	if Input.is_action_pressed(right_input):
		motion.x = min(motion.x + speed,maxSpeed)
	elif Input.is_action_pressed(left_input):
		motion.x = max(motion.x - speed, -maxSpeed)
	else:
		motion.x = lerp(motion.x,0,.2)
		
	if Input.is_action_pressed(up_input):
		motion.z = max(motion.z - speed, -maxSpeed)
	elif Input.is_action_pressed(down_input):
		motion.z = min(motion.z + speed, maxSpeed)
	else:
		motion.z = lerp(motion.z,0,0.5)
		
	if Input.is_action_pressed(run_input):
		maxSpeed = 100
	else:
		maxSpeed = 20
	if is_on_floor():
		if Input.is_action_pressed(run_input):
			motion.y = 20
			
	motion = move_and_slide(motion,Vector3.UP)
	
