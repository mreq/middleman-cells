require 'middleman-core'

module Middleman
  module Cells
    class Extension < ::Middleman::Extension
      def initialize(app, options_hash={}, &block)
        super

        require 'cells'
        yield if block_given? # Expect to require template engines (like cells-erb).

        ::Cell::ViewModel.send(:include, ::Cell::Erb) if defined?(::Cell::Erb)
      end

      def after_configuration
        root_path = app.root_path
        cells_dir = File.join(app.config[:source], 'cells')

        ::Cell::ViewModel.view_paths << root_path + cells_dir
      end
    end
  end
end
