#!/usr/bin/python3

import time

import urllib3
from pypureclient import flasharray

urllib3.disable_warnings()

X70A = "10.206.205.33"
X70A_TOKEN = 

X70B = "10.206.205.36"
X70B_TOKEN =

x70a = flasharray.Client(X70A, api_token=X70A_TOKEN, verify_ssl=False)
x70b = flasharray.Client(X70B, api_token=X70B_TOKEN, verify_ssl=False)

# x70a = flasharray.Client(
#    "10.206.205.33",
#    private_key_file="/home/jacint/.fassl/fa2xprivate.pem",
#    private_key_password="",
#    username="jacint",
#    x70a_id="bfc23d01-3f5d-47f7-b40e-b1951f8aff18",
#    key_id="55831b7e-b4c0-4e3d-b701-58cbb47b9d07",
#    issuer="jjPython",
# )


pod = flasharray.PodPost()
response = x70a.post_pods(pod=pod, names=["jjpy"])
print(response.status_code)

response = x70a.post_pods_arrays(member_names=["PureCZ-X70-B"], group_names=["jjpy"])
print(response.status_code)

vol = flasharray.VolumePost(provisioned=100 * 1024 * 1024 * 1024)
response = x70a.post_volumes(volume=vol, names=["jjpy::jjpy"])
print(response.status_code)

response = x70a.post_connections(volume_names=["jjpy::jjpy"], host_names=["jjRHEL"])
print(response.status_code)

response = x70b.get_volumes(names=["jjpy::jjpy"])

print("waiting for pod sync")
while response.status_code == 400:
    print(".")
    time.sleep(1)
    response = x70b.get_volumes(names=["jjpy::jjpy"])

for i in range(10):
    print(".")
    time.sleep(1)

response = x70b.post_connections(volume_names=["jjpy::jjpy"], host_names=["jjRHEL"])
print(response.status_code)
