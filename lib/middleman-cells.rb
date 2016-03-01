require "middleman-core"

Middleman::Extensions.register :cells do
  require "my-extension/extension"
  MyExtension
end
