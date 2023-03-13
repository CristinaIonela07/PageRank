Am construit functia ajutatoare "Adjacency" care extrage din fisier 
informatiile despre paginile web si construieste matricea de adiacenta A, 
matricea diagonala K, si matricea M. 

Pentru extragerea informatiilor, am citit pe rand cate o linie din fisier 
astfel:
-prima linie continea numarul total de pagini web (N) 
-urmatoarele N linii au fost citite pe rand, primul caracter reprezentand 
indexul paginii (i), urmatorul caracter (j) numarul total de link-uri catre 
alte pagini, iar urmatoarele j caractere indexurile paginilor catre care 
contine link.
Toate informatiile au fost prima data transformate din caractere in numere 
cu ajutorul functiei "str2num".

Pentru a construi matricea de adiacenta, A(i, j) = 1 daca nodul i se 
invecineaza cu nodul j, si 0 in rest. Matricea diagonala K avea pe pozitia 
(i,i) numarul total de noduri cu care se invecina nodul i si 0 in rest.
Matricea finala M a fost obtinuta dupa formula (K_inversat * A)'.

Matricea K_inversat a fost obtinuta cu ajutorul functiei PR_Inv care calculeaza
inversa unei matrice folosind factorizarea Gram-Schmidt din laboratorul 3. In 
urma factorizarii, o matrice A poate fi scrisa sub forma A = Q*r, unde Q este 
o matrice ortogonala (Q_inversat = Q') si R este superior triunghiulara. 
Cum A*A_inversat = I (matricea identitate) <=> Q*R*A_inversat = I /*Q' <=> 
R*A_inversat = Q'.

Cum R este superior triunghiulara, cel mai usor d32e aflat sunt elementele de 
pe ultima linie a matricei A_inversat, fiind obtinute prin inmultirea ultimei 
linii a matricei R (care are doar ultimul element nenul) cu fiecare coloana 
din matricea A_inversat si egalarea cu ultima linie din matricea Q'. Apoi se 
continua algoritmul pentru aflarea fiecarui element de pe o noua linie, 
avand nevoie de elementele de pe liniile anterioare. 

Functia "Iterative" a fost construita pe baza informatiilor din link-ul atasat,
iar functia "Algebraic" a fost construita cu ajutorul relatiei din link,trecand
toti termenii R intr-o parte a egalitatii.

In functia "Apartenenta", pentru ca functia u(x) sa fie continua, trebuie ca:
a * val1 + b = 0   si   a * val2 + b = 1. Din acest sistem am aflat relatiile
corespunzatoare constantelor a si b in functie de valorile val1 si val2. 
Daca x era mai mic decat val1, functia intorcea valoarea 0, daca era mai mare 
decat val2, intorcea valoarea 1, iar daca se afla intre ele, intorcea 
a * x + b, cu a si b calculate anterior.

Se parcurge fisierul pana la ultimele 2 linii si se extrag val1 si val2 
utilizate in functia "Apartenenta". Se deschide fisierul de iesire, se
calculeaza vectorul PR prin cele doua metode (iterativ si algebric) si se 
scrie in fisier. Urmeeaza ordonarea vectorului PR in PR1. Am construit o 
matrice (Grad_A). Prima coloana reprezinta indici in vectorul PR1, a 
doua coloana reprezinta nodul al carui PageRank este PR1, iar a treia coloana
reprezinta gradul de apartenenta al fiecarei pagini.
