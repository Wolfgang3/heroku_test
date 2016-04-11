class LocationsController < ApplicationController
	def create

       @person = Location.where(:user_id => current_user.id).first
      
       if @person
       	  @user= @person.update(location_params)
       	  if @user
            flash[:alert]= "Your location has been updated"
       	      redirect_to root_path
       	  end
       else
          @user= current_user.locations.create(location_params)
            if @user.save
              flash[:alert]= "Your location has been updated"
       	      redirect_to root_path
       	    end
        end
	end


   def map
        @user = Carpool.find(params[:format]).user
        @latitude = Location.where(:user_id => @user.id).first.latitude
        @longitude = Location.where(:user_id => @user.id).first.longitude
   
   end


	private

	  def location_params
	  	params.require(:location).permit(:latitude, :longitude)
	  end
end
