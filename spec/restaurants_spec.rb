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

  describe('#save') do
    it('saves a given restaurant to the restaurant database') do
      test_restaurant = Restaurant.new({:name => 'Biscuits', :location => 'Vancouver', :phone => '(360) 910-7205', :id => nil})
      test_restaurant.save()
      expect(Restaurant.all()).to(eq([test_restaurant]))
    end
  end
end
