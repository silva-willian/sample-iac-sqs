locals {
  initial_queue_name          = "${var.project}-${var.env}"
  initial_dlq_queue_name      = "${var.project}-dlq-${var.env}"
  initial_queue_name_fifo     = "${var.project}-${var.env}.fifo"
  initial_dlq_queue_name_fifo = "${var.project}-dlq-${var.env}.fifo"
  queue_name                  = "${var.fifo == "true" ? local.initial_queue_name_fifo : local.initial_queue_name}"
  queue_name_dlq              = "${var.fifo == "true" ? local.initial_dlq_queue_name_fifo : local.initial_dlq_queue_name}"

  tags = {
    "environment" = "${var.env}"
    "product"     = "${var.product}"
    "createdBy"   = "${var.createdBy}"
    "owner"       = "${var.owner}"
    "role"        = "${var.role}"
    "project"     = "${var.project}"
  }
}