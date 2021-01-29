# CSM-Oradea C++ Game
Memory game cu 12 cărți care vor avea drept copertă logoul echipei de baschet CSM Oradea, iar la întoarcerea fiecărei cărți va apărea unul din jucătorii echipei.
   Avem un tablou de 12 cărți de tipul clasei Carte, diverse variabile cu care lucrăm pentru a genera aleator cu funcția randomize() cărțile la fiecare RESET al jocului, amestecând cărțile. 
  Funcția setup() e de tipul void, nu returnează nimic. Aici setăm ecranul sa fie în modul full screen, avem o listă de numere pe care o să le ia fiecare imagine cu câte un jucător, este apelată funcția randomize() care așează aleator cărțile la fiecare RESET. Tot în setup() fiecare carte va fi setată să aibă variabila booleană reveal pe false, să fie afișat doar logoul echipei.
  Funcția draw() e de tipul void, nu returnează nimic. Setăm backgroundul, modul să fie centru, aici se aranjează cărțile pe poziția dorită, cu dimensiunile dorite. Dacă variabila reveal o să fie true, când se dă click pe o carte, atunci o să apară efectul de tranziție, de trecere de la imaginea cu logo la cea cu jucător.
  În funcție sunt condiții care verifică numărul de cărți ghicite, condiția care întoarce două cărți deja alese care sunt cu jucători diferiți și condiția care salvează până la final fiecare două cărți ghicite și identice.
  Sunt afișate si câteva mesaje cu funcția text(), fiecare având culoare diferită setată cu fill() și mărime diferită setată cu textSize().
  Funcția reset() este definită în așa fel încât la apăsarea tastei R jocul să reînceapă în orice moment, apelându-se funcția setup().
  Funcția mouseClicked() gestionează fiecare click făcut asupra imaginilor, setează variabila reveal pe true, adică întoarsă, iar variabila over setată pe true va apela funcția setup(), resetând toate variabilele.
  Dacă toate cărțile au fost ghicite se apelează metoda gameOver() care afișează un mesaj aferent și o imagine cu întreaga echipă CSM Oradea. Jocul este responsive, pentru orice rezoluție a ecranului.
