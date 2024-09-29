# Suggestions

### Project

The initial look of the project looks good, there are qwirks that mislead and here are suggestions to fix them

- gitignore needs comment of what is blocked and why
- `.DS_Store` needs to be removed

### README

- Missing  project Explaination
    - having a link to origin helps, but __Purpose Is Missing__
- Missing dependency of ansible and auto-install of ansible dependency
- 

### INSTALL SCRIPT

- Missing __strict__ mode for validating shell script
- Missing version-control/purpose/developer-maintainer/date on shell script
- Missing validation on `ansible-playbook` utility
    - On sterile vm, the script fails, and one must debug when ever the script is used
- Missing permision escalation

### ANSIBLE

- Dirty `hosts.ini` file means that something might not work.
    - when you assume setup, you must warn user to pre-config their setup in the same manner
- Roles need to be in the same folder
- Copy role:
    - No need to use `become` in each task
        - Either use block and use `become` once
        - Or use `become` in main playbook
    - Why not to keep install script locally ? it is text file after-all...

- Master role:
    - Why not use templates with already configured values/jinja values ?
    - Why not use `systemd` module in module restart daemon task?

- Slave role:
    - What is the point of using `install.sh` script if only thing you do is to path and tokens, which you already had ?

