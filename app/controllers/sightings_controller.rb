class SightingsController < ActionController::Base

  def index
    render('sightings/index.html.erb')
  end

  def list_all
    @species = Species.all
    @locations = Location.all
    @sightings = Sighting.all
    render('sightings/list_all.html.erb')
  end

  def new_species
    render('sightings/new_species.html.erb')
  end

  def new_location
    render('sightings/new_location.html.erb')
  end

  def new_sighting
    render('sightings/new_sighting.html.erb')
  end

  def create_sighting
    @species =  Species.find_by(:name => params[:spec_name])
    @location = Location.find_by(:name => params[:loc_name])
    @entry = Sighting.create(:species_id => @species.id,
                             :location_id => @location.id
                            )
    render('sightings/index.html.erb')
  end

  def create_species
    @entry = Species.create(:name => params[:name])
    render('sightings/success.html.erb')
  end

  def create_location
    @entry = Location.create(:name => params[:name])
    render('sightings/success.html.erb')
  end

  def update_remove
    @all_sightings = Sighting.all
    if Species.find_by(:name => params[:name]) != nil
      @entry = Species.find(params[:id])
      @sightings = Sighting.find_by(:species_id => params[:id])
    else
      @entry = Location.find(params[:id])
      @sightings = Sighting.find_by(:location_id => params[:id])
    end
    render('sightings/update_remove.html.erb')
  end

  def edit_species
    @species = Species.all
    @locations = Location.all
    @edit_species = Species.find(params[:id])
    @edit_species.update(:name => params[:name])
    render('sightings/list_all.html.erb')
  end

  def edit_location
    @species = Species.all
    @locations = Location.all
    @edit_location = Location.find(params[:id])
    @edit_location.update(:name => params[:name])
    render('sightings/list_all.html.erb')
  end

  def delete_species
    @species = Species.all
    @locations = Location.all
    Species.find(params[:id]).destroy
    result = Sighting.where(:species_id => params[:id])
    if result.first != nil
      Sighting.where(:species_id => params[:id]).first.destroy
    end
    render('sightings/list_all.html.erb')
  end

   def delete_location
    @species = Species.all
    @locations = Location.all
    Location.find(params[:id]).destroy
     result = Sighting.where(:location_id => params[:id])
    if result.first != nil
      Sighting.where(:location_id => params[:id]).first.destroy
    end
    render('sightings/list_all.html.erb')
  end

end



