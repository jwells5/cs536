import java.util.List;

public class SemSym {
    protected String type;
    
    public SemSym(String type) {
        this.type = type;
    }
    
    public String getType() {
        return type;
    }
    
    public String toString() {
        return type;
    }
}

/**
 * A struct declaration.
 */
class StructDeclSym extends SemSym {
    private final SymTable fields;

    public StructDeclSym(String type, SymTable fields) {
        super(type);
        this.fields = fields;
    }

    public SymTable getFields() {
        return fields;
    }
}

/**
 * A variable that is of a struct type.
 *
 * Useful to ensure valid accesses to the struct.
 */
class StructVarSym extends SemSym {
    private final StructDeclSym decl;

    public StructVarSym(String type, StructDeclSym decl) {
        super(type);
        this.decl = decl;
    }

    public StructDeclSym getDecl() {
        return decl;
    }
}

/**
 * A function declaration.
 *
 * We don't need FnVarSym because you can't have function
 * variable references.
 */
class FnDeclSym extends SemSym {
    private final List<String> formalTypes;

    public FnDeclSym(String returnType, List<String> formalTypes) {
        super(returnType);
        this.formalTypes = formalTypes;
    }

    public List<String> getFormalTypes() {
        return formalTypes;
    }

    public String getReturnType() {
        return type;
    }

    @Override
    public String getType() {
        return null;
    }
}
