node 'node4' {

    include ::haproxy
    
    haproxy::listen { 'app':
        collect_exported  => false,
        ipaddress         => $::ipaddress,
        ports             => '80',
    }
    haproxy::balancermember { 'app1':
        listening_service => 'app',
        server_names      => 'node1',
        ipaddresses       => '172.19.0.2',
        ports             => '8080',
        options           => 'check',
    }
    haproxy::balancermember { 'app2':
      listening_service => 'app',
      server_names      => 'node2',
      ipaddresses       => '172.0.19.6',
      ports             => '8080',
      options           => 'check',
    }
    notify {"THE IP ADDRES IS ${::ipaddress} ****************************************" : }
}
