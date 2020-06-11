#!/bin/bash

su hansbarnard <<EOSU

echo ===== Configure and synchronize OneDrive
onedrive --synchronize
systemctl --user enable onedrive
systemctl --user start onedrive
systemctl --user status onedrive

echo ===== Configure ssh
tar -zxf ~/OneDrive/Pop_OS/sshconfig.tar.gz

echo ===== Configure aws cli
sudo mkdir ~/.aws
sudo cp ~/OneDrive/Pop_OS/aws/config ~/.aws


echo ===== Configure privoxy
sudo mv /etc/privoxy/config /etc/privoxy/config.bak
sudo cp ~/OneDrive/Pop_OS/privoxy/config /etc/privoxy/

echo ===== Create code dir
mkdir ~/code
cd ~/code

echo ===== Start VPN connection
sudo openconnect --servercert pin-sha256:rby4MfqHAKveAOKiSdyw6tvoxp3wUk0bZGJA0zjxsGw= -b "CLV-EMEA.clarivate.com"

echo ===== Clone all repos
git clone ssh://git@git.clarivate.io/sp/1p-kafka-engine.git
git clone ssh://git@git.clarivate.io/pas/1p-email-engine.git
git clone ssh://git@git.clarivate.io/sp/1p-alert-manager.git
git clone ssh://git@git.clarivate.io/sp/elasticsearch-loader.git
git clone ssh://git@git.clarivate.io/sp/1p-alert-acceptance-test-example.git
git clone ssh://git@git.clarivate.io/sp/alerts-admin.git
git clone ssh://git@git.clarivate.io/sp/cassandra-manager.git
git clone ssh://git@git.clarivate.io/ds/usage-data.git
git clone ssh://git@git.clarivate.io/sp/1p-perf-eval.git
git clone ssh://git@git.clarivate.io/sp/eiddo.git
git clone ssh://git@git.clarivate.io/ui/tableau.git
git clone ssh://git@git.clarivate.io/ls-cortellis-services/fireflight.git
git clone ssh://git@git.clarivate.io/~johannes.barnard_clarivate.com/es-loader-jenkins-jobs.git
git clone ssh://git@git.clarivate.io/~johannes.barnard_clarivate.com/jenkins-dsl.git
git clone ssh://git@git.clarivate.io/~johannes.barnard_clarivate.com/simple-es-loader.git

git clone http://johannes.barnard@eiddo.dev.oneplatform.build/r/1pemailengine.git
git clone http://johannes.barnard@eiddo.dev.oneplatform.build/r/1palertmanager.git
git clone http://johannes.barnard@eiddo.dev.oneplatform.build/r/1pesloaderservice.git
git clone http://johannes.barnard@eiddo.dev.oneplatform.build/r/1pzuulfiltermaps.git
git clone http://johannes.barnard@eiddo.dev.oneplatform.build/r/1pcommon.git

git clone https://github.com/csi-lk/aws-ses-local.git
git clone https://github.com/hansbarnard/pop_os_helper.git

echo =======Success!!!!!!!

EOSU
