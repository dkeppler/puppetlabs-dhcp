# Class: okra::package
#
# Clones okra and installs all dependencies
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class okra::package {
  include git
  include okra::params

  user { "okra":
    ensure     => present,
    managehome => true,
    home       => $okra::params::basedir,
  }

  # Required for nokogiri. Debian specific.
  package { [ "libxslt1-dev", "libxml2-dev" ]:
    ensure => present
  }
  #vcsrepo { $okra::params::basedir:
  #  ensure   => present,
  #  provider => git,
  #  source   => $okra::params::source_url
  #}
}
