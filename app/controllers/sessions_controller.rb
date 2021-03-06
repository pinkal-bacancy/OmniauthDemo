class SessionsController < ApplicationController
	def new
	end
	def create
		auth_hash = request.env['omniauth.auth']
        puts "-----------------------"
        puts auth_hash

        if session[:user_id]
    # Means our user is signed in. Add the authorization to the user
          user=User.find(session[:user_id]).add_provider(auth_hash)

          render :text => "You can now login using #{auth_hash["provider"].capitalize} too!"
        else
    # Log him in or sign him up
          auth = Authorization.find_or_create(auth_hash)
          puts "------------auth-----------------"
          puts auth.user.name

    # Create the session
          session[:user_id] = auth.user.id
          redirect_to root_path, :notice => "Signed in!"
        end
  end
  def destroy
	  session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out!"
  end
end
