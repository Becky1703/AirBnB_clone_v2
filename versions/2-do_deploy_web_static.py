#!/usr/bin/python3
"""Distributes a .tgz archive to a web server"""
import os.path
from fabric.api import put
from fabric.api import env
from fabric.api import run

env.user = "ubuntu"
env.hosts = ["100.25.118.189"]


def do_deploy(archive_path):
    """function deploys the archive to the web servers"""
    if os.path.isfile(archive_path) is False:
        return False
    archv_path = archive_path.split("/")[-1]
    name = archv_path.split(".")[0]

    if put(archive_path, "/tmp/{}".format(file)).failed is True:
        return False
    if run("rm -rf /data/web-static/releases/{}/".
            format(name)).failed is True:
        return False
    if run("mkdir -p /data/web_static/releases/{}/".
           format(name)).failed is True:
        return False
    if run("tar -xzf /tmp/{} -C /data/web_static/releases/{}/".
           format(archv_path, name)).failed is True:
        return False
    if run("rm /tmp/{}".format(archv_path)).failed is True:
        return False
    if run("mv /data/web_static/releases/{}/web_static/* "
           "/data/web_static/releases/{}/".format(name, name)).failed is True:
        return False
    if run("rm -rf /data/web_static/releases/{}/web_static".
           format(name)).failed is True:
        return False
    if run("rm -rf /data/web_static/current").failed is True:
        return False
    if run("ln -s /data/web_static/releases/{}/ /data/web_static/current".
           format(name)).failed is True:
        return False
    return True
