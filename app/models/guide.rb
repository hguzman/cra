class Guide < ApplicationRecord
  belongs_to :shipment
  before_save :dest, :if => :new_record?

  def dest
    self.destinatario="#{self.radicado}- #{self.destinatario}"
  end


end
