require 'spec_helper'
require 'tel_formatter'

describe TelFormatter do
  describe ".split" do
    it "splits telephone number into 2 or 3 blocks" do
      tel = "0300000000"
      expect(TelFormatter.split(tel)).to eq(["03", "0000", "0000"])
      tel = "0110000000"
      expect(TelFormatter.split(tel)).to eq(["011", "000", "0000"])
      tel = "0123000000"
      expect(TelFormatter.split(tel)).to eq(["0123", "00", "0000"])
      tel = "0126700000"
      expect(TelFormatter.split(tel)).to eq(["01267", "0", "0000"])
      tel = "0120000000"
      expect(TelFormatter.split(tel)).to eq(["0120", "000000"])
      tel = "09000000000"
      expect(TelFormatter.split(tel)).to eq(["090", "0000", "0000"])
    end
    it "raises ArgumentError when Invalid number is given" do
      tel = "0200000000"
      expect { TelFormatter.split(tel) }.to raise_error(ArgumentError)
      tel = "04000000000"
      expect { TelFormatter.split(tel) }.to raise_error(ArgumentError)
      tel = "050000000"
      expect { TelFormatter.split(tel) }.to raise_error(ArgumentError)
    end
  end
end
