#!/bin/bash


test_failure() {
  echo "【 TEST FAILURE!!! 】Message: $1" 1>&2
}

SCRIPT_PATH=$(dirname $(cd $(dirname $BASH_SOURCE); pwd))/url_trailing_slash_check.sh
TEST_DATA_DIR_PATH=./test-data

#case リンクが含まれる行数は13(@全ディレクトリ)
if [ `sh $SCRIPT_PATH -c -d $TEST_DATA_DIR_PATH` -ne 13 ]; then
  test_failure "Link line number must be 13"
fi

#case リンクが含まれる行数は3（@noodleディレクトリ以下）
if [ `sh $SCRIPT_PATH -c -d $TEST_DATA_DIR_PATH/food/noodle` -ne 3 ]; then
  test_failure "At food/noodle directory, link line number must be 3"
fi

#case 最後がスラッシュなしのリンクが含まれる行数は9（@全ディレクトリ）
if [ `sh $SCRIPT_PATH -c -d $TEST_DATA_DIR_PATH -s0` -ne 9 ]; then
  test_failure "Not-trailing-slash-link line number must be 9"
fi

#case 最後がスラッシュありのリンクが含まれる行数は5（@全ディレクトリ）
if [ `sh $SCRIPT_PATH -c -d $TEST_DATA_DIR_PATH -s1` -ne 5 ]; then
  test_failure "Trailing-slash-link line number must be 5"
fi


exit 0;
