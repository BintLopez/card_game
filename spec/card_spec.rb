require_relative "../card"

describe Card do

  context "when creating a card" do
    let(:card_of_hearts) { Card.new("hearts", nil) }
    let(:five) { Card.new("hearts", 5) }

    it "has a suit" do
      expect(card_of_hearts.suit).to eq("hearts")
    end

    it "has a point value" do
      expect(five.point_value).to eq(5)
    end

  end

end