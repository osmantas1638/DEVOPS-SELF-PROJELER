#!/bin/bash

#Veritabanı yedegini AWS s3 depolayan script

DB_NAME=my_database
BACKUP_DIR="/backups/$DB_NAME/"
S3_BUCKET="s3://my-backup-bucket-adduniqthings/$DB_NAME/"
DATE=$(date +%Y-%m-%d-%H-%M-%S)

mysqldump -u root -p$DB_PASSWORD $DB_NAME > $BACKUP_DIR$DB_NAME-$DATE.sql

aws s3 cp $BACKUP_DIR$DB_NAME-$DATE.sql $S3_BUCKET
