require 'gosu'
require './circle'
require 'rubygems'
module ZOrder
  BACKGROUND, MIDDLE, TOP = *0..2
end
class Ultra < Gosu::Window
	def initialize()
		super(800,600)
		self.caption = "Sharpen your reflecion!"
		@radius = 20
		@dot = Gosu::Image.new('dot.png')
		@x = 310
		@y = 240
		@width = 1
		@height = 1
		@velocity_x = 2
		@velocity_y = 2
		@visible = 0
		#@hammer_image = Gosu::Image.new('hammer.png')
		@hit = 0 
		@score = 0
		@font = Gosu::Font.new(30)
		@time_left = Gosu.milliseconds / 1000
		@play = true
		#@space = 0
		@time = 0

		

	end
	def update()

		
		



	end
	def draw()
		draw_quad(0, 0, 0xffffffff, 0, 600, 0xffffffff, 800, 600, 0xffffffff, 800, 0, 0xffffffff, 0)
		draw_quad(600,100, Gosu::Color::BLACK, 600, 300, Gosu::Color::BLACK, 100, 300, Gosu::Color::BLACK, 100, 300, Gosu::Color::BLACK, 0)
      
		
			
	end
	def button_down(id)
	
			
		
		


	end

end

Window = Ultra.new
Window.show