#include "BasicPID.h"



int main()
{
	PIDController pid;
	float kp = .1;
	float ki = .2;
	float kd = .3;

	//how much you trust sensor measurements
	float lpf = 0.01f;

	float maxCurrent = 2.0f;
	float minCurrent = -maxCurrent;
	float dt = 1.0f;
	float time= 0;
	float tf = 100.0f;


	PIDInit(&pid, kp, ki, kd, lpf, dt,maxCurrent, minCurrent);

	while (time < tf)	
	{
		float xMeasurement = 1.0f;

		PIDUpdate(&pid, 0.0f,xMeasurement); 

	}

}
