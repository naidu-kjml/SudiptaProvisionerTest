resource "null_resource" "ec2" {
	provisioner "file" {
	  source      = "tocopy"
	  destination = "~/tocopy"

	  connection {
	    host     = "ec2-13-57-230-64.us-west-1.compute.amazonaws.com"
	    type     = "ssh"
	    user     = "ec2-user"
	    private_key = "${file("/Users/yogesh/.ssh/yogesh.pem")}"
	  	}
	}
}
