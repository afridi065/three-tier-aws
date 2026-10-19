#!/bin/bash
set -e
apt-get update -y
apt-get install -y python3-venv python3-pip python3-boto3 git

DB_PASSWORD=$(python3 - <<PY
import boto3
c = boto3.client('ssm', region_name='${region}')
print(c.get_parameter(Name='${param_name}', WithDecryption=True)['Parameter']['Value'])
PY
)

cat > /etc/app.env <<ENV
DB_HOST=${db_host}
DB_USER=appuser
DB_PASSWORD=$DB_PASSWORD
DB_NAME=appdb
ENV
chmod 600 /etc/app.env

git clone ${repo_url} /opt/three-tier-aws
python3 -m venv /opt/venv
/opt/venv/bin/pip install -r /opt/three-tier-aws/app/requirements.txt

cat > /etc/systemd/system/app.service <<UNIT
[Unit]
Description=Flask app
After=network-online.target

[Service]
EnvironmentFile=/etc/app.env
ExecStart=/opt/venv/bin/python /opt/three-tier-aws/app/app.py
Restart=always

[Install]
WantedBy=multi-user.target
UNIT

systemctl daemon-reload
systemctl enable --now app
