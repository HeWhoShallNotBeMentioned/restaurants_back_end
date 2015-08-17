require('spec_helper')

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

  describe('#name') do
    it("returns the restaurant name") do
      restaurant = Restaurant.new({:name => 'Biscuits', :location => 'Vancouver', :phone => '(360) 910-7205', :id => nil})
      restaurant.save()
      expect(restaurant.name()).to(eq('Biscuits'))
    end
  end

  describe('#location') do
    it("returns the restaurant location") do
      restaurant = Restaurant.new({:name => 'Biscuits', :location => 'Vancouver', :phone => '(360) 910-7205', :id => nil})
      restaurant.save()
      expect(restaurant.location()).to(eq('Vancouver'))
    end
  end

  describe('#id') do
    it("sets the instances' ID when saved") do
      test_restaurant = Restaurant.new({:name => 'Biscuits', :location => 'Vancouver', :phone => '(360) 910-7205', :id => nil})
      test_restaurant.save()
      expect(test_restaurant.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#==") do
    it("is the same restaurant if it has the same name") do
      restaurant1 = Restaurant.new({:name => "Ace's Cafe", :location => "Everett", :phone => "425-555-5555", :id => nil})
      restaurant2 = Restaurant.new({:name => "Ace's Cafe", :location => "Everett", :phone => "425-555-5555", :id => nil})
      expect(restaurant1).to(eq(restaurant2))
    end
  end
end
