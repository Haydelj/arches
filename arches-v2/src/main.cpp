#include "stdafx.hpp"

//#include "trax.hpp"
#include "dual-streaming.hpp"
//#include "describo.hpp"

//global verbosity flag
int arches_verbosity = 1;

int main(int argc, char* argv[])
{
	Arches::run_sim_dual_streaming(argc, argv);
	//Arches::run_sim_describo(argc, argv);
	return 0;
}