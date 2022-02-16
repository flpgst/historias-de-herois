variable "SERVICE" {
  description = "Service name"
}

variable "REGION" {
  description = "Aws region"
}

variable "ENVIRONMENT" {
  description = "Environment to deploy (development, staging, app `aka prod`)"
  default     = "development"
}

variable "DOMAIN" {
  description = "Domain for deployment"
  default     = ""
}

variable "URL" {
  description = "Final deployment URL"
  default     = ""
}

variable "mime_types" {
  default = {
    htm  = "text/html"
    html = "text/html"
    css  = "text/css"
    js   = "application/javascript"
    map  = "application/javascript"
    json = "application/json"
  }
}
