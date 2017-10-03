# frozen_string_literal: true

module AwesomeToyRobotSimulator
  class Tabletop
    MINIMAL_TABLE_WIDTH = 0
    MINIMAL_TABLE_HEIGHT = 0

    def initialize(width, height)
      @width = width
      @height = height
    end

    def within_bounds?(position)
      within_table_width?(position.x_axis) && within_table_height?(position.y_axis)
    end

    private

    attr_reader :width, :height

    def within_table_width?(x_axis)
      x_axis >= self.class::MINIMAL_TABLE_WIDTH && x_axis <= width
    end

    def within_table_height?(y_axis)
      y_axis >= self.class::MINIMAL_TABLE_HEIGHT && y_axis <= width
    end
  end
end
