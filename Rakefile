
begin
  require 'jasmine'
  load 'jasmine/tasks/jasmine.rake'
rescue LoadError
  task :jasmine do
    abort "Jasmine is not available. In order to run jasmine, you must: (sudo) gem install jasmine"
  end
end

namespace :github do
  task :deploy do
    sh 'git co gh-pages'
    sh 'cp -R build/assets/ assets/'
    sh 'cp build/index.html index.html'
    sh 'git add .'
    sh 'git commit -m "New version for github pages"'
    sh 'git push github gh-pages'
    sh 'git co master'
    sh 'rm assets/'
  end
end

namespace :assets do
  #
  # This variables have to be defined as constants to
  # be available to the helpers methods below.
  #
  # If defined as local variables they will only be
  # available to the blocks (which closures over them)
  #
  PUBLIC_ASSETS_DIR = "public/assets"
  BUILD_ASSETS_DIR  = "build/assets"
  VENDOR_ASSETS_DIR = "vendor/assets"

  SUBDIRS = %w{javascripts stylesheets}

  desc "Optimizes javascripts (minimize and uglify) and copies other assets into build dir"
  task :build => :prepare do
    FileUtils.rm_rf(files_in_dir(BUILD_ASSETS_DIR))
    sh "./node_modules/requirejs/bin/r.js -o build.js"

    FileUtils.cp(File.join("public", "index.html"), "build")
    FileUtils.cp_r(File.join(PUBLIC_ASSETS_DIR, "stylesheets"), BUILD_ASSETS_DIR)
    FileUtils.cp_r(File.join(PUBLIC_ASSETS_DIR, "images"), BUILD_ASSETS_DIR)
  end

  desc "Removes javascripts and stylesheets dirs from public"
  task :clean do
    SUBDIRS.each {|subdir| FileUtils.rm_rf(Dir.glob(File.join(PUBLIC_ASSETS_DIR, subdir)))}
  end

  desc "Compiles coffeescripts, sass and eco files and copies vendored resources into public"
  task :prepare => :clean do
    compile_assets
    copy_vendored_assets
  end

  def compile_assets
    require "guard"

    Guard.setup group: [:assets]
    Guard.run_all
  end

  def copy_vendored_assets
    SUBDIRS.each do |subdir|
      files_in_dir(File.join(VENDOR_ASSETS_DIR, subdir)).each {|file| copy_to(file,  vendor_file_path_in_public(subdir, file))}
    end
  end

  def files_in_dir(dir)
    Dir.glob(File.join(dir, "*"))
  end

  def vendor_file_path_in_public(subdir, vendor_file)
    File.join(PUBLIC_ASSETS_DIR, subdir, "vendor", File.basename(vendor_file))
  end
end

def ensure_path(path)
  path = File.dirname path unless File.directory? path
  FileUtils.mkdir_p path unless File.exist? path
end

def copy_to(origin, destination)
  ensure_path destination
  FileUtils.cp origin, destination
end
