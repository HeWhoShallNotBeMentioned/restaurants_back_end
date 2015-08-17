require("rspec")
require("pg")
require('restaurants')
# require("foods")

DB = PG.connect({:dbname => "restaurants_test"})
RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM restaurant *;")
    DB.exec("DELETE FROM foods *;")
  end
end

describe(Restaurant) do
  describe('.all') do
    it('returns an empty array if nothing is within the database') do
      expect(Restaurant.all()).to(eq([]))
    end
  end
end
