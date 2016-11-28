json.extract! shipment, :id, :fecha_envio_at, :comments, :created_at, :updated_at
json.url shipment_url(shipment, format: :json)