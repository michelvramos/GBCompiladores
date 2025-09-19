// Seção 1: Declarações de pacote e imports
package src;

%%
// Seção 2: Código Java adicional e configurações
%{ 
  private void imprimir(String descricao, String lexema) {
    System.out.println(lexema + " - " + descricao);
  }  
%}

// Configurações da classe gerada
%class Lexer       // Nome da classe Java gerada
%type Object       // Tipo de retorno do método yylex()
%unicode
%line
%column

// Definição de padrões reutilizáveis
BRANCO  = [ \t\r\n]+
COMENT_LINHA = "//".*
COMENT_BLOCO = "/*" ([^*] | ("*" [^/]))* "*/"
ID = [_a-zA-Z][_a-zA-Z0-9]*
DIGITO = [0-9]
NUMERO = {DIGITO}+
DECIMAL = {DIGITO}+"."{DIGITO}+
STRING = "\"".+"\""
P_VARARG = "..."
OP_LOGICO     = "&&" | "||"
OP_IGUALDADE  = "==" | "!="
OP_RELACIONAL = "<=" | ">=" | "<" | ">"
OP_INC = "++"
OP_DEC = "--"
OP_AST = "*"
OP_SOM = "+"
OP_SUB = "-"
OP_DIV = "/"
CHAV_ESQ = "{"
CHAV_DIR = "}"
PAR_ESQ = "("
PAR_DIR = ")"
COL_ESQ = "["
COL_DIR = "]"
ATTR    = "="
OP_NEG = "!"
SEP_PARAM = ","
TERMINADOR = ";"

%%
// Seção 3: Regras de reconhecimento de tokens
"if"            { imprimir("Palavra reservada if", yytext()); }
"then"          { imprimir("Palavra reservada then", yytext()); }
"else"          { imprimir("Palavra reservada else", yytext()); }
"for"           { imprimir("Palavra reservada for", yytext()); }
"do"            { imprimir("Palavra reservada do", yytext()); }
"while"         { imprimir("Palavra reservada while", yytext()); }
"switch"        { imprimir("Palavra reservada switch", yytext());}
"case"          { imprimir("Palavra reservada case", yytext());}
"break"         { imprimir("Palavra reservada break", yytext());}
"default"       { imprimir("Palavra reservada default", yytext());}
"continue"      { imprimir("Palavra reservada continue", yytext());}
"int"           { imprimir("Palavra reservada int", yytext()); }
"float"         { imprimir("Palavra reservada float", yytext()); }
"double"        { imprimir("Palavra reservada double", yytext()); }
"char"          { imprimir("Palavra reservada char", yytext()); }
"void"          { imprimir("Palavra reservada void", yytext()); }
"bool"          { imprimir("Palavra reservada bool", yytext()); }
"false"         { imprimir("Palavra reservada false", yytext()); }
"true"          { imprimir("Palavra reservada true", yytext()); }
"const"         { imprimir("Palavra reservada const", yytext()); }
{BRANCO}        {  }
{ID}            { imprimir("Identificador", yytext()); }
{NUMERO}        { imprimir("Número inteiro", yytext()); }
{DECIMAL}       { imprimir("Número decimal", yytext()); }
{STRING}        { imprimir("Constante string", yytext()); }
{ATTR}          { imprimir("Operador atribuição", yytext()); }
{CHAV_ESQ}      { imprimir("Inicio de bloco", yytext()); }
{CHAV_DIR}      { imprimir("Final de bloco", yytext()); }
{PAR_ESQ}       { imprimir("Abre parenteses", yytext()); }
{PAR_DIR}       { imprimir("Fecha parenteses", yytext()); }
{COL_ESQ}       { imprimir("Abre colchetes", yytext()); }
{COL_DIR}       { imprimir("Fecha colchetes", yytext()); }
{OP_NEG}        { imprimir("Operador negação", yytext()); }
{TERMINADOR}    { imprimir("Terminador de intrução/declaração", yytext()); }
{OP_LOGICO}     { imprimir("Operador lógico", yytext()); }
{OP_IGUALDADE}  { imprimir("Operador de igualdade/inequalidade", yytext()); }
{OP_RELACIONAL} { imprimir("Operador relacional", yytext()); }
{SEP_PARAM}     { imprimir("Separador de parametro", yytext()); }
{OP_INC}        { imprimir("Operador incremento", yytext()); }
{OP_DEC}        { imprimir("Operador decremento", yytext()); }
{OP_AST}        { imprimir("Operador asterisco", yytext()); }
{OP_SOM}        { imprimir("Operador SOMA", yytext()); }
{OP_SUB}        { imprimir("Operador subtração", yytext()); }
{OP_DIV}        { imprimir("Operador divisão", yytext()); }
{P_VARARG}      { imprimir("Parâmetro argumento variável", yytext()); }
{COMENT_LINHA}  { imprimir("Comentário linha", yytext()); }
{COMENT_BLOCO}  { imprimir("Comentário bloco", yytext()); }

// Regra de erro para caracteres não reconhecidos
. { throw new RuntimeException(
      "Caractere inválido '" + yytext() + "' em " + (yyline+1) + ":" + (yycolumn+1)
    ); }
