class GuidesController < ApplicationController
  def index
    if params[:q]
      @guides=Guide.where(radicado: params[:q])      
    else
      @guides=Guide.none
    end
  end
end
