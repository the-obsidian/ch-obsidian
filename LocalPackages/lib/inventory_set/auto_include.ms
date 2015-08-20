proc(_get_default_inventory_set, @player, @world) {
  switch(@world) {
    case 'world':
    case 'world_nether':
    case 'world_the_end':
    case 'district12':
      return('_default')
    case 'test_world':
      return('_default_cleanroom')
    default:
      return('_default')
  }
}

proc(_get_current_inventory_set, @player) {
  @set = get_value('inventoryset', @player, 'current')
  if (@set) {
    return(@set)
  } else {
    return('_default')
  }
}

proc(_save_inventory_set, @player, @set) {
  store_value('inventoryset', @player, 'inventory', @set, pinv(@player))
  store_value('inventoryset', @player, 'current', @set)
}

proc(_restore_inventory_set, @player, @set) {
  @new_inventory = get_value('inventoryset', @player, 'inventory', @set)
  if (!@new_inventory) {
    _clear_inventory(@player)
  } else {
    set_pinv(@new_inventory)
  }

  store_value('inventoryset', @player, 'current', @set)
}

proc(_switch_inventory_set_to, @player, @to) {
  _save_inventory_set(@player, _get_current_inventory_set(@player))
  _restore_inventory_set(@player, @to)
}

proc(_clear_inventory, @player) {
  @clear = array(
    0: null,
    1: null,
    2: null,
    3: null,
    4: null,
    5: null,
    6: null,
    7: null,
    8: null,
    9: null,
    10: null,
    11: null,
    12: null,
    13: null,
    14: null,
    15: null,
    16: null,
    17: null,
    18: null,
    19: null,
    20: null,
    21: null,
    22: null,
    23: null,
    24: null,
    25: null,
    26: null,
    27: null,
    28: null,
    29: null,
    30: null,
    31: null,
    32: null,
    33: null,
    34: null,
    35: null,
    100: null,
    101: null,
    102: null,
    103: null
  )
  set_pinv(@player, @clear)
}
