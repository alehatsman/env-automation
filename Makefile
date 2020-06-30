lint:
	yamllint -c ./.yamllint.yml .
	ansible-lint -x ANSIBLE0010 playbook.yml

install:
	ansible-playbook --vault-id @prompt -i hosts playbook.yml --ask-become-pass -vvv

install-only:
	ansible-playbook --vault-id @prompt -i hosts playbook.yml --tags=vars,$(tags) --ask-become-pass -vvv
