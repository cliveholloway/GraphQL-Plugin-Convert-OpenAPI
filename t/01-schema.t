use strict;
use Test::More 0.98;

use_ok 'GraphQL::Plugin::Convert::OpenAPI';

my $expected = join '', <DATA>;
my $converted = GraphQL::Plugin::Convert::OpenAPI->to_graphql(
  't/cpantesters-v3.json'
);
my $got = $converted->{schema}->to_doc;
#open my $fh, '>', 'tf'; print $fh $got; # uncomment to regenerate
is $got, $expected;

done_testing;

__DATA__
type AcceptedReports {
  id: String!
  status: String
}

type Distribution {
  name: String!
  # A list of prerequisites
  prerequisites: [Prerequisite]
  version: String!
}

type Environment {
  language: Language!
  system: System!
  toolchain: [EnvironmentToolchain]
  user_agent: String
}

type EnvironmentToolchain {
  key: String
  value: String
}

type Error {
  errors: [ErrorErrors]
}

type ErrorErrors {
  # Human readable description of the error
  message: String!
  # JSON pointer to the input data where the error occur
  path: String
}

type Grade {
}

type Language {
  archname: String!
  build: String
  name: String!
  variables: [LanguageVariables]
  version: String!
}

type LanguageVariables {
  key: String
  value: String
}

type NewReport {
  comments: String
  distribution: Distribution!
  environment: Environment!
  reporter: Reporter!
  result: Result!
}

type Perl5 {
}

type Perl6 {
}

type Prerequisite {
  have: String
  name: String!
  need: String!
  phase: String!
}

type Query {
  acceptedReports: [AcceptedReports]
  distribution: [Distribution]
  environment: [Environment]
  environmentToolchain: [EnvironmentToolchain]
  error: [Error]
  errorErrors: [ErrorErrors]
  grade: [Grade]
  language: [Language]
  languageVariables: [LanguageVariables]
  newReport: [NewReport]
  perl5: [Perl5]
  perl6: [Perl6]
  prerequisite: [Prerequisite]
  release: [Release]
  report: [Report]
  reportSummary: [ReportSummary]
  reporter: [Reporter]
  result: [Result]
  resultTodo: [ResultTodo]
  system: [System]
  systemVariables: [SystemVariables]
  testOutput: [TestOutput]
  upload: [Upload]
}

type Release {
  # The CPAN ID of the author who released this version of this distribution
  author: String
  # The distribution name
  dist: String
  # The number of test failures for this release
  fail: Int
  # The number of NA results for this release, which means the release does not apply to the tester's machine due to OS, Perl version, or other conditions
  na: Int
  # The number of test passes for this release
  pass: Int
  # The number of unknown reports for this release
  unknown: Int
  # The distribution release version
  version: String
}

type Report {
}

type ReportSummary {
  # The date/time of the report in ISO8601 format
  date: String
  # The name of the distribution tested
  dist: String
  grade: Grade
  # The GUID of the full report this data came from
  guid: String
  # The name of the operating system, like 'linux', 'MSWin32', 'darwin'
  osname: String
  # The version of the operating system, like '4.8.0-2-amd64'
  osvers: String
  # The Perl version that ran the tests, like '5.24.0'
  perl: String
  # The Perl platform that ran the tests, like 'x86_64-linux'
  platform: String
  # The name/email of the reporter who submitted this report
  reporter: String
  # The version of the distribution tested
  version: String
}

type Reporter {
  email: String!
  name: String
}

type Result {
  duration: Int
  failures: Int
  grade: Grade!
  output: TestOutput!
  skipped: Int
  tests: Int
  todo: ResultTodo
  warnings: Int
}

type ResultTodo {
  fail: Int!
  pass: Int!
}

type System {
  cpu_count: String
  cpu_description: String
  cpu_type: String
  filesystem: String
  hostname: String
  osname: String!
  osversion: String
  variables: [SystemVariables]
}

type SystemVariables {
  key: String
  value: String
}

type TestOutput {
  build: String
  configure: String
  install: String
  test: String
  uncategorized: String
}

type Upload {
  # The CPAN ID of the author who released this version of this distribution
  author: String
  # The distribution name
  dist: String
  # The filename on PAUSE, without the author directory
  filename: String
  # The date/time the file was released to CPAN, in UTC
  released: String
  # The distribution release version
  version: String
}