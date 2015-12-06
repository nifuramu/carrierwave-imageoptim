require 'spec_helper'

describe CarrierWave::ImageOptim do
  describe '#optimize' do
    before do
      @klass = Class.new(CarrierWave::Uploader::Base) do
        include CarrierWave::ImageOptim
      end
      @instance = @klass.new
      FileUtils.cp(file_path('test.jpg'), file_path('test_copy.jpg'))
      allow(@instance).to receive(:file).and_return(CarrierWave::SanitizedFile.new(file_path('test_copy.jpg')))
    end

    after do
      FileUtils.rm(file_path('test_copy.jpg')) if File.exist?(file_path('test_copy.jpg'))
    end

    it 'delegates to a new instance of ImageOptim with the current path to the file' do
      image_optim = double(::ImageOptim)
      options = {
        jpegoptim: true,
        optipng: true,
      }
      expect(::ImageOptim).to receive(:new).with(CarrierWave::ImageOptim::DEFAULT_OPTIONS.deep_merge(options)).and_return(image_optim)
      expect(image_optim).to receive(:optimize_image!).with(file_path('test_copy.jpg'))
      @instance.optimize(options)
    end

    it 'creates smaller jpeg with jpegoptim' do
      unoptimized_file_size = ::MiniMagick::Image.open(@instance.current_path).size
      options = { jpegoptim: true }
      @instance.optimize(options)
      optimized_file_size = ::MiniMagick::Image.open(@instance.current_path).size
      expect(optimized_file_size).to be < unoptimized_file_size
    end
  end
end
