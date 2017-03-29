require 'protonbot/chanop'

ProtonBot::Plugin.new do
  @name        = 'Chanop'
  @version     = ProtonBot::Chanop::VERSION
  @description = 'Chanop plugin for ProtonBot'

  core.permhash['admin'] << 'chanop'
  core.permhash['chanop'] = %w(
    kickban
    kick
    remove
    ban
    arjk
    arjr
    excempt
    quiet
    umode
    cmode
    op
    voice
    invite
  )

  run 'commands'
end
