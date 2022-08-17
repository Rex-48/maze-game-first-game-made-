extends KinematicBody2D

var score : int = 0

var speed : int = 200
var jumpForce : int = 600
var gravity : int = 1000

var vel : Vector2 = Vector2()

onready var sprite : Sprite = get_node("SPrite")

func _physics_process(delta):
	
	vel.x = 0
	
	if Input.is_action_pressed("move_left"):
		vel.x -= speed
	
	if Input.is_action_pressed("move_right"):
		vel.x += speed
		
	if Input.is_action_just_pressed("jump") and is_on_floor():
		vel.y -= jumpForce
	
	vel = move_and_slide(vel , Vector2.UP)
	
	if vel.x<0:
		sprite.flip_h = true
		
	elif vel.x>0:
		sprite.flip_h = false
		
	vel.y += gravity*delta
	
	
	
	
	
