require('sinatra')
require('sinatra/reloader')
require('./lib/task')
require('./lib/list')
also_reload('lib/**/*.rb')
require("pg")

DB = PG.connect({:dbname => "hair_salon_test"})

get("/") do
  @stylists = Stylists.all()
  @clients = Client.all()
  erb(:index)
end

get("/stylists/new") do
  erb(stylist_form)
end

post("/stylists") do
  name = params.fetch("stylist_name")
  stylist = Stylist.ew({:name => name, :id => id})
  stylist.save()
  erb(:success)
end

delete("/stylist") do
  @stylist = Stylist.find(params.fetch("id").to_i())
  @stylist.delete()
  @stylist = stylist.all()
  erb(:success)
end
