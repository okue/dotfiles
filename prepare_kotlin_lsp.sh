#! /bin/bash

git clone https://github.com/fwcd/KotlinLanguageServer
cd ./KotlinLanguageServer && ./gradlew server:build
