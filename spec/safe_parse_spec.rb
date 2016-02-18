require 'spec_helper'
require 'json'

describe SafeParse do
  describe ".call" do
    context "valid json" do
      let(:json) { { "awesome" => "123" } }
      let(:json_string) { JSON.generate(json) }

      it "safely parses json" do
        expect(SafeParse.call(json_string)).to eq json
      end
    end

    context "invalid json" do
      let(:json_string) { "abc123!" }
      let(:json) { { ok: 123 } }

      it "defaults to empty hash" do
        expect(SafeParse.call(json_string)).to eq({})
      end

      it "allows default to be provided" do
        expect(SafeParse.call(json_string, json)).to eq json
      end
    end

    context "ruby object" do
      it "defaults to empty hash" do
        expect(SafeParse.call(ok: 123)).to eq(ok: 123)
      end

      it "allows default to be provided" do
        expect(SafeParse.call(nil, garrett: 'rocks')).to eq(garrett: 'rocks')
      end
    end
  end
end
