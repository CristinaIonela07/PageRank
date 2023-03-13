function R = Iterative(nume, d, eps)
	% Functia care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eruarea care apare in algoritm.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
  
  % deschidere fisier pentru citire
  fid = fopen(nume, 'r');
  
  % N = numarul total de resurse web
  N = str2num(fgetl(fid));
  M = Adjacency(nume);
  
  % U = matricea coloana cu N elemente de 1
  U = ones(N,1);
  R = 1 / N * U;
  R1 = d * M * R + (1 - d) / N * U;
  
  while norm(R1 - R) > eps
    R = R1;
    R1 = d * M * R + (1 - d) / N * U;
  endwhile
  
  fclose(nume);
  
endfunction
