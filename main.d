import std.stdio;
import std.random;
import std.math;



auto monteCarloPi(const int limite){
	auto rnd = Random(unpredictableSeed);
	int nbPoint = 0;
	int nbPointInCircle = 0;	
	int i = 0;
	while(i <= limite){
		double x = uniform(-1.0, 1.0, rnd);
		double y = uniform(-1.0, 1.0, rnd);

		nbPoint++;

		if ( sqrt(x*x + y*y) <= 1){
			nbPointInCircle++;
		}
		i++;
	}

	writeln("nbPointInCircle : ", nbPointInCircle, "\nnbPoint : ", nbPoint, "\nPI = ", (nbPointInCircle/float(nbPoint))*4.0 );
	return (nbPointInCircle/float(nbPoint))*4.0;
}

auto Moyenne(double[] liste, int nbValeur){
	int b = 0;
	double PiMoyenne = 0;
	while(b <= nbValeur){
		PiMoyenne += liste[b];
		b++;
	}
	return PiMoyenne/double(nbValeur+1);
}

auto EcartType(double[] liste, int nbValeur, double moyenne){
	int c = 0;
	double ecartType = 0;
	while(c <= nbValeur){
		ecartType += (liste[c] - moyenne)*(liste[c] - moyenne);
		c++;
	}
	ecartType = sqrt(ecartType/double(nbValeur+1));
	return ecartType;
}

void main(){
	int limite;
	int nbPiEstimation;
	double[] listPi;
	int a = 0;

	readf!" %d"(limite);
	readf!" %d"(nbPiEstimation);

	while(a <= nbPiEstimation){
		listPi ~= monteCarloPi(limite);
		a++;
	}
	double moyenne = Moyenne(listPi, nbPiEstimation);
	writeln("Moyenne = ", moyenne);
	double ecartType = EcartType(listPi, nbPiEstimation, moyenne);
	writeln("ecartType =", ecartType);
}
