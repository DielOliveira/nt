class AddCicloToRede < ActiveRecord::Migration
  def change
    add_reference :redes, :ciclo, index: true, foreign_key: true        
  end
end
