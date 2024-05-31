require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TestApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # デフォルトのロケールを設定
    config.i18n.default_locale = :ja

    # 使用するロケールファイルのディレクトリを設定
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]

    # 使用するロケールのホワイトリストを設定
    config.i18n.available_locales = [:en, :ja]

    # ロケールを自動ロードするように設定
    config.i18n.fallbacks = true
  end
end
