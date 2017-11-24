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
=begin
    customer = Stripe::Customer.create(
        email: current_user.email,
        card: params[:stripeToken]
    )

    refund = Stripe::Refund.create(
        customer: customer.id,
        amount: @amount,
        description: "Premium Memebership Cancelation",
        currency: 'usd'
    )
=end
    flash[:notice] = "Your account has been downgraded and you should see a refund in 5-10 days!"
    current_user.standard!
    redirect_to root_path
=begin
rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to new_charge_path
=end
end


private
    def user_params
        params.require(:user) .permit(:name, :email)
    end

end
