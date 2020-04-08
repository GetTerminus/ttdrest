require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Ttdrest::Client do
  describe "with initialized client" do
    let(:client) { Ttdrest::Client.new }

    describe "#build_ad_group_data" do
      let(:ad_group_id) { 'njutzfg' }
      let(:campaign_id) { 'SampleCampaign' }
      let(:name)        { 'Test AdGroup' }
      let(:budget_settings) do
        {
          "Budget": {  
            "Amount": 1000,
            "CurrencyCode": "USD"
          }
        }
      end
      let(:base_bid_cpm) do
        {
          "Amount": 1,
          "CurrencyCode": "USD"
        }
      end
      let(:max_bid_cpm) do
        {  
          "Amount": 5,
          "CurrencyCode": "USD"
        }
      end

      let(:creative_ids) { [1,2,3] }
      let(:description) { 'foo' }
      let(:is_enabled) { true }
      let(:industry_category_id) { 54 }
      let(:frequency_settings) do
        {  
          "FrequencyCap": nil,
          "FrequencyPeriodInMinutes": nil,
          "FrequencyPricingSlopeCPM": {  
            "Amount": 0,
            "CurrencyCode": "USD"
          }
        }
      end
      let(:site_targeting) do
        {
          "SiteListIds": [],
          "SiteListFallThroughAdjustment": 1
        }
      end
      let(:fold_targeting) do
        {
          "AboveFoldAdjustment": 1,
          "BelowFoldAdjustment": 1,
          "UnknownFoldAdjustment": 1
        }
      end
      let(:supply_vendors) do
        {
          "DefaultAdjustment": 1,
          "Adjustments": []
        }
      end
      let(:contract_targeting) do
        {
          "AllowOpenMarketBiddingWhenTargetingContracts": false,
          "ContractIds": [],
          "ContractGroupIds": []
        }
      end
      let(:site_quality_settings) { { 'aHashOfWayTooMuch': 'stuff' } }
      let(:audience_id) { "ttdid123" }
      let(:recency_adjustments) do
        [
          {
            "RecencyExclusionWindowInMinutes": 0, "Adjustment": 1.0
          }
        ]
      end
      let(:regency_exclusion_window_in_minutes) { 2147483647 }
      let(:geo_segment_adjustments) { ['a','b','c'] }
      let(:data_element_adjustments) { ['d','e','f'] }

      let(:params) do
        {
          description: description,
          is_enabled: is_enabled,
          industry_category_id: industry_category_id,
          frequency_settings: frequency_settings,
          site_targeting: site_targeting,
          fold_targeting: fold_targeting,
          supply_vendors: supply_vendors,
          contract_targeting: contract_targeting,
          site_quality_settings: site_quality_settings,
          audience_id: audience_id,
          recency_adjustments: recency_adjustments,
          regency_exclusion_window_in_minutes: regency_exclusion_window_in_minutes,
          geo_segment_adjustments: geo_segment_adjustments,
          data_element_adjustments: data_element_adjustments,
        }
      end

      describe 'ad_group_id' do
        it 'determines the value of AdGroupId' do
          expect(
            client.build_ad_group_data(ad_group_id, campaign_id, name, budget_settings, base_bid_cpm, max_bid_cpm, creative_ids, params)
          ).to include({ "AdGroupId" => 'njutzfg' })
        end

        context 'when nil' do
          let(:ad_group_id) { nil }

          it 'does not contain the key at all' do
            expect(
              client.build_ad_group_data(ad_group_id, campaign_id, name, budget_settings, base_bid_cpm, max_bid_cpm, creative_ids, params).keys
            ).to_not include("AdGroupId")
          end
        end
      end

      describe 'campaign_id' do
        it 'determines the value of CampaignId' do
          expect(
            client.build_ad_group_data(ad_group_id, campaign_id, name, budget_settings, base_bid_cpm, max_bid_cpm, creative_ids, params)
          ).to include({ "CampaignId" => 'SampleCampaign' })
        end

        context 'when nil' do
          let(:campaign_id) { nil }

          it 'does not contain the key at all' do
            expect(
              client.build_ad_group_data(ad_group_id, campaign_id, name, budget_settings, base_bid_cpm, max_bid_cpm, creative_ids, params).keys
            ).to_not include("CampaignId")
          end
        end
      end

      describe 'name' do
        it 'determines the value of AdGroupName' do
          expect(
            client.build_ad_group_data(ad_group_id, campaign_id, name, budget_settings, base_bid_cpm, max_bid_cpm, creative_ids, params)
          ).to include({ "AdGroupName" => 'Test AdGroup' })
        end

        context 'when nil' do
          let(:name) { nil }

          it 'does not contain the key at all' do
            expect(
              client.build_ad_group_data(ad_group_id, campaign_id, name, budget_settings, base_bid_cpm, max_bid_cpm, creative_ids, params).keys
            ).to_not include("AdGroupName")
          end
        end
      end

      describe 'budget_settings' do
        it 'determines the value of RTBAttributes["BudgetSettings"]' do
          expect(
            client.build_ad_group_data(ad_group_id, campaign_id, name, budget_settings, base_bid_cpm, max_bid_cpm, creative_ids, params)['RTBAttributes']
          ).to include(
            "BudgetSettings" => 
            {
              "Budget": {  
                "Amount": 1000,
                "CurrencyCode": "USD"
              }
            }
          )
        end

        context 'when nil' do
          let(:budget_settings) { nil }

          it 'does not contain the key at all' do
            expect(
              client.build_ad_group_data(ad_group_id, campaign_id, name, budget_settings, base_bid_cpm, max_bid_cpm, creative_ids, params)['RTBAttributes'].keys
            ).to_not include("BudgetSettings")
          end
        end
      end

      describe 'base_bid_cpm' do
        it 'determines the value of RTBAttributes["BaseBidCPM"]' do
          expect(
            client.build_ad_group_data(ad_group_id, campaign_id, name, budget_settings, base_bid_cpm, max_bid_cpm, creative_ids, params)['RTBAttributes']
          ).to include(
            "BaseBidCPM" => 
            {
              "Amount": 1,
              "CurrencyCode": "USD"
            }
          )
        end

        context 'when nil' do
          let(:base_bid_cpm) { nil }

          it 'does not contain the key at all' do
            expect(
              client.build_ad_group_data(ad_group_id, campaign_id, name, budget_settings, base_bid_cpm, max_bid_cpm, creative_ids, params)['RTBAttributes'].keys
            ).to_not include("BaseBidCPM")
          end
        end
      end

      describe 'max_bid_cpm' do
        it 'determines the value of RTBAttributes["MaxBidCPM"]' do
          expect(
            client.build_ad_group_data(ad_group_id, campaign_id, name, budget_settings, base_bid_cpm, max_bid_cpm, creative_ids, params)['RTBAttributes']
          ).to include(
            "MaxBidCPM" => 
            {  
              "Amount": 5,
              "CurrencyCode": "USD"
            }
          )
        end

        context 'when nil' do
          let(:max_bid_cpm) { nil }

          it 'does not contain the key at all' do
            expect(
              client.build_ad_group_data(ad_group_id, campaign_id, name, budget_settings, base_bid_cpm, max_bid_cpm, creative_ids, params)['RTBAttributes'].keys
            ).to_not include("MaxBidCPM")
          end
        end
      end

      describe 'creative_ids' do
        it 'determines the value of RTBAttributes["CreativeIds"]' do
          expect(
            client.build_ad_group_data(ad_group_id, campaign_id, name, budget_settings, base_bid_cpm, max_bid_cpm, creative_ids, params)['RTBAttributes']
          ).to include(
            "CreativeIds" => [1,2,3] 
          )
        end
        context 'when empty' do
          let(:creative_ids) { [] }
          it 'does not contain the key at all' do
            expect(
              client.build_ad_group_data(ad_group_id, campaign_id, name, budget_settings, base_bid_cpm, max_bid_cpm, creative_ids, params)['RTBAttributes'].keys
            ).to_not include("CreativeIds")
          end
        end
      end

      describe 'params hash' do
        describe 'description' do
          it 'determines the value of Description' do
            expect(
              client.build_ad_group_data(ad_group_id, campaign_id, name, budget_settings, base_bid_cpm, max_bid_cpm, creative_ids, params)
            ).to include({ "Description" => 'foo' })
          end

          context 'when nil' do
            let(:description) { nil }

            it 'does not contain the key at all' do
              expect(
                client.build_ad_group_data(ad_group_id, campaign_id, name, budget_settings, base_bid_cpm, max_bid_cpm, creative_ids, params).keys
              ).to_not include("Description")
            end
          end
        end

        describe 'is_enabled' do
          it 'determines the value of IsEnabled' do
            expect(
              client.build_ad_group_data(ad_group_id, campaign_id, name, budget_settings, base_bid_cpm, max_bid_cpm, creative_ids, params)
            ).to include({ "IsEnabled" => true })
          end

          context 'when nil' do
            let(:is_enabled) { nil }

            it 'does not contain the key at all' do
              expect(
                client.build_ad_group_data(ad_group_id, campaign_id, name, budget_settings, base_bid_cpm, max_bid_cpm, creative_ids, params).keys
              ).to_not include("IsEnabled")
            end
          end
        end

        describe 'industry_category_id' do
          it 'determines the value of IndustryCategoryId' do
            expect(
              client.build_ad_group_data(ad_group_id, campaign_id, name, budget_settings, base_bid_cpm, max_bid_cpm, creative_ids, params)
            ).to include({ "IndustryCategoryId" => 54 })
          end

          context 'when nil' do
            let(:industry_category_id) { nil }

            it 'does not contain the key at all' do
              expect(
                client.build_ad_group_data(ad_group_id, campaign_id, name, budget_settings, base_bid_cpm, max_bid_cpm, creative_ids, params).keys
              ).to_not include("IndustryCategoryId")
            end
          end
        end

        describe 'frequency_settings' do
          it 'determines the value of RTBAttributes["FrequencySettings"]' do
            expect(
              client.build_ad_group_data(ad_group_id, campaign_id, name, budget_settings, base_bid_cpm, max_bid_cpm, creative_ids, params)['RTBAttributes']
            ).to include(
              "FrequencySettings" => 
              {  
                "FrequencyCap": nil,
                "FrequencyPeriodInMinutes": nil,
                "FrequencyPricingSlopeCPM": {  
                  "Amount": 0,
                  "CurrencyCode": "USD"
                }
              }
            )
          end

          context 'when nil' do
            let(:frequency_settings) { nil }

            it 'does not contain the key at all' do
              expect(
                client.build_ad_group_data(ad_group_id, campaign_id, name, budget_settings, base_bid_cpm, max_bid_cpm, creative_ids, params)['RTBAttributes'].keys
              ).to_not include("FrequencySettings")
            end
          end
        end

        describe 'site_targeting' do
          it 'determines the value of RTBAttributes["SiteTargeting"]' do
            expect(
              client.build_ad_group_data(ad_group_id, campaign_id, name, budget_settings, base_bid_cpm, max_bid_cpm, creative_ids, params)['RTBAttributes']
            ).to include(
              "SiteTargeting" => 
              {
                "SiteListIds": [],
                "SiteListFallThroughAdjustment": 1
              }
            )
          end

          context 'when nil' do
            let(:site_targeting) { nil }

            it 'does not contain the key at all' do
              expect(
                client.build_ad_group_data(ad_group_id, campaign_id, name, budget_settings, base_bid_cpm, max_bid_cpm, creative_ids, params)['RTBAttributes'].keys
              ).to_not include("SiteTargeting")
            end
          end
        end

        describe 'fold_targeting' do
          it 'determines the value of RTBAttributes["FoldTargeting"]' do
            expect(
              client.build_ad_group_data(ad_group_id, campaign_id, name, budget_settings, base_bid_cpm, max_bid_cpm, creative_ids, params)['RTBAttributes']
            ).to include(
              "FoldTargeting" => 
              {
                "AboveFoldAdjustment": 1,
                "BelowFoldAdjustment": 1,
                "UnknownFoldAdjustment": 1
              }
            )
          end

          context 'when nil' do
            let(:fold_targeting) { nil }

            it 'does not contain the key at all' do
              expect(
                client.build_ad_group_data(ad_group_id, campaign_id, name, budget_settings, base_bid_cpm, max_bid_cpm, creative_ids, params)['RTBAttributes'].keys
              ).to_not include("FoldTargeting")
            end
          end
        end

        describe 'supply_vendors' do
          it 'determines the value of RTBAttributes["SupplyVendorAdjustments"]' do
            expect(
              client.build_ad_group_data(ad_group_id, campaign_id, name, budget_settings, base_bid_cpm, max_bid_cpm, creative_ids, params)['RTBAttributes']
            ).to include(
              "SupplyVendorAdjustments" => 
              {
                "DefaultAdjustment": 1,
                "Adjustments": []
              }
            )
          end

          context 'when nil' do
            let(:supply_vendors) { nil }

            it 'does not contain the key at all' do
              expect(
                client.build_ad_group_data(ad_group_id, campaign_id, name, budget_settings, base_bid_cpm, max_bid_cpm, creative_ids, params)['RTBAttributes'].keys
              ).to_not include("SupplyVendorAdjustments")
            end
          end
        end

        describe 'contract_targeting' do
          it 'determines the value of RTBAttributes["ContractTargeting"]' do
            expect(
              client.build_ad_group_data(ad_group_id, campaign_id, name, budget_settings, base_bid_cpm, max_bid_cpm, creative_ids, params)['RTBAttributes']
            ).to include(
              "ContractTargeting" => 
              {
                "AllowOpenMarketBiddingWhenTargetingContracts": false,
                "ContractIds": [],
                "ContractGroupIds": []
              }
            )
          end

          context 'when nil' do
            let(:contract_targeting) { nil }

            it 'does not contain the key at all' do
              expect(
                client.build_ad_group_data(ad_group_id, campaign_id, name, budget_settings, base_bid_cpm, max_bid_cpm, creative_ids, params)['RTBAttributes'].keys
              ).to_not include("ContractTargeting")
            end
          end
        end

        describe 'site_quality_settings' do
          it 'determines the value of RTBAttributes["SiteQualitySettings"]' do
            expect(
              client.build_ad_group_data(ad_group_id, campaign_id, name, budget_settings, base_bid_cpm, max_bid_cpm, creative_ids, params)['RTBAttributes']
            ).to include(
              "SiteQualitySettings" => { 'aHashOfWayTooMuch': 'stuff' }
            )
          end

          context 'when nil' do
            let(:site_quality_settings) { nil }

            it 'does not contain the key at all' do
              expect(
                client.build_ad_group_data(ad_group_id, campaign_id, name, budget_settings, base_bid_cpm, max_bid_cpm, creative_ids, params)['RTBAttributes'].keys
              ).to_not include("SiteQualitySettings")
            end
          end
        end

        context 'when audience_id is present' do
          it 'determines the value of RTBAttributes["AudienceTargeting"]["AudienceId"]' do
            expect(
              client.build_ad_group_data(ad_group_id, campaign_id, name, budget_settings, base_bid_cpm, max_bid_cpm, creative_ids, params)['RTBAttributes']['AudienceTargeting']
            ).to include(
              "AudienceId" => 'ttdid123'   
            )
          end

          describe 'recency_adjustments' do
            it 'determines the value of RTBAttributes["AudienceTargeting"]["RecencyAdjustments"]' do
              expect(
                client.build_ad_group_data(ad_group_id, campaign_id, name, budget_settings, base_bid_cpm, max_bid_cpm, creative_ids, params)['RTBAttributes']['AudienceTargeting']
              ).to include(
                "RecencyAdjustments" => 
                [
                  {
                    "RecencyExclusionWindowInMinutes": 0, "Adjustment": 1.0
                  }
                ]
              )
            end

            context 'when nil' do
              let(:recency_adjustments) { nil }

              it 'a default RecencyAdjustments is set' do
                expect(
                  client.build_ad_group_data(ad_group_id, campaign_id, name, budget_settings, base_bid_cpm, max_bid_cpm, creative_ids, params)['RTBAttributes']['AudienceTargeting']
                ).to include(
                  "RecencyAdjustments" => 
                  [
                    {
                      "RecencyWindowStartInMinutes"=> 0, "Adjustment" => 1.0
                    }
                  ]
                )
              end
            end
          end

          describe 'regency_exclusion_window_in_minutes' do
            it 'determines the value of RTBAttributes["AudienceTargeting"]["RecencyExclusionWindowInMinutes"]' do
              expect(
                client.build_ad_group_data(ad_group_id, campaign_id, name, budget_settings, base_bid_cpm, max_bid_cpm, creative_ids, params)['RTBAttributes']['AudienceTargeting']
              ).to include(
                "RecencyExclusionWindowInMinutes" => 2147483647
              )
            end

            context 'when nil' do
              let(:regency_exclusion_window_in_minutes) { nil }

              it 'a default RecencyAdjustments is set' do
                expect(
                  client.build_ad_group_data(ad_group_id, campaign_id, name, budget_settings, base_bid_cpm, max_bid_cpm, creative_ids, params)['RTBAttributes']['AudienceTargeting']
                ).to include(
                  "RecencyExclusionWindowInMinutes" => 129600
                )
              end
            end
          end
        end
        context 'when audience_id is not present' do
          let(:audience_id) { nil }
          it 'does not contain the Audience Targeting key at all' do
            expect(
              client.build_ad_group_data(ad_group_id, campaign_id, name, budget_settings, base_bid_cpm, max_bid_cpm, creative_ids, params)['RTBAttributes'].keys
            ).to_not include("AudienceTargeting")
          end
        end

        describe 'geo_segment_adjustments' do
          it 'determines the value of RTBAttributes["GeoSegmentAdjustments"]' do
            expect(
              client.build_ad_group_data(ad_group_id, campaign_id, name, budget_settings, base_bid_cpm, max_bid_cpm, creative_ids, params)['RTBAttributes']
            ).to include(
              "GeoSegmentAdjustments" => ['a','b','c']
            )
          end

          context 'when nil' do
            let(:geo_segment_adjustments) { nil }

            it 'does not contain the key at all' do
              expect(
                client.build_ad_group_data(ad_group_id, campaign_id, name, budget_settings, base_bid_cpm, max_bid_cpm, creative_ids, params)['RTBAttributes'].keys
              ).to_not include("GeoSegmentAdjustments")
            end
          end
        end

        describe 'data_element_adjustments' do
          it 'determines the value of RTBAttributes["DataElementAdjustments"]' do
            expect(
              client.build_ad_group_data(ad_group_id, campaign_id, name, budget_settings, base_bid_cpm, max_bid_cpm, creative_ids, params)['RTBAttributes']
            ).to include(
              "DataElementAdjustments" => ['d','e','f']
            )
          end

          context 'when nil' do
            let(:data_element_adjustments) { nil }

            it 'does not contain the key at all' do
              expect(
                client.build_ad_group_data(ad_group_id, campaign_id, name, budget_settings, base_bid_cpm, max_bid_cpm, creative_ids, params)['RTBAttributes'].keys
              ).to_not include("DataElementAdjustments")
            end
          end
        end
      end
    end
  end
end

