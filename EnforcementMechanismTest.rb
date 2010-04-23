require 'test/unit'
require 'EnforcementMechanism'

class EnforcementMechanismTest < Test::Unit::TestCase
  
  class TestClass < EnforcementMechanism
    def initialize
      super(nil, nil, nil, nil, nil)
    end
    
    def test_build_heirarchy(klass)
      build_heirarchy(klass)
    end
    
    def test_is_context_compatible?(ctx)

    end
    
    def test_is_interface_compatible?
    
    end
    
  end
  
  def test_initialize
  
  end
  
  def test_is_license_interperable?
  
  end
  
  def test_is_context_compatible?
			ctx = Context.new(nil, nil, nil)
  end
  
  def test_is_interface_compatible?
  
  end
  
  def test_build_heirarchy
    emt =  TestClass.new
    assert_equal([Object.new.class, Array.new.class], emt.test_build_heirarchy([].class))
  end
  
end
