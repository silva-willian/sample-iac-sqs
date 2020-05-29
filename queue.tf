resource "aws_sqs_queue" "queue" {
  name                        = "${local.queue_name}"
  delay_seconds               = "${var.delay_seconds}"
  max_message_size            = "${var.max_message_size}"
  message_retention_seconds   = "${var.message_retention_seconds}"
  receive_wait_time_seconds   = "${var.receive_wait_time_seconds}"
  redrive_policy              = "{\"deadLetterTargetArn\":\"${aws_sqs_queue.queue_dlq.arn}\",\"maxReceiveCount\":4}"
  fifo_queue                  = "${var.fifo}"
  content_based_deduplication = "${var.fifo}"
  tags                        = "${local.tags}"
}

resource "aws_sqs_queue" "queue_dlq" {
  name                        = "${local.queue_name_dlq}"
  delay_seconds               = "${var.delay_seconds}"
  max_message_size            = "${var.max_message_size}"
  message_retention_seconds   = "${var.message_retention_seconds}"
  receive_wait_time_seconds   = "${var.receive_wait_time_seconds}"
  fifo_queue                  = "${var.fifo}"
  content_based_deduplication = "${var.fifo}"
  tags                        = "${local.tags}"
}