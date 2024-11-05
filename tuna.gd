extends Area2D

func _on_body_entered(body):
    if body.is_in_group("Player"):  # Assuming player is in 'Player' group
        # Inform the parent scene to add score
        get_parent().add_score(5)  # Notify main scene to increase score
        queue_free()  # Remove the collectible