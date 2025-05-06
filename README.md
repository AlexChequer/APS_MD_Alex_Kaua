# APS de Matemática Discreta - Modelando um Mundo com Lógica de Primeira Ordem

## Feito por Alex Chequer & Kauã Makiyama

## Link para video do prolog: https://youtu.be/rN3_LH-90r8

### 1. Cenário: “Batman: O Cavaleiro das Trevas”

#### Escolhemos o universo do filme *The Dark Knight* (2008). Nele temos:

Gotham é uma cidade dominada pelo crime, e Bruce Wayne, como Batman, luta para trazer justiça. Ao lado do comissário James Gordon e do promotor Harvey Dent, ele tenta restaurar a esperança da população. Porém, o Coringa aparece para desafiar a ordem e mostrar que a cidade pode facilmente desmoronar no caos. Harvey, antes símbolo de justiça, se transforma no Duas-Caras. Agora, Batman precisa enfrentar o Coringa e seu antigo aliado, enquanto usa a Batcaverna como seu refúgio para proteger Gotham da destruição.

- **Personagens principais:**
  - Bruce Wayne (Batman)
  - James Gordon
  - Harvey Dent (Two-Face)
  - Coringa (Joker)

- **Locais:**
  - Gotham
  - Batcaverna

- **Relações típicas:** herói, vilão, protege, ataca, aliado, inimigo, enfrenta

### 2. Modelagem em Lógica de Primeira Ordem

#### Constantes

- `batman`
- `gordon`
- `dent`
- `joker`
- `gotham`
- `batcaverna`

#### Predicados

1. `Heroi(x)` – "x é herói."  
2. `Vilao(x)` – "x é vilão."  
3. `Cidade(c)` – "c é uma cidade."  
4. `Local(l)` – "l é um local (base)."  
5. `Protege(x,y)` – "x protege o local y."  
6. `Ataca(x,y)` – "x ataca o local y."  
7. `Aliado(x,y)` – "x é aliado de y."  
8. `Inimigo(x,y)` – "x é inimigo de y."  
9. `Enfrenta(x,y)` – "x enfrenta y."  
10. `BaseDe(x,l)` – "l é base do agente x."

#### Fórmulas

1. **∀x (Heroi(x) → ∃l (BaseDe(x,l) ∧ Local(l)))**  
   “Todo herói tem pelo menos uma base, e esse lugar é um local válido.”

2. **∀x (Vilao(x) → ∃y (Ataca(x,y) ∧ Cidade(y)))**  
   “Todo vilão ataca pelo menos uma cidade.”

3. **∀x∀y ((Heroi(x) ∧ Cidade(y)) → Protege(x,y))**  
   “Se alguém é herói e y é uma cidade, então esse herói protege essa cidade.”

4. **∀x∀y ((Vilao(x) ∧ Cidade(y)) → Ataca(x,y))**  
   “Se alguém é vilão e y é uma cidade, então esse vilão ataca essa cidade.”

5. **∀x∀y (Aliado(x,y) ↔ Aliado(y,x))**  
   “Ser aliado é mútuo: se x é aliado de y, então y também é aliado de x.”

6. **∀x∀y (Enfrenta(x,y) ↔ (Inimigo(x,y) ∧ Inimigo(y,x)))**  
   “Dois agentes se enfrentam exatamente quando cada um é inimigo do outro.”

7. **∀x∀y ((Protege(x,y) ∧ Ataca(z,y)) → Enfrenta(x,z))**  
   “Se x protege um lugar y e z ataca esse lugar, então x enfrenta z.”

8. **∀x∀y (Inimigo(x,y) → (Vilao(x) ∧ Heroi(y)))**  
   “Se x é inimigo de y, então x é um vilão e y é um herói.”

9. **Heroi(batman)**  
   “Batman é um herói.”

10. **Vilao(joker)**  
   “Joker é um vilão.”

### 3. Deduções Naturais

#### Fato 1: `Protege(batman, gotham)`

- **Premissas:**
  1. Heroi(batman)  
  2. Cidade(gotham)  
  3. ∀x∀y ((Heroi(x) ∧ Cidade(y)) → Protege(x,y))

- **Demonstração:**
  1. Heroi(batman)  (Premissa)  
  2. Cidade(gotham)  (Definição do cenário)  
  3. Heroi(batman) ∧ Cidade(gotham)  (1,2 ∧-Intro)  
  4. (Heroi(batman) ∧ Cidade(gotham)) → Protege(batman,gotham)  (3 ∀-Elim)  
  5. Protege(batman,gotham)  (3,4 →-Elim)

#### Fato 2: `Enfrenta(batman, joker)`

- **Premissas:**
  1. Protege(batman, gotham)  (Fato 1)  
  2. Vilao(joker)  
  3. ∀x (Vilao(x) → ∃y (Ataca(x,y) ∧ Cidade(y)))  
  4. ∀x∀y ((Protege(x,y) ∧ Ataca(z,y)) → Enfrenta(x,z))

- **Demonstração:**
  1. Vilao(joker)  (Premissa)  
  2. ∀x (Vilao(x) → ∃y (Ataca(x,y) ∧ Cidade(y)))  (Premissa)  
  3. ∃y (Ataca(joker,y) ∧ Cidade(y))  (1,2 →-Elim)  
  4. Ataca(joker,gotham) ∧ Cidade(gotham)  (3 ∃-Elim com y=gotham)  
  5. Ataca(joker,gotham)  (4 ∧-Elim)  
  6. Protege(batman,gotham)  (Fato 1)  
  7. (Protege(batman,gotham) ∧ Ataca(joker,gotham)) → Enfrenta(batman,joker)  (4 ∀-Elim)  
  8. Protege(batman,gotham) ∧ Ataca(joker,gotham)  (5,6 ∧-Intro)  
  9. Enfrenta(batman,joker)  (7,8 →-Elim)
