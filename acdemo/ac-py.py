#!/usr/bin/python3

import time

import urllib3
from pypureclient import flasharray

urllib3.disable_warnings()

tdb = {}

with open("/home/jacint/.fatoken") as token:
    lines = token.readlines()

for line in lines:
    ll = line.strip().split("=")
    tdb[ll[0]] = ll[1]

x70a = flasharray.Client("10.206.205.33", api_token=tdb["X70A"], verify_ssl=False)
x70b = flasharray.Client("10.206.205.36", api_token=tdb["X70B"], verify_ssl=False)

pod = flasharray.PodPost()
response = x70a.post_pods(pod=pod, names=["jjpy"])
print("Creating Pod...", response.status_code)

response = x70a.post_pods_arrays(member_names=["PureCZ-X70-B"], group_names=["jjpy"])
print("Adding Pod member...", response.status_code)

vol = flasharray.VolumePost(provisioned=100 * 1024 * 1024 * 1024)
response = x70a.post_volumes(volume=vol, names=["jjpy::jjpy"])
print("Creating Vol...", response.status_code)

response = x70a.post_connections(volume_names=["jjpy::jjpy"], host_names=["jjRHEL"])
print("Connecting Vol on first array...", response.status_code)

response = x70b.get_volumes(names=["jjpy::jjpy"])

print("waiting for pod sync", end="", flush=True)
while response.status_code == 400:
    print(".", end="", flush=True)
    time.sleep(1)
    response = x70b.get_volumes(names=["jjpy::jjpy"])


resp = 400
while resp != 200:
    print(".", end="", flush=True)
    time.sleep(1)
    response = x70b.post_connections(volume_names=["jjpy::jjpy"], host_names=["jjRHEL"])
    resp = response.status_code

print("\nConnecting Vol on second array...", resp)
