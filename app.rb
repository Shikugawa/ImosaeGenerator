require 'sinatra'
require 'sinatra/reloader'
require 'rmagick'

set :public, File.dirname(__FILE__) + '/public'

def split_str str
  str.split('')      
end

def draw_logo draw, img, x, y, base_x, base_y, text
  font_path = './fonts/NotoSansCJKjp-Black.otf'
  font_color = 'white'
  font_pointsize = 70

  draw.annotate(img, x, y, base_x, base_y, text) do
    self.font = font_path
    self.fill = font_color
    self.stroke = 'transparent'
    self.pointsize = font_pointsize
    self.align = Magick::LeftAlign
    self.text_antialias = true
  end
end

get '/' do
  erb :index
end

post '/draw' do
  text0 = split_str(params[:text0])
  text1 = split_str(params[:text1] + "さえ")
  text2 = split_str(params[:text2])
  size = 30
  power = 70

  @img = Magick::Image.new(1200, 700) do 
    self.background_color = '#D2691E'
  end

  @img.format = 'jpg'
  draw = Magick::Draw.new

  base_x = 950
  base_y = 95

  text0.each_with_index do |t, index|
    draw_logo(draw, @img, 0, 0, base_x + 110, base_y + index * power + size, t)
  end

  text1.each_with_index do |t, index|
    draw_logo(draw, @img, 0, 0, base_x , base_y + index * power + size, t)
  end

  text2.each_with_index do |t, index|
    if t == '。'
      draw_logo(draw, @img, 0, 0, base_x - 70, base_y + index * power + size - 30, t)
      next 
    end

    draw_logo(draw, @img, 0, 0, base_x - 110, base_y + index * power + size, t)
  end

  @img.write('public/logos/sample.jpg')

  erb :index
end
