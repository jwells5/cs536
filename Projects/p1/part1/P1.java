// Title:            P1
// Files:            P1.java, DuplicationSymException.java, EmptySymTableException.java, Sym.java, SymTable.java
// Semester:         CS 536 Spring 2017
//
// Author:           Keenan Thompson
// Email:            keenan@cs.wisc.edu
// CS Login:         keenan
// Lecturer's Name:  Thomas Reps

import java.io.ByteArrayOutputStream;
import java.io.PrintStream;
import java.util.Objects;

/**
 * The main file for this project. Tests a variety of cases for SymTable.
 *
 * Tested SymTable.java methods: addDecl(), addScope(), removeScope(), lookupGlobal(), lookupLocal(), print().
 * Tested Sym.java methods: getType().
 *
 * @author Keenan Thompson
 */
public class P1 {
    private static int errorCount;

    /**
     * Test a variety of cases for SymTable.
     * @param args Command line arguments.
     */
    public static void main(String[] args) {
        SymTable table = new SymTable();

        ////////////
        // Scopes //
        ////////////
        {
            // Test for existence of initial scope, and removal of a scope.
            try {
                table.removeScope();
            } catch (EmptySymTableException e) {
                error("Exception thrown on attempt to remove initial scope.");
            }

            // Test for removing a scope, an exception should be thrown.
            try {
                table.removeScope();
                error("No exception thrown when removing scope from empty table?");
            } catch (EmptySymTableException e) {
                // This is the expected thrown exception, so we ignore it.
            }

            // Add back a scope.
            table.addScope();

            // Try and remove the newly added scope. If it fails, we know
            // that addScope() likely failed at adding a scope.
            try {
                table.removeScope();
            } catch (EmptySymTableException e) {
                error("Exception thrown when removing newly added scope, addScope() may have failed.");
            }

            // Add 10 scopes
            for (int i = 0; i < 10; i++) {
                table.addScope();
            }

            // Remove 10 scopes
            for (int i = 0; i < 10; i++) {
                try {
                    table.removeScope();
                } catch (EmptySymTableException e) {
                    error("Exception thrown when removing 10 newly added scopes.");
                }
            }
        }

        /////////////
        // Symbols //
        /////////////
        Sym typeA = new Sym("typeA");
        Sym typeB = new Sym("typeB");
        Sym typeC = new Sym("typeC");
        {
            // Test for type name
            if (!typeA.getType().equals("typeA")) {
                error("Sym type name does not match expected type.");
            }

            try {
                table.addDecl("name1", typeA);
                error("No exception thrown when adding declaration to empty table?");
            } catch (EmptySymTableException e) {
                // Expected, since we have no scope yet.
            } catch (DuplicateSymException e) {
                error("Exception thrown when adding first declaration to empty table.");
            }

            // Add a scope for future tests.
            table.addScope();

            try {
                if (table.lookupGlobal("fake-name") != null || table.lookupLocal("fake-name") != null) {
                    error("lookupGlobal() or lookupLocal() found a result on a fake name?");
                }
            } catch (EmptySymTableException e) {
                error("Exception thrown when looking up fake name in non empty table.");
            }

            // Add first declaration.
            try {
                table.addDecl("name1", typeA);
            } catch (Exception e) {
                error("Exception thrown when adding first declaration to non empty table.");
            }

            try {
                // Lookup the added decl in local
                if (!Objects.equals(typeA, table.lookupLocal("name1"))) {
                    error("lookupLocal() failed, didn't find first declaration.");
                }

                // Lookup the added decl in global
                if (!Objects.equals(typeA, table.lookupGlobal("name1"))) {
                    error("lookupGlobal() failed, didn't find first declaration.");
                }
            } catch (EmptySymTableException e) {
                error("Exception thrown when looking up in non empty table.");
            }

            // Attempt adding a duplicate name, this should fail.
            try {
                table.addDecl("name1", typeB);
                error("No exception thrown when adding duplicate names to table.");
            } catch (DuplicateSymException e) {
                // Expected result, ignore.
            } catch (EmptySymTableException e) {
                error("Exception thrown when adding duplicate declarations in non empty table.");
            }

            // Add variety of declarations
            try {
                table.addDecl("name2", typeB);
                table.addDecl("name3", typeC);
                table.addDecl("name4", typeA);
                table.addDecl("name5", typeB);
                table.addDecl("name6", typeC);
            } catch (EmptySymTableException e) {
                error("Exception (EmptySym) thrown when adding many declarations in non empty table.");
            } catch (DuplicateSymException e) {
                error("Exception (DupSym) thrown when adding many declarations in non empty table.");
            }

            try {
                if (!Objects.equals(table.lookupGlobal("name6"), typeC)) {
                    error("lookupGlobal name didn't match expected.");
                }

                if (!Objects.equals(table.lookupLocal("name6"), typeC)) {
                    error("lookupLocal name didn't match expected.");
                }
            } catch (EmptySymTableException e) {
                error("Exception thrown when looking up many declarations in non empty table.");
            }
        }

        ///////////////////////////////
        // Symbols + Multiple Scopes //
        ///////////////////////////////
        {
            // New scope!
            table.addScope();

            // Test lookups.
            try {
                // Nothing is in local, should fail.
                if (table.lookupLocal("name6") != null) {
                    error("lookupLocal yielded unexpected non-null value.");
                }

                // name6 exists earlier, should pass.
                if (table.lookupGlobal("name6") == null) {
                    error("lookupGlobal yielded unexpected null value.");
                }
            } catch (EmptySymTableException e) {
                error("Exception thrown, empty table, when not empty.");
            }

            // New scope, new declarations
            try {
                table.addDecl("name1", typeC);
                table.addDecl("name2", typeB);
                table.addDecl("name3", typeA);
                table.addDecl("name4", typeC);
                table.addDecl("name5", typeB);
                table.addDecl("name6", typeA);
            } catch (Exception e) {
                error("Exception thrown when adding declarations to secondary scope.");
            }

            // Test new declarations, both local and global lookups should be overriden.
            try {
                if (!Objects.equals(table.lookupLocal("name6"), typeA)) {
                    error("lookupLocal() failed on secondary scope.");
                }
                if (!Objects.equals(table.lookupGlobal("name6"), typeA)) {
                    error("lookupGlobal() failed on secondary scope, duplicate names.");
                }
            } catch (EmptySymTableException e) {
                error("Exception thrown when looking up declarations in table with multiple scopes.");
            }
        }

        //////////////////
        // Test print() //
        //////////////////
        {
            table = new SymTable();
            try {
                table.addDecl("name1", typeA);
                table.addScope();
                table.addDecl("name2", typeB);
            } catch (Exception e) {
                // already tested above.
            }

            // Hijack System.out so we can properly test the print() method.
            PrintStream originalOut = System.out;
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            System.setOut(new PrintStream(out));
            table.print();
            System.setOut(originalOut);

            // This is what was outputted to System.out.
            String printed = out.toString();

            // Should match this precisely, if not, log the error.
            if (!printed.equals("\nSym Table\n{name2=typeB}\n\n{name1=typeA}\n\n")) {
                error("Invalid print() output.");
            }
        }

        // Error count, pluralized.
        {
            if (errorCount == 1) {
                System.err.println(String.format("Failed %d test!", errorCount));
            } else if (errorCount > 1) {
                System.err.println(String.format("Failed %d tests!", errorCount));
            }
        }
    }

    /**
     * Log an error and increase the error count.
     * @param msg The message to display.
     */
    private static void error(String msg) {
        System.err.println(msg);
        errorCount++;
    }
}
