class UsersController < ApplicationController


  def index

    matching_users = User.all 

    @list_of_users = matching_users.order({ :created_at => :desc })

    render({ :template => "home.html.erb"})
  end


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


    def show
    the_name = params.fetch("path_id")

    matching_user = User.where({ :username => the_name })

    @the_user = matching_user.at(0)


    #matching_photos = Photo.where({ :id => the_id })

    #@the_photo = matching_photos.at(0)

    render({ :template => "show_user.html.erb" })
  end

  
  def showfollowcreate
      #the_name = params.fetch("query_recipient_id")
      #matching_recipient = User.where({ :username => the_name })
      #the_recipient = matching_recipient.at(0)

      the_followrequest = Followrequest.new
      the_followrequest.sender_id = @current_user.id
      the_followrequest.recipient_id = params.fetch("query_recipient_id")
      the_followrequest.status = "pending"

      if the_followrequest.valid?
        the_followrequest.save
        redirect_to("/users/", { :notice => "Followrequest created successfully." })
      else
        redirect_to("/users/", { :notice => "Followrequest failed to create successfully." })
      end
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

    render({ :template => "show_user.html.erb" })
  end

  def discover
    the_name = params.fetch("path_id")

    matching_user = User.where({ :username => the_name })

    @the_user = matching_user.at(0)


    #matching_photos = Photo.where({ :id => the_id })

    #@the_photo = matching_photos.at(0)

    render({ :template => "show_user.html.erb" })
  end


end