import std.stdio;
import std.random;
import std.math;


auto inCircle(double x, double y){
	if( sqrt(x*x + y*y) <= 1){
		return true;
	}
	return false;
}

void main(){
	auto rnd = Random(unpredictableSeed);
	int nbPoint = 0;
	int nbPointInCircle = 0;	
	const auto limite = 10000000 - 1;
	int i = 0;
	while(i <= limite){
		double x = uniform(-1.0, 1.0, rnd);
		//writeln(x);
		double y = uniform(-1.0, 1.0, rnd);
		//writeln(y);

		nbPoint++;

		if (inCircle(x,y)){
			nbPointInCircle++;
		}
		i++;
	}

	writeln("nbPointInCircle : ", nbPointInCircle, "\nnbPoint : ", nbPoint, "\nPI = ", (nbPointInCircle/float(nbPoint))*4.0 );
}
