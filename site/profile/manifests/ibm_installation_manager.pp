 class profile::ibm_installation_manager {
   class  { 'ibm_installation_manager': 
source_dir => '/media/sf_bandaru/was/InstallationManager',
 }
websphere::instance { 'webSphere85' :
target => '/opt/IBM/WebSphere/AppServer',
package => 'com.ibm.websphere.ND.v85',
version => '8.5.0.20120501_1108',
profile_base  => '/opt/IBM/WebSphere/AppServer/profiles',
repository => '/media/sf_bandaru/was/ND/repository.config',
}
websphere::package { 'WebSphere_85510':
ensure     => 'present',
package    => 'com.ibm.websphere.ND.v85',
version    => '8.5.5010.20160721_0036',
repository => '/media/sf_bandaru/was/FP/repository.config',
target     => '/opt/IBM/WebSphere/AppServer',
require    => Websphere::Instance['WebSphere85'],
}
websphere::package { 'Java7':
ensure     => 'present',
package    => 'com.ibm.websphere.IBMJAVA.v70',
version    => '7.0.4001.20130510_2103',
target     => '/opt/IBM/WebSphere/AppServer',
repository => '/media/sf_bandaru/was/javasdk7/SDK7.0/WS_SDK_JAVA_TEV7.0_1OF3_WAS_8.5.5/repository.config',
require    => Websphere::Package['WebSphere_85510'],
}
}
 }
 }

