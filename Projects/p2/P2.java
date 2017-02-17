import java.util.*;
import java.io.*;
import java_cup.runtime.*;  // defines Symbol

/**
 * This program is to be used to test the Scanner.
 * This version is set up to test all tokens, but more code is needed to test 
 * other aspects of the scanner (e.g., input that causes errors, character 
 * numbers, values associated with tokens)
 */
public class P2 {
    public static void main(String[] args) throws IOException {
                                           // exception may be thrown by yylex
   
        // Teststhat don't output line numbers...
        String[] normalTests = new String[] {"allcases", "codetest"};
        String[] lineTests = new String[] {"badcases", "testcounting"};

        // Iterate each test
        for (String filename : normalTests) {
            System.out.println("############################################");
            System.out.println("Testing input: " + filename + ".in");

            // Process the file
            testAllTokens(filename, false);

            System.out.println("> Output written to: " + filename + ".out");;

            // Reset CharNum for the next file
            CharNum.num = 1;
        }

        // Same as previous loop, except output with lines
        for (String filename : lineTests) {
            System.out.println("############################################");
            System.out.println("Testing input: " + filename + ".in");
            testAllTokens(filename, true);
            System.out.println("> Output written to: " + filename + ".out");;
            CharNum.num = 1;
        }
    }

    /**
     * Open and read from file specified by the argument.
     * For each token read, write the corresponding string to filename.out
     * If the input file contains all tokens, one per line, we can verify
     * correctness of the scanner by comparing the input and output files
     * (e.g., using a 'diff' command).
     *
     * @param filename The name of the file (excluding the .in extension).
     * @param moreInfo If true, output line and character number info for each token.
     */
    private static void testAllTokens(String filename, boolean moreInfo) throws IOException {
        // open input and output files
        FileReader inFile = null;
        PrintWriter outFile = null;
        try {
            inFile = new FileReader(filename + ".in");
            outFile = new PrintWriter(new FileWriter(filename + ".out"));
        } catch (FileNotFoundException ex) {
            System.err.println("File " + filename + ".in not found.");
            System.exit(-1);
        } catch (IOException ex) {
            System.err.println(filename + ".out cannot be opened.");
            System.exit(-1);
        }

        // create and call the scanner
        Yylex scanner = new Yylex(inFile);
        Symbol token = scanner.next_token();
        while (token.sym != sym.EOF) {
            if (moreInfo) {
                TokenVal val = (TokenVal) token.value;
                outFile.print("[" + val.linenum + "," + val.charnum + "] ");
            }
            switch (token.sym) {
            case sym.BOOL:
                outFile.println("bool"); 
                break;
			case sym.INT:
                outFile.println("int");
                break;
            case sym.VOID:
                outFile.println("void");
                break;
            case sym.TRUE:
                outFile.println("true"); 
                break;
            case sym.FALSE:
                outFile.println("false"); 
                break;
            case sym.STRUCT:
                outFile.println("struct"); 
                break;
            case sym.CIN:
                outFile.println("cin"); 
                break;
            case sym.COUT:
                outFile.println("cout");
                break;				
            case sym.IF:
                outFile.println("if");
                break;
            case sym.ELSE:
                outFile.println("else");
                break;
            case sym.WHILE:
                outFile.println("while");
                break;
            case sym.RETURN:
                outFile.println("return");
                break;
            case sym.ID:
                if (moreInfo) {
                    outFile.print("(ID) ");
                }
                outFile.println(((IdTokenVal)token.value).idVal);
                break;
            case sym.INTLITERAL:  
                if (moreInfo) {
                    outFile.print("(INTLITERAL) ");
                }
                outFile.println(((IntLitTokenVal)token.value).intVal);
                break;
            case sym.STRINGLITERAL: 
                if (moreInfo) {
                    outFile.print("(STRINGLITERAL) ");
                }
                outFile.println(((StrLitTokenVal)token.value).strVal);
                break;    
            case sym.LCURLY:
                outFile.println("{");
                break;
            case sym.RCURLY:
                outFile.println("}");
                break;
            case sym.LPAREN:
                outFile.println("(");
                break;
            case sym.RPAREN:
                outFile.println(")");
                break;
            case sym.SEMICOLON:
                outFile.println(";");
                break;
            case sym.COMMA:
                outFile.println(",");
                break;
            case sym.DOT:
                outFile.println(".");
                break;
            case sym.WRITE:
                outFile.println("<<");
                break;
            case sym.READ:
                outFile.println(">>");
                break;				
            case sym.PLUSPLUS:
                outFile.println("++");
                break;
            case sym.MINUSMINUS:
                outFile.println("--");
                break;	
            case sym.PLUS:
                outFile.println("+");
                break;
            case sym.MINUS:
                outFile.println("-");
                break;
            case sym.TIMES:
                outFile.println("*");
                break;
            case sym.DIVIDE:
                outFile.println("/");
                break;
            case sym.NOT:
                outFile.println("!");
                break;
            case sym.AND:
                outFile.println("&&");
                break;
            case sym.OR:
                outFile.println("||");
                break;
            case sym.EQUALS:
                outFile.println("==");
                break;
            case sym.NOTEQUALS:
                outFile.println("!=");
                break;
            case sym.LESS:
                outFile.println("<");
                break;
            case sym.GREATER:
                outFile.println(">");
                break;
            case sym.LESSEQ:
                outFile.println("<=");
                break;
            case sym.GREATEREQ:
                outFile.println(">=");
                break;
			case sym.ASSIGN:
                outFile.println("=");
                break;
			default:
				outFile.println("UNKNOWN TOKEN");
            } // end switch

            token = scanner.next_token();
        } // end while
        outFile.close();
    }
}
