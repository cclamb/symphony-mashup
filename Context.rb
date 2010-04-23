class Context

	attr_reader :environment, :subject, :resource

	def initialize(environment, subject, resource)
		@environment = environment
		@subject = subject
		@resource = resource
	end
	
end
