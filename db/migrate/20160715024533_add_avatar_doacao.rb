class AddAvatarDoacao < ActiveRecord::Migration
  def change
  	add_column :doacaos, :avatar, :string
  end
end
