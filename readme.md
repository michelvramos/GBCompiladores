# Como usar

### Windows
1. Baixar o projeto.
1. Abra o terminal.
1. Navegue até a pasta do projeto.
1. Execute `run.bat`.

### Linux
TODO

# Analisador Léxico (JFlex + Java)

Trabalho de Compiladores — **gera um lexer com JFlex** e roda em cima de um código-fonte de exemplo.

> **Stack**: JDK 21, JFlex, linha de comando no Windows (PowerShell/CMD).  
> **Estado atual**: projeto já compilando e rodando via `run.bat`.  

---

## Estrutura

```
Trabalho GB/
├─ lib/
│  └─ jflex-full-1.9.1.jar
├─ src/
│  ├─ grammar.flex          # especificação do lexer (fonte de verdade)
│  ├─ Lexer.java            # gerado pelo JFlex (pode ser regenerado)
│  ├─ Main.java             # classe principal
│  └─ source.code           # exemplo de entrada
├─ bin/                     # .class gerados (limpo no build)
├─ run.bat                  # compila e executa
├─ .gitignore
└─ README.md
```

---

## Pré-requisitos

* **JDK 21+** instalado (`java -version`, `javac -version` devem funcionar).
* **JFlex jar** em `lib/jflex-full-1.9.1.jar` (já está versionado aqui).
* Terminal **PowerShell** ou **CMD** no Windows.

---

## TL;DR (comandos rápidos)

Simplesmente:

```powershell
.\run.bat
```
ou 

Gerar lexer → compilar → executar:

```powershell
# 1) Gerar o Lexer a partir do grammar.flex (sem criar backups ~)
java -cp "lib/jflex-full-1.9.1.jar" jflex.Main --nobak src/grammar.flex

# 2) Compilar (gera .class em bin/)
javac -d bin -cp "lib/jflex-full-1.9.1.jar;." src/*.java

# 3) Executar (ajuste a classe principal se for MainLexAnalyzer)
java -cp "lib/jflex-full-1.9.1.jar;bin" src.Main src/source.code
```

> O `run.bat` já faz **limpeza do `bin/`**, compila e executa. Se quiser que ele rode um arquivo específico, edite a última linha do `.bat`.

---

## Como funciona

1. **Você edita** as regras em `src/grammar.flex` (tokens, regex, mensagens).
2. **Gera** o código do lexer com JFlex → sai `src/Lexer.java`.
3. **Compila** com `javac` → sai tudo em `bin/`.
4. **Executa** a classe principal (`src.Main` ou `src.MainLexAnalyzer`) informando **o arquivo de entrada** a ser analisado (ex.: `src/source.code`).
5. O programa imprime **tokens** (e **erros léxicos** quando houver), com linha/coluna/lexema conforme você implementou.

---

## Exemplos de uso

### Gerar o lexer (sem backup `~`)

```powershell
java -cp "lib/jflex-full-1.9.1.jar" jflex.Main --nobak src/grammar.flex
```

### Compilar tudo

```powershell
javac -d bin -cp "lib/jflex-full-1.9.1.jar;." src/*.java
```

### Executar (classe principal `Main`)

```powershell
java -cp "lib/jflex-full-1.9.1.jar;bin" src.Main src/source.code
```

### Executar (classe principal `MainLexAnalyzer`)

```powershell
java -cp "lib/jflex-full-1.9.1.jar;bin" src.MainLexAnalyzer src/source.code
```

> **Dica**: se não passar arquivo, você pode redirecionar do `stdin`:
>
> ```powershell
> type src\source.code | java -cp "lib/jflex-full-1.9.1.jar;bin" src.Main
> ```

---

## Limpeza / geração de novo

* O `run.bat` **recria** a pasta `bin/` a cada compilação.
* O JFlex, sem `--nobak`, cria backups `Lexer.java~`. Pra evitar:

  ```powershell
  jflex.Main --nobak ...
  ```
* Se aparecer aviso de **LF → CRLF** no Git, normal no Windows. Quer padronizar? Use `.gitattributes`:

  ```
  * text=auto
  *.bat text eol=crlf
  *.ps1 text eol=crlf
  *.java text eol=lf
  *.flex text eol=lf
  ```

---

## Entregáveis (lembrete)

* PPT da apresentação com explicações, trechos de código e resultados.
* Vídeo explicativo (2–5 minutos) mostrando o programa rodando e narrando o processo.
* Código-fonte completo na linguagem escolhida.
* Arquivos de entrada de teste.
* Relatório simples com:
  * Tabela de cadeias (Etapa 1).
  * Prints das saídas dos testes.
  * Diferença entre reconhecer if como palavra-chave ou identificador.
  * Comentários sobre modularização e estados.

---

## Licença

Livre pra uso acadêmico.
