DOMAINS 
  bersaudara = symbol
PREDICATES
 nondeterm dengan(bersaudara, bersaudara)
 benar_bersaudara
CLAUSES
  dengan(falisu,imam).
  dengan(apui,bayaq).
  dengan(iput,iyut).
 benar_bersaudara:-
 dengan(X,Y),
  write(X," bersaudara dengan ",Y,"\n"),
   fail.
   benar_bersaudara.
GOAL
benar_bersaudara.  
