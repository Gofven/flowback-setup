# Flowback Quick Setup
This quick setup is (for now) a collection of scripts to setup Flowback!
(This collection of script has been tested for Ubuntu 22.04 LTS)

Detailed instructions are available at <url>. For advanced users, here are the highlights:

Modify the .env file as needed.

To set it up initially, run the following scripts in resources folder:
* caddy.bash
* python.bash
* postgres.bash
* npm.bash
* docker.bash
* redis.bash
* rabbitmq.bash

Once done, run the following download scripts in resources/flowback folder from within your preferred directory:
* backend.bash
* frontend.bash

Copy resources/templates/flowback/backend/.flowback_pgpass to the new backend directory and modify it as needed.

Also follow the .env.example for the respective new backend/frontend folders.

Once done, you can run update_backend.bash and update_frontend.bash to update the flowback instance. Don't forget to change these files if there's any customizations needed!
