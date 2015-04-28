class HomeController < ApplicationController
  layout "application"
  include ActiveModel::Model
  attr_accessor :nombre, :asunto, :email, :mensaje
  validates :nombre, :asunto, :email, :mensaje, presence: true
  validates :email, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, message: "Formato de email incorrecto" }
  def index
    begin
      @titulo = "Estamos página principal"
      # @personas = ["Juan", "Ivan", "Lidia"]
      # respond_to do |format|
       # format.html
       # format.json { render :json => @personas }
       # format.xml { render :xml => @personas }
      # end
      # redirect_to :back
    rescue ActionController::RedirectBackError
      redirect_to :action => :quienes_somos, :id => ["fernando","inma","santiago","jimmy"]
    end
  end

  def quienes_somos
    @nombres = params[:id] ||= ["fernando","inma","santiago","jimmy"]
    @titulo = "Apartado quienes somos"
    @accion = action_name
    @controlador = controller_name
    @solicitud = request.method
    flash.now[:noticia] = "Todo correcto!"
  end

  def contacto
    return false unless valid?
    @titulo = "Estamos en apartado contacto"
    if request.post?
      begin
        if Email.micorreo(params).deliver_now and Email.enviar(params).deliver_now
          flash.now[:noticia] = "Enviado correctamente"
        end
      rescue
        flash.now[:error] = "No se ha enviado"
      end
    end
    true
  end
  
  def localizacion
    @titulo = "Localizacion"
  end
  
  def servicios
    @titulo = "Servicios"
  end
end
