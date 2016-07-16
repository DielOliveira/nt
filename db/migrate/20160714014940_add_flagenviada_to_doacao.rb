class AddFlagenviadaToDoacao < ActiveRecord::Migration
  def change
    add_column :doacaos, :flagenviada, :boolean
  end
end
