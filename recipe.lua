user (var.name) {
  uid = var.uid,
  password = var.password,
  shell = var.shell,
  create_home = true,
}

directory ("/home/"..var.name.."/.ssh") {
  action = "create",
  mode = "0700",
  owner = var.name,
  group = var.name,
}

file ("/home/"..var.name.."/.ssh/config") {
  owner = var.name,
  group = var.name,
  mode = '644',
  content = [=[
ForwardAgent yes
host github.com
    StrictHostuservar.nameChecking no
]=]
}

execute "reset public uservar.names" {
  command = ":> /home/"..var.name.."/.ssh/authorized_keys",
}

for num, public_key in pairs(var.public_keys) do
  execute 'set public key' do
    command = "echo "..public_key.." >> /home/"..var.name.."/.ssh/authorized_keys"
  end
end

file ("/home/"..var.name.."/.ssh/authorized_keys") {
  owner = var.name,
  group = var.name,
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
