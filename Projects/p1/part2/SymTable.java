// Main Class File:  P1.java
// File:             SymTable.java
// Semester:         CS 536 Spring 2017
//
// Author:           Keenan Thompson
// Email:            keenan@cs.wisc.edu
// CS Login:         keenan
// Lecturer's Name:  Thomas Reps
import java.util.*;

/**
 * A symbol table: stores a list of scopes which maintain names
 * and their associated symbol types.
 *
 * @author Keenan Thompson
 */
public class SymTable {
    /** List of scopes, earlier = more recent. */
    private final List<HashMap<String,Sym>> scopes;

    /**
     * Constructs the table with a single scope entry.
     */
    public SymTable() {
        // Empty list
        this.scopes = new ArrayList<>();

        // Populate list with the first scope.
        this.scopes.add(new HashMap<>());
    }

    /**
     * Adds a new declaration to the current scope.
     * @param name The name.
     * @param sym The symbol.
     * @throws DuplicateSymException If a sym is already declared with that name.
     * @throws EmptySymTableException If no scopes exist.
     */
    public void addDecl(String name, Sym sym) throws DuplicateSymException, EmptySymTableException {
        // No scopes added, invalid operation.
        requireNonEmptyTable();

        // Name and sym must be non-null.
        if (name == null || sym == null)
            throw new NullPointerException();

        // Store the first scope for fewer accesses = better performance
        HashMap<String, Sym> first = this.scopes.get(0);

        // Already exists in the scope, invalid operation.
        if (first.containsKey(name))
            throw new DuplicateSymException();

        first.put(name, sym);
    }

    /**
     * Add a new scope (a HashMap to the private list of HashMaps).
     *
     * This will modify the behavior of addDecl and lookupLocal, since a new "local" scope will be present
     * after this method is invoked.
     */
    public void addScope() {
        // Add a new map to the list at index 0
        this.scopes.add(0, new HashMap<>());
    }

    /**
     * Search for a symbol in the current scope.
     * @param name The name of the sym to find.
     * @return The symbol if it was found, otherwise returns null.
     * @throws EmptySymTableException If the table is empty.
     */
    public Sym lookupLocal(String name) throws EmptySymTableException {
        // No scopes added, invalid operation.
        requireNonEmptyTable();

        // Returns the Sym (or null if it's not there)
        return this.scopes.get(0).get(name);
    }

    /**
     * Search for a symbol in all scopes in the table.
     * @param name The name of the sym to find.
     * @return The symbol if it was found, otherwise, null.
     * @throws EmptySymTableException If the table is empty.
     */
    public Sym lookupGlobal(String name) throws EmptySymTableException {
        // No scopes added, invalid operation.
        requireNonEmptyTable();

        // Search every scope
        for (HashMap<String, Sym> scope : this.scopes) {
            if (scope.containsKey(name)) {
                // Match found, return it.
                return scope.get(name);
            }
        }

        // Not found in any scope, null is returned.
        return null;
    }

    /**
     * Remove the current scope from the table.
     * @throws EmptySymTableException If there is no scope to remove.
     */
    public void removeScope() throws EmptySymTableException {
        // Nothing to remove, invalid operation.
        requireNonEmptyTable();

        this.scopes.remove(0);
    }

    /**
     * Print out this table (for debugging).
     */
    public void print() {
        System.out.print("\nSym Table\n");

        // Go through each scope
        for (HashMap<String, Sym> scope: this.scopes) {
            // Print out it's toString() method + new line.
            System.out.println(scope.toString());
        }

        // One more new line
        System.out.println();
    }

    /**
     * Checks if this table is empty... If so, throw the exception.
     * @throws EmptySymTableException If the scope list is empty.
     */
    private void requireNonEmptyTable() throws EmptySymTableException {
        // Empty list check.
        if (this.scopes.isEmpty()) {
            throw new EmptySymTableException();
        }
    }
}
