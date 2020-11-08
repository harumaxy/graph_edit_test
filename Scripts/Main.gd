extends Control

var sgn: PackedScene = preload("res://SimpleGraphNode.tscn")

var initial_position = Vector2(40, 40)
var spawn_offset = Vector2(20,20)
var node_index = 0

func _on_Button_pressed():
  var node = sgn.instance()
  node.offset += initial_position + (node_index * spawn_offset)
  node.title += "-" + str(node_index)
  $GraphEdit.add_child(node)
  node_index += 1


# 子要素の GraphNode クラスの接続、切断はすべてGraphEdit ノードがやる

func _on_GraphEdit_connection_request(from: String, from_slot: int, to:String, to_slot: int):
  $GraphEdit.connect_node(from, from_slot, to, to_slot)


func _on_GraphEdit_disconnection_request(from, from_slot, to, to_slot):
  $GraphEdit.disconnect_node(from, from_slot, to, to_slot)


func _on_RunProgram_pressed():
  var G = $GraphEdit
  # reduce
  var result = 0
  var list = G.get_connection_list()
  for i in range(0, list.size()):
    var con = list[i]
    var from_val = G.get_node(con.from).get_node("SpinBox").value
    var to_val = G.get_node(con.to).get_node("SpinBox").value
    var value =  from_val + to_val if i == 0 else to_val
    result += value
  print(result)

    
