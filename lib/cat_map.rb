require "cat_map/version"
require "chunky_png"
require "thor"

module CatMap
  class Transform < Thor
    desc "map IMAGE_FILE", "apply the cat map to a png file"
    option :iterations
    def transform(image_file)
      new_image = ChunkyPNG::Image.from_file(image_file)
      (1..options[:iterations].to_i).each do |iteration|
        new_image = cat_map(new_image)
        puts "creating #{file_name(iteration)}."
        new_image.save(file_name(iteration))
      end
    end

    private

    def cat_map(image)
      new_image = ChunkyPNG::Image.new(image.width, image.height, ChunkyPNG::Color::TRANSPARENT)
      image.width.times do |i|
        image.height.times do |j|
          x = (2*i + j) % image.width
          y = (i+j) % image.height
          new_image[x,y] = image[i, j]
        end
      end
      new_image
    end

    def file_name(iteration)
      "cat_map_#{iteration.to_s.rjust(options[:iterations].to_s.size, "0")}.png"
    end
  end
end
