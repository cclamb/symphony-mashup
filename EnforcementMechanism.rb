class EnforcementMechanism
  
  attr_reader :actions, :history, :ctx, :interpreter, :license

  def initialize(actions, history, ctx, interpreter, license)
    @actions = actions
    @history = history
    @ctx = ctx
    @interpreter = interpreter
    @license = license
  end
  
  def can_perform?(action)
    activity = @interpreter.map(action)
    permission = license.is_allowed?(activity, ctx, history)
    history.push(action) if permission == true
    return permission
  end
  
  def is_license_interoperable?
    return is_context_compatible?(@license.creation_ctx) \
    	&& is_interface_compatible?(@license)
  end
  
  private
  
  def is_context_compatible?(ctx)
  	# This is a simple type check on the context object
    envHierarchy = build_heirarchy(@ctx.environment)
    resHierarchy = build_heirarchy(@ctx.resource)
    subHierarchy = build_heirarchy(@ctx.subject)
    return true
  end
  
  def is_interface_compatible?(license)
  	# So, I guess I check for the methods I want to call here...
    return true
  end
  
  def build_heirarchy(klass)
  	return [] if klass == nil
  	klass.superclass ? build_heirarchy(klass.superclass) << klass : [] << klass
  end
  
end
