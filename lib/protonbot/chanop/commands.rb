core.help_add('chanop', 'op', 'op [[chan] target]',
  'Ops self/target on this/given channel')
cmd(cmd: 'op') do |dat|
  case dat[:split].length
  when 0
    dat[:plug].op(dat[:target], dat[:nick])
  when 1
    dat[:plug].op(dat[:target], dat[:split][0])
  when 2..512
    dat[:plug].op(dat[:split][0], dat[:split][1])
  end
end.perm!('op')

core.help_add('chanop', 'deop', 'deop [[chan] target]',
  'Deops self/target on this/given channel')
cmd(cmd: 'deop') do |dat|
  case dat[:split].length
  when 0
    dat[:plug].deop(dat[:target], dat[:nick])
  when 1
    dat[:plug].deop(dat[:target], dat[:split][0])
  when 2..512
    dat[:plug].deop(dat[:split][0], dat[:split][1])
  end
end.perm!('op')

core.help_add('chanop', 'voice', 'voice [[chan] target]',
  'Voices self/target on this/given channel')
cmd(cmd: 'voice') do |dat|
  case dat[:split].length
  when 0
    dat[:plug].voice(dat[:target], dat[:nick])
  when 1
    dat[:plug].voice(dat[:target], dat[:split][0])
  when 2..512
    dat[:plug].voice(dat[:split][0], dat[:split][1])
  end
end.perm!('voice')

core.help_add('chanop', 'devoice', 'devoice [[chan] target]',
  'Devoices self/target on this/given channel')
cmd(cmd: 'devoice') do |dat|
  case dat[:split].length
  when 0
    dat[:plug].devoice(dat[:target], dat[:nick])
  when 1
    dat[:plug].devoice(dat[:target], dat[:split][0])
  when 2..512
    dat[:plug].devoice(dat[:split][0], dat[:split][1])
  end
end.perm!('voice')

core.help_add('chanop', 'quiet', 'quiet [chan] <target>',
  'Quiets target on this/given channel')
cmd(cmd: 'quiet') do |dat|
  case dat[:split].length
  when 0
    dat.nreply 'Not enough parameters!'
  when 1
    dat[:plug].quiet(dat[:target], '*!*@' + dat[:plug].gethost(dat[:split][0]))
  when 2..512
    dat[:plug].quiet(dat[:split][0], '*!*@' + dat[:plug].gethost(dat[:split][1]))
  end
end.perm!('quiet')

core.help_add('chanop', 'unquiet', 'unquiet [chan] <target>',
  'Unquiets target on this/given channel')
cmd(cmd: 'unquiet') do |dat|
  case dat[:split].length
  when 0
    dat.nreply 'Not enough parameters!'
  when 1
    dat[:plug].unquiet(dat[:target], '*!*@' + dat[:plug].gethost(dat[:split][0]))
  when 2..512
    dat[:plug].unquiet(dat[:split][0], '*!*@' + dat[:plug].gethost(dat[:split][1]))
  end
end.perm!('quiet')

core.help_add('chanop', 'ban', 'ban [chan] <target>',
  'Bans target on this/given channel')
cmd(cmd: 'ban') do |dat|
  case dat[:split].length
  when 0
    dat.nreply 'Not enough parameters!'
  when 1
    dat[:plug].ban(dat[:target], '*!*@' + dat[:plug].gethost(dat[:split][0]))
  when 2..512
    dat[:plug].ban(dat[:split][0], '*!*@' + dat[:plug].gethost(dat[:split][1]))
  end
end.perm!('ban')

core.help_add('chanop', 'unban', 'unban [chan] <target>',
  'Unbans target on this/given channel')
cmd(cmd: 'unban') do |dat|
  case dat[:split].length
  when 0
    dat.nreply 'Not enough parameters!'
  when 1
    dat[:plug].unban(dat[:target], '*!*@' + dat[:plug].gethost(dat[:split][0]))
  when 2..512
    dat[:plug].unban(dat[:split][0], '*!*@' + dat[:plug].gethost(dat[:split][1]))
  end
end.perm!('ban')

core.help_add('chanop', 'excempt', 'excempt [[chan] target]',
  'Excempts self/target on this/given channel')
cmd(cmd: 'excempt') do |dat|
  case dat[:split].length
  when 0
    dat[:plug].excempt(dat[:target], '*!*@' + dat[:plug].gethost(dat[:nick]))
  when 1
    dat[:plug].excempt(dat[:target], '*!*@' + dat[:plug].gethost(dat[:split][0]))
  when 2..512
    dat[:plug].excempt(dat[:split][0], '*!*@' + dat[:plug].gethost(dat[:split][1]))
  end
end.perm!('excempt')

core.help_add('chanop', 'excempt', 'excempt [[chan] target]',
  'Unexcempts self/target on this/given channel')
cmd(cmd: 'unexcempt') do |dat|
  case dat[:split].length
  when 0
    dat[:plug].unexcempt(dat[:target], '*!*@' + dat[:plug].gethost(dat[:nick]))
  when 1
    dat[:plug].unexcempt(dat[:target], '*!*@' + dat[:plug].gethost(dat[:split][0]))
  when 2..512
    dat[:plug].unexcempt(dat[:split][0], '*!*@' + dat[:plug].gethost(dat[:split][1]))
  end
end.perm!('excempt')

core.help_add('chanop', 'kick', 'kick [chan] <target> [reason]',
  'Kicks target from this/given channel')
cmd(cmd: 'kick') do |dat|
  case dat[:split].length
  when 0
    dat.nreply 'Not enough parameters!'
  when 1
    dat[:plug].kick(dat[:target], dat[:split][0])
  when 2..512
    if %w(# + ! &).include? dat[:split][0][0]
      dat[:plug].kick(dat[:split][0], dat[:split][1], dat[:split][2..dat[:split].length].join(' '))
    else
      dat[:plug].kick(dat[:target], dat[:split][0], dat[:split][1..dat[:split].length].join(' '))
    end
  end
end.perm!('kick')

core.help_add('chanop', 'remove', 'remove [chan] <target> [reason]')
cmd(cmd: 'remove') do |dat|
  case dat[:split].length
  when 0
    dat.nreply 'Not enough parameters!'
  when 1
    dat[:plug].remove(dat[:target], dat[:split][0])
  when 2..512
    if %w(# + ! &).include? dat[:split][0][0]
      dat[:plug].remove(dat[:split][0], dat[:split][1], dat[:split][2..dat[:split].length].join(' '))
    else
      dat[:plug].remove(dat[:target], dat[:split][0], dat[:split][1..dat[:split].length].join(' '))
    end
  end
end.perm!('remove')

core.help_add('chanop', 'kban', 'kban [chan] <target> [reason]',
  'Kickbans target from this/given channel')
cmd(cmd: 'kban') do |dat|
  case dat[:split].length
  when 0
    dat.nreply 'Not enough parameters!'
  when 1
    dat[:plug].ban(dat[:target], '*!*@' + dat[:plug].gethost(dat[:split][0]))
    dat[:plug].kick(dat[:target], dat[:split][0])
  when 2..512
    if %w(# + ! &).include? dat[:split][0][0]
      dat[:plug].ban(dat[:split][0], '*!*@' + dat[:plug].gethost(dat[:split][1]))
      dat[:plug].kick(dat[:split][0], dat[:split][1], dat[:split][2..dat[:split].length].join(' '))
    else
      dat[:plug].ban(dat[:target], '*!*@' + dat[:plug].gethost(dat[:split][0]))
      dat[:plug].kick(dat[:target], dat[:split][0], dat[:split][1..dat[:split].length].join(' '))
    end
  end
end.perm!('kick', 'ban')

core.help_add('chanop', 'rban', 'rban [chan] <target> [reason]',
  'Removebans target from this/given channel')
cmd(cmd: 'rban') do |dat|
  case dat[:split].length
  when 0
    dat.nreply 'Not enough parameters!'
  when 1
    dat[:plug].ban(dat[:target], '*!*@' + dat[:plug].gethost(dat[:split][0]))
    dat[:plug].remove(dat[:target], dat[:split][0])
  when 2..512
    if %w(# + ! &).include? dat[:split][0][0]
      dat[:plug].ban(dat[:split][0], '*!*@' + dat[:plug].gethost(dat[:split][1]))
      dat[:plug].remove(dat[:split][0], dat[:split][1], dat[:split][2..dat[:split].length].join(' '))
    else
      dat[:plug].ban(dat[:target], '*!*@' + dat[:plug].gethost(dat[:split][0]))
      dat[:plug].remove(dat[:target], dat[:split][0], dat[:split][1..dat[:split].length].join(' '))
    end
  end
end.perm!('remove', 'ban')

core.help_add('chanop', 'arjk', 'arjk [chan] <target>',
  'Anti-Rejoin-Kicks target from this/given channel')
cmd(cmd: 'arjk') do |dat|
  case dat[:split].length
  when 0
    dat.nreply 'Not enough parameters!'
  when 1
    dat[:plug].ban(dat[:target], '*!*@' + dat[:plug].gethost(dat[:split][0]))
    dat[:plug].kick(dat[:target], dat[:split][0])
    sleep(5)
    dat[:plug].unban(dat[:target], '*!*@' + dat[:plug].gethost(dat[:split][0]))
  when 2..512
    if %w(# + ! &).include? dat[:split][0][0]
      dat[:plug].ban(dat[:target], '*!*@' + dat[:plug].gethost(dat[:split][1]))
      dat[:plug].kick(dat[:split][0], dat[:split][1], dat[:split][2..dat[:split].length].join(' '))
      sleep(5)
      dat[:plug].unban(dat[:target], '*!*@' + dat[:plug].gethost(dat[:split][1]))
    else
      dat[:plug].ban(dat[:target], '*!*@' + dat[:plug].gethost(dat[:split][0]))
      dat[:plug].kick(dat[:target], dat[:split][0], dat[:split][1..dat[:split].length].join(' '))
      sleep(5)
      dat[:plug].unban(dat[:target], '*!*@' + dat[:plug].gethost(dat[:split][0]))
    end
  end
end.perm!('kick', 'ban')

core.help_add('chanop', 'arjr', 'arjr [chan] <target>',
  'Anti-Rejoin-Removes target from this/given channel')
cmd(cmd: 'arjr') do |dat|
  case dat[:split].length
  when 0
    dat.nreply 'Not enough parameters!'
  when 1
    dat[:plug].ban(dat[:target], '*!*@' + dat[:plug].gethost(dat[:split][0]))
    dat[:plug].remove(dat[:target], dat[:split][0])
    sleep(5)
    dat[:plug].unban(dat[:target], '*!*@' + dat[:plug].gethost(dat[:split][0]))
  when 2..512
    if %w(# + ! &).include? dat[:split][0][0]
      dat[:plug].ban(dat[:target], '*!*@' + dat[:plug].gethost(dat[:split][1]))
      dat[:plug].remove(dat[:split][0], dat[:split][1], dat[:split][2..dat[:split].length].join(' '))
      sleep(5)
      dat[:plug].unban(dat[:target], '*!*@' + dat[:plug].gethost(dat[:split][1]))
    else
      dat[:plug].ban(dat[:target], '*!*@' + dat[:plug].gethost(dat[:split][0]))
      dat[:plug].remove(dat[:target], dat[:split][0], dat[:split][1..dat[:split].length].join(' '))
      sleep(5)
      dat[:plug].unban(dat[:target], '*!*@' + dat[:plug].gethost(dat[:split][0]))
    end
  end
end.perm!('remove', 'ban')

core.help_add('chanop', 'umode', 'umode [chan] <user> <mode>',
  'Sets given mode on given user at this/given channel')
cmd(cmd: 'umode') do |dat|
  case dat[:split].length
  when 0..1
    dat.nreply 'Not enough parameters!'
  when 2
    unless /[+-]/ =~ dat[:split][1][0]
      dat.nreply 'Wrong mode!'
    else
      dat[:plug].usermode(dat[:target], dat[:split][0], dat[:split][1])
    end
  when 3..512
    unless /[+-]/ =~ dat[:split][2][0]
      dat.nreply 'Wrong mode!'
    else
      dat[:plug].usermode(dat[:split][0], dat[:split][1], dat[:split][2])
    end
  end
end.perm!('umode')

core.help_add('chanop', 'umode', 'umode [chan] <mode>',
  'Sets given mode on this/given channel')
cmd(cmd: 'cmode') do |dat|
  case dat[:split].length
  when 0
    dat.nreply 'Not enough parameters!'
  when 1
    if /[+-]/ =~ dat[:split][0][0]
      dat[:plug].chanmode(dat[:target], dat[:split][0])
    else
      dat.nreply 'Wrong mode!'
    end
  when 2..512
    if /[+-]/ =~ dat[:split][1][0]
      dat[:plug].chanmode(dat[:split][0], dat[:split][1])
    else
      dat.nreply 'Wrong mode!'
    end
  end
end.perm!('cmode')

core.help_add('chanop', 'invite', 'invite [chan] <user>',
  'Invites given user to this/given channel')
cmd(cmd: 'invite') do |dat|
  case dat[:split].length
  when 0
    dat.nreply 'Not enough parameters!'
  when 1
    dat[:plug].invite(dat[:target], dat[:split][0])
  when 2..512
    dat[:plug].invite(dat[:split][0], dat[:split][1])
  end
end.perm!('invite')