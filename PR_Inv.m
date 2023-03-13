function B = PR_Inv(A)
	% Functia care calculeaza inversa matricii A folosind factorizari Gram-Schmidt
	% B = inversa lui A
  % S a factorizat matricea A = Q*R cu ajutorul factorizarii Gram-Schmidt 
  % Qinversat = Q' , R superior triunghiulara
  % A*B = I(matricea identitate) <=> Q'*/  Q*R*B = I  <=> R*B = Q'
  % Am dedus din relatia R*B = Q' o relatie algebrica intre elementele 
  % componente ale celor 3 matrice, din care am scos elementul din matricea B
  
  [n n] = size(A);
  
  %Factorizare Gram-Schmidt
  for i = 1 : n
    R(i,i) = norm(A(:, i), 2);
    Q(:, i) = A(:,i) / R(i,i);
    for j = i + 1 : n
      R(i, j) = Q(:,i)' * A(:, j);
      A(:,j) = A(:, j) - Q(:, i) * R(i, j);
    endfor
  endfor
  
  B = zeros(n);
  Q = Q';
  
  for i = n : -1 : 1
    for j = n : -1 : 1 
      s = 0;
      for k = i + 1 : n
        s = s + R(i, k) * B(k, j);
      endfor
      B(i, j) = (Q(i, j) - s) / R(i,i);
   endfor
  endfor
 
endfunction
