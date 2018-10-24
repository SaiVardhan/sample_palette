require 'test_helper'

class GridCellsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get grid_cells_index_url
    assert_response :success
  end

end
