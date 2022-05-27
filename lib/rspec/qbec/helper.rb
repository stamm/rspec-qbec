# frozen_string_literal: true

require 'time'
require 'yaml'
require 'tmpdir'

module RSpec
  module Qbec
    # Helpers for run and parse qbec output
    module Helpers
      def run(cmd)
        Open3.capture3(cmd)
      end

      def run_qbec(env = '', args = '')
        run("qbec --root #{RSpec.configuration.qbec_root} show #{args} #{env}")
      end

      def to_ostruct(object)
        case object
        when Hash
          OpenStruct.new(object.transform_values { |v| to_ostruct(v) })
        when Array
          object.map { |x| to_ostruct(x) }
        else
          object
        end
      end

      def yaml(str, kind = '')
        matches = str.split(/(?:\n+|\A)---(?:\n+|\Z)/m)
        res = []
        matches.each do |v|
          res << to_ostruct(YAML.safe_load(v)) if v != ''
        end
        if kind != ''
          kind = kind.downcase
          res = res.select { |v| v.kind.downcase == kind }
        end
        res
      end

      def yaml_several(str, template)
        match = str.match(/#{regexp_source(template)}\n(.+?)\n(# Source|\z)/m)
        return if match.nil?

        str_ar = match[1].split('---')
        yamls = str_ar.each_with_object([]) do |el, res|
          res << to_ostruct(YAML.safe_load(el))
        end
        yamls.reject { |el| el == false }.compact
      end

      def write_file(str)
        file_path = ''
        loop do
          file_path = Dir.tmpdir + "/qbec_#{DateTime.now.strftime('%Q')}.yml"
          break unless File.exist?(file_path)
        end
        File.open(file_path, 'w') { |file| file.write(str) }
        file_path
      end
    end
  end
end
