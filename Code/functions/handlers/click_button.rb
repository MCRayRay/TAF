require_relative 'base_handler'

module TestSteps
  module Handlers
    class ClickButton < Base
      register :click_button

      def perform(step_attributes)
        button = step_attributes[:testvalue]
        locate = step_attributes[:locate]

        elms = %i[button span a div link image h1 h2 h3 h4]

        found_button = elms.map do |elm|
          Browser.b.send(elm, "#{locate}": button).exists?
        end.compact

        raise 'Multiple matches' if found_button.select { |i| i }.empty?

        index = found_button.index(true)
        return unless index

        case index
        when 0
          Browser.b.button("#{locate}": button).wait_until(&:exists?).click
        when 1
          Browser.b.span("#{locate}": button).wait_until(&:exists?).click
        when 2
          Browser.b.a("#{locate}": button).wait_until(&:exists?).click
        when 3
          Browser.b.div("#{locate}": button).wait_until(&:exists?).click
        when 4
          Browser.b.link("#{locate}": button).wait_until(&:exists?).click
        when 5
          Browser.b.image("#{locate}": button).wait_until(&:exists?).click
        when 6
          Browser.b.h1("#{locate}": button).wait_until(&:exists?).click
        when 7
          Browser.b.h2("#{locate}": button).wait_until(&:exists?).click
        when 8
          Browser.b.h3("#{locate}": button).wait_until(&:exists?).click
        when 9
          Browser.b.h4("#{locate}": button).wait_until(&:exists?).click
        end
        MyLog.log.info("Button: #{button} has been selected")
        true
      rescue StandardError
        MyLog.log.warn("Button: #{button} does not exist")
        false
      end
    end
  end
end
