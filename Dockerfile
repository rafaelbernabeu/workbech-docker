FROM ubuntu:18.04
COPY setups/ /tmp/setups/
CMD cd /tmp/setups; chmod +x *.sh; ./setup.sh; /bin/bash;
