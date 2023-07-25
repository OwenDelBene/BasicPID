# BasicPID

### Math behind the controller


##### PID Controller in laplace domain:
$U(s) = K_p + K_i * \frac{1}{s} + K_d * s $

##### PID Controller in discrete domain:
$P_n = Kp*E_n $

$I_n = Ki * \frac{t}{2} * (E_n + E_{n-1}) + I_{n-1} $

$D_n = \frac{2Kd}{2T +t} * (E_n - E_{n-1} + \frac{2T-t}{2T+t} * D_{n-1} $

$U_{n} = P_{n} + I_{n} + D_{n} $

### Practical Notes
- Derivative term amplifies high frequency noise, must apply low pass filter.
- Derivative spikes during change in setpoint, must take derivative on measurements not error.

- Integral can saturate output if held at one point for awhile: Use integral anti-windup. (clamping integral when control signal is at max for a long time)

- Real world actuators have limits, U term must be clamped.


### Usage
- Create a pid object and call init().
- During each iteration of a control loop pass in measurement data and a desired output to update().
- Convert output signal to inputs to actuators
