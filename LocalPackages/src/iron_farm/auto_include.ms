proc(_start_iron_farm) {
  clear_task(get_value('ironfarm.task'))

  @x_start = 914
  @y_start = 149
  @z_start = 1057
  @x_end = 927
  @y_end = 157
  @z_end = 1099

  @milliseconds = get_value('ironfarm.milliseconds')
  if (!@milliseconds) {
    @milliseconds = 200
    store_value('ironfarm.milliseconds', @milliseconds)
  }

  @threshhold = get_value('ironfarm.threshhold')
  if (!@threshhold) {
    @threshhold = 0.2
    store_value('ironfarm.threshhold', @threshhold)
  }

  @task = set_interval(@milliseconds, closure() {
    # If we hit the random threshhold
    if (rand() <= @threshhold) {
      # Generate random coords
      @x = rand(@x_start, @x_end)
      @y = rand(@y_start, @y_end)
      @z = rand(@z_start, @z_end)
      @location = array(
        x: @x,
        y: @y,
        z: @z,
        world: 'world'
      )
      spawn_entity(IRON_GOLEM, 1, @location)
    }
  })

  console('Starting announcements with task ID '.@task)
  store_value('ironfarm.task', @task)
}
