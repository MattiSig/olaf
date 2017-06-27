fall (a, b, c) {
	var d;
	d = a+b+c;
	return d;
}

main() {
	var tmp,f1,f2,i,c;
	c = true;
	f1 = 1;
	f2 = 1;
	i = 0;
	
	while(i<10){
		writeln(f1);
		tmp = f1 + f2;
		f1 = f2;
		f2 = tmp;
		i = i +1;
	};

	writeln(fall(1,2,3));
	
	if(true) {writeln("Rett1");};

	if(false) {writeln("Rangt");};

	if(false) {writeln("Rangt");}
	elseif(true) {writeln("Rett2");}
	else {writeln("Rangt");};

	if(false) {writeln("Rangt");}
	else {writeln("Rett3");};

	if(false) {writeln("Rangt");}
	elseif(false) {writeln("Rangt");}
	elseif(true) {writeln("Rett4");}
	elseif(true) {writeln("Rangt");}
	else {writeln("Rangt");};

}