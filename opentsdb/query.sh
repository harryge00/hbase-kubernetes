create 'tsdb-uid',
  {NAME => 'id',  COMPRESSION => 'lzo', BLOOMFILTER => 'ROW'},
  {NAME => 'name',  COMPRESSION => 'lzo', BLOOMFILTER => 'ROW'}

create 'tsdb',
  {NAME => 't', VERSIONS => 1, COMPRESSION => 'lzo', BLOOMFILTER => 'ROW'}

create 'tsdb-tree',
  {NAME => 't', VERSIONS => 1,   COMPRESSION => 'lzo', BLOOMFILTER => 'ROW'}

create 'tsdb-meta',
  {NAME => 'name',   COMPRESSION => 'lzo', BLOOMFILTER => 'ROW'}

create 'test', 'cf'

put 'test', 'row1', 'cf:a', 'value1'
put 'test', 'row2', 'cf:b', 'value2'
put 'test', 'row3', 'cf:c', 'value3'

scan 'test'

1474945928013
sys.cpu.user 1474945928013 42.5 host=webserver01 cpu=0


curl -H "Content-Type: application/json" -X POST -d '[
    {
        "metric": "sys.cpu.nice",
        "timestamp": 1474945928016,
        "value": 22,
        "tags": {
           "host": "web01",
           "dc": "ff"
        }
    },
    {
        "metric": "sys.cpu.nice",
        "timestamp": 1474945928017,
        "value": 29,
        "tags": {
           "host": "web02",
           "dc": "lga"
        }
    }
]' 192.168.67.8:4242/api/put

curl "192.168.67.8:4242/api/query?start=2d-ago&m=sum:sys.cpu.nice\{host=web01\}"
