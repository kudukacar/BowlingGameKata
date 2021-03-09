require "spec_helper"
require "game"

RSpec.describe Game do
    subject(:game) { Game.new }

    describe "#score" do
        def roll_many(rolls, pins)
            rolls.times { game.roll(pins) }
        end

        def roll_spare
            game.roll(5)
            game.roll(5)
        end

        def roll_strike
            game.roll(10)
        end

        context "with all gutter balls" do
            it "returns a score of 0" do
                roll_many(20, 0)

                expect(game.score).to eq(0)
            end
        end

        context "with all ones" do
            it "returns a score of 20" do
                roll_many(20, 1)

                expect(game.score).to eq(20)
            end
        end

        context "with a spare" do
            it "adds the next roll as a bonus" do
                roll_spare
                game.roll(3)
                roll_many(17, 0)

                expect(game.score).to eq(16)
            end
        end

        context "with a strike" do
            it "adds the next two rolls as a bonus" do
                roll_strike
                game.roll(3)
                game.roll(4)
                roll_many(16, 0)

                expect(game.score).to eq(24)
            end
        end

        context "with all strikes" do
            it "calculates a score of 300" do
                roll_many(12, 10)

                expect(game.score).to eq(300)
            end
        end
    end
end