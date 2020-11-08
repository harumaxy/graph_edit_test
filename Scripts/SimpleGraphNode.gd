extends GraphNode


# 個々の部分はなくても、inspector からスロットを作成できる
# func _ready():
#   self.set_slot(0, true, 0, Color(1,1,1,1), true, 0, Color(0,1,0,1))


func _on_GraphNode_close_request():
  queue_free()

func _on_GraphNode_resize_request(new_size: Vector2):
  self.rect_size = new_size
