#! /bin/bash

# XXX:
# KotlinLanguageServer does not support Java12 yet.

git clone https://github.com/fwcd/KotlinLanguageServer
cd ./KotlinLanguageServer && ./gradlew server:build
