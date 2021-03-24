acidez(baixa).
acidez(media).
acidez(alta).

corpo(leve).
corpo(medio_encorpado).
corpo(encorpado).

aroma(frutado).
aroma(nao_frutado).

tipo(seco).
tipo(demi_seco).

cor(rose).
cor(tinto).
cor(branco).


wine(bb, "Bordeaux Blanc").
wine(sb, "Sauvignon Blanc").
wine(rs, "Riesling").
wine(rp, "Rosé de Provence").
wine(pn, "Pinot Noir").
wine(cn, "Chianti Novo").
wine(ch, "Chianti Reserva").
wine(cs, "Cabernet Sauvignon").
wine(mr, "Merlot").
wine(cr, "Champagne Rosé").


atributos_vinho(bb, Cor, Tipo, Corpo, Acidez, Aroma) :- cor(branco), tipo(seco), corpo(leve), acidez(media), aroma(nao_frutado) !.
atributos_vinho(sb, Cor, Tipo, Corpo, Acidez, Aroma) :- cor(branco), tipo(seco), corpo(leve), acidez(alta), aroma(nao_frutado) !.
atributos_vinho(rs, Cor, Tipo, Corpo, Acidez, Aroma) :- cor(branco), tipo(demi_seco), corpo(leve), acidez(baixa), aroma(frutado) !.
atributos_vinho(rp, Cor, Tipo, Corpo, Acidez, Aroma) :- cor(rose), tipo(demi_seco), corpo(leve), acidez(baixa), aroma(frutado) !.
atributos_vinho(pn, Cor, Tipo, Corpo, Acidez, Aroma) :- cor(tinto), tipo(seco), corpo(encorpado), acidez(media), aroma(nao_frutado) !.
atributos_vinho(cn, Cor, Tipo, Corpo, Acidez, Aroma) :- cor(tinto), tipo(seco), corpo(medio_encorpado), acidez(media), aroma(nao_frutado) !.
atributos_vinho(ch, Cor, Tipo, Corpo, Acidez, Aroma) :- cor(tinto), tipo(seco), corpo(encorpado), acidez(baixa), aroma(nao_frutado) !.
atributos_vinho(cs, Cor, Tipo, Corpo, Acidez, Aroma) :- cor(tinto), tipo(seco), corpo(encorpado), acidez(alta), aroma(nao_frutado) !.
atributos_vinho(mr, Cor, Tipo, Corpo, Acidez, Aroma) :- cor(tinto), tipo(seco), corpo(medio_encorpado), acidez(media), aroma(nao_frutado) !.
atributos_vinho(cr, Cor, Tipo, Corpo, Acidez, Aroma) :- cor(rose), tipo(seco), corpo(leve), acidez(baixa), aroma(frutado) !.


carne_branca(porco).
carne_branca(aves).

carne_vermelha(grelhada).
carne_vermelha(assada).
carne_vermelha(com_molho).

legume(beringela_abobrinha).
legume(molho_delicado).

massa(mais_gorduroso).
massa(tomato).
massa(aglio_olio).

peixe(defumado).
peixe(frito_assado).
peixe(vapor).

sobremesa(chocolate).
sobremesa(fruta).


prato(carne_branca).
prato(carne_vermelha).
prato(peixe).
prato(pasta).
prato(sobremesa).
prato(legumes).



% REGRAS

%   Regra 1
%     SE tipo prato = Peixes e frutos do Mar
%     E  Tipo Peixe = Peixe no vapor
%     ENTÃO cor vinho = Branco CNF 100%
%           tipo vinho = Seco CNF 100%
%           corpo do vinho = leve CNF 100%
sugestao(Vinho, Carne, Bulhufas ) :-  atributos_vinho(Vinho,cor,tipo,corpo, _,_,_ ), carne(carne).

%   Regra 2
%     SE tipo prato = Peixes e frutos do Mar
%     E  Tipo Peixe = Peixe fritos ou grelhado
%     ENTÃO aroma vinho = frutado CNF 100%
%           cor vinho = Rosé CNF 100%
%           acidez do vinho = pouco ácido CNF 100%

%   Regra 3
%     SE tipo prato = Peixes e frutos do Mar
%     E  Tipo Peixe = Peixe defumado
%     ENTÃO tipo vinho = Seco CNF 100%
%           cor vinho = Branco CNF 100%
%           acidez do vinho = ácido  CNF 100%

%   Regra 4
%     SE tipo prato = Legumes
%     E  Tipo Legume = Acompanha molho delicado
%     ENTÃO cor vinho = Branco CNF 100%
%           aroma vinho = frutado CNF 100%
%           acidez do vinho = pouco ácido CNF 100%

%   Regra 5
%     SE tipo prato = Legumes
%     E  Tipo Legume = beringela ou abobrinha
%     ENTÃO cor vinho = Tinto CNF 100%
%           tipo vinho = Seco CNF 100%
%           corpo do vinho = encorpado CNF 100%

%   Regra 6
%     SE tipo prato = Massas
%     E  Tipo Massa = com molho de tomates
%     ENTÃO cor vinho = Tinto CNF 100%
%           tipo vinho = Seco CNF 100%
%           acidez do vinho = médio ácido CNF 80%

%   Regra 7
%     SE tipo prato = Massas
%     E  Tipo Massa = com molho mais gorduroso (carne ou creme de leite)
%     ENTÃO cor vinho = Tinto CNF 100%
%           corpo do vinho = encorpado CNF 100%
%           acidez do vinho = ácido  CNF 100%
%           tipo vinho = Seco CNF 100%

%   Regra 8
%     SE tipo prato = Massas
%     E  Tipo Massa = ao alho e óleo
%     ENTÃO cor vinho = Tinto CNF 100%
%           tipo vinho = Seco CNF 100%
%           corpo do vinho = leve CNF 100%

%   Regra 9
%     SE tipo prato = Carne branca
%     E  Tipo Carne Branca = Porco
%     OU Tipo Carne Branca = Aves
%     ENTÃO cor vinho = Branco CNF 60%
%           cor vinho = Tinto CNF 100%
%           acidez do vinho = médio ácido CNF 100%

%   Regra 10
%     SE tipo prato = Carne vermelha
%     E  Tipo Carne Vermelha = grellhada
%     ENTÃO cor vinho = Tinto CNF 100%
%           acidez do vinho = médio ácido CNF 100%

acidez(media) :-
    prato(carne_vermelha),
    red_mead(grelhada).

%   Regra 11
%     SE tipo prato = Carne vermelha
%     E  Tipo Carne Vermelha = com molho
%     OU Tipo Carne Vermelha = assada
%     ENTÃO tipo vinho = Seco CNF 100%
%           cor vinho = Tinto CNF 100%
%           corpo do vinho = encorpado CNF 100%
sugestao(Vinho, carne_vermelha, (assada; com_molho)) :-  atributos_vinho(Vinho, cor(tinto), tipo(seco), corpo(encorpado), _, _ ).
sugestao(vinho, CARNE, TIPOS) :- atributos_vinho( Vinho, cor(), tipo(), corpo(), acidez(), aroma()).

%   Regra 12
%     SE tipo prato = Sobremesas
%     E  Tipo Sobremesa = Frutas
%     ENTÃO cor vinho = Branco CNF 100%
%           cor vinho = Rosé CNF 80%
%           aroma vinho = frutado CNF 100%

%   Regra 13
%     SE cor vinho = Branco
%     E  tipo vinho = Seco
%     E  corpo do vinho = leve
%     ENTÃO Sugestão de vinho = Bordeaux blanc  CNF 100%

%   Regra 14
%     SE cor vinho = Tinto
%     E  tipo vinho = Seco
%     E  corpo do vinho = leve
%     ENTÃO Sugestão de vinho = Merlot CNF 100%
wine(mr) :-
    cor(tinto),
    tipo(seco),
    corpo(leve).

%   Regra 15
%     SE cor vinho = Branco
%     E  tipo vinho = Seco
%     E  corpo do vinho = médio encorpado
%     ENTÃO Sugestão de vinho = Sauvignon Blanc CNF 100%
wine(sb) :-
    cor(branco),
    tipo(seco),
    corpo(medio).

%   Regra 16
%     SE cor vinho = Tinto
%     E  tipo vinho = Seco
%     E  corpo do vinho = médio encorpado
%     ENTÃO Sugestão de vinho = Chianti novo CNF 100%
%           Sugestão de vinho = Merlot CNF 100%

%   Regra 17
%     SE cor vinho = Tinto
%     E  tipo vinho = Seco
%     E  corpo do vinho = encorpado
%     ENTÃO Sugestão de vinho = Cabernet Sauvignon  CNF 100%
%           Sugestão de vinho = Chianti Reserva  CNF 100%
%           Sugestão de vinho = Pinot Noir  CNF 100%

%   Regra 18
%     SE cor vinho = Tinto
%     E  acidez do vinho = ácido
%     ENTÃO Sugestão de vinho = Pinot Noir  CNF 100%
%           Sugestão de vinho = Chianti Reserva  CNF 100%
%           Sugestão de vinho = Cabernet Sauvignon  CNF 100%

%   Regra 19
%     SE cor vinho = Branco
%     E  tipo vinho = Seco
%     E  acidez do vinho = ácido
%     ENTÃO Sugestão de vinho = Sauvignon Blanc CNF 100%
wine(sb) :-
    cor(branco),
    tipo(seco),
    acidez(alta).


%   Regra 20
%     SE cor vinho = Tinto
%     E  acidez do vinho = médio ácido
%     ENTÃO Sugestão de vinho = Chianti novo CNF 100%
%           Sugestão de vinho = Merlot CNF 100%

%   Regra 21
%     SE cor vinho = Branco
%     E  tipo vinho = Seco
%     E  acidez do vinho = médio ácido
%     ENTÃO Sugestão de vinho = Bordeaux blanc  CNF 100%
wine(bb) :-
    cor(branco),
    tipo(seco),
    acidez(media).

%   Regra 22
%     SE cor vinho = Rosé
%     E  aroma vinho = frutado
%     ENTÃO Sugestão de vinho = Rosé de Provence  CNF 100%
wine(rp) :-
    cor(rose),
    aroma(frutado).

%   Regra 23
%     SE cor vinho = Branco
%     E  aroma vinho = frutado
%     ENTÃO Sugestão de vinho = Riesling CNF 100%
wine(rs) :-
    cor(branco),
    aroma(frutado).
