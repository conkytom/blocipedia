#Store enviroment variables on the Rails. configuration objet
Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key:      ENV['STRIPE_SECRET_KEY']
}

#Set our app-stored key with stripe
Stripe.api_key = Rails.configuration.stripe[:secret_key]
