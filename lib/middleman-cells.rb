require 'middleman-core'

Middleman::Extensions.register :cells do
  require 'middleman-cells/extension'
  Middleman::Cells::Extension
end
