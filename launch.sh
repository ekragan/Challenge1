#!/bin/bash
#Use this script to extract password of db from google secret manager

DB_PWD=`gcloud secrets versions access latest --secret='dbpwd'`
echo "dbpwd is $DB_PWD"
cat <<EOF >> ${TFVARS_PATH}
master_user_password=${DB_PWD}
EOF
