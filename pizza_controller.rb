require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative  "./models/pizza.rb"

#
get '/' do
  erb :default
end
#get all pizzas (index)
get "/pizzas"do
  @pizzas = Pizza.all()
  erb :index
end

#new pizza form (new)
get "/pizzas/new" do 
  erb :new
end

# actually send form  (create)
post "/pizzas" do
  @pizza = Pizza.new(params)
  @pizza.save
  erb :create
end

# get pizza by id (show)
get "/pizzas/:id" do
  @pizza = Pizza.find(params[:id])
  erb :show
end

#delete a pizza (destroy)
post "/pizzas/:id/delete" do
  Pizza.destroy(params[:id])
  redirect to('/pizzas')
end

#request edit pizza form (edit)
get "/pizzas/:id/edit" do
  @pizza = Pizza.find(params[:id])
  erb :edit
end

#submits updated pizza (update)
post "/pizzas/:id" do
  @pizza = Pizza.update(params)
  redirect to ("/pizzas/#{params[:id]}")
end