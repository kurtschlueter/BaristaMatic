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

  describe "#make_drink" do
    describe "making decaf coffees" do
      before :all do
        @decaf_coffee = []
        decaf_coffee_drink_session = Drinks.new
        4.times do |x|
          @decaf_coffee[x] = decaf_coffee_drink_session.make_drink("Decaf Coffee")
        end
      end
      it "make a Decaf coffee 1 time" do
          expect(@decaf_coffee[1 - 1][0]).to eq true
      end
      it "make a Decaf coffee 3 times" do
          expect(@decaf_coffee[3 - 1][0]).to eq true
      end
      it "make a Decaf coffee 4 times" do
          expect(@decaf_coffee[4 - 1][0]).to eq false
      end
    end

    describe "making coffees" do
      before :all do
        @coffee = []
        coffee_drink_session = Drinks.new
        4.times do |x|
          @coffee[x] = coffee_drink_session.make_drink("Coffee")
        end
      end
      it "make a coffee 1 time" do
          expect(@coffee[1 - 1][0]).to eq true
      end
      it "make a coffee 3 times" do
          expect(@coffee[3 - 1][0]).to eq true
      end
      it "make a coffee 4 times" do
          expect(@coffee[4 - 1][0]).to eq false
      end
    end

    describe "making caffe lattes" do
      before :all do
        @caffe_latte = []
        caffe_latte_drink_session = Drinks.new
        6.times do |x|
          @caffe_latte[x] = caffe_latte_drink_session.make_drink("Caffe Latte")
        end
      end
      it "make a caffe_latte 1 time" do
          expect(@caffe_latte[1 - 1][0]).to eq true
      end
      it "make a caffe_latte 5 times" do
          expect(@caffe_latte[5 - 1][0]).to eq true
      end
      it "make a caffe_latte 6 times" do
          expect(@caffe_latte[6 - 1][0]).to eq false
      end
    end

    describe "making caffe mochas" do
      before :all do
        @caffe_mocha = []
        caffe_mocha_drink_session = Drinks.new
        11.times do |x|
          @caffe_mocha[x] = caffe_mocha_drink_session.make_drink("Caffe Mocha")
        end
      end
      it "make a caffe_mocha 1 time" do
          expect(@caffe_mocha[1 - 1][0]).to eq true
      end
      it "make a caffe_mocha 10 times" do
          expect(@caffe_mocha[10 - 1][0]).to eq true
      end
      it "make a caffe_mocha 11 times" do
          expect(@caffe_mocha[11 - 1][0]).to eq false
      end
    end

    describe "making caffe americanos" do
      before :all do
        @caffe_americano = []
        caffe_americano_drink_session = Drinks.new
        4.times do |x|
          @caffe_americano[x] = caffe_americano_drink_session.make_drink("Caffe Americano")
        end
      end
      it "make a caffe_americano 1 time" do
          expect(@caffe_americano[1 - 1][0]).to eq true
      end
      it "make a caffe_americano 3 times" do
          expect(@caffe_americano[3 - 1][0]).to eq true
      end
      it "make a caffe_americano 4 times" do
          expect(@caffe_americano[4 - 1][0]).to eq false
      end
    end

    describe "making cappuccinos" do
      before :all do
        @cappuccino = []
        cappuccino_drink_session = Drinks.new
        6.times do |x|
          @cappuccino[x] = cappuccino_drink_session.make_drink("Cappuccino")
        end
      end
      it "make a cappuccino 1 time" do
          expect(@cappuccino[1 - 1][0]).to eq true
      end
      it "make a cappuccino 5 times" do
          expect(@cappuccino[5 - 1][0]).to eq true
      end
      it "make a cappuccino 6 times" do
          expect(@cappuccino[6 - 1][0]).to eq false
      end
    end
  end
  describe "#restock" do
    it "expect 10 units of coffee left after coffee is made and then supply is restocked" do
        drinks.make_drink("Coffee")
        drinks.restock()
        units_left = drinks.ingredients["Coffee"]["units left"]
        expect(units_left).to eq 10
    end
    it "expect 10 units of decaf coffee left after decaf coffee is made and then supply is restocked" do
        drinks.make_drink("Decaf Coffee")
        drinks.restock()
        units_left = drinks.ingredients["Decaf Coffee"]["units left"]
        expect(units_left).to eq 10
    end
    it "expect 10 units of cocoa left after caffe mocha is made and then supply is restocked" do
        drinks.make_drink("Caffe Mocha")
        drinks.restock()
        units_left = drinks.ingredients["Cocoa"]["units left"]
        expect(units_left).to eq 10
    end
    it "expect 10 units of espresso left after caffe americano is made and then supply is restocked" do
        drinks.make_drink("Caffe Americano")
        drinks.restock()
        units_left = drinks.ingredients["Espresso"]["units left"]
        expect(units_left).to eq 10
    end
    it "expect 10 units of steamed milk left after cappuccino is made and then supply is restocked" do
        drinks.make_drink("Cappuccino")
        drinks.restock()
        units_left = drinks.ingredients["Steamed Milk"]["units left"]
        expect(units_left).to eq 10
    end
    it "expect 10 units of foamed milk left after cappuccino is made and then supply is restocked" do
        drinks.make_drink("Cappuccino")
        drinks.restock()
        units_left = drinks.ingredients["Foamed Milk"]["units left"]
        expect(units_left).to eq 10
    end
    it "expect 10 units of sugar left after coffee is made and then supply is restocked" do
        drinks.make_drink("Coffee")
        drinks.restock()
        units_left = drinks.ingredients["Sugar"]["units left"]
        expect(units_left).to eq 10
    end
    it "expect 10 units of whipped cream left after Caffe Mocha is made and then supply is restocked" do
        drinks.make_drink("Caffe Mocha")
        drinks.restock()
        units_left = drinks.ingredients["Whipped Cream"]["units left"]
        expect(units_left).to eq 10
    end
    it "expect 10 units of cream left after Coffee is made and then supply is restocked" do
        drinks.make_drink("Coffee")
        drinks.restock()
        units_left = drinks.ingredients["Cream"]["units left"]
        expect(units_left).to eq 10
    end
  end
end