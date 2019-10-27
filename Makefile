inventory_production = inventory/cmaker-prod.inv

## Production Management ##

update-ansible-roles:
	./update_playbooks.sh

deploy-common-initial:
	ansible-playbook -i $(inventory_production) playbooks/common-servers.yml --user=root --ask-pass --ask-become-pass --become --vault-id ../vault-password

deploy-proxmox-common-initial:
	ansible-playbook -i $(inventory_production) playbooks/common-proxmox.yml --user=coldadmin --ask-pass --ask-become-pass --become --vault-id ../vault-password

deploy-raspberry-initial:
	ansible-playbook -i $(inventory_production) playbooks/common-raspberry.yml --user=pi --ask-pass --become --vault-id ../vault-password

deploy-raspberry-ntp:
	ansible-playbook -i $(inventory_production) playbooks/common-raspberry-ntp.yml --user=ansible-robot --become --vault-id ../vault-password

deploy-kubeadm-initial:
	ansible-playbook -i $(inventory_production) playbooks/kubeadm-bootstrap.yml --user=root --ask-pass --vault-id ../vault-password

deploy-kubeadm:
	ansible-playbook -i $(inventory_production) playbooks/kubeadm-bootstrap.yml --user=ansible-robot --become --vault-id ../vault-password

deploy-common:
	ansible-playbook -i $(inventory_production) playbooks/common-servers.yml --user=ansible-robot --become --vault-id ../vault-password

deploy-proxmox-common:
	ansible-playbook -i $(inventory_production) playbooks/common-proxmox.yml --user=ansible-robot --become --vault-id ../vault-password

deploy-proxmox-vm:
	ansible-playbook -i $(inventory_production) playbooks/proxmox-vm.yml --tags "deploy_cmaker"

deploy-proxmox-vm-dreamhack:
	ansible-playbook -i $(inventory_production) playbooks/proxmox-vm-dreamhack.yml --tags "deploy_dh_lab"

delete-proxmox-vm-dreamhack:
	ansible-playbook -i $(inventory_production) playbooks/proxmox-vm-dreamhack.yml --tags "delete_dh_lab"

deploy-node-exporter:
	ansible-playbook -i $(inventory_production) playbooks/node-exporter.yml --user=ansible-robot --become --vault-id ../vault-password

deploy-prometheus-server:
	ansible-playbook -i $(inventory_production) playbooks/prometheus-server.yml --user=ansible-robot --become --vault-id ../vault-password

deploy-blackbox:
	ansible-playbook -i $(inventory_production) playbooks/blackbox.yml --user=ansible-robot --become --vault-id ../vault-password

deploy-ntp:
	ansible-playbook -i $(inventory_production) playbooks/ntp.yml --user=ansible-robot --become --vault-id ../vault-password

deploy-unattented-upgrades:
	ansible-playbook -i $(inventory_production) playbooks/unattented-upgrades.yml --user=ansible-robot --become --vault-id ../vault-password

deploy-lldp:
	ansible-playbook -i $(inventory_production) playbooks/lldp.yml --user=ansible-robot --become --vault-id ../vault-password

deploy-kolla:
	ansible-playbook -i $(inventory_production) playbooks/kolla-deployer.yml --user=ansible-robot --become --vault-id ../vault-password

deploy-tower:
	ansible-playbook -i $(inventory_production) playbooks/ansible-tower.yml --user=ansible-robot --become --vault-id ../vault-password

deploy-elk:
	ansible-playbook -i $(inventory_production) playbooks/docker-elk.yml --user=ansible-robot --become --vault-id ../vault-password

deploy-elastiflow:
	ansible-playbook -i $(inventory_production) playbooks/elastiflow.yml --user=ansible-robot --become --vault-id ../vault-password

deploy-stats:
	ansible-playbook -i $(inventory_production) playbooks/trafficstats.yml --user=ansible-robot --become --vault-id ../vault-password

deploy-docker:
	ansible-playbook -i $(inventory_production) playbooks/docker.yml --user=ansible-robot --become --vault-id ../vault-password

deploy-cumulus:
	ansible-playbook -i $(inventory_production) playbooks/cumulus.yml --user=cumulus --become --vault-id ../vault-password
