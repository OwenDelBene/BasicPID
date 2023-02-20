# BasicPID

## Math behind the controller


## PID Controller in laplace domain:
PID(s) = Kp + Ki * 1/s + Kd * (s/sT + 1)

## PID Controller in discrete domain:
P[n] = Kp*E[n]
I[n] = Ki * t/2 * (E[n] + E[n-1]) + I[n-1]
D[n] = 2Kd/(2T +t) * (E[n] - E[n-1]) + (2T-t)/(2T+t) * D[n-1]

U[n] = P[n] + I[n] + D[n}

Derivative term amplifies high frequency noise, must apply low pass filter.
Derivative spikes during change in setpoint, must take derivative on measurements not error.

Integral can saturate output if held at one point for awhile: Use integral anti-windup. (clamping integral when control signal is at max for a long time)

Real world actuators have limits, U term must be clamped.


## Usage
Create a pid object and call init().
During each iteration of a control loop pass in measurement data and a desired output.
Convert output signal to inputs to actuators
