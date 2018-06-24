function ind = randompoint(prob, n)
    %　从问题中随机的初始化点
    %RANDOMNEW to generate n new point randomly from the mop problem given.

    if (nargin == 1)
        n = 1;
    end 

    % 先生成一列随机数
    randarray = rand(prob.pd, n);
    lowend = prob.domain(:, 1);
    span = prob.domain(:, 2) - lowend;
    point = randarray .* (span(:, ones(1, n))) + lowend(:, ones(1, n));
    % 然后把生成的随机数变成变成元孢
    cellpoints = num2cell(point, 1);

    % 吧生成的元孢装进ind中
    indiv = struct('parameter', [], 'objective', [], 'estimation', []);
    ind = repmat(indiv, 1, n);
    [ind.parameter] = cellpoints{:};

    % estimation = struct('obj', NaN, 'std', NaN);
    % [ind.estimation] = deal(repmat(estimation, prob.od, 1));
end 
