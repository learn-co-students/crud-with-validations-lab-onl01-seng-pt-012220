Rails.application.routes.draw do
  get 'songs/index'

  get 'songs/show'

  get 'songs/new'

  get 'songs/edit'

  get 'songs/create'

  get 'songs/update'

  get 'songs/delete'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
