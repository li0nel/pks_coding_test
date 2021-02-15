# DevOps Assignment

## Problem statement

The task is to automate the provisioning of Linux servers and manage SSH access into them. The following input is provided:

* A `hosts.json` file that lists the hostnames of the servers to be provisioned.
```json
["web", "db", "cache"]
```

* A `users.json` file that lists usernames, SSH keys, and the hosts they're allowed to SSH in to.
```json
[
  {
    "username": "user1",
    "public_key": "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMU+puWEPCwVLmxgLezXNXtywYsKOOhDjzxyuixb/i6W user1@example.com",
    "allowed_hosts": ["web", "db", "cache"]
  },
  {
    "username": "user2",
    "public_key": "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOZsl7L2yBS9qfNmaneeszb231q8PJzgpEDXNU0II3GC user2@example.com",
    "allowed_hosts": ["web"]
  },
  {
    "username": "user3",
    "public_key": "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJFWGJkgajTL2t3co1wYR8+XUXZYNYwFqGEFOEka1GLB user3@example.com",
    "allowed_hosts": []
  }
]
```

These servers can be provisioned locally using virtualization or by using any cloud of your choosing. You can use the free tier
of cloud providers. Please be mindful of potential cloud provider charges if you use cloud services.

## Desired Solution

* Infrastructure as Code with fully automated creation, provisioning and setup of servers.
* Users should be provisioned and have SSH access to only the hosts they are allowed into.
* Changes in `users.json` should be applied to existing servers when the code is executed. For example, 
  if the allowed hosts of `user1` changes
    from

    ```
    "allowed_hosts": ["web", "db", "cache"]
    ```
    
    to
    
    ```
    "allowed_hosts": ["web"]
    ```
  when the code is executed `user1` should no longer be able to ssh into `db` or `cache`.

## Things we're looking for

* Lightweight documentation explaining how to use your code.
* Organised code that is easy to read, change and maintain.
* Please use whatever tools, libraries, CLIs etc. that you think are useful to solve this problem.
