module HomeHelper

  def enlace(nombre,controlador,accion)
    link_to nombre, :controller=>controlador, :action=>accion
  end
  
  def hay_banner?
    if content_for?(:imagen)
      return true
    end
  end
  
end
