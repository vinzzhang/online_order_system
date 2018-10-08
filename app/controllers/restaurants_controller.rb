class RestaurantsController < ApplicationController
    def new
        @user = User.first
        @restaurant = @user.restaurants.build
    end
    
    def index
        @restaurants = Restaurant.all
    end
    
    def create
        @user = User.first
        @restaurant = @user.restaurants.build(restaurant_params)
        if @restaurant.save
          redirect_to restaurants_path
        else
          render 'new'
        end
    end
  
    private

    def restaurant_params
      params.require(:restaurant).permit(:name, :address, :photo, :users)
    end
end