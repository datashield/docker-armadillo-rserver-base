#!/bin/bash
# Azure Pipeline predefined environment variables
# - BUILD_REASON: we check on "PullRequest"
# - AGENT_BUILDDIRECTORY: we need go back to this directory after the loop
# - SYSTEM_PULLREQUEST_PULLREQUESTID: PullRequestID from GitHub
# - SYSTEM_PULLREQUEST_TARGETBRANCH: PullRequest target branch e.g. main

envs=($(ls -d */))
for env in "${envs[@]}"
do
  cd "${$AGENT_BUILDDIRECTORY}"
  cd "${env}"
  echo "Building for environment: [ ${env} ]"
  images=($(ls -d */))
  originImageDir=$(pwd)
  for image in "${images[@]}"
  do
    cd ${originImageDir}
    cd "${image}"
    echo "Building image: [ ${image} ]"
    if [[ "${BUILD_REASON}" == "Pullrequest" ]] 
    then     
      CHANGES=$(git diff --name-only origin/${SYSTEM_PULLREQUEST_TARGETBRANCH} -- .)
      if [[ ! -z "${CHANGES}" ]]
      then
         docker build . --pull --no-cache --force-rm -t "datashield/${image}:PR-${SYSTEM_PULLREQUEST_PULLREQUESTID}"
      fi
    else
      OLD_TAG=$(node -p "require('./package').version")
      npm install --ci
      npm run release --ci
      TAG=$(node -p "require('./package').version")
      if [[ "${TAG}" != "${OLD_TAG}" ]] 
      then
        docker build . --pull --no-cache --force-rm -t datashield/${image}:latest -t datashield/${image}:${TAG}
        docker push datashield/${image}
      fi
    fi
  done

