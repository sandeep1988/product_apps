class AddDaysToHoliday < ActiveRecord::Migration
  def change
    add_column :holidays, :days, :integer
    add_column :holidays, :user_id, :integer
  end
end
