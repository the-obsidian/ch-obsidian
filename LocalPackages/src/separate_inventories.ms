bind(world_changed, null, null, @event) {
  @player = @event['player']
  @from = @event['from']
  @to = @event['to']

  @default_from = _get_default_inventory_set(@player, @from)
  @default_to = _get_default_inventory_set(@player, @to)

  @current = _get_current_inventory_set(@player)

  if (@current == @default_from && @default_from != @default_to) {
    _switch_inventory_set_to(@player, @default_to)
  }
}
