# Increase the guardian count
bind(creature_spawn, null, array(reason: 'NATURAL', type: 'GUARDIAN'), @event) {
  @squid = entities_in_radius(@event['location'], 64, 'SQUID')
  foreach(@s in @squid) {
    entity_remove(@s)
  }
  @multiplier = 10
  spawn_entity(GUARDIAN, @multiplier, @event['location'])
}

bind(entity_death, null, array(type: 'GUARDIAN'), @event) {
  @squid = entities_in_radius(@event['location'], 64, array('SQUID', 'SKELETON', 'CREEPER'))
  foreach(@s in @squid) {
    entity_remove(@s)
  }
}
