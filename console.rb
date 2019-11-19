#database name properties
require('pry')
require_relative('models/property.rb')

Property.delete_all()

property1 = Property.new({
    'address' => '26 Aberfoyle Street',
    'value' => 65000,
    'num_bedrooms' => 1,
    'year_built' => '1904'
})

property2 = Property.new({
    'address' => '133 Finniston Street',
    'value' => 185000,
    'num_bedrooms' => 2,
    'year_built' => '2001'
})

property1.save()
property2.save()

binding.pry

nil
