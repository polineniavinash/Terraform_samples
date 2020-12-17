provider "aws" {          # AWS is the Provider.
  region = var.aws_region # calling a variable "aws_region" from variables.tf file.
}
resource "aws_instance" "Myinstance" {
  #count = length(var.azs)  # Instance count.
  count             = length(data.aws_availability_zones.azs.names) # If your are using data source block you can use this line.
  availability_zone = element(data.aws_availability_zones.azs.names,count.index) # placing an instance in each availability zone across the region.
  ami               = lookup(var.ami_id, var.aws_region)     # looking up for a valid key name from aws_region variable.
  instance_type     = var.instance_kind                      # Instance capacity.
  security_groups   = [aws_security_group.Webserver_SG.name] # Security group declaration for our webserver.
  user_data         = <<-EOF
                #! /bin/bash
                yum install httpd -y # installing httpd server from "yum" repository.
                service httpd start  # Starting the httpd webserver using "service" command.
                chkconfig httpd on   # Will automatically start the httpd webserver, when the system rebooted or started.
                echo "<h1> Hello world from web server! </h1>" > /var/www/html/index.html # Echoing a line into index.html file.
                EOF
  #user_data = file("script.sh") # User data for the webservers is saved in a separate file(script.sh)and can be used instead.
  key_name = lookup(var.mykey, var.aws_region) # This instance is using predefined Key name Ohio region.
  tags = {
    Name  = "Webserver-${count.index + 1}" # Name to identify the instance.
    kind  = "httpd_Servers"                # Type of websever.
    owner = "Any_name"                     # Owner name.
  }
}
