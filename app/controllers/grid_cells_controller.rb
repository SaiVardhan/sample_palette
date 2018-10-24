class GridCellsController < ApplicationController
  before_action :find_or_create_user

  def index
  end

  def update_cell
    params.permit!
    params[:cells].split(",").each do |cell|
      position = cell.split("-")[1].split("_")
      @user.cells.create(color_code: params[:color_code],row: position[0],column: position[1])
    end
    respond_to do |format|
      format.js { flash.now[:notice] = "Color updated successfully" }
    end
  end

  def reload_tiles
    respond_to :js
  end

  def leader_board
    @users = User.get_palette_count
  end

  protected

  def find_or_create_user
    user = User.where(remote_ip: request.remote_ip).last
    if user.present?
      @user = user
    else
      username = Faker::Name.unique.name
      @user = User.create(user_name: username,remote_ip: request.remote_ip)
    end
  end
end
