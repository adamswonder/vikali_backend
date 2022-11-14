class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

  # Fetch all users from the database
  get '/users' do
    user = User.all
    user.to_json
  end

  # create users
  post '/users' do
    user = User.create(params)
  end
  # get all products
  get '/products' do
    product = Product.all
    product.to_json
  end

  # get product by :id
  get '/products/:id' do
    product = Product.find(params[:id])
    product.to_json(only: [:id, :image, :title,:category, :price, :actual_price, :discount], include: {
      reviews: {only: [:comment, :rating]}
    })
  end

  # get all reviews
  get '/reviews'  do
    review = Review.all
    review.to_json
  end

  # create reviews
  post '/reviews' do
    review = Review.create_review(params)
    review.to_json
  end

  # deletes review
  delete '/reviews/:id' do
    review = Review.delete_review(params[:id])
    review.to_json
  end

  # patch a review
  patch '/reviews/:id' do
    review = Review.update_review(params)
    review.to_json
  end
end
