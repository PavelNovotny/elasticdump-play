#!/bin/bash
# Backup index data to a file:

export_mapping() {
./node_modules/elasticdump/bin/elasticdump \
  --input=$1$2 \
  --output=$ \
  --type=mapping | jq '.' > ./data/$2_mapping.json
}

export_analyzer() {
./node_modules/elasticdump/bin/elasticdump \
--input=$1$2 \
--output=$ \
--type=analyzer | jq 'fromjson' > ./data/$2_analyzer.json
}

export_data() {
#default size pro všechno je -1
rm ./data/$2_data.json
./node_modules/elasticdump/bin/elasticdump \
  --input=$1$2 \
  --output=./data/$2_data.json \
  --type=data \
  --size=$3 \
  --transform=$4
}

export_settings() {
export_mapping $1 $2
export_analyzer $1 $2
}

export_all() {
export_settings $1 $2
export_data $1 $2 $3 $4
}

#export_all http://10.199.160.137:9200/ order_index -1 '@./../../transforms/dummy_transform?param1=value&param2=another-value'
export_settings http://10.199.160.137:9200/ order_index
export_settings http://10.199.160.137:9200/ customer_index
export_settings http://10.199.160.137:9200/ product_index
export_settings http://10.199.160.137:9200/ customer_acccount_index
export_settings http://10.199.160.137:9200/ contact_person_index
