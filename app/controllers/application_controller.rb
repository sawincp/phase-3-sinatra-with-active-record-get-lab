class ApplicationController < Sinatra::Base
  
   # Add this line to set the Content-Type header for all responses
   set :default_content_type, 'application/json'
  
  # add routes
  get '/bakeries' do
    # get all the bakeries from the database
    bakeries = Bakery.all
    # send them back as a JSON array
    bakeries.to_json
  end

  get '/bakeries/:id' do
    # returns single bakery as JSON with baked goods nested in array.
    bakery = Bakery.find(params[:id])
    bakery.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    # see the BakedGood class for the  method definition of `.by_price`
    baked_goods = BakedGood.by_price
    baked_goods.to_json
  end

  get '/baked_goods/most_expensive' do

    most_expensive = BakedGood.by_price.first
    most_expensive.to_json

  end

end
