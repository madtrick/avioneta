
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

  copy_to "vendor/assets/bootstrap-3.0.0/bootstrap.js", "public/assets/vendor/bootstrap-3.0.0/bootstrap.js"
  copy_to "vendor/assets/bootstrap-3.0.0/bootstrap.css", "public/assets/vendor/bootstrap-3.0.0/bootstrap.css"
  copy_to "vendor/assets/jquery-2.0.3.js", "public/assets/vendor/jquery-2.0.3.js"
  copy_to "vendor/assets/bootbox.js", "public/assets/vendor/bootbox.js"
end

def ensure_path(path)
  path = File.dirname path unless File.directory? path
  FileUtils.mkdir_p path unless File.exist? path
end

def copy_to(origin, destination)
  ensure_path destination
  FileUtils.cp origin, destination
end
