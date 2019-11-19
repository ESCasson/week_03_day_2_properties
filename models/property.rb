require('pg')

class Property

  attr_reader :id
  attr_accessor :value, :address, :num_bedrooms, :year_built

def initialize(property_details)
  @id = property_details['id'].to_i() if property_details['id']
  @address = property_details['address']
  @value = property_details['value']
  @num_bedrooms = property_details['num_bedrooms']
  @year_built = property_details['year_built']
end

def save()
  db = PG.connect({dbname: 'properties', host: 'localhost'})
  sql = "INSERT INTO properties
  (address, value, num_bedrooms, year_built)
  VALUES ($1, $2, $3, $4) RETURNING id;"
  values = [@address, @value, @num_bedrooms, @year_built]
  db.prepare("save", sql)
  result = db.exec_prepared("save", values)
  @id = result[0]['id'].to_i()
  db.close()
end

def Property.delete_all()
  db = PG.connect({dbname: 'properties', host: 'localhost'})
  sql = "DELETE FROM properties;"
  db.prepare("delete_all", sql)
  db.exec_prepared("delete_all", [])
  db.close()
end

def Property.all()
  db =PG.connect({dbname: 'properties', host: 'localhost'})
  sql = "SELECT * FROM properties;"
  db.prepare("all", sql)
  properties = db.exec_prepared("all", [])
  db.close()
  return properties.map{|dwelling| Property.new(dwelling)}
end

def delete()
  db = PG.connect({dbname: 'properties', host: 'localhost'})
  sql = "DELETE FROM properties WHERE id = $1"
  values = [@id]
  db.prepare("delete", sql)
  db.exec_prepared("delete", values)
  db.close
end

def update()
  db = PG.connect({dbname: 'properties', host: 'localhost'})
  sql = "UPDATE properties SET
  (address, value, num_bedrooms, year_built) = ($1, $2, $3, $4)
    WHERE id = $5"
  values = [@address, @value, @num_bedrooms, @year_built, @id]
  db.prepare("update", sql)
  db.exec_prepared("update", values)
  db.close
end

def Property.find_by_id(id)
  db = PG.connect({dbname: 'properties', host: 'localhost'})
  sql = "SELECT * FROM properties WHERE id =  $1"
  values = [id]
  db.prepare("find_by_id", sql)
  property_by_id = db.exec_prepared("find_by_id", values)
  db.close
  return property_by_id.map{|dwelling| Property.new(dwelling)}
end

def Property.find_by_address(address)
  db = PG.connect({dbname: 'properties', host: 'localhost'})
  sql = "SELECT * FROM properties WHERE address =  $1"
  values = [address]
  db.prepare("find_by_address", sql)
  property_by_address = db.exec_prepared("find_by_address", values)
  db.close
  property_by_address_array = property_by_address.map{|dwelling| Property.new(dwelling)}

  if property_by_address_array.length() == 0
    return nil
  else
  return property_by_address_array
  end
end







end
