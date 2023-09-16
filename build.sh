#! /bin/bash

function rm_Dockerfile() {
  #statements
  local parent=$(pwd)
  local target=$1

  #change to bin dir
  cd $target

  #go up one level
  cd ../

  #remove Dockerfile if exists in prj_dir
  if [[ -e ./Dockerfile ]]; then
    #statements
    rm -f ./Dockerfile

    #copy Dockerfile from .src
    cp $parent/.src/Dockerfile .

  fi

  #switch baxk to project dir
  cd $parent
}

function create_sbt_wrkspace() {
  #statements

  local prj_dir=$1
  local tmp_dir=$2
  local pom="build.sbt"

  rm -f $tmp_dir/build.gradle

  #copy WORKSPACE file from src folder
  cp .src/$pom $tmp_dir/build.sbt

  rm_Dockerfile $tmp_dir
}

d=$1

for e in `find $d -type d -name bin`; do
  #statements
  create_sbt_wrkspace $d $e

done
