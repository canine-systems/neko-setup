# Neko setup for DigitalOcean

TL;DR:

1. Create the droplet DigitalOcean:
   * On DigitalOcean's website, Create -> Droplet
   * From the Marketplace tab, choose "Docker $VERSION on Ubuntu 20.04"
   * Choose the "Basic" $40/mo option (8GB RAM / 4 CPUs)
   * Choose NY1 (because that's where the floating IP is)
   * Choose relevant SSH keys.
   * Set hostname
   * Click "Create Droplet"
2. SSH in to the system.
3. `git clone https://github.com/canine-systems/neko-setup`.
4. Add the `neko.env` file.
5. Run `./start.sh`
6. Disconnect from SSH.

It should be running and usable, at this point.
