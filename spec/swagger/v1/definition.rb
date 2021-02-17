API_V1 = {
  swagger: '2.0',
  info: {
    title: 'API V1',
    version: 'v1'
  },
  basePath: '/api/v1',
  definitions: {
    product: PRODUCT_SCHEMA,
    products_collection: PRODUCTS_COLLECTION_SCHEMA,
    product_resource: PRODUCT_RESOURCE_SCHEMA,
    order: ORDER_SCHEMA,
    orders_collection: ORDERS_COLLECTION_SCHEMA,
    order_resource: ORDER_RESOURCE_SCHEMA,
  }
}
