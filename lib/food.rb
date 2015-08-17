class Food
  attr_reader(:type, :cost, :rating, :restaurant_id)

  define_method(:initialize) do |attributes|
    @type = attributes.fetch(:type)
    @cost = attributes.fetch(:cost)
    @rating = attributes.fetch(:rating)
    @restaurant_id = attributes.fetch(:restaurant_id)
  end

  define_singleton_method(:all) do
    returned_foods = DB.exec("SELECT * FROM foods;")
    foods = []
    returned_foods.each() do |food|
      type = food.fetch('type')
      cost = food.fetch('cost')
      rating = food.fetch('rating')
      restaurant_id = food.fetch('restaurant_id').to_i()
      foods.push(Food.new({:type => type, :cost => cost, :rating => rating, :restaurant_id => restaurant_id}))
    end
    foods
  end

  define_method(:save) do
    DB.exec("INSERT INTO foods (type, cost, rating, restaurant_id) VALUES ('#{@type}', '#{@cost}', '#{@rating}', #{@restaurant_id})")
  end

  define_method(:==) do |another_food|
    self.type().==(another_food.type).&(self.restaurant_id.==(another_food.restaurant_id()))
  end

end
