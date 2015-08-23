proc(_get_default_xp_set, @player, @world) {
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

proc(_get_current_xp_set, @player) {
  @set = get_value('xpset', @player, 'current')
  if (@set) {
    return(@set)
  } else {
    return('_default')
  }
}

proc(_save_xp_set, @player, @set) {
  store_value('xpset', @player, 'xp', @set, ptexp(@player))
  tmsg(@player, 'save xp '.ptexp(@player))
  store_value('xpset', @player, 'current', @set)
}

proc(_restore_xp_set, @player, @set) {
  @new_xp = get_value('xpset', @player, 'xp', @set)
  if (!@new_xp) {
    _clear_xp(@player)
  } else {
    set_ptexp(@new_xp)
    tmsg(@player, 'set xp '.@new_xp)
  }

  store_value('xpset', @player, 'current', @set)
}

proc(_switch_xp_set_to, @player, @to) {
  _save_xp_set(@player, _get_current_xp_set(@player))
  _restore_xp_set(@player, @to)
}

proc(_clear_xp, @player) {
  set_ptexp(@player, 0)
  tmsg(@player, 'set xp 0')
}
