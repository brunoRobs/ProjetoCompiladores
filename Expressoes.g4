grammar Expressoes;

// Lexer rules
TITLE: 'TITLE';
ITEM: 'ITEM';
TEXT: 'TEXT';
MULTIPLE_CHOICE: 'MULTIPLE_CHOICE';
SECTION_HEADER: 'SECTION_HEADER';
SELECT : 'SELECT';
INSERT : 'INSERT';
UPDATE : 'UPDATE';
DELETE : 'DELETE';
CLEAR : 'CLEAR';
SHOW : 'SHOW';
EXPORT : 'EXPORT';
VALUES : 'VALUES';
AND : 'AND';
OR : 'OR';
EQ : '=';
NEQ : '!=';
GT : '>';
LT : '<';
COMMA : ',';
PV : ';';
LPAR : '(';
RPAR : ')';
ID : [a-zA-Z_][a-zA-Z_0-9]*;
NUM : [0-9]+;
STRING : '\'' .*? '\''; // Adiciona suporte para strings entre aspas simples
WS : [ \t\r\n]+ -> skip;

// Parser rules
prog : stmt+ ;
stmt : titleStmt | insertItemTextStmt | insertItemMultipleChoicetStmt | insertItemSectionHeadertStmt | showStmt | exportStmt;

titleStmt : TITLE value PV ;
insertItemTextStmt : ITEM TEXT LPAR itemKeys RPAR VALUES LPAR values RPAR PV ;
insertItemMultipleChoicetStmt : ITEM MULTIPLE_CHOICE LPAR itemKeys RPAR VALUES LPAR values RPAR PV ;
insertItemSectionHeadertStmt : ITEM SECTION_HEADER LPAR itemKeys RPAR VALUES LPAR values RPAR PV ;
showStmt : SHOW PV ;
exportStmt : EXPORT PV ;

itemKeys : ID (COMMA ID)* ;
values : value (COMMA value)* ;
assignments : assignment (COMMA assignment)* ;
assignment : ID EQ value ;
condition : ID (EQ | NEQ | GT | LT) value (AND condition | OR condition)? ;
value : NUM | ID | STRING ; // Adiciona suporte para strings entre aspas simples
table : ID ;