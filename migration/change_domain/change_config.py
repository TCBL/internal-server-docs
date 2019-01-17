# Original code: https://github.com/GluuFederation/community-edition-setup/tree/master/static/scripts/change_hostname

import os, sys
from change_gluu_host import Installer, FakeRemote, ChangeGluuHostname

name_changer = ChangeGluuHostname(
    
    # Change these parameters here. If there are '' marks, leave them only replacing <entry> with your information.
    
    # The hostname currently in Gluu Server's configuration
    old_host='tcblsso.ilabt.iminds.be',
    
    # The hostname you would like your Gluu Server to have
    new_host='tcblsso.tcbl.eu',
    
    #### Certificate Creation #### 
    cert_city='Gent',
    cert_mail='gerald.haesendonck@ugent.be',
    # State must be in 2 letter format i.e TX for Texas
    cert_state='VLG',
    # Country also must be in 2 letter format i.e US for United States
    cert_country='BE',
    ##############################
    
    # IP Address of the Gluu Server. Used to change the /etc/hosts file for Apache
    ip_address='193.191.148.150',
    
    # The hostname or IP of the LDAP server to make changes to static hostname data. 
    # The local parameter below, when True, disregards this variable to prevent accidentally connecting to a production instance.
    server='localhost',
    
    # The password to the the LDAP server
    ldap_password=<the well-known password!>,
    
    # 'Ubuntu' or 'CentOS'
    os_type='Ubuntu',
    
    # Do not change to False unless you want the script to access that LDAP server remotely. 
    # Not recommended as the script should be run locally
    local=True,
    
    # Version of Gluu Server you're trying to modify. For example: '3.1.3'
    gluu_version='3.0.2',
    
    #Type of LDAP Server, it will be either openldap or opendj
    ldap_type='openldap'
    )

r = name_changer.startup()
if not r:
    sys.exit(1)

name_changer.change_appliance_config()
name_changer.change_clients()
name_changer.change_uma()
name_changer.change_httpd_conf()
name_changer.create_new_certs()
name_changer.change_host_name()
name_changer.modify_etc_hosts()
name_changer.modify_saml_passport()
