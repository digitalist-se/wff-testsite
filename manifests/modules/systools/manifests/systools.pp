class systools (
  $packages = [
    'emacs23-nox',
    'puppet-el',
    'php-elisp',
    'htop',
    'git-core',
    'curl',
    'aptitude',
    'links',
    'pv'
  ]
) {
  package { $packages:
    ensure => latest,
  }
  exec { 'apt-get update':
    command => "/usr/bin/apt-get update"
  }
  Package { require => Exec['apt-get update'] }
}
