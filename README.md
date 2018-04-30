# ActivePath View Injection: 
View injection for your partials.


## Installation 

Add to your Gemfile:

```ruby
gem 'active_path-view_injection'
```

Add the initializer `config/initializers/active_path.rb` and enable `ActivePath`:

```ruby

ActivePath.configure do |config|

  config.enabled = true

end

```


**View injection:**

```ruby

ActivePath.configure do |config|

  ...

  config.partials.prepend('pages/content').with('example/test')

end

```

The above example assumes your application renders a partial called 'pages/content' and you want to `prepend` a partial called 'example/test'.

Your partial will have the same local parameters access as the prepended partial. You can also use `append`:

```ruby

config.partials.append('pages/content').with('example/test')

```


The above renders 'example/test' after 'pages/content'.

--

**Conditions:**

The `when` method allows you to conditionally inject your view. Consider this partial:

```ruby
render partial: 'pages/content', locals: { page_id: 9 }
```

You can pass in a hash which must match the local variables.

```ruby

config.partials.append('pages/content').with('example/test').when(page_id: 9)

```

Or pass in a block for more flexibility with your conditions:

```ruby

config.partials.append('pages/content').with('example/test').when do |locals|
  locals[:page_id] == 9
end

```


Feel free to [submit issues](https://github.com/active-path/view-injection/issues) or [help make it better](https://github.com/active-path/view-injection/pulls). 