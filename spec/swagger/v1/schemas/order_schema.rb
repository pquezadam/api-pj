ORDER_SCHEMA = {
  type: :object,
  properties: {
    id: { type: :string, example: '1' },
    type: { type: :string, example: 'order' },
    attributes: {
      type: :object,
      properties: {
        total: { type: :integer, example: 666, 'x-nullable': true }
      },
      required: []
    }
  },
  required: %i[
    id
    type
    attributes
  ]
}

ORDERS_COLLECTION_SCHEMA = {
  type: 'object',
  properties: {
    data: {
      type: 'array',
      items: { '$ref' => '#/definitions/order' }
    }
  },
  required: [
    :data
  ]
}

ORDER_RESOURCE_SCHEMA = {
  type: 'object',
  properties: {
    data: { '$ref' => '#/definitions/order' }
  },
  required: [
    :data
  ]
}
