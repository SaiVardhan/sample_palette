require 'rails_helper'


RSpec.describe GridCellsController, type: :controller do
	
	describe "GET Leader DashBoard" do
    it "has 200 status and renders leader_board view" do
      get :leader_board
      expect(response.status).to eq(200)
      expect(response).to render_template("leader_board")
    end
  end

  describe "GET Index" do
    it "renders the index template" do
      get :index
      expect(response.status).to eq(200)
      expect(response).to render_template("index")
    end
  end

  describe "POST update_cells" do
  	it "renders the update_cells template" do
  		params = { cells: "tile-19_10", color_code: "#29591e" }
      params.merge!(format: :js)

  		post :update_cell, params: params
  		expect(response).to have_http_status(:success)
  		expect(response).to render_template(:update_cell)
  		expect(response.headers["Content-Type"]).to eq "text/javascript; charset=utf-8"
  	end

  end

end
