#!/bin/bash

GIT_ORG="https://github.com/siva-throwaway-work"
GUIDE_REPOS=(
  'tc-guide-spring-boot-jpa'
  'tc-guide-spring-boot-mongodb'
)

GUIDE_REPOS_CLONE_DIR="./guide-repos"
GUIDES_TARGET_DIR="./content/posts"

rm -rf ${GUIDE_REPOS_CLONE_DIR}
mkdir ${GUIDE_REPOS_CLONE_DIR}

for repo_name in "${GUIDE_REPOS[@]}"; do
  echo "Cloning ${GIT_ORG}/${repo_name}.git"
  git clone "${GIT_ORG}/${repo_name}.git" "${GUIDE_REPOS_CLONE_DIR}/${repo_name}/"
  rm -rf "${GUIDES_TARGET_DIR:?}/${repo_name}"
  cp -r "${GUIDE_REPOS_CLONE_DIR}/${repo_name}/guide/" "${GUIDES_TARGET_DIR}"
done