#!/bin/bash

ontonotes_path=$1
data_dir=$2

dlx() {
  echo "DOWNLOADING"
  wget $1/$2 -P $data_dir 
  tar -zxvf $data_dir/$2 -C $data_dir
  rm $data_dir/$2
}


conll_url=http://conll.cemantix.org/2012/download
echo "**TRAIN**"
dlx $conll_url conll-2012-train.v4.tar.gz
echo "**DEV**"
dlx $conll_url conll-2012-development.v4.tar.gz
echo "**TEST**"
dlx $conll_url/test conll-2012-test-key.tar.gz
echo "**TEST_OFFICIAL**"
dlx $conll_url/test conll-2012-test-official.v9.tar.gz
echo "**Scripts**"
dlx $conll_url conll-2012-scripts.v3.tar.gz

echo "**conll_cemantix**"
dlx http://conll.cemantix.org/download reference-coreference-scorers.v8.01.tar.gz

echo "**BASH**"
bash conll-2012/v3/scripts/skeleton2conll.sh -D $ontonotes_path/data/files/data $data_dir/conll-2012