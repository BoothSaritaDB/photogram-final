class UsersController < ApplicationController


  def index

    matching_users = User.all 

    @list_of_users = matching_users.order({ :created_at => :desc })

    render({ :template => "home.html.erb"})
  end

# --------------- follow create for the index page ---------------
  def followcreate
      the_followrequest = Followrequest.new
      the_followrequest.sender_id = @current_user.id
      the_followrequest.recipient_id = params.fetch("query_recipient_id")
      the_followrequest.status = params.fetch("query_status")

      if the_followrequest.valid?
        the_followrequest.save
        redirect_to("/users", { :notice => "Followrequest created successfully." })
      else
        redirect_to("/users", { :notice => "Followrequest failed to create successfully." })
      end
    end




# --------------- SHOW SECTION ---------------

    def show
    the_name = params.fetch("path_id")

    matching_user = User.where({ :username => the_name })

    @the_user = matching_user.at(0)


    #matching_photos = Photo.where({ :id => the_id })

    #@the_photo = matching_photos.at(0)

    render({ :template => "show_user.html.erb" })
  end

  # --------------- follow create for the show page ---------------
  
  def showfollowcreate
      
      the_followrequest = Followrequest.new
      the_followrequest.sender_id = @current_user.id
      the_followrequest.recipient_id = params.fetch("query_recipient_id")
      the_followrequest.status = "pending"


      var1 = User.where({ :id => the_followrequest.recipient_id }).at(0)
      recipient_name = var1.username


      if the_followrequest.valid?
        the_followrequest.save
        redirect_to("/users/"+recipient_name, { :notice => "Followrequest created successfully." })
      else
        redirect_to("/users/"+recipient_name, { :notice => "Followrequest failed to create successfully." })
      end
    end


  def destroy
    the_id = params.fetch("path_id")
    the_followrequest = Followrequest.where({ :id => the_id }).at(0)

     
    var1 = User.where({ :id => the_followrequest.recipient_id }).at(0)
    recipient_name = var1.username

    the_followrequest.destroy


    redirect_to("/users/"+recipient_name, { :notice => "Followrequest deleted successfully."} )
  end




#-------------------------
def liked
    the_name = params.fetch("path_id")

    matching_user = User.where({ :username => the_name })

    @the_user = matching_user.at(0)


    #matching_photos = Photo.where({ :id => the_id })

    #@the_photo = matching_photos.at(0)

    render({ :template => "liked_show_user.html.erb" })
  end

  def feed
    the_name = params.fetch("path_id")

    matching_user = User.where({ :username => the_name })

    @the_user = matching_user.at(0)


    #matching_photos = Photo.where({ :id => the_id })

    #@the_photo = matching_photos.at(0)

    render({ :template => "feed_show_user.html.erb" })
  end

  def discover
    the_name = params.fetch("path_id")

    matching_user = User.where({ :username => the_name })

    @the_user = matching_user.at(0)


    #matching_photos = Photo.where({ :id => the_id })

    #@the_photo = matching_photos.at(0)

    render({ :template => "discover_show_user.html.erb" })
  end


end