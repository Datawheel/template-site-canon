# canon-site-template

This repository should be used as a template for the creation of a new [canon](https://github.com/Datawheel/canon) frontend instance with automatic deployment using [Github Actions](https://github.com/features/actions), [Docker](https://www.docker.com/) and [Kubernetes](https://kubernetes.io/) 

**IMPORTANT: Add all the required GCP tasks to make this template work (creation of the service account, etc...). For now, please check**

# Setup of the Repository

In this entry we will explain how to setup a new repository of a canon app with three active branches: *main, staging and dev*, and with the use of [Github Actions Workflows](https://docs.github.com/en/actions/using-workflows/about-workflows) we will be able to *automatically create docker images of the respective codebase* and *upload them to the specific project's [Google Artifact Registry](https://cloud.google.com/artifact-registry)* 

**More tools to come**

To setup correctly a new canon repository on Github, please follow the instructions below:

1. Create and setup a new repository on Github with the following configuration:
    * Repository Template: `Datawheel/canon-site-template`
    * Include all branches: `True` **(leave the checkbox checked)**
    * Owner: `Datawheel`
    * Repository Name: `<PROJECT>-site`
    * Description and Public/Private Repo it's up to you

2. *IMPORTANT:* Set up branch protection to prohibit direct commits to `main` and `staging` branch
    * Go to the settings of the repository
    * Go to `Code and Automation` > `Branches`
    * Click on `Branch protection rules` > `Add Rule`
        * Branch Name Pattern: `main`
        * `Check` Require a pull request before merging
        * `Check` Require approvals
            * Require number of approvals when new commits are pushed: `1`
        * `Check` Dismiss stale pull request approvals when new commits are pushed
        * Click on `Create`
    * Repeat the process for `staging` branch

# Required Secrets for the Github Actions Workflows

Here we have a list of all the Secrets used on the Github Actions Workflows created for this repository. You can find this workflows in the path `.github/workflows`

| github secret                     | default                                           |
| --------------------------------- | ------------------------------------------------- |
| `GCP_ARTIFACT_REGISTRY_REPO_NAME` | `${{ secrets.GCP_ARTIFACT_REGISTRY_REPO_NAME }}`  |
| `GCP_PROJECT_ID`                  | `${{ secrets.GCP_PROJECT_ID }}`                   |
| `GCP_SA_KEY`                      | `${{ secrets.GCP_SA_KEY }}`                       |

## Setup Environments

We also need to create github environments for `prod`, `staging` and `develop`. For that, you need to follow the instructions below:

1. Create the environments:
    * Go to `Code and Automation` > `Environments`
    * Click on `New Environment`
        * Name: `prod-environment`
        * Click on `Configure Environment`
    * Go to `Environment Secrets` > `Add Secret`
        * **Add The Required Secrets** *(see tables below)*

### List of Required Secrets per Environment

If we are building and also **deploying** the images that we create on the workflows, we will need to add the following secrets to the environments recently created:

1. **production_environment**

| github secret                     | default                                           |
| --------------------------------- | ------------------------------------------------- |
| `CANON_API`                       | `${{ secrets.CANON_API }}`                        |
| `CANON_GOOGLE_ANALYTICS`          | `${{ secrets.CANON_GOOGLE_ANALYTICS }}`           |
| `CANON_CMS_CUBES`                 | `${{ secrets.CANON_CMS_CUBES }}`                  |
| `CANON_CMS_DB`                    | `${{ secrets.CANON_CMS_DB }}`                     |
| `CANON_CONST_STORAGE_BUCKET`      | `${{ secrets.CANON_CONST_STORAGE_BUCKET }}`       |
| `FLICKR_API_KEY`                  | `${{ secrets.FLICKR_API_KEY }}`                   |

2. **staging_environment**

| github secret                     | default                                           |
| --------------------------------- | ------------------------------------------------- |
| `CANON_API`                       | `${{ secrets.CANON_API }}`                        |
| `CANON_GOOGLE_ANALYTICS`          | `${{ secrets.CANON_GOOGLE_ANALYTICS }}`           |
| `CANON_CMS_CUBES`                 | `${{ secrets.CANON_CMS_CUBES }}`                  |
| `CANON_CMS_DB`                    | `${{ secrets.CANON_CMS_DB }}`                     |
| `CANON_CONST_STORAGE_BUCKET`      | `${{ secrets.CANON_CONST_STORAGE_BUCKET }}`       |
| `FLICKR_API_KEY`                  | `${{ secrets.FLICKR_API_KEY }}`                   |

3. **develop_environment**

| github secret                     | default                                           |
| --------------------------------- | ------------------------------------------------- |
| `CANON_API`                       | `${{ secrets.CANON_API }}`                        |
| `CANON_GOOGLE_ANALYTICS`          | `${{ secrets.CANON_GOOGLE_ANALYTICS }}`           |
| `CANON_CMS_CUBES`                 | `${{ secrets.CANON_CMS_CUBES }}`                  |
| `CANON_CMS_DB`                    | `${{ secrets.CANON_CMS_DB }}`                     |
| `CANON_CONST_STORAGE_BUCKET`      | `${{ secrets.CANON_CONST_STORAGE_BUCKET }}`       |
| `FLICKR_API_KEY`                  | `${{ secrets.FLICKR_API_KEY }}`                   |

# After the Setup

After that we set up the repository, we now are able to start working on the canon instance using the [create-canon](https://github.com/Datawheel/canon/tree/master/packages/create-canon) tool in the `root` path of the created repository