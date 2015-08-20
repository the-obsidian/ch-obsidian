# Customize player joins
bind(player_join, null, null, @event) {
  if (get_value('mail'.@event['player']) == null) {
    msg(colorize('&7You have no new mail.'))
  } else {
    msg(colorize('&aYou have new mail! Type /mail read to see your messages.'))
  }
}
