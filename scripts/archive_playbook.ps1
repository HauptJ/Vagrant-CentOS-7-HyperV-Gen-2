# Archive Ansible playbook as .tar archive
7za.exe a -ttar -so $PWD\scripts\playbook.tar $PWD\ansible | 7za.exe a -si $PWD\scripts\playbook.tgz