function M = Adjacency(nume)
  % Functie care calculeaza matricea de tranzitie M
  % Se construieste matricea de adiacenta A
  % Calculeaza matricea diagonala K
  % M = (K_inversat * A)'
  
  % N = numarul de resurse web
  fid = fopen(nume, 'r');
  N = str2num(fgetl(fid));
  
  A = zeros(N);
  K = zeros(N);
  M = zeros(N);
  
  while N > 0
    linie = fgetl(fid);
    
    % i = numarul nodului
    [i, linie] = strtok (linie, " ");
    i = str2num(i);
    
    % l = numarul total de noduri cu care se invecineaza
    [l, linie] = strtok (linie, " ");
    l = str2num(l);
    
    K(i, i) = l;
    
    while l > 0
      % j = nodul cu care se invecineaza
      [j, linie] = strtok (linie, " ");
      j = str2num(j);
      
      % Daca un nod se invecineaza cu sine, numarul de vecini al nodului scade,
      % implicit scade valoarea de pe pozitia (i, i) din matricea K
      if i != j
        A(i, j) = 1;
      else K(i, i) --;
      endif
    
      l = l - 1;
    endwhile
    N = N - 1;
  endwhile
  
  M = (PR_Inv(K) * A)';
  fclose(fid); 
  
endfunction