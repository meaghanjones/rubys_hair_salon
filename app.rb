require('sinatra')
require('sinatra/reloader')
require('./lib/client')
require('./lib/stylist')
also_reload('lib/**/*.rb')
require("pg")

DB = PG.connect({:dbname => "hair_salon_test"})

get("/") do
  @stylists = Stylist.all()
  erb(:index)
end

post("/stylists") do
  name = params.fetch("stylist_name")
  @stylist = Stylist.new({:name => name, :id => nil})
  @stylist.save()
  @stylists = Stylist.all()
  erb(:index)
end

get("/stylists/:id") do
  @stylist = Stylist.find(params.fetch("id").to_i())
  @clients = Client.all()
  erb(:stylist)
end

get ("/stylists/:id/edit") do
  @stylist = Stylist.find(params.fetch("id").to_i())
  @clients = Client.all()
  erb(:stylist_edit)
end

delete("/stylist") do
  @stylist = Stylist.find(params.fetch("stylist_id").to_i())
  @stylist.delete()
  @stylist = Stylist.all()
  erb(:stylist_delete_success)
end

patch("/stylists/:id")do
  name = params.fetch("stylist_name")
  @stylist = Stylist.find(params.fetch("id").to_i())
  @stylist.update({:name => name})
  erb(:success)
end

post("/clients") do
  name = params.fetch("client_name")
  stylist_id = params.fetch("stylist_id").to_i()
  @client = Client.new({:name => name, :stylist_id => stylist_id})
  @client.save()
  @stylist = Stylist.find(stylist_id)
  erb(:success)
end

get("/clients/:id") do
  @client = Client.find(params.fetch("id").to_i())
  erb(:client_info)
end

patch("/clients/:id") do
  name = params.fetch("client_name")
  @client = Client.find(params.fetch("id").to_i())
  @client.update({:name => name})
  @clients = Client.all()
  erb(:success)
end

delete("/client") do
  client = Client.find(params.fetch("remove_client_id").to_i())
  client.delete()
  erb(:success)
end
