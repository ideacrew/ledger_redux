# frozen_string_literal: true

module AcapiEvents
  class ResourceError < Dry::Struct
    attribute :code, Types::Strict::String.meta(omittable: false)
    attribute :errors, Types::Instance(Hash)
  end
end