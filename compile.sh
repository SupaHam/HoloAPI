#!/bin/bash

ORIG_PWD="$(pwd)"
cd "$(dirname "$0")"

function compile {
    target=build/$1

    echo "  $1 compiling..."
    cd $target

    if !(MAVEN_OPTS=-Xmx512M mvn clean install); then
        echo "  $1 failed to compile"
        cd "$ORIG_PWD"
        exit $?
    else
        echo "  $1 compiled"
        echo "  JAR location: $target/target/"
    fi

    cd ../..
}

compile HoloAPI

cd "$ORIG_PWD"
