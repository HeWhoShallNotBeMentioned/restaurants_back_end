class Restaurant
  attr_reader(:name, :location, :phone, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @location = attributes.fetch(:location)
    @phone = attributes.fetch(:phone)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_restaurants = DB.exec("SELECT * FROM restaurant;")
    restaurant = []
    returned_restaurants.each() do |restaurant|
      name = restaurant.fetch('name')
      location = restaurant.fetch('location')
      phone = restaurant.fetch('phone')
      id = restaurant.fetch('id')
      tasks.push(Restaurant.new({:name => name, :location => location, :phone => phone, :id => id}))
    end
    restaurant
  end
end
