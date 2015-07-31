class AddApproveToHolidays < ActiveRecord::Migration
  def change
  	add_column :holidays, :approve, :boolean, :default => false
  end
end
