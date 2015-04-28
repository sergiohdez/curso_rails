class Email < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.email.recepcion.subject
  #
  def recepcion
    @greeting = "Hola"

    mail to: "sergioluisha@gmail.com", subject: "Correo de prueba Rails"
  end
  
  def micorreo(params)
    enviar_correo(params, "sergioluisha@gmail.com", "Nuevo mensaje")
  end
  
  def enviar(params)
    enviar_correo(params, params[:email], "Gracias por contactarnos")
  end
  
  private
    def enviar_correo(params, email, asunto)
      @nombre = params[:nombre]
      @email = params[:email]
      @asunto = params[:asunto]
      @mensaje = params[:mensaje]
      mail to: email, subject: asunto do |format|
        format.html
        format.text
      end
    end
end
