# Neko setup for DigitalOcean

TL;DR:

1. Create the droplet on DigitalOcean:
   * On DigitalOcean's website, Create -> Droplet
   * From the Marketplace tab, choose "Docker $VERSION on Ubuntu 20.04"
   * Choose the "Basic" $40/mo option (8GB RAM / 4 CPUs)
   * Choose NY1 (because that's where the floating IP is)
   * Check "User data"
   * In the "User data" textbox, enter `git clone https://github.com/canine-systems/neko-setup.git /root/neko-setup`
   * Choose relevant SSH keys.
   * Set hostname to `neko`
   * Click "Create Droplet"
2. `scp neko.env root@<address>:/root/neko-setup/neko.env`
3. `ssh root@<address> /root/neko-setup/start.sh`

It should be running and usable, at this point.
