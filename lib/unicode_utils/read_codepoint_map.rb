# encoding: utf-8

module UnicodeUtils

  module Impl # :nodoc:

    def self.read_codepoint_map(filename)
      path = File.join(File.dirname(__FILE__), filename)
      Hash.new.tap { |map|
        File.open(path, "r:US-ASCII") do |input|
          buffer = "x" * 6
          while input.read(6, buffer)
            map[buffer.to_i(16)] = input.read(6, buffer).to_i(16)
          end
        end
      }
    end

  end

end
