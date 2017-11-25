class ChargesController < ApplicationController

    def create
        @amount = 1500

        customer = Stripe::Customer.create(
            email: current_user.email,
            card: params[:stripeToken]
        )

        charge = Stripe::Charge.create(
            customer: customer.id, # Note -- this is NOT the user_id in your app
            amount: @amount,
            description: "Premium Memebership",
            currency: 'usd'
        )

        flash[:notice] = "Your money belongs to me now, thanks #{current_user.email}!"
        current_user.premium!
        redirect_to root_path # or wherever(?)

        # Stripe will send back CardErrors, with friendly messages
        # when something goes wrong.
        # This `rescue block` catches and displays those errors.
    rescue Stripe::CardError => e
        flash[:alert] = e.message
        redirect_to new_charge_path
    end

    def new
        @stripe_btn_data = {
            key: "#{Rails.configuration.stripe[:publishable_key] }",
            description: "Premium Memebership",
            amount: @amount
        }
    end

end
