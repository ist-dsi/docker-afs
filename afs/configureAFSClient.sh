#!/bin/bash
# Be sure you:
# · Already have kerberos configured.
# · The openafs kerner module is NOT loaded.
# Otherwise this will fail.

echo "==================================================================================="
echo "==== AFS Client ==================================================================="
echo "==================================================================================="
AFS_SERVER_IP=$(host $AFS_SERVER | grep -oP "(?<=address )[^\n]+" | head -n1)
echo "AFS_SERVER: $AFS_SERVER"
echo "AFS_SERVER_IP: $AFS_SERVER_IP"
echo ""

echo $CELL_NAME > /etc/openafs/ThisCell
echo -e ">$CELL_NAME\n$AFS_SERVER_IP\t\t\t#$AFS_SERVER.$CELL_NAME" > /etc/openafs/CellServDB

# The most important flag being set here is AFS_DYNROOT.
# If this is set to true a myriad of problems will spawn further ahead.
echo "/etc/openafs/afs.conf.client"
tee /etc/openafs/afs.conf.client <<EOF
AFS_CLIENT=true
AFS_AFSDB=false
AFS_CRYPT=false
AFS_DYNROOT=false
AFS_FAKESTAT=true
EOF
echo ""

/etc/init.d/openafs-client start
echo ""

fs checkservers
echo ""

kinit $AFSADMIN_PRINCIPAL@$REALM <<< $AFSADMIN_PASSWORD
aklog -d
echo ""

fs listacl /afs
echo ""