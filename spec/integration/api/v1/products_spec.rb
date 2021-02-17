require 'swagger_helper'

describe 'API V1 Products', swagger_doc: 'v1/swagger.json' do
  let(:order) { create(:order) }
  let(:order_id) { order.id }

  path '/orders/{order_id}/products' do
    parameter name: :order_id, in: :path, type: :integer
    get 'Retrieves Products' do
      description 'Retrieves all the products'
      produces 'application/json'

      let(:collection_count) { 5 }
      let(:expected_collection_count) { collection_count }

      before { create_list(:product, collection_count, order: order) }

      response '200', 'Products retrieved' do
        schema('$ref' => '#/definitions/products_collection')

        run_test! do |response|
          expect(JSON.parse(response.body)['data'].count).to eq(expected_collection_count)
        end
      end
    end

    post 'Creates Product' do
      description 'Creates Product'
      consumes 'application/json'
      produces 'application/json'
      parameter(name: :product, in: :body)

      response '201', 'product created' do
        let(:product) do
          {
            name: 'Some name',
            sku: 'Some sku',
            type: 'Some type',
            price: 666
          }
        end

        run_test!
      end
    end
  end

  path '/products/{id}' do
    parameter name: :id, in: :path, type: :integer

    let(:existent_product) { create(:product, order: order) }
    let(:id) { existent_product.id }

    get 'Retrieves Product' do
      produces 'application/json'

      response '200', 'product retrieved' do
        schema('$ref' => '#/definitions/product_resource')

        run_test!
      end

      response '404', 'invalid product id' do
        let(:id) { 'invalid' }
        run_test!
      end
    end

    put 'Updates Product' do
      description 'Updates Product'
      consumes 'application/json'
      produces 'application/json'
      parameter(name: :product, in: :body)

      response '200', 'product updated' do
        let(:product) do
          {
            name: 'Some name',
            sku: 'Some sku',
            type: 'Some type',
            price: 666
          }
        end

        run_test!
      end
    end

    delete 'Deletes Product' do
      produces 'application/json'
      description 'Deletes specific product'

      response '204', 'product deleted' do
        run_test!
      end

      response '404', 'product not found' do
        let(:id) { 'invalid' }

        run_test!
      end
    end
  end
end
