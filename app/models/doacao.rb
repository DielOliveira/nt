class Doacao < ActiveRecord::Base
  belongs_to :ciclo

  belongs_to :cadastro_doador, :class_name => "Cadastro"
  belongs_to :cadastro_recebedor, :class_name => "Cadastro"
  belongs_to :cadastro_principal, :class_name => "Cadastro"

  belongs_to :ciclo_doador, :class_name => "Ciclo"
  belongs_to :ciclo_recebedor, :class_name => "Ciclo"


  #validates :avatar, :presence => { :message => 'é obrigatório.' }, on: :update 
  
  mount_uploader :avatar, AvatarUploader


end
