class UsersController < ApplicationController

def update
    user = User.find(params[:id])

    authorize user
    user.assign_attributes(user_params)

    if user.save
        render json: user
    else
        render json: {}, status: :unprocessable_entity
    end
end

def downgrade

    @wikis = Wiki.where(user_id: current_user.id)

    @wikis.each do |wiki|
        wiki.private = false
        wiki.save!
    end

    flash[:notice] = "Your account has been downgraded and you should see a refund in 5-10 days!"
    current_user.standard!
    redirect_to root_path

end


private
    def user_params
        params.require(:user) .permit(:name, :email)
    end

end
