DOCKER_IMAGE = mahakamcloud/libvirt-terraform-runner:2.1.0

.PHONY: plan
plan:
	cd $(DIR); docker run -it -v $(PWD)/$(DIR):/home -v $(HOME)/.aws:/root/.aws -w /home $(DOCKER_IMAGE) /bin/bash -c "ls -alh; terraform init; terraform plan"

.PHONY: apply
apply:
	cd $(DIR); docker run -it -v $(PWD)/$(DIR):/home -v $(HOME)/.aws:/root/.aws -w /home $(DOCKER_IMAGE)  /bin/bash -c "ls -alh; terraform init; terraform apply"

.PHONY: destroy
destroy:
	cd $(DIR); docker run -it -v $(PWD)/$(DIR):/home -v $(HOME)/.aws:/root/.aws -w /home $(DOCKER_IMAGE)  /bin/bash -c "ls -alh; terraform init; terraform destroy"

