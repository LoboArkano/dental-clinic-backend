# frozen_string_literal: true

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  if Rails.env == 'production'
    allow do
      origins 'https://dental-clinic-react.herokuapp.com'
      resource '*', headers: :any, methods: %i[get post put patch delete options head], credentials: true
    end
  else
    allow do
      origins 'http://localhost:3000'
      resource '*', headers: :any, methods: %i[get post put patch delete options head], credentials: true
    end
  end
end
