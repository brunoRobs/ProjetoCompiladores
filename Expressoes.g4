grammar Expressoes;

// Lexer rules
TITLE: 'TITLE' ;
DESCRIPTION: 'DESCRIPTION' ;
ITEM: 'ITEM' ;
TEXT: 'TEXT' ;
PARAGRAPH_TEXT: 'PARAGRAPH_TEXT' ;
MULTIPLE_CHOICE: 'MULTIPLE_CHOICE' ;
SECTION_HEADER: 'SECTION_HEADER' ;
SHOW : 'SHOW' ;
EXPORT: 'EXPORT' ;
VALUES: 'VALUES' ;
COMMA: ',' ;
PV: ';' ;
LPAR: '(' ;
RPAR: ')' ;
ID: [a-zA-Z_][a-zA-Z_0-9]* ;
NUM: [0-9]+ ;
STRING: '\'' .*? '\'' ;
WS: [ \t\r\n]+ -> skip ;

// Parser rules
prog : stmt+ ;
stmt : titleStmt 
    | descriptionStmt 
    | insertItemTextStmt 
    | insertItemParagraphTextStmt 
    | insertItemMultipleChoicetStmt 
    | insertItemSectionHeadertStmt 
    | showStmt 
    | exportStmt
    ;

titleStmt : TITLE value PV ;
descriptionStmt : DESCRIPTION value PV ;
insertItemTextStmt : ITEM TEXT LPAR itemKeys RPAR VALUES LPAR values RPAR PV ;
insertItemParagraphTextStmt : ITEM PARAGRAPH_TEXT LPAR itemKeys RPAR VALUES LPAR values RPAR PV ;
insertItemMultipleChoicetStmt : ITEM MULTIPLE_CHOICE LPAR itemKeys RPAR VALUES LPAR values RPAR PV ;
insertItemSectionHeadertStmt : ITEM SECTION_HEADER LPAR itemKeys RPAR VALUES LPAR values RPAR PV ;
showStmt : SHOW PV ;
exportStmt : EXPORT PV ;

itemKeys : ID (COMMA ID)* ;
values : value (COMMA value)* ;
value : NUM 
    | ID 
    | STRING 
    ;