class TestObjects
  def initialize(screens)
    @screens = screens
  end

  def test_registration
    @test_registration ||= TestRegistration.new(@screens)
    @test_registration
  end
end
