require 'protonbot/chanop'

ProtonBot::Plugin.new do
  @name        = 'Chanop'
  @version     = ProtonBot::Chanop::VERSION
  @description = 'Chanop plugin for ProtonBot'

  core.permhash['admin'] << 'chanop'
  core.permhash['chanop'] = %w(
    kick
    remove
    ban
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
