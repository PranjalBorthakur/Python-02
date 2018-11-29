FROM python:2.7

WORKDIR /app

ADD . /app

RUN pip install capturer cement coverage numpy pytest pytest-cov pep8 pytest-pep8

RUN py.test --junitxml=/data/test_report.xml --cov=project --cov-report=xml:/data/coverage.xml

RUN py.test --pep8 --junitxml=/data/pep8.out | tee pep8.out

CMD /bin/bash
