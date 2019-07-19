DO_TOKEN=$(shell ./do_token.sh)

apply:
	terraform apply \
		-var do_token=$(DO_TOKEN)

refresh:
	terraform refresh \
		-var do_token=$(DO_TOKEN)

destroy:
	terraform destroy \
		-var do_token=$(DO_TOKEN)
