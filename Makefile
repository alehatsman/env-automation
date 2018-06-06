install:
	ansible-playbook --vault-id @prompt -i hosts playbook.yml
