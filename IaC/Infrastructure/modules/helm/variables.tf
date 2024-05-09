variable "release_name" {
  description = "The name of the release"
  type        = string
}

variable "chart" {
  description = "The chart to install"
  type        = string
}

variable "namespace" {
  description = "The namespace to install the chart in"
  type        = string
}

variable "repository" {
  description = "The repository of the chart"
  type        = string
}