module WebDisplay
  class WebIO
    def set_next_move(move)
      @move = move
    end

    def ready?
      !@move.nil?
    end

    def read
      temp = @move
      @move = nil
      temp
    end
  end
end
