// Main Class File:  P1.java
// File:             Sym.java
// Semester:         CS 536 Spring 2017
//
// Author:           Keenan Thompson
// Email:            keenan@cs.wisc.edu
// CS Login:         keenan
// Lecturer's Name:  Thomas Reps

/**
 * Represents a symbol.
 *
 * @author Keenan Thompson
 */
public class Sym {
    /** The type of the symbol (int, bool, etc.) **/
    private final String type;

    /**
     * Construct a sym with the given type.
     * @param type The type of this symbol.
     */
    public Sym(String type) {
        this.type = type;
    }

    /**
     * Get the symbol type.
     * @return The symbol type.
     */
    public String getType() {
        return this.type;
    }

    /**
     * Convert this object to a string. Currently it is just its type as a string.
     * @return The symbol type.
     */
    @Override
    public String toString() {
        return getType();
    }
}
