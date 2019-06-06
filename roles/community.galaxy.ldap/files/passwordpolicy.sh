#!/bin/bash

# Usage
# Before this script, you should install LDAP.
# ./PasswordPolicies.sh -u {LDAP ADMIN} -p {ADMIN PASS} -d {BaseDN}

clear

RED='\e[0;31m'
GREEN='\e[0;32m'
GRAY='\e[0;90m'
NC='\e[0m' # No Color

echo -e "${GREEN}
======================================
PlusClouds LDAP PasswordPolicies Script
======================================
${NC}"

if [ $(id -u) -ne 0 ]; then
  echo -e "${RED}Islemlere devam edilebilmesi icin root kullanicisi ile giris yapmalisiniz${NC}"
  exit 1
fi

POSITIONAL=()
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -u|--username)
    USERNAME="$2"
    shift # past argument
    shift # past value
    ;;
    -p|--password)
    PASSWORD="$2"
    shift # past argument
    shift # past value
    ;;
    -d|--basedn)
    BASEDN="$2"
    shift # past argument
    shift # past value
    ;;
    --default)
    DEFAULT=YES
    shift # past argument
    ;;
    *)    # unknown option
    POSITIONAL+=("$1") # save it in an array for later
    shift # past argument
    ;;
esac
done
set -- "${POSITIONAL[@]}" # restore positional parameters
echo -e "${GREEN}
- Starting backup with variables;${NC}"

#STEP 1
ldapadd -Y EXTERNAL -H ldapi:///  -f /etc/ldap/schema/ppolicy.ldif #ppolicy şemasını db'de tanımlar.
echo -e "${GREEN}
- STEP 1 DONE;${NC}"

#STEP 2
# Policy Organization'ı oluşturur.
cat > /etc/ldap/slapd.d/myoupolicy.ldif <<EOF
dn: ou=Policies,$BASEDN
objectClass: top
objectClass: organizationalUnit
ou: Policies
EOF
echo -e "${GREEN}
- STEP 2 DONE;${NC}"

#STEP 3
ldapadd -D cn=$USERNAME,$BASEDN -w $PASSWORD -f /etc/ldap/slapd.d/myoupolicy.ldif #Ldap'a Policy Organizasyonunu ekler.
echo -e "${GREEN}
- STEP 3 DONE;${NC}"

#STEP 4
# PPolicy modülünü tanımlar.
cat > /etc/ldap/slapd.d/ppmodule.ldif <<EOF
dn: cn=module{0},cn=config
changetype: modify
add: olcModuleLoad
olcModuleLoad: ppolicy
EOF
echo -e "${GREEN}
- STEP 4 DONE;${NC}"

#STEP 5
ldapadd -Y EXTERNAL -H ldapi:///  -f /etc/ldap/slapd.d/ppmodule.ldif # PPolicy modülünü LDAP DB'de tanımlar.
echo -e "${GREEN}
- STEP 5 DONE;${NC}"

#STEP 6
# Policy overlay oluşturulur.
cat > /etc/ldap/slapd.d/ppolicyoverlay.ldif <<EOF
dn: olcOverlay={0}ppolicy,olcDatabase={1}hdb,cn=config
objectClass: olcOverlayConfig
objectClass: olcPPolicyConfig
olcOverlay: {0}ppolicy
olcPPolicyDefault: cn=MyOrgPPolicy,ou=Policies,$BASEDN
EOF
echo -e "${GREEN}
- STEP 6 DONE;${NC}"

#STEP 7
ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/ldap/slapd.d/ppolicyoverlay.ldif # PPolicy Overlay, Ldap DB'de tanımlanır.
echo -e "${GREEN}
- STEP 7 DONE;${NC}"

#STEP 8
#Password Policy özellikleri eklenir.
cat > /etc/ldap/slapd.d/passwordpolicy.ldif <<EOF
dn: cn=MyOrgPPolicy,ou=Policies,$BASEDN
cn: MyOrgPPolicy
objectClass: pwdPolicy
objectClass: device
objectClass: top
pwdAttribute: userPassword
pwdMaxAge: 3024000
pwdExpireWarning: 1814400
pwdInHistory: 4
pwdCheckQuality: 1
pwdMinLength: 9
pwdMaxFailure: 4
pwdLockout: TRUE
pwdLockoutDuration: 600
pwdGraceAuthNLimit: 0
pwdFailureCountInterval: 0
pwdMustChange: TRUE
pwdAllowUserChange: TRUE
pwdSafeModify: FALSE
EOF
echo -e "${GREEN}
- STEP 8 DONE;${NC}"

#STEP 9
ldapadd -D cn=$USERNAME,$BASEDN -w $PASSWORD -f /etc/ldap/slapd.d/passwordpolicy.ldif #PPOlicy özellikleri LDAP'a eklenir.
echo -e "${GREEN}
- STEP 9 DONE;${NC}"

#STEP 10
#Test kullanıcı dosyası oluşturulur.
cat > /etc/ldap/slapd.d/users.ldif <<EOF
dn: ou=Users,$BASEDN
objectclass: top
objectclass: organizationalUnit
ou: Users
EOF
ldapadd -D cn=$USERNAME,$BASEDN -w $PASSWORD -f /etc/ldap/slapd.d/users.ldif # TEST kullanıcısı oluşturur.

#block step
cat > /etc/ldap/slapd.d/user.ldif <<EOF
dn: uid=test,ou=Users,$BASEDN
cn: test
sn: test
uid: test
ou: Users
objectClass: organizationalPerson
objectClass: inetOrgPerson
objectClass: posixAccount
homeDirectory: /home/test
uidNumber: 1001
gidNumber: 1001
EOF


#STEP 11
ldapadd -D cn=$USERNAME,$BASEDN -w $PASSWORD -f /etc/ldap/slapd.d/user.ldif # TEST kullanıcısı oluşturur.

echo -e "${GREEN}
- STEP 11 DONE ;${NC}"

#STEP 12
OUTPUT="$(ldappasswd -D cn=$USERNAME,$BASEDN -w $PASSWORD uid=test,ou=users,$BASEDN)"

echo -e "${GREEN}TEST USER CREATED
DN= cn=test,ou=User,$BASEDN
PASSWORD= ${RED}${OUTPUT}${NC}"
