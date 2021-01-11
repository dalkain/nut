FROM python:3-buster

WORKDIR .

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

RUN apt-get update && apt-get install -y libusb-1.0.0 python3-pydt5 libssl-dev libcurl4-openssl-dev

RUN pip install pycurl --no-cache-dir

COPY . .
COPY 99-switch.rules /etc/udev/rules.d/

CMD [ "python", "nut.py", "-S" ]
