function ind = genetic_op(subproblems, index, domain, params)
    % 使用当前的种群进行差分进化
    %GENETICOP function implemented the DE operation to generate a new
    %individual from a subproblems and its neighbours.

    %   subproblems: is all the subproblems. 所有的子问题
    %   index: the index of the subproblem need to handle. 子问题的编号
    %   domain: the domain of the origional multiobjective problem. 定义域
    %   ind: is an individual structure. 个人结构？

    % 提取出邻居矩阵
    neighbourindex = subproblems(index).neighbour;

    %The random draw from the neighbours.
    %　从邻居中进行随机的抽取
    nsize = length(neighbourindex);
    si = ones(1, 3) * index;

    si(1) = neighbourindex(ceil(rand * nsize));

    while si(1) == index
        si(1) = neighbourindex(ceil(rand * nsize));
    end 

    si(2) = neighbourindex(ceil(rand * nsize));

    while si(2) == index || si(2) == si(1)
        si(2) = neighbourindex(ceil(rand * nsize));
    end 

    si(3) = neighbourindex(ceil(rand * nsize));

    while si(3) == index || si(3) == si(2) || si(3) == si(1)
        si(3) = neighbourindex(ceil(rand * nsize));
    end 

    %retrieve the individuals.
    points = [subproblems(si).curpoint];
    selectpoints = [points.parameter];

    oldpoint = subproblems(index).curpoint.parameter;
    parDim = size(domain, 1);

    jrandom = ceil(rand * parDim);

    randomarray = rand(parDim, 1);
    deselect = randomarray < params.CR;
    deselect(jrandom) = true;
    newpoint = selectpoints(:, 1) + params.F * (selectpoints(:, 2) - selectpoints(:, 3));
    newpoint(~deselect) = oldpoint(~deselect);

    %repair the new value.
    newpoint = max(newpoint, domain(:, 1));
    newpoint = min(newpoint, domain(:, 2));

    ind = struct('parameter', newpoint, 'objective', [], 'estimation', []);
    %ind.parameter = newpoint;
    %ind = realmutate(ind, domain, 1/parDim);
    ind = gaussian_mutate(ind, 1 / parDim, domain);

    %clear points selectpoints oldpoint randomarray deselect newpoint neighbourindex si;
end 
