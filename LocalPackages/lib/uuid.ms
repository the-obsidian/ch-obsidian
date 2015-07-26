proc(_get_puuid, @playerName) {
  @playerName = to_lower(strip_colors(@playerName));

  if (ponline(@playerName)) {
    @pinfo = pinfo(@playerName);
    return(replace(@pinfo[20], '-', ''));
  }

  if (@playerName == '~console') {
    return(@playerName);
  }

  @uuidCache = import('uuidCache');

  if (array_index_exists(@uuidCache, @playerName)) {
    return(@uuidCache[@playerName]);
  }

  @res = query('uuid', 'SELECT uuid FROM user WHERE last_username=? LIMIT 1', @playerName);
  if (length(@res) == 0) {
    return(null);
  } else {
    @uuidCache[@playerName] = @res[0]['uuid'];
    export('uuidCache', @uuidCache);
    return(@res[0]['uuid']);
  }
}
