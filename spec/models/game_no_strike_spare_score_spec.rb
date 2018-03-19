require "rails_helper"

#spare: add the next value of the roll + 10
#strike: add the next two roll values + 10

RSpec.describe Game, "#score" do
  before do 
    @bowling = Game.new
  end

  context "with no strikes or spares" do 
    it "sums the pin count for each roll" do 
      20.times { @bowling.roll(4) }
      expect(@bowling.score).to eq 80
    end
  end

    it "score all gutters with 0" do
      20.times { @bowling.roll(0)}
      expect(@bowling.score).to eq 0
    end

  context "score with one spare" do 
    it "sums pins and adds multiper for spare" do
      @bowling.roll(5)
      @bowling.roll(5)
      @bowling.roll(7)
      17.times {@bowling.roll(0)}
      expect(@bowling.score).to eq (24)
    end
  end

  it "score with one spare" do 
    @bowling.roll(5)
    @bowling.roll(5)
    @bowling.roll(3)
    17.times {@bowling.roll(0)}
    expect(@bowling.score).to eq (16)
  end
end