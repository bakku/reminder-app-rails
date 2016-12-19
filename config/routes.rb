Rails.application.routes.draw do
  get 'reminders',    to: 'reminders#index'

  get 'users',        to: 'users#index'
end
