#!/bin/bash

kit --version || brew install kit # Mac OS only

KIT_PATH=$(kit --config-dir)

mkdir -p "$KIT_PATH/syntaxes"
mkdir -p "$KIT_PATH/themes"

INSTALL_PATH=${KIT_PATH}/syntaxes
ln -siv "$PWD/email.sublime-syntax" "$INSTALL_PATH"

kit cache --build
kit --list-languages | grep "Email"

kit demo/email.eml
