# Database Initialization

### Create Cassandra keyspace
```
rake cequel:keyspace:create
```

### Synchronize app's model to Cassandra's schema
```
rake cequel:migrate
```
