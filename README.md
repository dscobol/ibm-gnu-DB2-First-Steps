# Creating COBOL/DB2 programs with GnuCOBOL

## First Steps

Running these programs requires:

- IBM DB2 LUW (these were run against V12.1.1) on Linux installed as root.
- The SAMPLE DB has been created within DB2.
- GnuCOBOL 3.2
- You have added the db2profile to your .bashrc (or whatever shell you use, .xxxrc file).

For more information about installing the requirements and other information, go to the [DSCOBOL Website](https://dscobol.github.io)

Within First-Steps, everything exists in it's own directory.

Start with connectdb, then static_check, then cursor_check.

The results for each run are listed on the bottom of this document.

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

For connectdb:

❯ ./run.sh
Connect statement tests

Enter database alias to connect to (Eg MYSAMPLE) sample
Enter username db2inst1
Enter password <password>
Test 1: CONNECT without id or password.
Test 1: This will fail.
Error: cannot connect
-0000001060
DSCOBOL  
Test 2: CONNECT with id and password.
Test 2: passed as char fields.
Test 2: OK
Test 3: CONNECT with id and password.
Test 3: passed as varchar fields.
Test 3: OK

For static_check:

❯ ./run.sh
Sample COBOL program: STATIC1
Enter your user id (default none): db2inst1
Enter your password : <password>
First name = SYBIL

❯ ./run.sh
Sample COBOL program: CURSOR
Enter your user id (default none): db2inst1
Enter your password : <password>
Sanders in Dept. 20 is a Manager
Marenghi in Dept. 38 is a Manager
Hanes in Dept. 15 is a Manager
Plotz in Dept. 42 is a Manager
Fraye in Dept. 51 is a Manager
Molinare in Dept. 10 is a Manager
Lu in Dept. 10 is a Manager
Daniels in Dept. 10 is a Manager
Jones in Dept. 10 is a Manager
Lea in Dept. 66 is a Manager
Quill in Dept. 84 is a Manager
