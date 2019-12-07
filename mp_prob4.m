function mp_prob4

h = input('Please enter the initial height: ');
vo = input('Please enter the initial velocity: ');
deg = input('Please enter the angle in degrees: ');
ax = input('Please enter the x-component of acceleration in m/s^2: ');
ay = input('Please enter the y-component of acceleration in m/s^2: ');

if ay>=0
    fprintf(2,'Error. Please try again.\n\n')
end

vox = vo*cosd(deg);
voy = vo*cosd(deg);

tm = max(roots([(ay/2) voy h]));
d = 0:0.01:tm;
x = zeros(1, length(d)+1);
y = zeros(1, length(d)+1);

t = 0.01;
x(1) = 0;
y(1) = h;

for i = 1:length(d)-1
    xt = (ax*(t^2))/2 + vox*t;
    yt = (ay*(t^2))/2 + voy*t + h;
    x(i+1) = xt;
    y(i+1) = yt;
    t = t + 0.01;
end

x(length(d)+1) = (ax/2)*tm^2 + vox*0.01;
y(length(d)+1) = 0;

plot(x,y)
grid on

xlim([0 max(x)+1])
ylim([0 max(y)+1])
ylabel('height')
xlabel('distance')