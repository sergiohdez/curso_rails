class ErroresController < ApplicationController
  def rutas
    render :file => "#{Rails.root}/public/404.html", :layout => false
  end
end
