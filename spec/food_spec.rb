require('spec_helper')

describe('Food') do
  describe('.all') do
    it('returns nothing if nothing is in the database') do
      expect(Food.all()).to(eq([]))
    end
  end
end
