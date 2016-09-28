class AddFlagopcionalToReentrada < ActiveRecord::Migration
  def change
    add_column :reentradas, :flagopcional, :boolean
  end
end
