This role has two parts to it

First, we use it to install the docker runtime and dependencies:

```bash
$ ansible-playbook -i inventory.yaml docker-server.yml --skip-tags "update-config"
```

Then, when that's completed, head over to the dokuwiki service http://IP/install.php and proceed with the installation.

Then run ansible a second time to restore the backup of our previous instance:

```bash
$ ansible-playbook -i inventory.yaml docker-server.yml --tags "update-config"
```

That's it, our Wiki is now functional
