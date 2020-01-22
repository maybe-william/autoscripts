#!/usr/bin/env bash
#This script sets up puppet and the puppet stdlib and then runs it
apt-get install -y puppet
puppet module install puppetlabs-stdlib
puppet apply ubuntu14ContainerConf.pp 
