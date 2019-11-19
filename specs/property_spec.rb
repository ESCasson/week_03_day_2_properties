require('minitest/autorun')
require('minitest/reporters')
require_relative('../models/property.rb')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class PropertyTest < Minitest::Test
  # address
  # value
  # number of bedrooms
  # year built
  def test_can_create_a_property__address
    property_details = {
      'address' => '26 Aberfoyle Street',
      'value' => 65000,
      'num_bedrooms' => 1,
      'year_built' => '1904'
    }
  new_property = Property.new(property_details)
  assert_equal('26 Aberfoyle Street', new_property.address)

  end

end
