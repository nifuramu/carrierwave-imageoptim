require 'image_optim'
require 'carrierwave-imageoptim/version'

module CarrierWave
  module ImageOptim
    DEFAULT_OPTIONS = {
      skip_missing_workers: true,
      advpng: false,
      gifsicle: false,
      jhead: false,
      jpegrecompress: false,
      jpegtran: false,
      pngcrush: false,
      pngout: false,
      pngquant: false,
      svgo: false,
      jpegoptim: { max_quality: 75 },
      optipng: { level: 4 }
    }.freeze

    def optimize(options = {})
      image_optim = ::ImageOptim.new(optimizer_options(options))
      image_optim.optimize_image!(current_path)
    end

    private

    def optimizer_options(options)
      DEFAULT_OPTIONS.deep_merge(options)
    end
  end
end
