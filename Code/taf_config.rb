# frozen_string_literal: true

# Created on 20 Sept 2017
# @author: Andy Perrett
# MIT License
# Copyright (c) 2017 Aperrett
# Versions:
# 1.0 - Baseline
#
# taf_config.rb - Framework Config file

# list of all the required gems.
require 'selenium-webdriver'
require 'watir'
require 'rubygems'
require 'fileutils'
require 'logger'
require 'net/ping'
require 'nokogiri'
require 'time_difference'
require 'colored'
require 'rubyXL'

# list of all the required files
require_relative 'test_steps'
require_relative 'report'
require_relative 'browser'
require_relative 'create_directories'
require_relative 'test_engine'
require_relative 'exceptions'
require_relative 'report'
require_relative 'web_functions'
require_relative 'custom_funcs'
require_relative 'parser'
require_relative 'xlsx_parser'
