class RemoveUsuarioIdToRede < ActiveRecord::Migration
  def change
    remove_reference :redes, :usuario, index: true, foreign_key: true
  end
end
