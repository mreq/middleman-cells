require 'middleman-core'

module Middleman
  module Cells
    class Extension < ::Middleman::Extension
      option :cells_dir, 'cells', 'Directory where to place cells'
      option :autoload, true, 'Whether to autoload cells or not'

      def initialize(app, options_hash={}, &block)
        super

        require 'cells'
        yield if block_given? # Expect to require template engines (like cells-erb).

        ::Cell::ViewModel.send(:include, ::Cell::Erb) if defined?(::Cell::Erb)
      end

      def after_configuration
        cells_dir = File.join(app.root, app.config[:source], options.cells_dir)

        ::Cell::ViewModel.view_paths << cells_dir

        if options.autoload
          require 'active_support/dependencies'
          ::ActiveSupport::Dependencies.autoload_paths << cells_dir
        end
      end
    end
  end
end
