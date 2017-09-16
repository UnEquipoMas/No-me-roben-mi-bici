class User
  attr_accessor :name, :email #getter and setter

  def initialize(attributes = {}) #Este metodo es el constructuro ejecutado al hacer User.new
    @name  = attributes[:name]
    @email = attributes[:email]
  end

  def formatted_email
    "#{@name} <#{@email}>"    #funcion que muestra Nombre de usuario < Correo >
  end
end