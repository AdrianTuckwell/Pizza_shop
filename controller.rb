require 'sinatra'
require 'sinatra/contrib/all'
require 'pry-byebug'
require_relative './models/pizza'


get '/pizza/new' do
  erb(:new)
end

post '/pizza' do
  #binding.pry

  @pizza = Pizza.new(params)
  @pizza.save()
  erb(:create)
end

get '/pizza' do
  @pizza = Pizza.all()
  erb(:index)
end