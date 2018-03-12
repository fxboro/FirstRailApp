if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_K127M5TuHySE1bOtQ2D1IO8q',
    secret_key: 'sk_test_YElaSrZH0C5soQiaKc8Ghz5x'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
