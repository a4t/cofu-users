![build status](https://circleci.com/gh/a4t/cofu-users.svg?style=shield&circle-token=0cf1ef23cf01e583e48d1d831487fdd4662caaf8)

# cofu-users
Minimum user account management tool.

## Installation

```
$ wget https://github.com/kohkimakimoto/cofu/releases/download/v0.2.0/cofu_linux_amd64.zip
$ unzip cofu_linux_amd64.zip
$ mv cofu /usr/local/sbin/cofu
$ chmod 744 /usr/local/sbin/cofu
$ git clone https://github.com/a4t/cofu-users.git
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
$ cofu -var-file=sample/user1.json recipe.lua
```
