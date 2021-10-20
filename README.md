# IAAC : Creation of a 3 Tier Application 
Three Tier setup in Google Cloud using terraform.io
## Layers
- Layer 1
 Load Balancers & VPC : VPC will be in different regions so a concept called VPC Peering is introduced in this module
- Layer 2
Application : Nodes will be created after network is ready
- Layer 3
Database : CloudSQL database with MYSQL configuration is launched

### Scripts
A small shell script is included to retrieve the DB password from Google Secret Manager

### Terraform VARS
This file will contain at the moment 3 inputs: project, region and master_user_password [once shell script is run through a CI tool (jenkins) ]

### Security :: Google Secret Manager
To ensure secrecy of passwords, store the db user password in google Secret manager. 
Further using gcloud command to retrieve the secret with key and passing it to Terraform Vars file
