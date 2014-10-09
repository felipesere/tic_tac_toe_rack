module WebDisplay
  class GameRepository
    @@counter = 1
    def initialize
      clear
    end

    def store(game)
     id = @@counter
     @storage[id] = game
     @@counter += 1
     id
    end

    def find(id)
      @storage[id]
    end

    def delete(id)
      @storage.delete(id)
    end

    def count
      @storage.count
    end

    def clear
      @@counter = 1
      @storage = {}
    end
  end
end

