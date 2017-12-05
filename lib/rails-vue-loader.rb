require 'sprockets'
require 'sprockets/vue/version'
require 'sprockets/vue/utils'
require 'sprockets/vue/script'
require 'sprockets/vue/style'
module Sprockets
  if respond_to?(:register_transformer)
    extensions = ['.vue'].concat(Sprockets::Vue::Script::ALLOWED_JS_EXTS)
    register_mime_type 'text/vue', extensions: extensions, charset: :unicode
    register_transformer 'text/vue', 'application/javascript', Vue::Script
    register_transformer 'text/vue', 'text/css', Vue::Style

    register_processor 'text/vue', Sprockets::DirectiveProcessor
  end
end
