class GuidesController < ApplicationController
  def index
    if params[:q]
      @guides=Guide.where("lower(radicado) like :q", q: "%#{params[:q].downcase}%")     
       
    else
      @guides=Guide.none
    end
  end
end
