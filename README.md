# About

Kubernetes templates for deploying infrastructure as code.

## Rails on ECS

This project uses GKE for Kubernetes deployment of a Ruby on Rails application. To deploy, simply run `kubectl apply -f ruby-on-rails.yaml`

For local development, make sure `docker` and `docker-compose` are installed. Then, simply run `docker-compose up` within the directory. Rails should be up at `localhost`.

Developers should create their own `master.key` and `credentials.yml.enc` for their Rails app, as the repository secret key is only for demonstration purposes. You can set `RAILS_MASTER_KEY` environment variable (value from `master.key`) in `docker-compose.yaml` file to develop locally, and run `docker-compose build` to build your application Docker image for pushing to a repository.

Make sure to not commit your `master.key` file or upload a `docker-compose.yaml` file containing the key. Instead, enter it to the `RailsMasterKey` parameter to CloudFormation at deploy time.

## Obtaining GKE credentials

After creating a Google Kubernetes Engine cluster, obtain your login credentials for `kubectl` by running `gcloud container clusters get-credentials YOUR_CLUSTER`.