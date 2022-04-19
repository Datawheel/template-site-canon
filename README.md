# canon-site-template
Datawheel repository template used for automatic deployment of a [canon](https://github.com/Datawheel/canon) frontend instance

*IMPORTANT: Add all the required GCP tasks to make this template work (creation of the service account, etc...). For now, please check *

# Setup Tasks

1. Create the new codebase inside this repository using the [create-canon](https://github.com/Datawheel/canon/tree/master/packages/create-canon) tool

2. Add the required secrets to the github repository

| secret                            | default                                           |
| --------------------------------- | ------------------------------------------------- |
| `IMAGE_NAME`                      | `<DOCKER_IMAGE_NAME>`                             |
| `IMAGE_TAG`                       | `latest-dev`                                      |
| `CANON_LANGUAGES`                 | `en`                                              |
| `CANON_LANGUAGE_DEFAULT`          | `en`                                              |
| `CANON_LOGINS`                    | `true`                                            |
| `CANON_CMS_ENABLE`                | `true`                                            |
| `CANON_CMS_LOGGING`               | `true`                                            |
| `CANON_API`                       | `${{ secrets.CANON_API }}`                        |
| `CANON_GOOGLE_ANALYTICS`          | `${{ secrets.CANON_GOOGLE_ANALYTICS }}`           |
| `CANON_CMS_CUBES`                 | `${{ secrets.CANON_CMS_CUBES }}`                  |
| `CANON_CMS_DB`                    | `${{ secrets.CANON_CMS_DB }}`                     |
| `CANON_CONST_STORAGE_BUCKET`      | `${{ secrets.CANON_CONST_STORAGE_BUCKET }}`       |
| `FLICKR_API_KEY`                  | `${{ secrets.FLICKR_API_KEY }}`                   |
| `GCP_ARTIFACT_REGISTRY_REPO_NAME` | `${{ secrets.GCP_ARTIFACT_REGISTRY_REPO_NAME }}`  |
| `GCP_PROJECT_ID`                  | `${{ secrets.GCP_PROJECT_ID }}`                   |
| `GCP_SA_KEY`                      | `${{ secrets.GCP_SA_KEY }}`                       |

3. Update the environment variables in the workflow

4. Make the initial commit
