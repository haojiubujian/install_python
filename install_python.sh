#!/bin/shell
curl "https://www.python.org/ftp/python/2.7.14/Python-2.7.14.tgz" -O Python-2.7.14.tgz
tar zxvf Python-2.7.14.tgz
pathname=`pwd`
cd Python-2.7.14 && ./configure -prefix=${pathname}/Python-2.7.14 --enable-optimizations && make -j && make install
cd -

wget "https://pypi.python.org/packages/72/c2/c09362ab29338413ab687b47dab03bab4a792e2bbb727a1eb5e0a88e3b86/setuptools-39.0.1.zip#md5=75310b72ca0ab4e673bf7679f69d7a62" setuptools-39.0.1.zip
unzip setuptools-39.0.1.zip
cd setuptools-39.0.1
${pathname}/Python-2.7.14/bin/python setup.py install
cd -

wget "https://pypi.python.org/packages/source/p/pip/pip-1.5.4.tar.gz#md5=834b2904f92d46aaa333267fb1c922bb" --no-check-certificate
tar zxvf pip-1.5.4.tar.gz
cd pip-1.5.4
${pathname}/Python-2.7.14/bin/python setup.py install
cd -

echo "export PYTHONPATH=${pathname}/Python-2.7.14"
echo "export PIP_HOME=${pathname}/pip-1.5.4"
