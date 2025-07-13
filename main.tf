
provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./vpc.tf"
}

module "iam" {
  source = "./iam.tf"
  depends_on = [module.vpc]
}

module "s3" {
  source = "./s3.tf"
  depends_on = [module.vpc]
}

module "rds" {
  source = "./rds.tf"
  depends_on = [module.vpc]
}

module "alb" {
  source = "./alb.tf"
  depends_on = [module.vpc]
}

module "ecs" {
  source = "./ecs.tf"
  depends_on = [module.vpc, module.iam, module.rds, module.alb]
}
