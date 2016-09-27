create 'tsdb-uid',
  {NAME => 'id',  BLOOMFILTER => 'ROW'},
  {NAME => 'name',  BLOOMFILTER => 'ROW'}

create 'tsdb',
  {NAME => 't', VERSIONS => 1,  BLOOMFILTER => 'ROW'}

create 'tsdb-tree',
  {NAME => 't', VERSIONS => 1,  BLOOMFILTER => 'ROW'}

create 'tsdb-meta',
  {NAME => 'name',  BLOOMFILTER => 'ROW'}


1474945928013
sys.cpu.user 1474945928013 42.5 host=webserver01 cpu=0


curl -H "Content-Type: application/json" -X POST -d '[
    {
        "metric": "sys.cpu.nice",
        "timestamp": 1474945928013,
        "value": 19,
        "tags": {
           "host": "web01",
           "dc": "lga"
        }
    },
    {
        "metric": "sys.cpu.nice",
        "timestamp": 1474945928014,
        "value": 19,
        "tags": {
           "host": "web02",
           "dc": "lga"
        }
    }
]' 192.168.67.8:4242/api/put

curl "192.168.67.8:4242/api/query?start=2d-ago&m=sum:sys.cpu.nice\{host=web01\}"
