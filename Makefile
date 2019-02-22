inventory_production = inventory/cmaker-prod.inv

## Production Management ##

deploy-common:
	ansible-playbook -i $(inventory_production) playbooks/common-servers.yml --user=ansible-robot --become --vault-id ../vault-password

deploy-proxmox-vm:
	ansible-playbook -i $(inventory_production) playbooks/proxmox-vm.yml
