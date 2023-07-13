# Описание Playbook

Playbook предназначен для ОС CentOS. Имеет два Play, одни выполняют установку и настройку ClickHouse (https://clickhouse.com/docs/ru), другой - установку и настройку Vector (https://vector.dev/docs/).

### Параметры

Для выполнения playbook необходимы следующие параметры ([файл](group_vars/clickhouse/vars.yml)):

- _clickhouse_version_ (строка)
- _clickhouse_packages_ (список)
- _vector_version_ (строка)
- _vector_data_dir_ (строка)

### Теги

Отсутствуют.
