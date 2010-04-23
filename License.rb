class License
	
	attr_reader :creation_ctx, :permissions, :expression

	def initialize(creation_ctx, permissions, expression)
		@creation_ctx = creation_ctx
		@permissions = permissions
		@expression = expression
	end
  
  def is_allowed?(activity, ctx, history)
    return is_usage_ok?(ctx) && is_access_ok?(activity)
  end
  
  private
  
  def is_usage_ok?(ctx)
    return true
  end
  
  def is_access_ok?(activity)
    return @permissions[activity]
  end

end
