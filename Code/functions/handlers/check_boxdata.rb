require_relative 'base_handler'

module TestSteps
  module Handlers
    class CheckBoxdata < Base
      register :check_box_data

      def perform(step_attributes)
        box = step_attributes[:testvalue]
        value = step_attributes[:testvalue2]
        locate = step_attributes[:locate]

        found_box = [
          Browser.b.textarea("#{locate}": box).exist?,
          Browser.b.text_field("#{locate}": box).exist?
        ]

        raise 'Multiple matches' if found_box.select { |i| i }.empty?

        index = found_box.index(true)
        return unless index

        if index.zero?
          Browser.b.textarea("#{locate}": box).wait_until(&:exists?)
          (Browser.b.textarea("#{locate}": box).value == value)
        elsif index == 1
          Browser.b.text_field("#{locate}": box).wait_until(&:exists?)
          (Browser.b.text_field("#{locate}": box).value == value)
        end
        MyLog.log.info("Textbox: #{box} has the correct value: #{value}")
        true
      rescue StandardError
        MyLog.log.warn("Textbox: #{box} has the incorrect value: #{value}")
        false
      rescue StandardError
        MyLog.log.warn("Textbox: #{box} does not exist")
        false
      end
    end
  end
end
