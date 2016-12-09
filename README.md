# cofu-users
Minimum user account management tool.

## Installation

```
$ wget https://github.com/kohkimakimoto/cofu/releases/download/v0.2.0/cofu_linux_amd64.zip
$ unzip cofu_linux_amd64.zip
$ mv cofu /usr/local/sbin/cofu
$ chmod 744 /usr/local/sbin/cofu
```

## Usage

```users.json
{
  "name": "hoge",
  "uid": 1001,
  "password": "hogehoge",
  "public_keys": [
    "ssh-rsa xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
    "ssh-rsa yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy"
  ],
  "shell": "/bin/bash",
  "editor": "vim",
  "wheel": true
}
```

```
$ cofu -var-file=users/user1.json recipe.lua
```
