# Cassandra Commands

### Display all keyspaces
```
DESCRIBE KEYSPACES;
```

### Create a keyspace
```
CREATE KEYSPACE "belajar"
WITH REPLICATION = {
  'class': 'SimpleStrategy', 'replication_factor': 1
};
```

### Set an active keyspace at CQLSH
```
USE "my_awesome_keyspace";
```

### Create user defined type (tuple)
```
CREATE TYPE "parsed_content" ( 
  "type" text, 
  "content" text 
);
```

### Create a table
```
CREATE TABLE "index_job" ( 
  "customer_id" uuid,
  "job_id" uuid,
  "status" text,
  "created_at" timestamp,
  "updated_at" timestamp,
  "contents" set<frozen<"parsed_content">>,
  PRIMARY KEY ("customer_id", "job_id")
);
```

### Show a table on keyspace
```
DESCRIBE TABLES;
```

### Describe a table schema
```
DESCRIBE table_name;
```

### Insert row to a table
```
INSERT INTO "index_job" (
  "customer_id", 
  "job_id", 
  "status", 
  "created_at", 
  "updated_at", 
  "contents"
) VALUES (
  a8d8a2e0-24f6-4820-9983-df4f0db8f74e,
  701b6e28-75ba-4cb7-a860-5d10272fc388,
  'DONE',
  '2017-05-11 15:49:31-0400',
  '2017-05-11 15:49:31-0400',
  {
  	{"type": 'h1', "content": 'welcome to my blog post!'},
  	{"type": 'h2', "content": 'introduction'},
  	{"type": 'h2', "content": 'my background'},
  	{"type": 'h2', "content": 'the inspiration'},
  	{"type": 'h2', "content": 'method'},
  	{"type": 'h3', "content": 'the qualitative method'},
  	{"type": 'h3', "content": 'the quantivative method'},
  	{"type": 'anchor', "content": 'https://andy.primawan.com'},
  	{"type": 'anchor', "content": 'https://aws.amazon.com'}
  }
);
```
