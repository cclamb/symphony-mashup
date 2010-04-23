class Interpreter
  
  def initialize(actions, activities)
    @map = {}
    for key in actions.keys
      @map[actions[key]] = activities[key]
    end
  end

  def map(action)
    return @map[action]
  end

end