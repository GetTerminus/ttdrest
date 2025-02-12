module Ttdrest
  module Concerns
    module Seed
      def create_seed(advertiser_id, name, urls)
        mutation = <<-GRAPHQL
          mutation CreateSeed($advertiserId: ID!, $name: String!, $urls: [String!]) {
            seedCreate(
              input: {
                advertiserId: $advertiserId
                name: $name
                targetingData: { contextualInclusion: { urls: $urls } }
              }
            ) {
              data {
                id
              }
              userErrors {
                field
                message
              }
            }
          }
        GRAPHQL

        variables = {
          advertiserId: advertiser_id,
          name: name,
          urls: urls
        }

        response = graphql_mutation(mutation, variables)
        raise StandardError, 'nil response' if response.nil?

        seed_create_response = response['data']['seedCreate']

        check_user_errors(seed_create_response)
        seed_create_response['data']['id']
      end

      def set_default_seed(advertiser_id, seed_id)
        mutation = <<-GRAPHQL
          mutation AdvertiserSetDefaultSeed($advertiserId: ID!, $seedId: ID!) {
            advertiserSetDefaultSeed(input: { advertiserId: $advertiserId, seedId: $seedId }) {
              data {
                id
              }
              userErrors {
                field
                message
              }
            }
          }
        GRAPHQL

        variables = {
          advertiserId: advertiser_id,
          seedId: seed_id
        }

        response = graphql_mutation(mutation, variables)
        seed_set_response = response['data']['advertiserSetDefaultSeed']

        check_user_errors(seed_set_response)
        seed_set_response['data']['id']
      end

      def check_user_errors(response)
        return unless response['userErrors'].any?

        error_messages = response['userErrors'].map do |error|
          "Error on field #{error['field']}: #{error['message']}"
        end.join(', ')
        raise StandardError, error_messages
      end
    end
  end
end
