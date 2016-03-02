# Middleman::Cells

[![Gem Version](https://badge.fury.io/rb/middleman-cells.svg)](https://badge.fury.io/rb/middleman-cells)

[Cells](https://github.com/apotonick/cells) support for [Middleman](https://github.com/middleman/middleman).

## Usage

Create cells under `source/cells`.

`source/cells/greet_cell.rb`:
```ruby
class GreetCell < Cell::ViewModel
  property :name

  def show
    render
  end
end
```

`source/cells/greet/show.erb`:
```erb
<p>Hello, <%= name %>!</p>
```

Use it in your views.

`source/index.html.erb`
```erb
---
name: Ninome-chan
---

<%= cell(:greet, current_page.data).() %>
```

Cool. :smirk:

For more details of Cells, see [Cells' README](https://github.com/apotonick/cells/blob/master/README.md).


## Installation

Add the following line to your `Gemfile`.

```ruby
gem 'middleman-cells'
```

In addition, you need to install template engine(s) which you want to use in cells.
Available engines are listed [here](https://github.com/apotonick/cells#installation).

If you want to use [cells-erb](https://github.com/trailblazer/cells-erb), for example, add the following line to `Gemfile`.

```ruby
gem 'cells-erb'
```

Then, run `bundle install`.


## Configuration

```ruby
require 'cells-erb' # Require template engine(s) you installed.

activate :cells
```

Or, if you prefer:

```ruby
activate :cells do
  require 'cells-erb'
end
```

### Configuration Options

#### `cells_dir` (default: `"cells"`)

```ruby
# Change directory where to place cells to `source/view_models`.
activate :cells, cells_dir: 'view_models'
```

#### `autoload` (default: `true`)

```ruby
# Disable to autoload cells.
activate :cells, autoload: false

# ...and you need to require your cells manually.
require 'source/cells/foobar_cell'
```

## Contributing

Please report bugs via [Issues](https://github.com/notozeki/middleman-cells/issues). Also [Pull Requests](https://github.com/notozeki/middleman-cells/pulls) are welcome. :grinning:

Issue や Pull Request は日本語でもOKです :jp:

## License

MIT
