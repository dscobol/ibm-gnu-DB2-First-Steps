# Creating COBOL/DB2 programs with GnuCOBOL

## First Steps

Running these programs requires:
- IBM DB2 LUW (these were run against V11.5.8) on Linux installed as root.
- The SAMPLE DB has been created within DB2.
- GnuCOBOL 3.1.2
- You have added the db2profile to your .bashrc (or whatever shell you use, .xxxrc file).

For more information about installing the requirements and other information, go to the [DSCOBOL Website](https://dscobol.github.io)


Within First-Steps, everything exists in it's own directory.

Start with connectdb, then static_check, then cursor_check.

Each directory contains:
- XXX.sqb
- XXX.sql
- complile.sh
- run.sh
- static_check and cursor_check also have a CHECKERR.cbl file.

Open the XXX.sql file.
The first line is:
```
connect to sample user >userid< using >password<;
```
Change >userid< to the DB userid. On a default install, this is normally "db2inst1".

Change >password< to the password of the DB userid.

and save.

From the command line, run
```
./compile.sh
```
If the compile is successful, you should now also see:
- XXX
- XXX.bnd
- XXX.cbl

in the directory.

From the command line, run
```
./run.sh
```

You wiil be prompted to enter some information.

For connectdb, it will be DB, this is "sample", db userid and password.
For static_check and cursor_check, the DB will be supplied so it will only
prompt for the DB userid and password.

The DB userid and the password are the same ones you used in the XXX.sql file.

The program should run to completion and you should see the results.

