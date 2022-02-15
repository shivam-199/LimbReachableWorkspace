x = 0;
y = 0;
while x^2 + y^2 <= RADIUS^2
    plot(x, y, "ro")
    x = x + 0.1;
    y = y + 0.1;
end