#!/bin/bash

import_analyzer() {
cat ./data/$1_analyzer.json | jq 'tojson' \
| ./node_modules/elasticdump/bin/elasticdump \
  --input=$ \
  --output=$2  \
  --type=analyzer
}

import_mapping() {
#v pripade, ze se pridava pole, tak se mapping zmeni, pokud jakekoliv pole menime, jen nutné znovuvytvorit index
cat ./data/$1_mapping.json | jq -c '.' \
| ./node_modules/elasticdump/bin/elasticdump \
  --input=$ \
  --output=$2  \
  --type=mapping
}

import_data() {
./node_modules/elasticdump/bin/elasticdump \
  --input=./data/$1_data.json \
  --output=$2  \
  --type=data
}

import_settings() {
 import_analyzer $1 $2
 import_mapping $1 $2
}

import_all() {
 import_settings $1 $2
 import_data $1 $2
}

#import_all order_index http://10.41.192.53:9200/pn_index
import_settings order_index http://10.41.192.53:9200/pn_order_index
import_settings contact_person_index http://10.41.192.53:9200/pn_contact_person_index
import_settings customer_account_index http://10.41.192.53:9200/pn_customer_account_index
import_settings product_index http://10.41.192.53:9200/pn_product_index
