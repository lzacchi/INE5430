acidity(little_acid).
acidity(medium_acid).
acidity(acid).

profile(light).
profile(full_bodied).
profile(medium_bodied).

aroma(fruity).

dryness(dry).

color(rose).
color(red).
color(white).


wine(pn, "Pinot Noir").
wine(cs, "Cabernet Sauvignon").
wine(rs, "Riesling").
wine(cr, "Champagne Rosé").
wine(rp, "Rosé de Provence").
wine(cn, "Chianti Novo").
wine(sb, "Sauvignon Blanc").
wine(mr, "Merlot").
wine(bb, "Bordeaux Blanc").
wine(ch, "Chianti Reserva").


white_meat(pork).
white_meat(poultry).

red_meat(grilled).
red_meat(bbq).
red_meat(with_sauce).

vegetable(eggplant_zuchinni).
vegetable(delicate_sauce).

pasta(high_fat).
pasta(tomato).
pasta(aglio_olio).

fish(smoked).
fish(fry_bbq).
fish(steamed).

dessert(chocolate).
dessert(fruit).


plate(red_meat).
plate(fish).
plate(pasta).
plate(dessert).



% REGRAS

%   Regra 1
%     SE tipo prato = Peixes e frutos do Mar
%     E  Tipo Peixe = Peixe no vapor
%     ENTÃO cor vinho = Branco CNF 100%
%           tipo vinho = Seco CNF 100%
%           corpo do vinho = leve CNF 100%

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

acidity(medium_acid) :-
    plate(red_meat),
    red_mead(grilled).

%   Regra 11
%     SE tipo prato = Carne vermelha
%     E  Tipo Carne Vermelha = com molho
%     OU Tipo Carne Vermelha = assada
%     ENTÃO tipo vinho = Seco CNF 100%
%           cor vinho = Tinto CNF 100%
%           corpo do vinho = encorpado CNF 100%

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
    color(red),
    dryness(dry),
    profile(leve).

%   Regra 15
%     SE cor vinho = Branco
%     E  tipo vinho = Seco
%     E  corpo do vinho = médio encorpado
%     ENTÃO Sugestão de vinho = Sauvignon Blanc CNF 100%
wine(sb) :-
    color(white),
    dryness(dry),
    profile(medio).

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
    color(white),
    dryness(dry),
    acidity(acid).


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
    color(white),
    dryness(dry),
    acidity(medium_acid).

%   Regra 22
%     SE cor vinho = Rosé
%     E  aroma vinho = frutado
%     ENTÃO Sugestão de vinho = Rosé de Provence  CNF 100%
wine(rp) :-
    color(rose),
    aroma(fruity).

%   Regra 23
%     SE cor vinho = Branco
%     E  aroma vinho = frutado
%     ENTÃO Sugestão de vinho = Riesling CNF 100%
wine(rs) :-
    color(white),
    aroma(fruity).
