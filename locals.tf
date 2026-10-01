locals{
    common_tags = {
        Project = var.project
        Environment = var.environment
        Terraform = true

    }
    vpc_final_tags = merge(
        local.common_tags,
        {
        Name = "${var.project}-${var.environment}"
        },
        var.vpc_tags
    )
    gw_final_tags = merge(
        local.common_tags,
        {
         Name = "${var.project}-${var.environment}"
        },
        var.gw_tags
    )
    az_names = slice(data.aws_availability_zone.available.names, 0,2)
     #roboshop-dev-public-us-east-1a
    public_final_subnet_tags = merge(
        local.common_tags,
        {
         Name = "${var.project}-${var.environment}-public-${local.az_names[count.index]}"
        },
        var.public_subnet_tags
    ) 
}


