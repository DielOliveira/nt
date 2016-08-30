class AddFlagpauseToDoacao < ActiveRecord::Migration
  def change
    add_column :doacaos, :flagpause, :boolean
  end
end
