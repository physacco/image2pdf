# encoding: utf-8

require 'prawn'
require 'dimensions'
require_relative 'image2pdf/version'

module Prawn
  module Images
    def clear_image_registry
      @image_registry.clear
    end
  end
end

module ImageToPDF

  class ImageFormatError < Exception
  end

  class Image
    attr_reader :filename, :dimensions

    def initialize(filename)
      @filename = filename
      @dimensions = Dimensions.dimensions(filename)

      if @dimensions.nil?
        raise ImageFormatError.new(filename)
      end
    end
  end

  def self.convert(src_files, output)
    images = src_files.map {|filename| Image.new(filename)}

    Prawn::Document.generate(output,
      :page_size => images[0].dimensions, :margin => 0) do
      image images[0].filename

      1.upto(images.size - 1) do |i|
        start_new_page :size => images[i].dimensions, :margin => 0
        image images[i].filename
        clear_image_registry
      end
    end
  end
end
