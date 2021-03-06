# frozen_string_literal: true

# Created on 20 Sept 2017
# @author: Andy Perrett
#
# Versions:
# 1.0 - Baseline
#
# junit_report.rb - methods for writing to the summary xml junit report.
module JunitReport
  require_relative '../taf_config.rb'
  # holds printable test report summary for all the executed tests
  @test_step_report_summary2 = []
  # construct the test suite header for junit
  def self.test_step_summary_xml(test_file_name, test_file_name_index)
    @test_step_report_summary2[test_file_name_index] = {
      'classname' => test_file_name,
      'name' => test_file_name,
      'assertions' => $numberOfTestSteps,
      'failures' => $testStepFailures,
      'tests' => $testStepPasses,
      'skipped' => $testStepNotrun,
      'time' => TimeDifference.between(
        $test_case_end_time, $test_case_start_time
      ).in_seconds
    }
  end

  def self.test_summary_junit
    # output to XML file format for Junit for CI.
    builder = Nokogiri::XML::Builder.new(encoding: 'UTF-8') do |xml|
      testsuite_attrs = {
        'classname' => $testcasesFolder.to_s,
        'name' => $testcasesFolder.to_s,
        'tests' => $totalTests.to_s,
        'failures' => $totalTestFailures.to_s,
        'timestamp' => $test_start_time.to_s,
        'skipped' => $totalTestNotrun.to_s,
        'time' => TimeDifference.between($test_end_time, $test_start_time)
                                .in_seconds
      }
      xml.testsuites(testsuite_attrs) do |testsuites|
        @test_step_report_summary2.each do |test_step_report_summary2|
          testsuites.testsuite(test_step_report_summary2) do |testsuite|
            $testStep_xml[test_step_report_summary2['name']]
              .each do |test_step_idx, test_step_xml|
              testsuite.testcase(test_step_xml) do |testcase|
                failure = $failtestStep_xml
                  &.[](test_step_report_summary2['name'])&.[](test_step_idx)
                skipped = $skiptestStep_xml
                  &.[](test_step_report_summary2['name'])&.[](test_step_idx)
                testcase.failure(failure) if failure
                testcase.skipped(skipped) if skipped
              end
            end
          end
        end
      end
    end

    ts_summary_file_xml = File.open($TestSuiteSummaryXML, 'w')
    ts_summary_file_xml.write builder.to_xml
    ts_summary_file_xml.close
  end
end
