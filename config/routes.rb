Rails.application.routes.draw do
  get 'reminders',    to: 'reminders#index'

  # users
  get    'users',       to: 'users#index'
  post   'users',       to: 'users#create'
  get    'users/:id',   to: 'users#show'
  delete 'users/:id',   to: 'users#delete'
end
