require 'gosu'
require './circle'
require 'rubygems'
module ZOrder
  BACKGROUND, MIDDLE, TOP = *0..2
end
class Ultra < Gosu::Window
	attr_accessor :back
	def initialize()
		super(800,600)
		self.caption = "Sharpen your reflecion!"
		@radius = 20
		@dot = Gosu::Image.new('dot.png')
		@back = Gosu::Image.new('yellow.jpg')
		
		@x = 300
		@x_back = 300
		@y = 300
		@y_back = 300
		@width = 1
		@height = 1
		@velocity_x = 3
		@velocity_backx = 5
		@velocity_y = 3
		@velocity_backy = 5
		@visible = 0
		@visible_back = 0
		@hit = 0 
		@score = 0
		
		@time_left = Gosu.milliseconds / 1000
		@play = true
		@font = Gosu::Font.new(30)
		@text = "Your score is: "
		@text_time = "Time left: "
		

	end
	def update()
		#origin position of the dot
		@x += @velocity_x
		@y += @velocity_y
		#velocity of the dot
		@velocity_x *= -1 if @x - @width / 2 > 590 || @x - @width < 210
		@velocity_y *= -1 if @y - @height /2 > 390 || @y - @height < 210
		#origin position of the square
		@x_back += @velocity_backx
		@y_back += @velocity_backy
		#velocity of the square
		@velocity_backx *= -1 if @x_back - @width / 2 > 550 || @x_back - @width < 200
		@velocity_backy *= -1 if @y_back - @height /2 > 350 || @y_back - @height < 200
		#visible
		@visible -= 1
		@visible_back -= 1
		@visible = 30 if @visible < -10 and rand 0.5
		@visible_back = 30 if @visible_back < -5 and rand 0.7
		@time_left = Gosu.milliseconds / 1000
		@play = false if @time_left > 1


	end
	def draw()
		draw_quad(0, 0,Gosu::Color::BLACK , 0, 600, Gosu::Color::BLACK, 800, 600, Gosu::Color::BLACK, 800, 0, Gosu::Color::BLACK, 0)
		draw_quad(200,200, Gosu::Color::GREEN, 600, 200, Gosu::Color::GREEN, 600, 400, Gosu::Color::GREEN, 200, 400, Gosu::Color::GREEN, ZOrder::BACKGROUND)
    draw_quad(500,450, Gosu::Color::WHITE, 500,550, Gosu::Color::WHITE, 700,550, Gosu::Color::WHITE, 700, 450, Gosu::Color::WHITE)
    if @visible > 0
 			@dot.draw(@x,@y)
 			
 		end
 		if @visible_back > 0
 			@back.draw(@x_back ,@y_back)
 		end
 		#this line is to print score
 		@font.draw_text(@score, 700, 100,0)
		@font.draw_text(@text,500, 100, 0)
		#this line is to print time
		@font.draw_text(@time_left.to_s, 700, 20, 0)
		@font.draw_text(@text_time,555,20,0)
		

		
			
	end
	def button_down(id)
	
			
		
		


	end

end

Window = Ultra.new
Window.show