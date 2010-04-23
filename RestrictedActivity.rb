require 'Activity'

class RestrictedActivity < Activity

	def initialize(constraints)
		@constraints = constraints
	end
	
	def is_satisfied?(ctx)
		ret = true
		@constraints.each do |predicate|
			unless predicate.call(ctx)
				ret = false
				break
			end
		end
		return ret
	end
  
end
