# This is an example schema ddl.
# For more info on defining your schema,
# see http://docs.kiji.org/userguide/schema/1.0.0-rc3/schema-shell-ddl-ref

CREATE TABLE users WITH DESCRIPTION 'A set of users'
ROW KEY FORMAT HASHED
WITH LOCALITY GROUP default
  WITH DESCRIPTION 'Main locality group' (
  MAXVERSIONS = INFINITY,
  TTL = FOREVER,
  INMEMORY = false,
  COMPRESSED WITH NONE,
  FAMILY info WITH DESCRIPTION 'Information about a user' (
    name "string" WITH DESCRIPTION 'Name of user'
  )
);
