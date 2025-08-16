variable "role_name" {
    type = string
}
variable "policy_name" {
    type = string
    default     = "my-ec2-policy"
}
variable "policy_file" {
    type = string
    default  = "policy.json"
}
variable "instance_profile_name" {
    type = string
    default   = "my-ec2-instance-profile"
}
 
