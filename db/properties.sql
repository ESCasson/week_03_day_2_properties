DROP TABLE IF EXISTS properties;

CREATE TABLE properties (
  id SERIAL PRIMARY KEY,
  address VARCHAR,
  value   VARCHAR,
  num_bedrooms INT,
  year_built VARCHAR
);
