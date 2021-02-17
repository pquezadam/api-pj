require 'swagger_helper'

describe 'API V1 Orders', swagger_doc: 'v1/swagger.json' do
  path '/orders' do
    get 'Retrieves Orders' do
      description 'Retrieves all the orders'
      produces 'application/json'

      let(:collection_count) { 5 }
      let(:expected_collection_count) { collection_count }

      before { create_list(:order, collection_count) }

      response '200', 'Orders retrieved' do
        schema('$ref' => '#/definitions/orders_collection')

        run_test! do |response|
          expect(JSON.parse(response.body)['data'].count).to eq(expected_collection_count)
        end
      end
    end

    post 'Creates Order' do
      description 'Creates Order'
      consumes 'application/json'
      produces 'application/json'
      parameter(name: :order, in: :body)

      response '201', 'order created' do
        let(:order) do
          {
            total: 666
          }
        end

        run_test!
      end
    end
  end

  path '/orders/{id}' do
    parameter name: :id, in: :path, type: :integer

    let(:existent_order) { create(:order) }
    let(:id) { existent_order.id }

    get 'Retrieves Order' do
      produces 'application/json'

      response '200', 'order retrieved' do
        schema('$ref' => '#/definitions/order_resource')

        run_test!
      end

      response '404', 'invalid order id' do
        let(:id) { 'invalid' }
        run_test!
      end
    end

    put 'Updates Order' do
      description 'Updates Order'
      consumes 'application/json'
      produces 'application/json'
      parameter(name: :order, in: :body)

      response '200', 'order updated' do
        let(:order) do
          {
            total: 666
          }
        end

        run_test!
      end
    end

    delete 'Deletes Order' do
      produces 'application/json'
      description 'Deletes specific order'

      response '204', 'order deleted' do
        run_test!
      end

      response '404', 'order not found' do
        let(:id) { 'invalid' }

        run_test!
      end
    end
  end
end
