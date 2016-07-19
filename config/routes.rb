Rails.application.routes.draw do
  gets '/product' => 'products#index'
end
