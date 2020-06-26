package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
D=[0-9]+
A = [+] 
B = [-] 
C = [/] 
E = [*] 
X = [+-/*] [+-/*]+

espacio=[ ,\t,\r,\n]+


%{
    public String lexeme;
%}
%%
{espacio} {/*Ignore*/}
"//".* {/*Ignore*/}
"*" {return Multiplicacion;}
"/" {return Division;}
("(-"{D}+")")|{D}+ {lexeme=yytext(); return Digito;}
{A} {lexeme=yytext(); return Suma;}
{C} {lexeme=yytext(); return Division;}
{E} {lexeme=yytext(); return Multiplicacion;}
{B} {lexeme=yytext(); return Resta;}
{X}+ {lexeme=yytext(); return Error;}
. {return ERROR;}



