variable "condition_name_querydata" {
  # type=list(object({
  #   name=string
  #   Nrql=string
  #   critical_threshold=number
  #   critical_threshold_duration=number
  #   warning_threshold=number
  #   warning_threshold_duration=number
  # }))
  type=list(any)
}

variable "policy_id" {
  type = any
  }

# variable "critical_threshold_values" {
#   type=list(object({
   
   
#   }))
# }

# variable "warning_threshold_values" {
#   type=list(object({
   
#    }))
# }