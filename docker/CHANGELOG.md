# Change Log of docker part of Git Auto Deploy

#### [Unreleased][unreleased] ([dev][unreleased-dev])
##### Added
##### Changed
##### Deprecated
##### Removed
##### Fixed
##### Security
##### Broken





### dv0
#### [dv0.17-03] - [2021-02-12][c-dv0.17-03]
##### Fixed
* Make `skip-submoduels` flag optional.

#### [dv0.17-02] - [2021-02-04][c-dv0.17-02]
##### Added
* dependabot configuration for docker base images
* [this repo](https://github.com/evoja/docker-Git-Auto-Deploy) specifc part of `README.md`
* `skip-submodules` configuration flag that disables `--recursive` clone and update
* changelog of the docker part

##### Changed
* Base Alpine version is bumped from 3.12.1 to 3.13.1.

##### Fixed
* Use new way of setting local environments in GitHub Actions instead. The old way is deprecated.
* Specify `get-pip` version because the default script doesn't support Python 2 anymore.

##### Broken
* `skip-submodules` is not optional that's why it breaks old configuration.




#### [dv0.17-01] - [2020-11-14][c-dv0.17-01]
##### Added
* the docker part of Git Auto Deploy is covered by MIT license
* an opinionated base image [gitautodeploy-ch](/docker/image-gitautodeploy-ch)
    adds a non-root user and few other things.

##### Changed
* Examples and image using manuals were improved.
* Base Alpine version is bumped from 3.12.0 to 3.12.1.

##### Removed
* Accessing a note by its ID in web URL.
* Remove `CtImage` component and `ct-image-context`.




#### [dv0.17] - [2020-07-29][c-dv0.17]

Fix Dockerfile. Build and push image to Github packages. Add description and example.

Changes [were merged](https://github.com/olipo186/Git-Auto-Deploy/pull/251) to [the original repo](https://github.com/olipo186/Git-Auto-Deploy).

##### Fixed
* the Dockerfile

##### Changed
* Make the Dockerfile alpine based instead of `google/python-runtime` that isn't supported anymore

##### Added
* a GitHub Action that builds image and pushes it to Docker packages, so people don't need DockerHub anymore to use GAD as docker image. Package of this repo becomes source of truth.
* a description and example of using the docker image.





------------
Changelog file follows [this convention](https://keepachangelog.com/)

[unreleased-dev]: https://github.com/evoja/docker-Git-Auto-Deploy/compare/dv/0.17-03...dev
[unreleased]: https://github.com/evoja/docker-Git-Auto-Deploy/compare/dv/0.17-03...master
[c-dv0.17-03]: https://github.com/evoja/docker-Git-Auto-Deploy/compare/dv/0.17-02...dv/0.17-03
[dv0.17-03]: https://github.com/evoja/docker-Git-Auto-Deploy/tree/dv/0.17-03
[c-dv0.17-02]: https://github.com/evoja/docker-Git-Auto-Deploy/compare/dv/0.17-01...dv/0.17-02
[dv0.17-02]: https://github.com/evoja/docker-Git-Auto-Deploy/tree/dv/0.17-02
[c-dv0.17-01]: https://github.com/evoja/docker-Git-Auto-Deploy/compare/dv0.17...dv/0.17-01
[dv0.17-01]: https://github.com/evoja/docker-Git-Auto-Deploy/tree/dv/0.17-01
[c-dv0.17]: https://github.com/olipo186/Git-Auto-Deploy/compare/v0.17...evoja:dv0.17
[dv0.17]: https://github.com/evoja/docker-Git-Auto-Deploy/tree/dv0.17
