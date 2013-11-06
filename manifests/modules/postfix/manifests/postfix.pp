class postfix (
  $mail_name = $hostname,
  $relay_name = '',
  $mail_domain = 'example.com',
  ) {
  package { "postfix":
    ensure => installed,
  }

  service { "postfix":
    enable => true,
    ensure => running,
    require => [Package['postfix'], File["/etc/mailname"], File["/etc/postfix/main.cf"]]
  }

  file { "/etc/mailname":
    mode    => 0444,
    content => "${mail_name}.${mail_domain}",
    notify  => Service['postfix'],
    require => Package['postfix']
  }

  file { "/etc/postfix/main.cf":
    mode    => 0444,
    content => template("postfix/main.cf.erb"),
    notify  => Service['postfix'],
    require => File['/etc/mailname']
  }

  Package { require => Exec['apt-get update'] }
}
