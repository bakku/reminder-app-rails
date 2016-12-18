Rails.application.routes.draw do
  get 'reminders_controller/index'

  get 'reminders_controller/show'

  get 'reminders_controller/create'

  get 'reminders_controller/update'

  get 'reminders_controller/delete'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
