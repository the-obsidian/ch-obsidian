proc(_tellraw, @target, @message) {
  sudo('/tellraw '.@target.' '.json_encode(@message))
}
