% Copyright 2013 Paren8esis
% =========================
%
% This program is free software: you can redistribute it and/or modify
%    it under the terms of the GNU General Public License as published by
%    the Free Software Foundation, either version 3 of the License, or
%    (at your option) any later version.

%    This program is distributed in the hope that it will be useful,
%    but WITHOUT ANY WARRANTY; without even the implied warranty of
%    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%    GNU General Public License for more details.

%    You should have received a copy of the GNU General Public License
%    along with this program.  If not, see <http://www.gnu.org/licenses/>.

% File machineTrans.pl
% ====================
% Translation from Greek numbers to English and vice versa.
%
% Syntactic rules for the English numbers were derived from
% "the Oxford's Advanced Learner's Dictionary", while for
% the Greek numbers were derived from G. Mpampiniotis' 
% "Grammatiki tis neas ellinikis".
%
% The program below uses Swi Prolog's GULP extension for UBGs.
% (Tested on SWI-Prolog, 64 bits, Version 6.6.1)
%


% Rules and lexicon for Greek numbers

num(sem:(huns:0 .. tens:0 .. ones:O)) --> miden(sem:(ones:O)), {!}.
num(sem:(huns:0 .. tens:T .. ones:O)) --> teens(sem:(tens:T .. ones:O)), {!}.
num(sem:(huns:H .. tens:T .. ones:O)) -->
	hundred(sem:(huns:H .. tens:T .. ones:O)), {!}.
num(sem:(huns:H .. tens:T .. ones:O)) -->
	hundreds(sem:(huns:H)),
	teens(sem:(tens:T .. ones:O)), {!}.
num(sem:(huns:H .. tens:T .. ones:O)) -->
	hundreds(sem:(huns:H)),
	tens(sem:(tens:T)),
	ones(sem:(ones:O)).


miden(sem:(ones:0)) --> [miden].

ones(sem:(ones:0)) --> [].
ones(sem:(ones:1)) --> [ena].
ones(sem:(ones:2)) --> [dyo].
ones(sem:(ones:3)) --> [tria].
ones(sem:(ones:4)) --> [tessera].
ones(sem:(ones:5)) --> [pente].
ones(sem:(ones:6)) --> [eksi].
ones(sem:(ones:7)) --> [epta].
ones(sem:(ones:8)) --> [okto].
ones(sem:(ones:9)) --> [ennea].

teens(sem:(tens:1 .. ones:0)) --> [deka], {!}.
teens(sem:(tens:1 .. ones:1)) --> [endeka], {!}.
teens(sem:(tens:1 .. ones:2)) --> [dodeka], {!}.
teens(sem:(tens:1 .. ones:3)) --> [deka], [tria], {!}.
teens(sem:(tens:1 .. ones:4)) --> [deka], [tessera], {!}.
teens(sem:(tens:1 .. ones:5)) --> [deka], [pente], {!}.
teens(sem:(tens:1 .. ones:6)) --> [deka], [eksi], {!}.
teens(sem:(tens:1 .. ones:7)) --> [deka], [epta], {!}.
teens(sem:(tens:1 .. ones:8)) --> [deka], [okto], {!}.
teens(sem:(tens:1 .. ones:9)) --> [deka], [ennea].

tens(sem:(tens:0)) --> [].
tens(sem:(tens:2)) --> [eikosi].
tens(sem:(tens:3)) --> [trianta].
tens(sem:(tens:4)) --> [saranta].
tens(sem:(tens:5)) --> [peninta].
tens(sem:(tens:6)) --> [eksinta].
tens(sem:(tens:7)) --> [ebdominta].
tens(sem:(tens:8)) --> [ogdonta].
tens(sem:(tens:9)) --> [eneninta].

hundred(sem:(huns:1 .. tens:0 .. ones:0)) --> [ekato].

hundreds(sem:(huns:0)) --> [].
hundreds(sem:(huns:1)) --> [ekaton].
hundreds(sem:(huns:2)) --> [diakosia].
hundreds(sem:(huns:3)) --> [triakosia].
hundreds(sem:(huns:4)) --> [tetrakosia].
hundreds(sem:(huns:5)) --> [pentakosia].
hundreds(sem:(huns:6)) --> [eksakosia].
hundreds(sem:(huns:7)) --> [eptakosia].
hundreds(sem:(huns:8)) --> [oktakosia].
hundreds(sem:(huns:9)) --> [enniakosia].


% Rules and lexicon for English numbers

numEN(sem:(huns:0 .. tens:0 .. ones:O)) --> 
	zero(sem:(ones:O)), {!}.

numEN(sem:(huns:0 .. tens:0 .. ones:O)) --> 
	onesEN(sem:(ones:O)), {!}.

numEN(sem:(huns:0 .. tens:T .. ones:0)) --> 
	tensEN(sem:(tens:T)), {!}.

numEN(sem:(huns:0 .. tens:T .. ones:O)) --> 
	teensEN(sem:(tens:T .. ones:O)), {!}.

numEN(sem:(huns:0 .. tens:2 .. ones:O)) -->
	twenty(sem:(tens:2)),
	onesEN(sem:(ones:O)), {!}.

numEN(sem:(huns:0 .. tens:T .. ones:O)) -->
	tensEN(sem:(tens:T)),
	[-],
	onesEN(sem:(ones:O)), {!}.

numEN(sem:(huns:H .. tens:0 .. ones:0)) -->
	hundredsEN(sem:(huns:H)), {!}.

numEN(sem:(huns:H .. tens:0 .. ones:O)) -->
	hundredsEN(sem:(huns:H)),
	[and],
	onesEN(sem:(ones:O)), {!}.

numEN(sem:(huns:H .. tens:T .. ones:O)) -->
	hundredsEN(sem:(huns:H)),
	[and],
	teensEN(sem:(tens:T .. ones:O)), {!}.

numEN(sem:(huns:H .. tens:2 .. ones:O)) -->
	hundredsEN(sem:(huns:H)),
	[and],
	twenty(sem:(tens:2)),
	onesEN(sem:(ones:O)), {!}.

numEN(sem:(huns:H .. tens:T .. ones:0)) -->
	hundredsEN(sem:(huns:H)),
	[and],
	tensEN(sem:(tens:T)),
	onesEN(sem:(ones:0)), {!}.

numEN(sem:(huns:H .. tens:T .. ones:O)) -->
	hundredsEN(sem:(huns:H)),
	[and],
	tensEN(sem:(tens:T)),
	[-],
	onesEN(sem:(ones:O)).


zero(sem:(ones:0)) --> [zero].

onesEN(sem:(ones:0)) --> [].
onesEN(sem:(ones:1)) --> [one].
onesEN(sem:(ones:2)) --> [two].
onesEN(sem:(ones:3)) --> [three].
onesEN(sem:(ones:4)) --> [four].
onesEN(sem:(ones:5)) --> [five].
onesEN(sem:(ones:6)) --> [six].
onesEN(sem:(ones:7)) --> [seven].
onesEN(sem:(ones:8)) --> [eight].
onesEN(sem:(ones:9)) --> [nine].

teensEN(sem:(tens:1 .. ones:0)) --> [ten].
teensEN(sem:(tens:1 .. ones:1)) --> [eleven].
teensEN(sem:(tens:1 .. ones:2)) --> [twelve].
teensEN(sem:(tens:1 .. ones:3)) --> [thirteen].
teensEN(sem:(tens:1 .. ones:4)) --> [fourteen].
teensEN(sem:(tens:1 .. ones:5)) --> [fifteen].
teensEN(sem:(tens:1 .. ones:6)) --> [sixteen].
teensEN(sem:(tens:1 .. ones:7)) --> [seventeen].
teensEN(sem:(tens:1 .. ones:8)) --> [eighteen].
teensEN(sem:(tens:1 .. ones:9)) --> [nineteen].

twenty(sem:(tens:2)) --> [twenty].

tensEN(sem:(tens:0)) --> [].
tensEN(sem:(tens:3)) --> [thirty].
tensEN(sem:(tens:4)) --> [fourty].
tensEN(sem:(tens:5)) --> [fifty].
tensEN(sem:(tens:6)) --> [sixty].
tensEN(sem:(tens:7)) --> [seventy].
tensEN(sem:(tens:8)) --> [eighty].
tensEN(sem:(tens:9)) --> [ninety].

hundredsEN(sem:(huns:1)) --> onesEN(sem:(ones:1)), [hundred].
hundredsEN(sem:(huns:2)) --> onesEN(sem:(ones:2)), [hundred].
hundredsEN(sem:(huns:3)) --> onesEN(sem:(ones:3)), [hundred].
hundredsEN(sem:(huns:4)) --> onesEN(sem:(ones:4)), [hundred].
hundredsEN(sem:(huns:5)) --> onesEN(sem:(ones:5)), [hundred].
hundredsEN(sem:(huns:6)) --> onesEN(sem:(ones:6)), [hundred].
hundredsEN(sem:(huns:7)) --> onesEN(sem:(ones:7)), [hundred].
hundredsEN(sem:(huns:8)) --> onesEN(sem:(ones:8)), [hundred].
hundredsEN(sem:(huns:9)) --> onesEN(sem:(ones:9)), [hundred].


% translate/2 
% Use as: translate(GreekNumber, EnglishNumber) by providing at least
% one argument. Arguments are formed as lists of words,
% e.g. [one, hundred, and, thirty, -, two] for EN
% or [ekaton, trianta, dyo] for GR.
translate(GR, EN) :-
	(nonvar(GR), num(Sem, GR, []), numEN(Sem, EN, []));
	(nonvar(EN), numEN(Sem, EN, []), num(Sem, GR, [])).

