Rails.application.routes.draw do
  # users
  get    'users/me',    to: 'users#me'
  get    'users',       to: 'users#index'
  post   'users',       to: 'users#create'
  get    'users/:id',   to: 'users#show', as: :user_show
  delete 'users/:id',   to: 'users#delete'

  # reminders
  get    '/users/:id/reminders',               to: 'reminders#index'
  post   '/users/:id/reminders',               to: 'reminders#create'
  get    '/users/:id/reminders/:reminder_id',  to: 'reminders#show', as: :reminder_show
  delete '/users/:id/reminders/:reminder_id',  to: 'reminders#delete'
  
end
