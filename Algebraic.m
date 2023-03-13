function R = Algebraic(nume, d)
	% Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
	% Intrari: 
	%	-> nume: numele fisierului in care se scrie;
	%	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
  % I = matricea identitate
  % U = matricea coloana cu N elemente de 1
  % N = numarul total de resurse web
  
  fid = fopen(nume, 'r');
  N = str2num(fgetl(fid));
  
  M = Adjacency(nume);
  
  I = eye(N);
  U = ones(N, 1);
  
  R = (1 - d) / N * PR_Inv(I - d * M) * U;
  
endfunction