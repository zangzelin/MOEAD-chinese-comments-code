function subp = init_weights(popsize, niche, objDim)
    % 权值向量初始化函数，使用分解权重和近邻关系来初始化权值向量
    % init_weights function initialize a pupulation of subproblems structure
    % with the generated decomposition weight and the neighbourhood
    % relationship.

    % 初始化权值向量
    subp = [];

    % 循环所有的种群规模

    for i = 0:popsize

        % 如果目标有两个，这里可以扩展

        if objDim == 2
            % 每个子问题都有
            p = struct('weight', [], 'neighbour', [], 'optimal', Inf, 'optpoint', [], 'curpoint', []);

            % 平均划分，定义每个权值向量，然后吧定义好的所有向量装进subp
            weight = zeros(2, 1);
            weight(1) = i / popsize;
            weight(2) = (popsize - i) / popsize;
            p.weight = weight;
            subp = [subp p];
        elseif objDim == 3
            %TODO
        end 

    end 

    % weight = lhsdesign(popsize, objDim,'criterion', 'maximin', 'iterations', 1000)';
    % p=struct('weight', [], 'neighbour', [], 'optimal', Inf, 'optpoint', [], 'curpoint', []);
    % subp = repmat(p, popsize, 1);
    % cells = num2cell(weight);
    % [subp.weight]=cells{:};

    %Set up the neighbourhood.
    % 定义邻居
    % 每一个向量将邻居中所有的向量中较近的定义为邻居向量。
    leng = length(subp);
    distanceMatrix = zeros(leng, leng); % 距离矩阵

    % 计算每两个点间的距离
    for i = 1:leng
        for j = i + 1:leng

            A = subp(i).weight; B = subp(j).weight;
            distanceMatrix(i, j) = (A - B)' * (A - B);
            distanceMatrix(j, i) = distanceMatrix(i, j);
        end 

        [s, sindex] = sort(distanceMatrix(i, :));
        subp(i).neighbour = sindex(1:niche)';
    end 

end 
