class Game

    def initialize
        @rolls = []
    end
    def roll(pins)
        @rolls.push(pins)
    end

    def score
        frame_index = 0
        running_score = 0
        10.times do
            if is_spare?(frame_index)
                running_score += 10 + spare_bonus(frame_index)
                frame_index += 2
            elsif is_strike?(frame_index)
                running_score += 10 + strike_bonus(frame_index)
                frame_index += 1
            else
                running_score += frame_sum(frame_index)
                frame_index += 2
            end
        end
        running_score
    end

    private

    def is_spare?(frame_index)
        @rolls[frame_index] + @rolls[frame_index + 1] == 10
    end

    def is_strike?(frame_index)
        @rolls[frame_index] == 10
    end

    def spare_bonus(frame_index)
        @rolls[frame_index + 2]
    end

    def strike_bonus(frame_index)
        @rolls[frame_index + 1] + @rolls[frame_index + 2]
    end

    def frame_sum(frame_index)
        @rolls[frame_index] + @rolls[frame_index + 1]
    end
end