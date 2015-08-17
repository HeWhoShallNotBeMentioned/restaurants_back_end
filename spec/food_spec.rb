require('spec_helper')

describe('Food') do
  describe('.all') do
    it('returns nothing if nothing is in the database') do
      expect(Food.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a task to the array of saved foods") do
      test_food = Food.new({:type => "salad", :cost => "10", :rating => "4", :restaurant_id => 3})
      test_food.save()
      expect(Food.all()).to(eq([test_food]))
    end
  end


end
