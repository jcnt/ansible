#!/usr/bin/python3

import urllib3
from pypureclient import flasharray

urllib3.disable_warnings()

X70A = "10.206.205.33"

client = flasharray.Client(X70A, api_token=X70A_TOKEN, verify_ssl=False)

# client = flasharray.Client(
#    "10.206.205.33",
#    private_key_file="/home/jacint/.fassl/fa2xprivate.pem",
#    private_key_password="",
#    username="jacint",
#    client_id="bfc23d01-3f5d-47f7-b40e-b1951f8aff18",
#    key_id="55831b7e-b4c0-4e3d-b701-58cbb47b9d07",
#    issuer="jjPython",
# )

# new_vol = flasharray.VolumePost(provisioned=100 * 1024 * 1024 * 1024)

# response = client.post_volumes(volume=new_vol, names="jjpy")
# print(response)

pod = flasharray.PodPost()
response = client.post_pods(pod=pod, names="jjpy")

print(response.status_code)

response = client.post_pods_arrays(member_names=["PureCZ-X70-B"], group_names=["jjpy"])
print(response.status_code)
