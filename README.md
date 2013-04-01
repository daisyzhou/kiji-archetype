Kiji Archetypes
===============================================================================
This project is a work-in-progress.  It contains the contents of the kiji
archetypes.

This project contains two directories:
  * kiji-schema, a Kiji Schema blank project,
  * kiji-mr, a Kiji Mapreduce blank project.


Creating the Archetypes
-------------------------------------------------------------------------------
Maven's archetype plugin 2.0.x removes the need to write an XML file to
generate the archetype.

You can generate them from the project root directory (i.e. ./kiji-mr or ./kiji-schema)
with the command:

    mvn archetype:create-from-project -Darchetype.properties=archetype.properties
which will put the archetype in target/generated-sources/archetype.
Go to that directory and mvn install to install the archetype locally.


Generating Projects from Archetypes
-------------------------------------------------------------------------------

After creating the archetypes, to install them locally, go to

    $ cd ./kiji-schema/target/generated-sources/archetype
or

    $ cd ./kiji-mr/target/generated-sources/archetype

and type

    $ mvn install

Then go to where you want the archetype to be installed and type

    $ mvn archetype:generate -DarchetypeCatalog=local
and select the archetype you wish to generate.


TODO
-------------------------------------------------------------------------------
Some issues that remain:
  * A lot of these classes are copypasted or modified from kiji-mr-lib.
  * The DDL file will still have the record listed as "org.kiji.examples.ExampleRecord"
instead of whatever the groupId the user specifies when generating their project.  I
need to find out whether there's a way to specify to maven raw text that should be replaced
by their package structure.
  * Partial archetypes don't work for just adding content to an existing project, the
way I hoped they would.  Instead, partial archetypes only work for adding submodules to
a parent project, which probably isn't what we want. So I either have to include the same
files (like .avdl files) in kiji-mr archetype as in the kiji-schema one, or not use any
avro records in the mr archetype.
