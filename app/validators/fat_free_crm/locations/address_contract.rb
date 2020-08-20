# frozen_string_literal: true

module FatFreeCrm::Locations
  class AddressContract < ApplicationContract

    params do
      optional(:street1).maybe(:string)
      optional(:street2).maybe(:string)
      optional(:city).maybe(:string)
      optional(:state).maybe(:string)
      optional(:zipcode).maybe(:string)
      optional(:county).maybe(:string)
      optional(:state_code).maybe(:string)
      optional(:county_code).maybe(:string)
      optional(:country).maybe(:string)
      optional(:latitude).maybe(:string)
      optional(:longitude).maybe(:string)
      optional(:lonlat).maybe(:string)

      optional(:full_address).maybe(:string)
      optional(:address_type).maybe(LedgerRedux::Types::ContactAddressKind)
      optional(:addressable_type).maybe(:string)
      optional(:addressable_id).maybe(:string)
    end
  end
end
