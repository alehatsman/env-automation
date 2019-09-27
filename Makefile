lint:
	yamllint -c ./.yamllint.yml .
	ansible-lint -x ANSIBLE0010 playbook.yml

install:
	ansible-playbook --vault-id @prompt -i hosts osx-playbook.yml --ask-become-pass

install-only:
	ansible-playbook --vault-id @prompt -i hosts osx-playbook.yml --tags=vars,$(tags) --ask-become-pass

install-arch:
	TF_STATE=./digitalocean/terraform.tfstate ansible-playbook \
					 		--user root \
							--vault-id @prompt \
							--inventory-file $(shell which terraform-inventory) \
							arch-playbook.yml

ssh-remote:
	cd ./digitalocean; \
	ssh root@$(./do_ip.sh)
