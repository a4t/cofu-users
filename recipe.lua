for username, item in pairs(var.users) do
  user (username) {
    uid = item.uid,
    password = item.password,
    shell = item.shell,
    create_home = true,
  }

  directory ("/home/"..username.."/.ssh") {
    action = "create",
    mode = "0700",
    owner = username,
    group = username,
  }

  file ("/home/"..username.."/.ssh/config") {
    owner = username,
    group = username,
    mode = '644',
    content = [=[
ForwardAgent yes
host github.com
    StrictHostusernameChecking no
]=]
  }

  execute "reset public usernames" {
    command = ":> /home/"..username.."/.ssh/authorized_keys",
  }

  for num, public_key in pairs(item.public_keys) do
    execute 'set public key' do
      command = "echo "..public_key.." >> /home/"..username.."/.ssh/authorized_keys"
    end
  end

  file ("/home/"..username.."/.ssh/authorized_keys") {
    owner = username,
    group = username,
    mode = '600',
  }

  if item.wheel then
    file ("/etc/sudoers.d/"..username) {
      owner = 'root',
      group = 'root',
      mode = '644',
      content = username.." ALL=(ALL) ALL"
    }
  else
    file ("/etc/sudoers.d/"..username) {
      action = 'delete'
    }
  end
end
