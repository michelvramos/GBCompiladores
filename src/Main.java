package src;

import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.nio.charset.StandardCharsets;

/*
 * .run.bat
 *      - Compila grammar.lex e gerar Lexer.java
 *      - Compila Main.java
 *      - Executa Main.class
 */

public class Main 
{
    public static void main(String[] args) throws Exception 
    {
        Reader srcInput = new InputStreamReader(new FileInputStream("src/source.code"), StandardCharsets.UTF_8);
        Lexer lexer = new Lexer(srcInput); 

        System.out.println("--------------------------------------------------------------------------------------");
        System.out.println(String.format("%30s\t%-30s\t%s\t%s","Descrição","Token","Linha","Coluna"));
        System.out.println("--------------------------------------------------------------------------------------");

        try 
        {
            lexer.yylex();
        } 
        catch (Exception ex) 
        {
            System.out.println("Exception: " + ex.getMessage());
        }
    }
}