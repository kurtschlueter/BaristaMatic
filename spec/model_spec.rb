require_relative "../source/model"

describe Drinks do
  let(:drinks) { Drinks.new }

  describe "#set_drink_prices" do
    context "when initialized" do
      it "Coffee should cost $2.75" do
        expect(drinks.drink_details["Coffee"]["unit price"]).to eq "2.75"
      end
      it "Caffe Americano should cost $3.30" do
        expect(drinks.drink_details["Caffe Americano"]["unit price"]).to eq "3.30"
      end
      it "Caffe Latte should cost $2.55" do
        expect(drinks.drink_details["Caffe Latte"]["unit price"]).to eq "2.55"
      end
      it "Caffe Mocha should cost $3.35" do
        expect(drinks.drink_details["Caffe Mocha"]["unit price"]).to eq "3.35"
      end
      it "Cappuccino should cost $2.90" do
        expect(drinks.drink_details["Cappuccino"]["unit price"]).to eq "2.90"
      end
      it "Decaf Coffee should cost $2.75" do
        expect(drinks.drink_details["Decaf Coffee"]["unit price"]).to eq "2.75"
      end
    end
  end

  describe "#register_all_availabilities" do
    context "when initialized" do
      it "Coffee should be available from start" do
        expect(drinks.drink_details["Coffee"]["available?"]).to eq true
      end
      it "Caffe Americano should be available from start" do
        expect(drinks.drink_details["Caffe Americano"]["available?"]).to eq true
      end
      it "Caffe Latte should be available from start" do
        expect(drinks.drink_details["Caffe Latte"]["available?"]).to eq true
      end
      it "Caffe Mocha should be available from start" do
        expect(drinks.drink_details["Caffe Mocha"]["available?"]).to eq true
      end
      it "Cappuccino should be available from start" do
        expect(drinks.drink_details["Cappuccino"]["available?"]).to eq true
      end
      it "Decaf Coffee should be available from start" do
        expect(drinks.drink_details["Decaf Coffee"]["available?"]).to eq true
      end
    end
  end


end