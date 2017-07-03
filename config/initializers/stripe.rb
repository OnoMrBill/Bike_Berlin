if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_t6OvgGvFeWhSkfyJ4Ptt8Oio',
    secret_key: 'sk_test_mXkTN7gRQleQmmJV4zR9Ip3p'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]