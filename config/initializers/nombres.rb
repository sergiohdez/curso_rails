class Nombres
  # def initialize
    @@array ||= ["Luis","Inma","Boris","Hugo"]
  # end
  
  def self.agregar=(nombre)
    @@array<<nombre
  end
  
  def self.borrar(nombre)
    @@array.delete(nombre)
  end
  
  def self.obtener
    @@array
  end
end