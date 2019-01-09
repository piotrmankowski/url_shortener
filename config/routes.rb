Rails.application.routes.draw do
  root to: 'shortened_urls#new'
  resources :shortened_urls
  get '/:key', to: 'shortened_urls#redirect'
end
