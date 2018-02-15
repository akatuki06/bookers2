Rails.application.routes.draw do

  devise_for :users

	# get '/top/' => 'root#top'

	# resources :bookers, only: [:new, :create, :index, :show]
	resources :bookers

	# 追加
	# root 'bookers#index'
	root 'root#top'

	resources :users


# これ入れるとrails sできない
	# resources :users, only: [show]

end
