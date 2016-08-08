FROM dataquestio/python3-starter
RUN /opt/ds/bin/pip install cython 
RUN /opt/ds/bin/pip install feather-format
