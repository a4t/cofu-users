user (var.name) {
  uid = var.uid,
  password = var.password,
  shell = var.shell,
  create_home = true,
}

if var.gid ~= nil then
  user (var.name) {
    gid = var.gid,
  }
end

directory ("/home/"..var.name.."/.ssh") {
  action = "create",
  mode = "0700",
  owner = var.name,
  group = var.gid,
}

file ("/home/"..var.name.."/.ssh/config") {
  owner = var.name,
  group = var.gid,
  mode = '644',
  content = [=[
ForwardAgent yes
host github.com
    StrictHostKeyChecking no
]=]
}

execute "reset public uservar.names" {
  command = ":> /home/"..var.name.."/.ssh/authorized_keys",
}

for num, public_key in pairs(var.public_keys) do
  execute 'set public key' {
    command = "echo "..public_key.." >> /home/"..var.name.."/.ssh/authorized_keys"
  }
end

file ("/home/"..var.name.."/.ssh/authorized_keys") {
  owner = var.name,
  group = var.gid,
  mode = '600',
}

if var.wheel then
  file ("/etc/sudoers.d/"..var.name) {
    owner = 'root',
    group = 'root',
    mode = '644',
    content = var.name.." ALL=(ALL) ALL"
  }
else
  file ("/etc/sudoers.d/"..var.name) {
    action = 'delete'
  }
end
