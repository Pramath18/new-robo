Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope :api do
    post 'robot/0/orders', action: :orders, controller: :robots
  end
end
