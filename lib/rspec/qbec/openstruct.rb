# frozen_string_literal: true

class OpenStruct
  def deep_to_h
    to_h.transform_values do |v|
      v.is_a?(OpenStruct) ? v.deep_to_h : v
    end
  end
end
