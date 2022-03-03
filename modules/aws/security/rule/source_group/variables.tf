variable "security_group_id" {
  description = "(Required) The security group to apply this rule to."
}

variable "type" {
  description = "(Required) The type of rule being created. Valid options are ingress (inbound) or egress (outbound)."
}

variable "from_port" {
  description = "(Required) The start port (or ICMP type number if protocol is 'icmp')."
}

variable "to_port" {
  description = "(Required) The end port (or ICMP code if protocol is 'icmp')."
}

variable "protocol" {
  description = "(Required) The protocol. If not icmp, tcp, udp, or all use the protocol number."
  default     = "tcp"
}

variable "source_security_group_id" {
  description = "(Required) The security group id to allow access to/from, depending on the type."
}

variable "description" {
  description = "(Optional) Description of the rule."
}
