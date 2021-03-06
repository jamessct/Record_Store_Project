require_relative('../models/stock')
require('pry-byebug')

get('/stock/select_artist') do
  @artist = Artist.all
  erb(:'stock/select_artist')
end

get('/artists/:id/stock/new') do
  @albums = Album.all
  @album = Album.new(params)
  erb(:'stock/new')
end

post('/stock') do
  @stock = Stock.new(params)
  @stock.save
  @artists = Artist.all.first
  @albums = Album.all.first
  erb(:'stock/create')
end

get('/stock') do
  @stocks = Stock.all
  @artists = Artist.all
  @albums = Album.all
  erb(:'stock/index')
end

get('/stock/:id') do
  @stock = Stock.find(params[:id])
  erb(:'stock/show')
end

get('/stock/:id/edit') do
  @stock = Stock.find(params[:id])
  @albums = Album.all
  erb(:'stock/edit')
end

post('/stock/:id') do
  @stock = Stock.update(params)
  redirect to("/stock/#{params[:id]}")
end

post('/stock/:id/delete') do
  @stock = Stock.destroy(params[:id])
  redirect to('/stock')
end