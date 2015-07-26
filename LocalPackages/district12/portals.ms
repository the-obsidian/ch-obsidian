proc(_portal_type, @position) {
  # Extract location
  @x = @position['x']
  @y = @position['y']
  @z = @position['z']
  @world = @position['world']

  # Shortcuts for block IDs
  @obsidian = '49:0'
  @coal = '173:0'

  # Go down one block
  @y -= 1

  # Return if not obsidian
  if (get_block_at(@x, @y, @z, @world) != @obsidian) {
    return('normal')
  }

  # Initialize search directions
  @xdirection = 0
  @zdirection = 0

  # Determine search directions
  if (get_block_at(@x + 1, @y, @z, @world) == @obsidian) {
    @xdirection = 1
  } else if (get_block_at(@x - 1, @y, @z, @world) == @obsidian) {
    @xdirection = -1
  } else if (get_block_at(@x, @y, @z + 1, @world) == @obsidian) {
    @zdirection = 1
  } else if (get_block_at(@x, @y, @z - 1, @world) == @obsidian) {
    @zdirection = -1
  }

  # Scan for special blocks
  while(true) {
    @x += 1 * @xdirection
    @z += 1 * @zdirection

    if (get_block_at(@x, @y, @z, @world) == @coal) {
      return('district12')
    }

    if (get_block_at(@x, @y, @z, @world) != @obsidian) {
      return('normal')
    }
  }
}

bind(player_portal_travel, null, null, @event) {
  @type = _portal_type(@event[from])
  @from = @event[from]
  @world = @from['world']

  switch(@world) {
    case 'world':
      if (@type == 'district12') {
        @from['world'] = 'district12'
        modify_event('to', @from)
      }
    case 'district12':
      @from['world'] = 'world'
      modify_event('to', @from)
    case 'cleanroom':
      cancel()
  }
}
