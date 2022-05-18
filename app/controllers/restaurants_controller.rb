require 'faker'

class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
    @images = ['https://media.timeout.com/images/105239239/image.jpg', 'https://media.istockphoto.com/photos/modern-restaurant-interior-design-picture-id1211547141?k=20&m=1211547141&s=612x612&w=0&h=KiZX3NBZVCK4MlSh4BJ8hZNSJcTIMbNSSV2yusw2NmM=', 'https://www.theworlds50best.com/filestore/jpg/W50BR2021-150-Noma-2.jpg', 'https://upload.wikimedia.org/wikipedia/commons/6/62/Barbieri_-_ViaSophia25668.jpg', 'https://media.cntraveler.com/photos/620152954196925d48e33f88/master/pass/Enoteca%20Paco%20Pe%CC%81rez_Enoteca%20Paco%20Perez%20-%20Hotel%20Arts%20Barcelona%20(9).JPG', 'https://media-cdn.tripadvisor.com/media/photo-s/17/75/3f/d1/restaurant-in-valkenswaard.jpg']
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save
    redirect_to restaurants_path
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @reviews = Review.all
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
