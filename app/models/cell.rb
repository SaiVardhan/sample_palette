class Cell < ApplicationRecord
  belongs_to :user

  validates :color_code,:row,:column, presence: true

  def self.find_color_code_and_user_stamp(x,y)
    result = []
    palette = Cell.where(row: x,column: y).last
    result = [palette.color_code,"#{palette.user.user_name} #{palette.form_time_stamp}"] if palette.present?
    result
  end

  def form_time_stamp
    self.updated_at.strftime("%d-%m-%Y %H:%M:%S")
  end
end
