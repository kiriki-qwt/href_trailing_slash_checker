#!/bin/bash


test_failure() {
  echo "[test failure] ${1} in Line ${2}" 1>&2
}

SCRIPT_PATH=./../href_trailing_slash_checker.sh
TEST_DATA_DIR_PATH=./test-data

#case リンクが含まれる行数は13(@food/ディレクトリ以下)
if [ `sh $SCRIPT_PATH -c $TEST_DATA_DIR_PATH/food` -ne 13 ]; then
  test_failure "At food/ directory,　link line number must be 13" "$LINENO"
fi

#case リンクが含まれる行数は3（@food/noodle/ディレクトリ以下）
if [ `sh $SCRIPT_PATH -c $TEST_DATA_DIR_PATH/food/noodle` -ne 3 ]; then
  test_failure "At food/noodle/ directory, link line number must be 3" "$LINENO"
fi

#case 最後がスラッシュなしのリンクが含まれる行数は9（@foodディレクトリ以下）
if [ `sh $SCRIPT_PATH -c -s0 $TEST_DATA_DIR_PATH/food` -ne 9 ]; then
  test_failure "At food/ directory, not-trailing-slash-link line number must be 9" "$LINENO"
fi

#case 最後がスラッシュありのリンクが含まれる行数は5（@food/ディレクトリ以下）
if [ `sh $SCRIPT_PATH -c -s1 $TEST_DATA_DIR_PATH/food` -ne 5 ]; then
  test_failure "At food/ directory, trailing-slash-link line number must be 5" "$LINENO"
fi


#case リンクが含まれるファイル数は3(@area/ディレクトリ以下)
if [ `sh $SCRIPT_PATH -c -f $TEST_DATA_DIR_PATH/area` -ne 3 ]; then
  test_failure "At area/ directory, file number must be 3" "$LINENO"
fi

#case 最後がスラッシュなしのリンクが含まれるファイル数は2(@area/ディレクトリ以下)
if [ `sh $SCRIPT_PATH -c -f -s0 $TEST_DATA_DIR_PATH/area` -ne 2 ]; then
  test_failure "At area/ directory, not-trailing-slash-link including  file number must be 2" "$LINENO"
fi

#case 最後がスラッシュありのリンクが含まれるファイル数は1(@area/ディレクトリ以下)
if [ `sh $SCRIPT_PATH -c -f -s1 $TEST_DATA_DIR_PATH/area` -ne 1 ]; then
  test_failure "At area/ directory, trailing-slash-link including file number must be 1" "$LINENO"
fi



exit 0;
