class User < ApplicationRecord
	has_many :cells,dependent: :destroy
  validates :user_name,:remote_ip, presence: true

  scope :get_palette_count, -> { joins(:cells).select("users.*, count(cells.id) as color_count").group("users.id").order("color_count DESC") }
  

  def mostly_used_color
   self.cells.group(:color_code).count.sort {|a1,a2| a2[1]<=>a1[1]}.first[0]
  end
end
