require_relative "../card"

describe Card do

  let(:card) { Card.new("hearts", 2)}
  let(:face_card) { Card.new("diamonds", 12) }
  let(:ace) { Card.new("spades", 14) }

  describe "Each new card" do
    it "has the correct suit" do
      expect(card.suit).to eq("hearts")
    end

    it "has the correct value" do
      expect(card.point_value).to eq(2)
    end
  end

  context "Card is not a face card" do
    it "creates correct name based on suit and value" do
      expect(card.name).to eq("two of hearts")
    end
  end

  context "Card is a face card" do
    it "creates correct name based on suit and value" do
      expect(face_card.name).to eq("queen of diamonds")
    end

    context "When the point value strategy is 'faces_worth_ten" do
      it "has a point value of 10" do
        expect(face_card.point_value).to eq(10)
      end
    end

    context "When the point value strategy is 'face_value_increments'" do
      let(:face_card) { Card.new("diamonds", 12, 'face_values_increment') }

      it "point values increment with card values" do
        expect(face_card.point_value).to eq(12)
      end
    end 
  end

  context "Card is an ace" do
    it "creates correct name based on suit and value" do
      expect(ace.name).to eq("ace of spades")
    end
  end

end