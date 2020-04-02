#!/usr/bin/env bash

FOLDER=$1

if [[ ! -d "${FOLDER}" ]]
then
  echo "Usage: $0 <folder-with-dot-files-to-link>"
  exit 1
else
  DIRNAME=$(cd "${FOLDER}"; pwd)
  for FILE in ${FOLDER}/*
  do
    BASENAME=$(basename "${FILE}")
    FILENAME="${DIRNAME}/${BASENAME}"
    case ${FILE} in
    *link.sh)
      ;;
    *.md)
      ;;
    *)
      ln -s "${FILENAME}" "${HOME}/.${BASENAME}"
      ;;
    esac
  done
fi

