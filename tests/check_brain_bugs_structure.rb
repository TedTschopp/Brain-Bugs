#!/usr/bin/env ruby
# frozen_string_literal: true

require 'pathname'

ROOT = Pathname.new(__dir__).parent

EXPECTED_COUNTS = {
  '_bb_errors' => 83,
  '_bb_topics' => 10,
  '_bb_compare' => 16,
  '_bb_practice' => 8,
  '_bb_stories' => 6
}.freeze

EXPECTED_OUTPUTS = [
  '_site/index.html',
  '_site/errors/ad-hominem/index.html',
  '_site/topics/logical-fallacies/index.html',
  '_site/compare/fallacies-vs-biases/index.html',
  '_site/practice/quizzes/five-quick-calls/index.html',
  '_site/search/index.html',
  '_site/glossary/index.html'
].freeze

def fail_with(message)
  warn("ERROR: #{message}")
  exit(1)
end

EXPECTED_COUNTS.each do |directory, expected|
  actual = Dir.glob(ROOT.join(directory, '*.md')).size
  fail_with("#{directory} expected #{expected} markdown files, found #{actual}.") unless actual == expected
end

EXPECTED_OUTPUTS.each do |relative_path|
  fail_with("Missing generated page: #{relative_path}") unless ROOT.join(relative_path).file?
end

puts 'OK: Brain Bugs structure and representative outputs are present.'