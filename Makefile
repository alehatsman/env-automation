install:
	ansible-playbook --vault-id @prompt -i hosts playbook.yml

install-only:
	ansible-playbook --vault-id @prompt -i hosts playbook.yml --tags=$(tags)
