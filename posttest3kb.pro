
PREDICATES
  likes(symbol,symbol) - nondeterm (i,o)
  cooking(symbol,symbol)  - nondeterm(i,i)
  food(symbol) - nondeterm (o)

CLAUSES
  likes(ingan,X):- %ingan menyukai sesuatu jika
	food(X), % sesuatu itu adalah makanan dan
	cooking(X,happy). %sesuatu itu adalah memasak maka sesuatu itu adalah senang 

  cooking(fried_chicken,happy).
  cooking(fried_rice,sad).

  food(fried_rice). % fakta makanan yang akan dimasak 
  food(fried_chicken).

GOAL
  likes(ingan,What). % ingan menyukai memasak apa?
  		     % jawaban nya memasak fried_chicken dengan solution 1
	