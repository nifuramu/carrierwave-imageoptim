# Carrierwave ImageOptim
This gem allows you to optimize [CarrierWave](https://github.com/carrierwaveuploader/carrierwave) images using the [image_optim](https://github.com/toy/image_optim) gem.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'carrierwave-imageoptim'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install carrierwave-image_optim

## Usage
To add image optimization to your CarrierWave uploader, first include the module:

```ruby
class MyUploader < CarrierWave::Uploader::Base
  include CarrierWave::ImageOptimizer
  ...
end
```

Then apply to all versions via:

```ruby
class MyUploader < CarrierWave::Uploader::Base
  include CarrierWave::ImageOptimizer

  process optimize: [{
    jpegoptim: true,
    optipng: true,
    gifsicle: true
  }]
end
```

Or to a single image version via:

```ruby
class MyUploader < CarrierWave::Uploader::Base
  include CarrierWave::ImageOptimizer

  version :thumbnail do
    process optimize: [{
      jpegoptim: true,
      optipng: true,
      gifsicle: true
    }]
  end
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
