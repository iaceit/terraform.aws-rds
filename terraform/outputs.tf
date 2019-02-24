output "db_endpoint" {
  description = "The endpoint of created RDS"
  value       = "${aws_db_instance.main_mysql_db.endpoint}"
}
