extends CanvasLayer

var playerhealth = 100.0
var enemyhealth = 100.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_clock_animation_finished() -> void:
	if %Scream.button_pressed:
		%Chicken.animation = "ability"
		var tween = get_tree().create_tween()
		var dmg = randi_range(15, 40)
		enemyhealth -= dmg
		show_damage(dmg)
		tween.tween_property(%EnemyHealth, "value", enemyhealth, 2.0)
		await get_tree().create_timer(3.0).timeout
		%Chicken.animation = "default"
	elif %Water.button_pressed:
		%Blahaj.animation = "ability"
		var tween = get_tree().create_tween()
		var dmg = randi_range(20, 30)
		enemyhealth -= dmg
		show_damage(dmg)
		tween.tween_property(%EnemyHealth, "value", enemyhealth, 2.0)
		await get_tree().create_timer(3.0).timeout
		%Blahaj.animation = "default"
	elif %Stare.button_pressed:
		%Chicken.stop()
		%Blahaj.stop()
		var tween = get_tree().create_tween()
		var dmg = randi_range(3, 12)
		enemyhealth -= dmg
		show_damage(dmg)
		tween.tween_property(%EnemyHealth, "value", enemyhealth, 2.0)
		await get_tree().create_timer(3.0).timeout
		%Chicken.play()
		%Blahaj.play()
	elif %Skip.button_pressed:
		var tween = get_tree().create_tween()
		var dmg = 0
		show_damage(dmg)
		tween.tween_property(%EnemyHealth, "value", enemyhealth, 2.0)
		await get_tree().create_timer(3.0).timeout
	else:
		var tween = get_tree().create_tween()
		var dmg = 0
		show_damage(dmg)
		tween.tween_property(%EnemyHealth, "value", enemyhealth, 2.0)
		await get_tree().create_timer(3.0).timeout
	
	if enemyhealth <= 0:
		pass
	otter_damage()
	await get_tree().create_timer(3.0).timeout
	choose_move()
	
	if playerhealth <= 0:
		pass
		
	# you could check if healths are <= 0 here and lead to diff endings

func show_damage(dmg) -> void:
	if dmg > 0:
		%CharacterLabel.text = "Otter was hit"
		%DialogueLabel.text = "-" + str(dmg) + " HP"
	else:
		%CharacterLabel.text = "Why would you skip??"
		%DialogueLabel.text = "no damage to the otter."
	%DialogueLabel.visible = true
	%Moves.visible = false

func otter_damage() -> void:
	var damage = randi_range(5, 30)
	playerhealth -= damage
	var tween = get_tree().create_tween()
	tween.tween_property(%PlayerHealth, "value", playerhealth, 2.0)
	%CharacterLabel.text = "The otter hit you"
	%DialogueLabel.text = "-" + str(damage) + " HP"

func choose_move() -> void:
	%CharacterLabel.text = "Choose your move"
	%DialogueLabel.visible = false
	%Moves.visible = true
	%Clock.play()

	%Scream.button_pressed = false
	%Water.button_pressed = false
	%Stare.button_pressed = false
	%Skip.button_pressed = false
