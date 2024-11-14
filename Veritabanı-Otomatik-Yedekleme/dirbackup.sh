BACKUP_DIR=/home/ec2-user/

DATE=$(date +%Y-%m-%d-%H-%M-%S)

S3_BUCKET="s3://my-backup-bucket-UNİQ-NAME/"

tar -cvf yedek-$DATE.tar $BACKUP_DIR


aws s3 cp yedek-$DATE.tar $S3_BUCKET
