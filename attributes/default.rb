# graphite module version
default['graphite']['web']['version'] = '0.9.12-5.el6'
default['graphite']['web-selinux']['version'] = '0.9.12-5.el6'
default['graphite']['python-carbon']['version'] = '0.9.12-3.el6'
default['graphite']['python-whisper']['version'] = '0.9.12-1.el6'

# mysql information
default['graphite']['mysql']['host'] = 'localhost'
default['graphite']['mysql']['port'] = 3306
default['graphite']['mysql']['database'] = 'graphite'
default['graphite']['mysql']['user'] = 'graphite'
default['graphite']['mysql']['password'] = 'justfortest'
normal['mysql']['server_root_password'] = 'justfortest'



default['graphite']['twisted_version'] = '13.1'
default['graphite']['django_version'] = '1.5.5'
default['graphite']['password'] = 'change_me'
default['graphite']['user'] = 'graphite'
default['graphite']['group'] = 'graphite'
default['graphite']['listen_port'] = 80
default['graphite']['base_dir'] = '/var/lib/graphite'
default['graphite']['storage_dir'] = '/var/lib/graphite/storage'
default['graphite']['install_type'] = 'package'
default['graphite']['package_names'] = {
  'whisper' => {
    'package' => 'whisper',
    'source' => 'https://github.com/graphite-project/whisper/zipball/master'
  },
  'carbon' => {
    'package' => 'carbon',
    'source' => 'https://github.com/graphite-project/graphite-web/zipball/master'
  },
  'graphite_web' => {
    'package' => 'graphite-web',
    'source' => 'https://github.com/graphite-project/graphite-web/zipball/master'
  }
}

default['graphite']['graph_templates'] = [
  {
    'name' => 'default',
    'background' => 'black',
    'foreground' => 'white',
    'majorLine' => 'white',
    'minorLine' => 'grey',
    'lineColors' => 'blue,green,red,purple,brown,yellow,aqua,grey,magenta,pink,gold,rose',
    'fontName' => 'Sans',
    'fontSize' => '10',
    'fontBold' => 'False',
    'fontItalic' => 'False'
  }
]

