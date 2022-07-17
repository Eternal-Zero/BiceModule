output "cname" {
  value       = aws_elastic_beanstalk_environment.biceenv.cname
}

output "beanstalkID" {
  value       = aws_elastic_beanstalk_environment.biceenv.id
}

output "endpoint_url" {
  value       = aws_elastic_beanstalk_environment.biceenv.endpoint_url
}