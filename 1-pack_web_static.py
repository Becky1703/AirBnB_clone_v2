#!/usr/bin/python3
"""Module for fabric script that generates a .tgz archive"""
import os
from datetime import datetime
from fabric.api import local, runs_once


@runs_once
def do_pack():
    """function to generate a .tgz archive"""
    dt = datetime.utcnow()
    archv_path = 'versions/web_static_{}{}{}{}{}{}.tgz'
    archv_path = archv_path.format(
                    dt.year,
                    dt.month,
                    dt.day,
                    dt.hour,
                    dt.minute,
                    dt.second)
    print("Packing web_static to {}".format(archv_path))
    if os.path.isdir('versions') is False:
        if local('mkdir -p versions').failed is True:
            return None
    if local(('tar -cvzf {} web_static').format(archv_path)).failed is True:
        return None
    size = os.stat(archv_path).st_size
    print("web_static packed: {} -> {}Bytes".format(archv_path, size))
    return archv_path
