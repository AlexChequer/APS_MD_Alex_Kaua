% Fatos sobre personagens
heroi(batman).
heroi(gordon).
heroi(dent).
vilao(coringa).

% Fatos sobre locais
cidade(gotham).
local(batcaverna).

% Relacionamentos unidirecionais
baseDe(batman, batcaverna).
protege(batman, gotham).
protege(gordon, gotham).
protege(dent, gotham).
ataca(coringa, gotham).

% Regras unidirecionais
temBase(X) :- heroi(X), baseDe(X, _).
atacaCidade(X) :- vilao(X), ataca(X, _).
protegeCidade(X, Y) :- heroi(X), cidade(Y), protege(X, Y).
atacaCidade(X, Y) :- vilao(X), cidade(Y), ataca(X, Y).

% Relações simétricas

% --- Aliado ---
aliadoDe(batman, gordon).
aliadoDe(batman, dent).
aliadoDe(gordon, dent).

aliado(X, Y) :- aliadoDe(X, Y).
aliado(X, Y) :- aliadoDe(Y, X).

% --- Inimigo ---
% Fatos-base de inimigo
inimigoDe(coringa, batman).
inimigoDe(coringa, gordon).
inimigoDe(coringa, dent).

% Fechamento simétrico
inimigo(X, Y) :- inimigoDe(X, Y).
inimigo(X, Y) :- inimigoDe(Y, X).

% --- Enfrenta ---
% Definição-base de "enfrenta"
enfrenta_base(X, Y) :- inimigo(X, Y), inimigo(Y, X).

% Fechamento simétrico
enfrenta(X, Y) :- enfrenta_base(X, Y).
enfrenta(X, Y) :- enfrenta_base(Y, X).
