class ClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :rate, :contact, :email, :address1, :address2, :city, :state, :zip, :created_at, :updated_at
end