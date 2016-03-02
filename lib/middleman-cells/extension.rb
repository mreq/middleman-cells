require 'middleman-core'

module Middleman
  module Cells
    class Extension < ::Middleman::Extension
      option :cells_dir, 'cells', 'Directory where to place cells'
      option :autoload, true, 'Whether to autoload cells or not'

      def initialize(app, options_hash={}, &block)
        super

        require 'cells'
        require 'active_support/inflector'
        yield if block_given? # Expect to require template engines (like cells-erb).

        ::Cell::ViewModel.send(:include, ::Cell::Erb) if defined?(::Cell::Erb)
        ::Cell::ViewModel.send(:include, ::Cell::Hamlit) if defined?(::Cell::Hamlit)
        ::Cell::ViewModel.send(:include, ::Cell::Haml) if defined?(::Cell::Haml)
        if defined?(::Cell::Slim)
          ::Cell::ViewModel.send(:include, ::Cell::Slim)

          # HACK: In Tilt's convention, All arguments of Template#initialize
          # are optional. But Middleman breaks it when overriding
          # Slim::Template and it causes ArgumentError. So we re-define it here
          # to follow the convention for the nonce. This very smells...:hankey:
          ::Slim::Template.class_eval do
            alias orig_initialize initialize
            def initialize(file=nil, line=1, options={}, &block)
              orig_initialize(file, line, options, &block)
            end
          end
        end
      end

      def after_configuration
        cells_dir = File.join(app.root, app.config[:source], options.cells_dir)

        ::Cell::ViewModel.view_paths << cells_dir

        if options.autoload
          require 'active_support/dependencies'
          ::ActiveSupport::Dependencies.autoload_paths << cells_dir
        end

        if app.config[:environment] == :development
          require 'cell/development'
          ::Cell::ViewModel.send(:include, ::Cell::Development)
        end
      end

      helpers do
        # Refer to Cell::ViewModel::Helpers#cell
        def cell(name, *args, &block)
          "#{name}_cell".camelize.constantize.(*args, &block)
        end
      end
    end
  end
end
