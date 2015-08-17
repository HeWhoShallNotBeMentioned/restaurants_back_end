require("rspec")
require("pg")
require('restaurants')
require("food")

DB = PG.connect({:dbname => "restaurants_test"})
RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM restaurant *;")
    DB.exec("DELETE FROM foods *;")
  end
end
