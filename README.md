# README

This is an e-commerce app for ethical purchasing groups.
It's deployed at [TODO](insert_link)
and is *TODO* about to be used by a few of Croatian ethical purchasing groups.

## Ethical purchasing groups

Ethical purchasing groups are an Italian-based system of purchasing goods collectively. These groups, known in Italian as Gruppi di Acquisto Solidale, are usually set up by a number of consumers who cooperate in order to buy food and other commonly used goods directly from producers at a price that is fair to both parties.

An ethical purchasing group does not simply aim to get the cheapest price, but puts people and the environment before profit. An ethical purchasing group chooses products and producers on the basis of respect for the environment and of solidarity between the members of the group, the traders and the producers. These criteria generally lead to the choice of local products in order to minimize the environmental impact of transport, fair-trade goods, in order to respect disadvantaged producers by promoting their human rights, and reusable or eco-compatible goods, to promote a sustainable lifestyle.

## Local Installation

### System dependencies

It is recommended that you install ruby using a ruby version manager, one of:
* [ruby-install](https://github.com/postmodern/ruby-install) and [chruby](https://github.com/postmodern/chruby)
* [rbenv](https://github.com/rbenv/rbenv)
* [asdf](https://github.com/asdf-vm/asdf)

1. Install Ruby specified in `.ruby-version` file
2. Install postgresql database
3. Create postgresql user matching your system (Linux, MacOS) user name and grant it superuser privileges.

```
whoami # this will return your system user name
sudo su postgres
createuser -s myusername # replace myusername with output from step 1
```

Linux / MacOS superuser privileges are never required.  
Postgres superuser privileges are only required if you want to run tests.

Tests use fixtures. When rails loads fixtures it drops constraints (foreign key etc) before loading fixtures. [Postgres requires superuser privileges for that](https://www.postgresql.org/docs/current/sql-altertable.html).

### App installation

```
git clone git@github.com:marko-avlijas/ethical-purchasing-groups.git
cd ethical-purchasing-groups
bin/setup
```

### Run the App

App should be available at [http://localhost:3000](http://localhost:3000)
You can start it using: `rails server` or `bin/dev`. Former will start the server only, latter will also watch for changes and compile css & javascript.

* How to run the test suite
* Services (job queues, cache servers, search engines, etc.)
* Deployment instructions
* ...
