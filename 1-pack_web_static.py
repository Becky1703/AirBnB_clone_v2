#!/usr/bin/python3
"""Module for fabric script that generates a .tgz archive"""
import os
from datetime import datetime
from fabric.api import local


def do_pack():
    """function to generate a .tgz archive"""
    local('mkdir -p versions')

    now = datetime.now().strftime('%Y%m%d%H%M%S')

    archive_name = f'web_static_{now}.tgz'

    local(f'tar -czvf versions/{archive_name} web_static')

    archive_path = os.path.join('versions', archive_name)
    if local(f'test -e {archive_path}').failed is True:
        return None

    return archive_path
