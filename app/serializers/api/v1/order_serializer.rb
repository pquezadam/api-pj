class Api::V1::OrderSerializer < ActiveModel::Serializer
  type :order

  attributes(
    :total
  )
end
