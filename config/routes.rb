Rails.application.routes.draw do
  #get 'grid_cells/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'grid_cells#index'
  post '/grid_cells/update_cell'
	get '/grid_cells/reload_cells'
	get '/grid_cells/leader_board'
end
