# frozen_string_literal: true

# Created on 20 Sept 2017
# @author: Andy Perrett
#
# Versions:
# 1.0 - Baseline
#
# report_summary.rb - methods for writing to the test summary report file
module ReportSummary
  require_relative '../taf_config.rb'
  # holds printable test report summary for all the executed tests
  @testStepReportSummary = []
  # output the test results summary for the current test case
  def self.test_step_summary(test_file_name, test_file_name_index)
    @testStepReportSummary[test_file_name_index] = <<~TEXT
      Test file: #{test_file_name}
      Browser type: #{$browserType}
      Browser version: #{Browser.browser_version}
      Environment: #{$env_type}
      Started at: #{$test_case_start_time}
      Finished at: #{$test_case_end_time}
      There are: #{$testStepPasses} Passes
      There are: #{$testStepFailures} Failures
      There are: #{$testStepNotrun} Skipped Tests \n
    TEXT
  end

  # output the overall test results summary
  def self.print_overall_test_summary
    # output to the console

    MyLog.log.info "Finished processing all test files - executed via test suite: #{$testSuiteFile} by tester: #{$tester}"
    MyLog.log.info "Overall Test Summary:"
    @testStepReportSummary.each do |testStepReportSummary|
      testStepReportSummary.each_line do |line|
        MyLog.log.info(line.strip)
      end
    end

    MyLog.log.info "Total Tests started at: #{$test_start_time}"
    MyLog.log.info "Total Tests finished at: #{$test_end_time}"
    MyLog.log.info ('Total Tests duration: ' + TimeDifference.between($test_end_time, $test_start_time).humanize)
    MyLog.log.info "Total Tests Passed: #{$totalTestPasses}".green
    MyLog.log.info "Total Tests Failed: #{$totalTestFailures}".red
    MyLog.log.info "Total Tests Skipped: #{$totalTestNotrun}".blue
    $totalTests = [$totalTestPasses, $totalTestFailures, $totalTestNotrun].sum
    MyLog.log.info "Total Tests: #{$totalTests}\n"
  end
end
