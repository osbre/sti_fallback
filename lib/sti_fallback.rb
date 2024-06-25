# frozen_string_literal: true

require_relative "sti_fallback/version"

module StiFallback
  extend ActiveSupport::Concern

  included do
    class_attribute :_raise_error_for_types, instance_writer: false
    self._raise_error_for_types = []
  end

  class_methods do
    # Method to specify which types should raise an error when not found
    def sti_fallback(raise_error_for: [])
      self._raise_error_for_types = raise_error_for.map(&:to_s)
    end

    def sti_class_for(type_name)
      type_name.constantize
    rescue NameError
      # Raises error if type is in the list for which errors should be raised
      raise if _raise_error_for_types.include?(type_name)
      # Falls back to the base class if the type is not in the error list
      self
    end
  end
end
