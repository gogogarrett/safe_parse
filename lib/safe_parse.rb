require "safe_parse/version"
require "json"

module SafeParse
  extend self
  def call(maybe_json, default_on_invalid_json = {})
    if maybe_json.is_a?(String)
      begin
        JSON.parse(maybe_json)
      rescue
        default_on_invalid_json
      end
    else
      maybe_json || default_on_invalid_json
    end
  end
end
