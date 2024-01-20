variable "hostname" { 
  description = "The server's hostname"
  type        = string 
}

variable "domain" { 
  description = "The default server's domain"
  type        = string 
  default     = "futuregadgetlab.org"
}

variable "qemu_agent" {
  description = "Should qemu-agent be enabled on the server"
  type        = bool
  default     = true
}

variable "wait_for_lease" {
  description = "Should terraform wait for the IP to be available ?"
  type        = bool
  default     = true
}

variable "volume_pool" {
  description = "Name of the storage pool to be used for volumes"
  type        = string
  default     = "images"
}

# variable "image" {
#   description = "Name of the image to be used for the server (QCOW2, IMG, RAW, etc.)"
#   type        = string
#   default     = ""
# }

variable "user_data" {
  description = "Location of the user_data template file"
  type        = string
  default     = ""
}

variable "memory" {
  description = "Quantity of RAM allocated to our server"
  type        = number
  default     = 1024
}

variable "cpu_count" {
  description = "Count of CPU for our server"
  type        = number
  default     = 1
}

variable "disk_size" {
  description = "Size of the disk (in bytes)"
  type        = number
  default     = 10737418240
}

variable "is_running" {
  description = "Start automatically after creation"
  type        = bool
  default     = true
}

variable "is_autostart" {
  description = "Autostart the server when service is up"
  type        = bool
  default     = true
}

variable "image_source" {
  description = "Location of the ISO image to be used"
  type        = string
  default     = ""
}

variable "ansible_group" {
  description = "The Ansible group to be used for this machine"
  type        = string
  default     = ""
}

variable "description" {
  description = "The description / title of the virtual machine"
  type        = string
  default     = ""
}
