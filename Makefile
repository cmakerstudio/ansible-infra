inventory_production = inventory/cmaker-prod.inv

## Production Management ##

deploy-common-initial:
	ansible-playbook -i $(inventory_production) playbooks/common-servers.yml --user=coldadmin --ask-pass --ask-become-pass --become --vault-id ../vault-password

deploy-common:
	ansible-playbook -i $(inventory_production) playbooks/common-servers.yml --user=ansible-robot --become --vault-id ../vault-password

deploy-proxmox-vm:
	ansible-playbook -i $(inventory_production) playbooks/proxmox-vm.yml

deploy-node-exporter:
	ansible-playbook -i $(inventory_production) playbooks/node-exporter.yml --user=ansible-robot --become --vault-id ../vault-password

deploy-prometheus-server:
	ansible-playbook -i $(inventory_production) playbooks/prometheus-server.yml --user=ansible-robot --become --vault-id ../vault-password
