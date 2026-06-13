% 二维线性系统 dx/dt = Ax 的向量场与相图绘制脚本
% 用户可修改矩阵 A 和初值 x0，运行即可得到相图
% 零斜率点/线 (Ax=0) 用红色标示

clear; close all;

% ========== 用户可修改参数 ==========
A = [-1, 1; 0, -1];          % 2x2 矩阵，可修改为任意实矩阵
x0 = [-0.5; 0.5];% 初始点 (列向量)

% 绘图范围与网格密度
xlims = [-3, 3];              % x 轴范围
ylims = [-3, 3];              % y 轴范围
nx = 20;                      % x 方向网格点数
ny = 20;                      % y 方向网格点数
% 轨线积分时间限制
Tmax = 20;                    % 最大积分时间（正/负方向）
% ===================================

% 生成网格点
x = linspace(xlims(1), xlims(2), nx);
y = linspace(ylims(1), ylims(2), ny);
[X, Y] = meshgrid(x, y);

% 计算向量场 U = A(1,1)*X + A(1,2)*Y, V = A(2,1)*X + A(2,2)*Y
U = A(1,1).*X + A(1,2).*Y;
V = A(2,1).*X + A(2,2).*Y;

% 绘制向量场
figure('Color','white');
quiver(X, Y, U, V, 1.5, 'Color', [0.5 0.5 0.5], 'LineWidth', 0.8);
hold on;

% 标示 Ax = 0 的点或直线 (红色)
rankA = rank(A);
nullA = null(A);
if rankA == 2
    % 只有原点是零斜率点
    plot(0, 0, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
elseif rankA == 1
    % 零空间是一条过原点的直线
    v = nullA(:,1);          % 方向向量
    % 将直线延伸到绘图边界
    t_vals = [linspace(-10, 10, 2)];  % 足够覆盖
    line_points = v * t_vals;
    plot(line_points(1,:), line_points(2,:), 'r-', 'LineWidth', 2);
    plot(0, 0, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
elseif rankA == 0
    % A 是零矩阵，整个平面都是零斜率点
    % 在图中给出文本提示
    text(mean(xlims), mean(ylims), 'A = 0, 全平面零斜率', ...
        'Color','r','FontSize',12,'HorizontalAlignment','center');
end

% 绘制过初值 x0 的轨线（双向积分）
% 定义 ODE 函数
odefun = @(t, x) A * x;

% 事件函数：当轨线超出绘图范围时停止积分
function [value, isterminal, direction] = outOfBounds(t, x, xlims, ylims)
    value = [x(1) - xlims(1); xlims(2) - x(1); ...
             x(2) - ylims(1); ylims(2) - x(2)];
    isterminal = ones(4,1);   % 全部停止
    direction = zeros(4,1);   % 任何方向
end

opts = odeset('Events', @(t,x) outOfBounds(t, x, xlims, ylims), ...
              'RelTol', 1e-8, 'AbsTol', 1e-10);

% 正向积分 (t >= 0)
[~, x_fwd] = ode45(odefun, [0, Tmax], x0, opts);
% 反向积分 (t <= 0)
[~, x_bwd] = ode45(odefun, [0, -Tmax], x0, opts);

% 将正反向轨迹合并：反向轨迹从后往前取，去掉重复的起点
x_traj = [flipud(x_bwd); x_fwd(2:end,:)];

% 绘制轨线
plot(x_traj(:,1), x_traj(:,2), 'b-', 'LineWidth', 1.5);
% 标记初值点
plot(x0(1), x0(2), 'go', 'MarkerSize', 8, 'MarkerFaceColor', 'g');

% 在轨线上添加方向箭头（取正向部分的中点）
if size(x_fwd,1) > 2
    mid_idx = round(size(x_fwd,1)/2);
    % 使用annotation或直接在图上画小箭头，这里用quiver在轨线上画一个箭头
    % 获取箭头位置和方向
    x_mid = x_fwd(mid_idx, :);
    dx = A * x_mid';
    % 归一化方向
    dx = dx / norm(dx) * 0.3;  % 箭头长度
    quiver(x_mid(1), x_mid(2), dx(1), dx(2), 0, ...
        'Color', 'b', 'LineWidth', 1.5, 'MaxHeadSize', 0.8);
end
if size(x_bwd,1) > 2
    mid_idx = round(size(x_bwd,1)/2);
    x_mid = x_bwd(mid_idx, :);
    dx = A * x_mid';
    dx = dx / norm(dx) * 0.3;
    quiver(x_mid(1), x_mid(2), dx(1), dx(2), 0, ...
        'Color', 'b', 'LineWidth', 1.5, 'MaxHeadSize', 0.8);
end

% 图形修饰
xlabel('x_1');
ylabel('x_2');
title(sprintf('相图: A = [%.2f %.2f; %.2f %.2f],  x_0 = [%.2f; %.2f]', ...
    A(1,1), A(1,2), A(2,1), A(2,2), x0(1), x0(2)));
axis equal;
xlim(xlims);
ylim(ylims);
grid on;
box on;

% 图例
h_vec = findobj(gca,'Type','Quiver','-and','Color',[0.5 0.5 0.5]);
% 仅保留向量场的一个箭头作为图例
if ~isempty(h_vec)
    h_vec = h_vec(1);
end
% 简单图例，可能与其他quiver箭头冲突，直接在title说明
% 添加文本注释
text(0.02, 0.98, '灰色箭头: 向量场  |  红色: Ax=0  |  蓝色: 轨线  |  绿点: 初值', ...
    'Units','normalized', 'VerticalAlignment','top', 'FontSize', 9, ...
    'BackgroundColor', 'w');

hold off;
