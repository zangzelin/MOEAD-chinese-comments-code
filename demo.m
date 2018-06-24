function demo()
    % 导入多目标的测试函数
    mop = testmop('zdt1', 30);
    % 使用moead函数求解多目标最优解
    % 种群规模，100，迭代次数，200，相邻种群数，20，方法，te
    pareto = moead(mop, 'popsize', 100, 'niche', 20, 'iteration', 200, 'method', 'te');

    %pareto = moead( mop,'popsize', 100, 'niche', 20, 'iteration', 200, 'method', 'ws');

end 
