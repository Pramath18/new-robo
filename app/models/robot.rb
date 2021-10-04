class Robot < ApplicationRecord
  class << self
    NORTH = 'NORTH'
    SOUTH = 'SOUTH'
    EAST = 'EAST'
    WEST = 'WEST'

    # commands
    PLACE = 'PLACE'
    MOVE = 'MOVE'
    LEFT = 'LEFT'
    RIGHT = 'RIGHT'

    DIRECTION_MAPPER = { "NORTH_LEFT": 'WEST', "NORTH_RIGHT": 'EAST',
                        "SOUTH_LEFT": 'EAST', "SOUTH_RIGHT": 'WEST',
                        "EAST_LEFT": 'NORTH', "EAST_RIGHT": 'SOUTH',
                        "WEST_LEFT": 'SOUTH', "WEST_RIGHT": 'NORTH' }.freeze
    attr_accessor :x, :y, :orientation
    # byebug
    def initialize
      @x = 0
      @y = 0
      @orientation = NORTH
      # @result = []
    end

    def execute(input)
      result = []
      input.each do |command|
        if command[0..4] == PLACE
          place_robot(command)
        elsif command == MOVE
          move_robot
        elsif [LEFT, RIGHT].include?(command)
          # Rotate robot 90 degree
          @orientation = DIRECTION_MAPPER["#{@orientation}_#{command}".to_sym]
        elsif command == 'REPORT'
          result.push(@x, @y, @orientation)
        end
      end
      result
    end

    def place_robot(command)
      cords = command.split(' ')[1].split(',')
      @x = cords[0].to_i
      @y = cords[1].to_i
      @orientation = cords[2]
    end

    def move_robot
      return unless valid_move?
      if @orientation == NORTH
        @y += 1
      elsif @orientation == SOUTH
        @y -= 1
      elsif @orientation == EAST
        @x += 1
      elsif @orientation == WEST
        x -= 1
      end
    end

    def valid_move?
      (0...5) === @x && (0...5) === @y
    end
  end
end
