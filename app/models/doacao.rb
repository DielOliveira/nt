class Doacao < ActiveRecord::Base
  belongs_to :ciclo

  belongs_to :cadastro_1, :class_name => "Cadastro"
  belongs_to :cadastro_2, :class_name => "Cadastro"

  validates :avatar, :presence => { :message => 'é obrigatório.' }, on: :update 
  
  mount_uploader :avatar, AvatarUploader


end
