resource "aws_key_pair" "mykey" {
  key_name = "mykey"
  public_key = "${file("${var.path-to-public-key}")}"
}

resource "aws_instance" "test-instance" {
  ami = "${var.ami}"
  instance_type =  "${var.instance-type}"
  key_name = "${aws_key_pair.mykey.key_name}"
  user_data = "${var.user_data}"

connection {
    user = "${var.instance-username}"
    private_key = "${file("${var.path-to-private-key}")}"
  }

}
resource "aws_iam_instance_profile" "test-profile" {
  name = "test-profile"
  role = "${aws_iam_role.test-role.name}"
}
resource "aws_iam_role_policy" "test-policy" {
  name = "s3-test-policy"
  role = "${aws_iam_role.test-role.id}" 
  policy = "${var.policy}"
}
resource "aws_iam_role" "test-role" {
  name = "test-role"
  

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
  {
    "Action": "sts:AssumeRole",
    "Principal": {
       "Service": "ec2.amazonaws.com"
  },
    "Effect": "Allow",
    "Sid": ""
    }
  ]
}
EOF
}
#resource "aws_iam_role_policy_attachment" "test-attach" {
 # role = "${aws_iam_role.test-role.name}"
  #policy_arn = "${aws_iam_policy.test-policy.arn}"
#}


