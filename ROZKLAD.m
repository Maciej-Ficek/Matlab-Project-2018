## Copyright (C) 2018 Maciej
## 
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {} {@var{retval} =} ROZKLAD (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Maciej <Maciej@ADMIN-KOMPUTER>
## Created: 2018-05-27
function [R,p,q] = ROZKLAD(A,s)
  
  m=size(A,1);
  n=size(A,2);
  l=n;
  if (m<n||m>n) error('Macierz nie jest kwadratowa');
    endif;
if (det(A)==0) 
error('Macierz ma zerowy wyznacznik');
endif;
L=zeros(n);
if(s==0)
    disp('Bez wyboru elementu glownego');
    R=A;
    L=eye(n);
    p=[1:n];
    q=[1:n];
    for k=1:n-1
      for i=k+1:n 
        L(i,k)=R(i,k)/R(k,k);
        for j=k:n 
          R(i,j)=R(i,j)-L(i,k)*R(k,j);
      endfor
      endfor
    endfor;
    
    for i=1:n
      for j=1:n
        if (i>j) R(i,j)=L(i,j);
          endif;
        endfor;
      endfor;
      
endif;
if(s==1)
    disp('Z wyborem elementu glownego w kolumnie');
    R=A;
    T=A;
    L=zeros(n);
    p=[1:n];
    q=[1:n];
    d=0;
    for k=1:n-1
      maks=R(k,k);
      d=0;
        for c=k+1:n
          if(abs(R(c,k))>abs(maks))
          maks=R(c,k);
          d=c;
        endif;
        endfor;
        if(d>0)
          T(k,k:n)=R(k,k:n);
          R(k,k:n)=R(d,k:n);
          R(d,k:n)=T(k,k:n);
          e=p(d);
          p(d)=p(k);
          p(k)=e;
          if(d>0&&k>1)
          T(k,1:k-1)=L(k,1:k-1);
          L(k,1:k-1)=L(d,1:k-1);
          L(d,1:k-1)=T(k,1:k-1);
          endif;
          endif;
        for i=k+1:n;
      L(i,k)=R(i,k)/R(k,k);
    for j=k:n
      R(i,j)=R(i,j)-L(i,k)*R(k,j);
    endfor;
    endfor;
  endfor;
  
  for i=1:n
    for j=1:n
      if(i>j)
         R(i,j)=L(i,j);
         endif;
       endfor;
       endfor;
    
        endif;
if(s==2)
  disp('Z wyborem elementu glownego w kolumnie i wierszu.');
    R=A;
    T=A;
    p=[1:n];
    q=[1:n];
    L=zeros(n);
    
    for k=1:n-1
      maks=R(k,k);
      f=0;
      g=0;
      for a=k:n
        for b=k:n
          if(abs(R(a,b))>abs(maks))
          maks=R(a,b);
          if(a>k)
          f=a;
          endif;
          if(b>k)
          g=b;
        endif;
        endif;
      endfor;
      endfor;
      ##zamiana wierszy
      if(f>0)
        T(k,k:n)=R(k,k:n);
        R(k,k:n)=R(f,k:n);
        R(f,k:n)=T(k,k:n);
        z=p(f);
        p(f)=p(k);
        p(k)=z;
        if(f>0&&k>1)
        T(k,1:k-1)=L(k,1:k-1);
        L(k,1:k-1)=L(f,1:k-1);
        L(f,1:k-1)=T(k,1:k-1);
      endif;
      endif;
      ##zamiana kolumn
      if(g>0)
      T(:,k)=R(:,k);
      R(:,k)=R(:,g);
      R(:,g)=T(:,k);
      z=q(g);
      q(g)=q(k);
      q(k)=z;
      endif;
      ## w macierzy L nie trzeba nic zmieniac po zamianie kolumn
     for i=k+1:n
        L(i,k)=R(i,k)/R(k,k);
     for j=k:n
        R(i,j)=R(i,j)-L(i,k)*R(k,j);
      endfor;
      endfor;
      endfor;
    
    
    
    
  endif;
  
 if(s!=0&&s!=1&&s!=2) error('Wprowadzono zla wartosc s');
endif;
disp('Macierz R wynosi:');
disp(R);
disp('Wektor p wynosi:');
disp(p);
disp('Wektor q wynosi:');
disp(q);
endfunction

