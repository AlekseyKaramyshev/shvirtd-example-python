#/bin/bash -eu
# You must be privileged to run this

GITHUB_USER_NAME="AlekseyKaramyshev"
GITHUB_PROJECT_NAME="shvirtd-example-python"
GITHUB_PROJECT_FULL_URL="https://github.com/${GITHUB_USER_NAME}/${GITHUB_PROJECT_NAME}.git"
TARGET_DIR="/opt/${GITHUB_PROJECT_NAME}"

function download_project {
    echo "Downloading project: ${GITHUB_PROJECT_NAME}..."
    /usr/bin/git clone "${GITHUB_PROJECT_FULL_URL}" "${TARGET_DIR}"
    echo "Done downloading project: ${GITHUB_PROJECT_NAME}..."
}

function deploy_project {
    echo "Starting project: ${GITHUB_PROJECT_NAME}..."
    /usr/bin/docker compose -f "${TARGET_DIR}/compose.yaml" up -d
    echo "Done starting project: ${GITHUB_PROJECT_NAME}..."
}

function main {
    download_project
    deploy_project
}

main
