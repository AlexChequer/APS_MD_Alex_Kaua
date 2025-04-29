% Fatos sobre personagens
heroi(batman).
heroi(gordon).
heroi(dent).
vilao(coringa).

% Fatos sobre locais
cidade(gotham).
local(batcaverna).

% Fatos sobre relacionamentos
baseDe(batman, batcaverna).
protege(batman, gotham).
protege(gordon, gotham).
protege(dent, gotham).
ataca(coringa, gotham).

% Regras
% Regra 1: Todo herói tem pelo menos uma base
temBase(X) :- heroi(X), baseDe(X, _).

% Regra 2: Todo vilão ataca pelo menos uma cidade
atacaCidade(X) :- vilao(X), ataca(X, _).

% Regra 3: Se alguém é herói e y é uma cidade, então esse herói protege essa cidade
protegeCidade(X, Y) :- heroi(X), cidade(Y), protege(X, Y).

% Regra 4: Se alguém é vilão e y é uma cidade, então esse vilão ataca essa cidade
atacaCidade(X, Y) :- vilao(X), cidade(Y), ataca(X, Y).

% Regra 5: Ser aliado é mútuo
aliado(X, Y) :- aliado(Y, X).

% Regra 6: Dois agentes se enfrentam exatamente quando cada um é inimigo do outro
enfrenta(X, Y) :- inimigo(X, Y), inimigo(Y, X).

% Regra 7: Se x protege um lugar y e z ataca esse lugar, então x enfrenta z
enfrenta(X, Z) :- protege(X, Y), ataca(Z, Y).

% Regra 8: Se x é inimigo de y, então x é um vilão e y é um herói
inimigo(X, Y) :- vilao(X), heroi(Y).

% Fatos adicionais sobre relacionamentos
inimigo(coringa, batman).
inimigo(coringa, gordon).
inimigo(coringa, dent).
aliado(batman, gordon).
aliado(batman, dent).
aliado(gordon, dent).
