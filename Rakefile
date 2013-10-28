
begin
  require 'jasmine'
  load 'jasmine/tasks/jasmine.rake'
rescue LoadError
  task :jasmine do
    abort "Jasmine is not available. In order to run jasmine, you must: (sudo) gem install jasmine"
  end
end

task :build do
  require "guard"

  Guard.setup group: [:assets]
  Guard.run_all

  ensure_path "public/assets/vendor/bootstrap-3.0.0/js"
  FileUtils.cp "vendor/assets/bootstrap-3.0.0/js/modal.js", "public/assets/vendor/bootstrap-3.0.0/js/modal.js"
end

def ensure_path(path)
  FileUtils.mkdir_p path unless File.directory? path
end
