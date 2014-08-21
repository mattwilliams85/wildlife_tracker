Wildlife::Application.routes.draw do
  match('/', {:via => :get, :to => 'sightings#index'})
  match('sightings', {:via => :get, :to => 'sightings#index'})
  match('new_species', {:via => :get, :to => 'sightings#new_species'})
  match('list_all', {:via => :get, :to => 'sightings#list_all'})
  match('new_location', {:via => :get, :to => 'sightings#new_location'})
  match('species/:name/:id', {:via => :get, :to => 'sightings#update_remove'})
  match('new_sighting', {:via => :get, :to => 'sightings#new_sighting'})

  match('create_species', {:via => :post, :to => 'sightings#create_species'})
  match('create_location', {:via => :post, :to => 'sightings#create_location'})
  match('create_sighting', {:via => :post, :to => 'sightings#create_sighting'})

  match('edit_species/:id', {:via => [:patch, :put], :to => 'sightings#edit_species'})
  match('edit_location/:id', {:via => [:patch, :put], :to => 'sightings#edit_location'})

  match('delete_species/:id', {:via => :get, :to => 'sightings#delete_species'})
  match('delete_location/:id', {:via => :get, :to => 'sightings#delete_location'})

end


