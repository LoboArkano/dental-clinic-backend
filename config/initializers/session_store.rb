# frozen_string_literal: true

if Rails.env == 'production'
  Rails.application.config.session_store :cookie_store, key: '_authentication_app', domain: "dental-clinic-react.herokuapp.com", same_site: :none, secure: :true
else
  Rails.application.config.session_store :cookie_store, key: '_authentication_app'
end
