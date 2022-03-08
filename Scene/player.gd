extends KinematicBody2D

const Speed := 250
const Gravity := 250
const JumpVelocity := 150
var velocity := Vector2()
var current_block := 0
var mouse_position := Vector2()

onready var tilemap = $"../TileMap"


func get_input(delta):
	velocity.x = 0
	mouse_position = tilemap.world_to_map(get_global_mouse_position())
	
	if Input.is_action_just_pressed("move_up"):
		if is_on_floor():
			velocity.y -= JumpVelocity
		
	if Input.is_action_pressed("move_down"):
		velocity.y += Speed
		
	if Input.is_action_pressed("move_left"):
		velocity.x -= Speed
		
	if Input.is_action_pressed("move_right"):
		velocity.x += Speed
		
	velocity.y += Gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
		
	if Input.is_action_just_released("next_item"):
		if current_block < tilemap.ID.size() - 2:
			current_block += 1
		
	if Input.is_action_just_released("prev_item"):
		if current_block > 0:
			current_block -= 1
			
	if Input.is_action_pressed("rclick"):
		tilemap.set_tile(mouse_position[0], mouse_position[1], current_block)
		
	if Input.is_action_pressed("lclick"):
		tilemap.set_tile(mouse_position[0], mouse_position[1], -1)
			
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()
		

func _physics_process(delta):
	get_input(delta)
