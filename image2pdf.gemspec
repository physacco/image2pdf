# encoding: utf-8

require_relative 'lib/image2pdf/version'

Gem::Specification.new do |s|
  s.name        = 'image2pdf'
  s.version     = ImageToPDF::VERSION
  s.date        = '2015-11-27'

  s.summary     = 'Convert a set of images into a PDF document'
  s.description = <<EOF
This is a pure Ruby command line program that converts a set of images
into a PDF document. It supports JPEG and PNG file formats.

Examples:
* image2pdf -o foo.pdf foo.jpg
* image2pdf -o bar.pdf bar/*.jpg
EOF

  s.authors     = ['physacco']
  s.email       = ['physacco@gmail.com']
  s.homepage    = 'https://github.com/physacco/image2pdf'
  s.license     = 'MIT'

  s.files       = Dir['lib/**/*.rb'] + Dir['bin/*'] +
                  ['README.md', 'LICENSE', 'image2pdf.gemspec']
  s.executables = ['image2pdf']

  s.platform    = Gem::Platform::RUBY
  s.required_ruby_version = '>= 2.0.0'
  s.add_runtime_dependency 'prawn', '~> 2.0', '>= 2.0.0'
  s.add_runtime_dependency 'dimensions', '~> 1.3', '>= 1.3.0'
end
