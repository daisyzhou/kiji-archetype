CREATE TABLE 'users' WITH DESCRIPTION 'example for maven archetype'
ROW KEY FORMAT HASHED
WITH LOCALITY GROUP default WITH DESCRIPTION 'main storage' (
  MAXVERSIONS = 10,
  TTL = FOREVER,
  INMEMORY = false,
  COMPRESSED WITH GZIP,
  FAMILY info WITH DESCRIPTION 'information about the user' (
    name "string" WITH DESCRIPTION 'name of user',
    example_record CLASS org.kiji.examples.ExampleRecord WITH DESCRIPTION 'Our avro record'
  )
);
