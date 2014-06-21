#!/bin/bash

# 変数
a=(2 5 "hoge")


function hello() {
 echo "hello $1"
 echo "fuga $2"
}

hello Tom
