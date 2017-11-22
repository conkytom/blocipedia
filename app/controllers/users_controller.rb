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

private
    def user_params
        params.require(:user) .permit(:name, :email)
    end

end
