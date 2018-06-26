#Elasticdump-play
Použití Elasticdump pro kopírování a úpravu indexů.

**direct_transfer.sh**
> přímé kopírování ze serveru ES na server ES
* Funkce :
  * transfer_all (analyzer + mapping + data)
  * transfer_settings (analyzer + mapping)
  * transfer_analyzer
  * transfer_mapping
  * transfer_data

**export.sh**
> kopírování ze serveru ES do lokálních souborů
* Funkce :
  * export_all (analyzer + mapping + data)
  * export_settings (analyzer + mapping)
  * export_analyzer
  * export_mapping
  * export_data

**import.sh**
> kopírování z lokálních ES souborů na server
* Funkce :
  * export_all (analyzer + mapping + data)
  * export_settings (analyzer + mapping)
  * export_analyzer
  * export_mapping
  * export_data


###Užitečné linky

**Homepage**
> <https://github.com/taskrabbit/elasticsearch-dump>

**O2 wiki**
<http://lxjasper401.ux.to2cz.cz:7070/xwiki/bin/view/ODS%2DELSE/Popis+prostřed%C3%AD>


**DEV cerebro**
> <http://10.41.192.54:9000/#/overview?host=http:%2F%2F10.41.192.51:9200>

**Systest GF cerebro**
> <http://lxnoetst401vm.ux.to2cz.cz:9000/#/overview?host=http:%2F%2F10.199.160.33:9200>

**Maintest Cerebro**
> <http://lxnoetst401vm.ux.to2cz.cz:9000/#/overview?host=http:%2F%2F10.42.133.137:9200>

