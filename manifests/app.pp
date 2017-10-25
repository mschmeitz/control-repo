node 'node3'  {

    $url_v3 = 'https://3-107874296-gh.circle-artifacts.com/0/tmp/circle-artifacts.wooda1V/sysfoo.war'
    $url_v3_checksum = '5aa79b9893ffba6a4eb376d2839005a9'
    $url_v2 = 'https://1-107874296-gh.circle-artifacts.com/0/tmp/circle-artifacts.5iR6AFf/sysfoo.war'
    $url_v2_checksum = '70b62de0380b0be004a2a76be458c899'

    notify { "***** EXECUTING TOMCAT ***** ": }

    include base
    include java

    class { 'tomcat':
       xms            => '128m',
       xmx            => '128m',
       user           => 'root',

    }
    
    tomcat::deploy { "sysfoo":
        deploy_url    => $url_v3,
        md5_checksum  => $url_v3_checksum,
    }
}
