require_relative '../3rdparty/cfpropertylist'

module Lagunitas
  class App
    def initialize(path)
      @path = path
    end

    def info
      @info ||= CFPropertyList.native_types(CFPropertyList::List.new(file: File.join(@path, 'Info.plist')).value)
    end

    def identifier
      info['CFBundleIdentifier']
    end

    def display_name
      info['CFBundleDisplayName']
    end

    def version
      info['CFBundleVersion']
    end

    def short_version
      info['CFBundleShortVersionString']
    end

    def icon(size)
      icons.each do |icon|
        return icon[:path] if icon[:width] >= size
      end
      nil
    end

    def icons
      @icons ||= begin
        icons = []
        info['CFBundleIcons']['CFBundlePrimaryIcon']['CFBundleIconFiles'].each do |name|
          icons << get_image(name)
          icons << get_image("#{name}@2x")
        end
        icons.delete_if { |i| !i }
      end
    end

    private

    def get_image(name)
      path = File.join(@path, "#{name}.png")
      return nil unless File.exist?(path)

      {
        path: path,
        width: `sips -g pixelWidth #{path} | tail -n1 | cut -d" " -f4`.to_i,
        height: `sips -g pixelHeight #{path} | tail -n1 | cut -d" " -f4`.to_i
      }
    rescue Errno::ENOENT
      nil
    end
  end
end
