function [R1 R2] = PageRank(nume, d, eps)
	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out
  % N = numarul total de resurse web
  
  fid = fopen(nume, 'r');
  N = str2num(fgetl(fid));
  % se parcurge fisierul pana la ultimele 2 linii
  % se extrag val1 si val2 utilizate in functia "Apartenenta"
  for i = 1 : N
    fgetl(fid);
  endfor
  val1 = str2num(fgetl(fid));
  val2 = str2num(fgetl(fid));
  fclose(fid);
  
  % numele fisierul de iesire va fi salvat in variabila nume_out
  nume_out = strcat(nume, ".out");
  
  % se deschide fisierul de iesire pentru a scrie in el
  fid = fopen(nume_out, 'w');
  fprintf(fid, "%d\n", N);
  
  PR = Iterative(nume, d, eps);
  fprintf(fid, "%.06f\n", PR);
  fprintf(fid, "\n");
  
  PR = Algebraic(nume, d, eps);
  fprintf(fid, "%.06f\n", PR);
  fprintf(fid, "\n");
  
  %PR1 = vectorul PR ordonat descrescator
  PR1 = PR; 
  for i = 1 : (N - 1)
    for j = i : N
      if PR1(i) < PR1(j)
        aux = PR1(i);
        PR1(i) = PR1(j);
        PR1(j) = aux;
      endif
    endfor
  endfor

  % Grad_A = matrice care contine gradul de apartenenta corespunzator fiecarei pagini
  Grad_A = zeros(N, 3);
  for i = 1 : N
    Grad_A(i, 1) = i;
    for j = 1 : N
      if PR1(i) == PR(j)
        Grad_A(i, 2) = j; 
        PR(j) = 0;
        break;
      endif
    endfor 
    Grad_A(i, 3) = Apartenenta(PR1(i), val1, val2);
  endfor
  
  % Se ordoneaza descrescator in functie de a doua coloana daca doua grade 
  % de apartenenta sunt la fel
  for i = 1 : N
    for j = i : N
      if Grad_A(i, 3) == Grad_A(j, 3) && PR1(i) == PR1(j)
        aux = Grad_A(j, 2);
        Grad_A(j, 2) = Grad_A(i, 2);
        Grad_A(i, 2) = aux;
      endif
    endfor
  endfor

  for i = 1 : N
    fprintf(fid, "%d %d %.06f\n", Grad_A(i, 1), Grad_A(i, 2), Grad_A(i, 3));
  endfor
  
  fclose(fid);

endfunction