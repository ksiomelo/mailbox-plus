#require 'action_controller'
require 'rqrcode'
require 'rqrcode-rails3/size_calculator.rb'
require 'rqrcode-rails3/renderers/svg.rb'

class LibQRCode

  def self.generate_qrcode(text, options)
    size = options[:size] 
    level = options[:level] || :h

    qrcode = RQRCode::QRCode.new(text, :size => size, :level => level)
    svg = RQRCode::Renderers::SVG::render(qrcode, options)
    
    filename = SecureRandom.hex(12)+'.svg' # generates random unique name for the image file
    directory = Rails.public_path + "/qrcodes"
      File.open(File.join(directory, filename), 'w') do |f|
      f.puts svg
    end
    
    return "qrcodes/"+filename
  end
end