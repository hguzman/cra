#encoding: utf-8
class Shipment::GuidesController < ApplicationController
  respond_to :html, :xlsx
  before_action :set_shipment
  before_action :set_guide, only: [:destroy]
  require 'csv'

  def report

    @guides=@shipment.guides
    render xlsx: 'report',filename: "envios#{Date.current}.xlsx"    

  end

  def index
  end

  def show
  end

  def new
    @guide=@shipment.guides.new
  end

  def create
    @guide=@shipment.guides.new(guide_params)
    if @guide.save
      flash[:success] = "Guía registrada"
      respond_with @shipment
    else
      flash[:alert] = "Problemas con el registro"
      render :new
    end
  end

  def destroy
    @guide.destroy
    flash[:success] = "Guía eliminada correctamente"
    respond_with @shipment
  end

  def import
    puts "Registrar la importación"
    begin
      import_file=params[:guides][:import_file]

      archivo=File.open(import_file.path, "r")
      csv_string = archivo.read.encode!("UTF-8", "iso-8859-1", invalid: :replace)

      CSV.parse(csv_string, col_sep: ";", headers: true, encoding: "iso-8859-1:UTF-8") do |row|
        valor=row[1]
        guia=row[0]
        radicado=valor.split("-")[0]
        envio=Guide.where(radicado: radicado).first
        unless envio.nil?
          envio.update(guia: guia)         
        end
      end 

      flash[:success] = "Guias cargadas correctamente"

      redirect_to shipment_path(@shipment)

    rescue => exception 
      flash[:error] = "Problemas para cargar guias"
      p exception
      redirect_to shipment_path(@shipment)
    end
  end

  private

  def set_shipment
    @shipment=Shipment.find(params[:shipment_id])
  end  

  def set_guide
    @guide=@shipment.guides.find(params[:id])
  end

  def guide_params
    params.require(:guide).permit(:destinatario, :direccion, :ciudad, :peso, :observaciones, :radicado)
  end
end
