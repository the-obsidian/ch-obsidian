proc(_assertperm, @name, @cmodetrumps) {
  if (player() == '~console') {
    return()
  }

  if (pisop()) {
    return()
  }

  if (has_permission('obsidian.' . @name)) {
    return()
  }

  if (@cmodetrumps == 1 && pmode() == 'CREATIVE') {
    return()
  }

  msg(colorize('&cYou do not have permission to do this!'))
  die()
}
