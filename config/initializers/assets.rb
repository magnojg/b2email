# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( libs/modernizr-2.5.3.min.js )
Rails.application.config.assets.precompile += %w( libs/jquery-ui-1.10.3.custom.min.js )
Rails.application.config.assets.precompile += %w( plugins/bootstrap-datetimepicker.min.js )
Rails.application.config.assets.precompile += %w( plugins/bootstrap-datetimepicker.pt-BR.js )
Rails.application.config.assets.precompile += %w( plugins/bootstrap-file-input.js )
Rails.application.config.assets.precompile += %w( plugins/validate/jquery.validate.js )
Rails.application.config.assets.precompile += %w( plugins/validate/jquery.validate.pt-br.js )
Rails.application.config.assets.precompile += %w( ckeditor/* )
