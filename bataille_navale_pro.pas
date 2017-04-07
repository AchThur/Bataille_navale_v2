program bataille_navale_pro;
uses crt ;
const
	NbBateau = 5;
	MaxCase = 5;
	MinL = 1;
	MaxL = 50;
	MinC = 1;
	MaxC = 50;
	
	type cases = record
		Ligne:integer;
		Col:integer;
	end;
	
	type bateau = record
		nCase : array [1..MaxCase] of cases;
	end;
	
	type flotte = record
		nBateau : array [1..NbBateau] of bateau;
	end;
	
	type position_bateau = (enLigne,enColonne,enDiag);
	type Etat_bateau = (toucher, couler);
	type etat_flotte = (aFlot,aSombre);
	type etat_joueur = (gagne,perd);
	
	
procedure creat_case (L,C : integer ; var tCase : cases);
	begin
		Tcase.ligne := L;
		Tcase.Col:= C;
	end;


function CmpCase (nCase, tCase : cases): boolean;
	begin
		if ((nCase.col = tCase.col) and (nCase.ligne = tCase.ligne)) then
			CmpCase := true	
		else
			CmpCase:=false;
	end;


function creation_bateau (nCase : cases ;taille : integer) : bateau;
var
	Res : bateau;
	i,pos:integer;
	pos_bateau:position_bateau;
begin
	randomize;
	pos:= random (3) + 1;
	pos_bateau:=position_bateau(pos);
	for i:=1  to MaxCase do
	begin
		if (i <= taille) then
			begin
			Res.nCase[i].ligne:=nCase.Ligne;
			Res.nCase[i].col:=nCase.col;
			end
		else
			begin
			Res.nCase[i].Ligne:=0;
			Res.nCase[i].col:=0;
			end;
	end;
	
	if (pos_bateau = enLigne) then
		nCase.col:=nCase.col + 1
	else if(pos_bateau = enColonne) then
		nCase.ligne:=nCase.Ligne+1
	else
	begin
		nCase.col := nCase.col + 1;
		nCase.ligne := nCase.Ligne + 1;
	end;
	
	creation_bateau:=Res;
end;

function ctrlcase (mBat : bateau; nCase : cases ) : boolean;
var
	Valtest : boolean;
	i : integer;
begin
	Valtest:=false;
	for i := 1 to MaxCase do
	begin
		if (cmpCase(mBat.nCase[i], nCase)) then
		Valtest := true;
	end;
	ctrlCase := Valtest;
end;

function ctrlflotte(nFlotte : Flotte; nCase : cases) : boolean;
var
	i:integer;
	Valtest : boolean;
begin
	Valtest:=false;
	for i := 1 to NbBateau do
	begin
		if (ctrlCase(nFlotte.nBateau[i],nCase)) then
		Valtest:=true;
	end;
	ctrlFlotte := Valtest;
end;

var
	phlaute : flotte;
	i : integer;
	
	taille : integer;
	position : cases;
	
begin
	clrscr;
	for i := 1 to NbBateau do
	begin
		randomize;
		taille := random(MaxCase) + 1;
		position.ligne := random(MaxL) + 1;
		position.col := random(MaxC) + 1;
		phlaute.nBateau[i] := creation_bateau(position, taille);
		writeln('Bateau numero ', i, ': Ligne = ', phlaute.nBateau[i].nCase[i].Ligne, ' ET Colonne = ', phlaute.nBateau[i].nCase[i].col);
	end;
		
	readln;
end.
	
	
