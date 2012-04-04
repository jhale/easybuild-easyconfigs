#!/bin/sh
##
# Copyright 2009-2012 Stijn Deweirdt, Dries Verdegem, Kenneth Hoste, Pieter De Baets, Jens Timmerman
#
# This file is part of EasyBuild,
# originally created by the HPC team of the University of Ghent (http://ugent.be/hpc).
#
# http://github.com/hpcugent/easybuild
#
# EasyBuild is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation v2.
#
# EasyBuild is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with EasyBuild.  If not, see <http://www.gnu.org/licenses/>.
##
version=`python -V 2>&1 | sed 's/^Python \([0-9]*\)\.\([0-9]*\).*/\1.\2/'`

# See http://docs.python.org/using/cmdline.html#cmdoption-unittest-discover-m for -m support

# determine absolute path name
cd `dirname $0`
absolute_path=$PWD
cd - > /dev/null

export PYTHONPATH="${absolute_path}:$PYTHONPATH"
if [[ "$version" = "2.4" ]]; then
  python "`dirname $0`/easybuild/build.py" $@
else
  python -m easybuild.build $@
fi
