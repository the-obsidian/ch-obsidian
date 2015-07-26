# Set up teams for groups
try(create_team('member'), @ex, , array(ScoreboardException))
try(create_team('premium'), @ex, , array(ScoreboardException))
try(create_team('guardian'), @ex, , array(ScoreboardException))
try(create_team('premiumguardian'), @ex, , array(ScoreboardException))
try(create_team('community'), @ex, , array(ScoreboardException))
try(create_team('operator'), @ex, , array(ScoreboardException))
try(create_team('admin'), @ex, , array(ScoreboardException))

# Set up team display names
set_team_display('member', array('prefix': _group_prefix('member'), 'suffix': ''))
set_team_display('premium', array('prefix': _group_prefix('premium'), 'suffix': ''))
set_team_display('guardian', array('prefix': _group_prefix('guardian'), 'suffix': ''))
set_team_display('premiumguardian', array('prefix': _group_prefix('premiumguardian'), 'suffix': ''))
set_team_display('community', array('prefix': _group_prefix('community'), 'suffix': ''))
set_team_display('operator', array('prefix': _group_prefix('operator'), 'suffix': ''))
set_team_display('admin', array('prefix': _group_prefix('admin'), 'suffix': ''))
