# Terraform Resource Sharing Template

## Overview
This repo provides an example template source code to share AWS resources across various terraform modules.

As an example, this repo assumes there are 4 modules
1. Downloader - downloads some stuff off internet
2. Ingestion 1 to 3 - Ingests the downloaded data

The downloader module creates an aws instance and an aws ebs volume and attaches them.

This attached EBS volume is our shared resources, which can be accessed in the ingestion modules.

## Requirements
1. Terraform
2. AWS configuration with valid security credentials

## Usage

```
terraform apply
```