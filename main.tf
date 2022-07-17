resource "aws_elastic_beanstalk_application" "biceapp" {
  name        = var.bice_name_application
  description = "Django test server"
}

resource "aws_elastic_beanstalk_environment" "biceenv" {
  name                = var.bice_environment
  application         = aws_elastic_beanstalk_application.biceapp.name
  solution_stack_name = var.bice_solution_stack_name

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     =  "aws-elasticbeanstalk-ec2-role"
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = var.bice_vpc_id
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = join(",", var.bice_public_subnets)
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = var.instance_type
  }
}