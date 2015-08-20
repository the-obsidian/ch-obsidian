proc(_friendly_world_name, @world) {
  switch(@world) {
    case 'world':
      return('the Overworld')
    case 'world_nether':
      return('the Nether')
    case 'world_the_end':
      return('the End')
    case 'test_world':
      return('the Cleanroom')
    case 'district12':
      return('District 12')
    default:
      return('an unknow world')
  }
}
