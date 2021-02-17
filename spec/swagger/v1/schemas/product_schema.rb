PRODUCT_SCHEMA = {
  type: :object,
  properties: {
    id: { type: :string, example: '1' },
    type: { type: :string, example: 'product' },
    attributes: {
      type: :object,
      properties: {
        name: { type: :string, example: 'Some name', 'x-nullable': true },
        sku: { type: :string, example: 'Some sku', 'x-nullable': true },
        type: { type: :string, example: 'Some type', 'x-nullable': true },
        price: { type: :integer, example: 666, 'x-nullable': true }
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

PRODUCTS_COLLECTION_SCHEMA = {
  type: 'object',
  properties: {
    data: {
      type: 'array',
      items: { '$ref' => '#/definitions/product' }
    }
  },
  required: [
    :data
  ]
}

PRODUCT_RESOURCE_SCHEMA = {
  type: 'object',
  properties: {
    data: { '$ref' => '#/definitions/product' }
  },
  required: [
    :data
  ]
}
