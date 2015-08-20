proc(_start_announcements) {
  clear_task(get_value('server.announcements.task'))

  @seconds = get_value('server.announcements.seconds')
  if (!@seconds) {
    @seconds = 200
    store_value('server.announcements.seconds', @seconds)
  }

  @task = set_interval(@seconds * 1000, closure() {
    _display_announcements()
  })

  console('Starting announcements with task ID '.@task)
  store_value('server.announcements.task', @task)
}

proc(_display_announcements) {
  # broadcast('')
  # broadcast(colorize('&6Announcements:'))
  # broadcast(colorize('  &3District 12: A Parallel World:'))
  # broadcast(colorize('    &2http://forum.the-obsidian.com/t/t/102'))
  # broadcast(colorize('  &3Welcome New Guardians: Checkers300 and Monkeymad358:'))
  # broadcast(colorize('    &2http://forum.the-obsidian.com/t/t/103'))
  # broadcast(colorize('  &3Welcome New Guardian: d0ct0rwh00ves:'))
  # broadcast(colorize('    &2http://forum.the-obsidian.com/t/t/97'))
  broadcast('')
  broadcast(colorize('&6Links:'))
  broadcast(colorize('  &3TeamSpeak: &2ts.the-obsidian.com &f(pw: thetspassword)'))
  broadcast(colorize('  &3Forum:       &2http://forum.the-obsidian.com'))
  broadcast(colorize('  &3Map:          &2http://map.the-obsidian.com'))
  broadcast('')
}
