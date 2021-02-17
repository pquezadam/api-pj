class Api::V1::ProductSerializer < ActiveModel::Serializer
  type :product

  attributes(
    :name,
    :sku,
    :type,
    :price
  )
end
