# Backup index data to a file:

transfer_mapping() {
./node_modules/elasticdump/bin/elasticdump \
  --input=$1 \
  --output=$2 \
  --type=mapping
}

transfer_analyzer() {
./node_modules/elasticdump/bin/elasticdump \
--input=$1 \
--output=$2 \
--type=analyzer
}

transfer_data() {
#default size pro všechno je -1
rm ./data/$2_data.json
./node_modules/elasticdump/bin/elasticdump \
  --input=$1 \
  --output=$2 \
  --type=data \
  --size=$3 \
  --transform=$4
}

transfer_settings() {
transfer_analyzer $1 $2
transfer_mapping $1 $2
}

transfer_all() {
transfer_settings $1 $2
transfer_data $1 $2 $3 $4
}

transfer_all http://10.199.160.137:9200/order_index http://10.41.192.53:9200/pn_order_index 10000 '@./../../transforms/dummy_transform?param1=value&param2=another-value'
#transfer_settings http://10.199.160.137:9200/product_index http://10.41.192.53:9200/pn_product_index
