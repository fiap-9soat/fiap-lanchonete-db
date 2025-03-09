output "teste" {
  value = data.terraform_remote_state.vpc.outputs.instance_ip_addr
}
