group :development do
  guard 'livereload' do
    watch(%r{public/index\.html})
    watch(%r{public/assets/.*})
  end
end

group :specs do
  #Options for guard-jasmine got here: https://github.com/netzpirat/guard-jasmine/issues/103
  guard :jasmine, server:  :jasmine_gem, port: 8888, jasmine_url: 'http://localhost:8888', timeout: 120 do
    watch(%r{public/assets/.+\.js})
    watch(%r{spec/javascripts/spec\.(js\.coffee|js|coffee)$}) { 'spec/javascripts' }
    watch(%r{spec/javascripts/.+_spec\.(js\.coffee|js|coffee)$})
  end
end

group :assets do
  guard 'coffeescript', input: 'vendor/javascript', output: 'public/assets'
  guard 'coffeescript', input: 'app/assets/javascript', output: 'public/assets'
  guard 'coffeescript', input: 'spec/coffeescripts', output: 'spec/javascripts'
  guard 'sass', input: 'app/assets/style', output: 'public/assets'

  guard :less, all_on_start: true, all_after_change: true, output: "public/assets/vendor/bootstrap-3.0.0/css"do
    watch(%r{vendor/assets/bootstrap-3\.0\.0/less/.+\.less$})
  end
end
