# Eventually the ruby main loop.
require_relative 'EnforcementMechanism'
require_relative 'Action'
require_relative 'Context'
require_relative 'Interpreter'
require_relative 'RestrictedActivity'
require_relative 'License'
require_relative 'History'

def build_actions
  return {
    :play           => Action.new,
    :fast_forward   => Action.new,
    :rewind         => Action.new, 
    :stop           => Action.new,
    :pause          => Action.new
  }
end

def build_activities
  return {
    :play           => RestrictedActivity.new(nil),
    :fast_forward   => RestrictedActivity.new(nil),
    :rewind         => RestrictedActivity.new(nil), 
    :stop           => RestrictedActivity.new(nil),
    :pause          => RestrictedActivity.new(nil)
  }
end

def build_permissions(activities)
  return {
    activities[:play]         => true,
    activities[:fast_forward] => true,
    activities[:rewind]       => true,
    activities[:stop]         => false,
    activities[:pause]        => true
  }
end

actions     = build_actions
activities  = build_activities
permissions = build_permissions(activities)

history     = History.new
ctx         = Context.new(nil, nil, nil)
license     = License.new(ctx, permissions, 'some license expression')
interpreter = Interpreter.new(actions, activities)
em          = EnforcementMechanism.new(build_actions, history, ctx, interpreter, license)

exit unless em.is_license_interoperable?

puts('can play')  if em.can_perform?(actions[:play])
puts('can ff')    if em.can_perform?(actions[:fast_forward])
puts('can rew')   if em.can_perform?(actions[:rewind])
puts('can stop')  if em.can_perform?(actions[:stop])
puts('can pause') if em.can_perform?(actions[:pause])

