function output = a(input)
    a = 0:0.01:3;
    b = 0:0.01:3;

    for i = 1:300

        for j = 1:300
            x(i, j) = a(i);
            y(i, j) = a(j);
            q = evaluate([a(i), b(j)]);
            c(i, j) = q(2);
        end 

    end 

    figure(2)
    plot3(x, y, c)
end 

function y = evaluate(x)
    y = zeros(2, 1);
    c = x(1) + x(2);
    f = 9 - (3 * sin(2.5 * c^0.5) + 3 * sin(4 * c) + 5 * sin(2 * c + 2));
    g = (pi / 2.0) * (x(1) - x(2) + 3.0) / 6.0;
    y(1) = 20 - (f * cos(g));
    y(2) = 20 - (f * sin(g));
end 
