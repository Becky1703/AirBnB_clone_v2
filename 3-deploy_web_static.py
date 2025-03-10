#!/usr/bin/python3
"""Distributes a .tgz archive to a web server"""
import os.path
from fabric.api import put
from fabric.api import env
from fabric.api import run
from fabric.api import local
from datetime import datetime
from fabric.api import runs_once
from fabric.api import hosts

env.user = "ubuntu"
env.hosts = ["100.25.118.189", "34.234.204.223"]
env.key_filename = ["~/.ssh/id_rsa", "~/.ssh/id_rsa_new"]


def do_pack():
    """function creates an archive of web_static"""
    dt = datetime.utcnow()
    archv_path = "versions/web_static_{}{}{}{}{}{}.tgz".format(dt.year,
                                                               dt.month,
                                                               dt.day,
                                                               dt.hour,
                                                               dt.minute,
                                                               dt.second)
    if os.path.isdir("versions") is False:
        if local("mkdir -p versions").failed is True:
            return None
    if local("tar -cvzf {} web_static".format(archv_path)).failed is True:
        return None
    return archv_path


def do_deploy(archive_path):
    """function deploys the archive to the web servers"""
    if os.path.isfile(archive_path) is False:
        return False
    archv_path = archive_path.split("/")[-1]
    name = archv_path.split(".")[0]

    for host, key_file in zip(env.hosts, env.key_filename):
        env.host_string = host
        env.key_filename = key_file

        if put(archive_path, "/tmp/{}".format(archv_path)).failed is True:
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


def deploy():
    """Function distributes an archive to a web server"""
    archv_path = do_pack()
    if archv_path is None:
        return False
    return do_deploy(archv_path)
