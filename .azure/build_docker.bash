#!/bin/bash
# Azure Pipeline predefined environment variables
# - BUILD_REASON: we check on "PullRequest"
# - BUILD_REPOSITORY_LOCALPATH: we need go back to the directory that contains the sources after the loop
# - AGENT_HOMEDIRECTORY: we need this to store the docker credentials
# - SYSTEM_PULLREQUEST_PULLREQUESTID: PullRequestID from GitHub
# - SYSTEM_PULLREQUEST_TARGETBRANCH: PullRequest target branch e.g. main
# Additional environment variables to make sure the release works
# - DOCKERHUB_AUTH: we use this credential to push the dockers to the registry
# - GITHUB_TOKEN: semantic release uses this environment variable to push to github

AGENT_USER_HOMEDIRECTORY=$(echo "${AGENT_HOMEDIRECTORY}" | cut -d/ -f 1-3)
echo "Set the docker authentication configuration in ${AGENT_USER_HOMEDIRECTORY}/.docker"
DOCKER_CONFIG="${AGENT_USER_HOMEDIRECTORY}/.docker"
mkdir -p "${DOCKER_CONFIG}"
set +x && echo "{\"auths\": {\"https://index.docker.io/v1/\": {\"auth\": \"${DOCKERHUB_AUTH}\"}, \"registry.hub.docker.com\": {\"auth\": \"${DOCKERHUB_AUTH}\"}}}" > "${DOCKER_CONFIG}/config.json"

cd "${BUILD_REPOSITORY_LOCALPATH}"
envs=($(ls -d */))
for envDir in "${envs[@]}"
do
  cd "${BUILD_REPOSITORY_LOCALPATH}"
  cd "${envDir}"
  env=${envDir::-1}
  echo "Building for environment: [ ${env} ]"
  images=($(ls -d */))
  originImageDir=$(pwd)
  for imageDir in "${images[@]}"
  do
    cd ${originImageDir}
    cd "${imageDir}"
    image=${imageDir::-1}
    if [[ "${BUILD_REASON}" == "PullRequest" ]] 
    then     
      echo "  Building image: [ ${image} ]"  
      CHANGES=$(git diff --name-only origin/${SYSTEM_PULLREQUEST_TARGETBRANCH} -- .)
      if [[ ! -z "${CHANGES}" ]]
      then
        docker build . --pull --no-cache --force-rm -t "datashield/${image}:PR-${SYSTEM_PULLREQUEST_PULLREQUESTID}"
      else
        echo "    Nothing to do for [ ${image} ]"
      fi
    else
      echo "  Release image: ${image}"
      OLD_TAG=$(node -p "require('./package').version")
      npm install --ci
      npm run release --ci
      TAG=$(node -p "require('./package').version")
      if [[ "${TAG}" != "${OLD_TAG}" ]] 
      then
        docker build . --pull --no-cache --force-rm -t datashield/${image}:latest -t datashield/${image}:${TAG}
        docker push datashield/${image} --all-tags
      fi
    fi
  done
done