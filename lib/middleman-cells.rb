require "middleman-core"

Middleman::Extensions.register :middleman-cells do
  require "my-extension/extension"
  MyExtension
end
