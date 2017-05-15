s = [1, 1, 2, 2, 3, 4, 4, 5, 5, 6, 7, 8, 9]; % source of each link
t = [2, 10, 10, 3, 4, 5, 9, 6, 8, 7, 8, 9, 10]; % destination of each link

root = 3; % tree rooted at node 3
G = graph(s, t);
t_edge = shortestpathtree(G, root);%generate the all the shortest path edges on the tree
plot(t_edge);

%generate tree data structure through recursive function
shortestPathTree = GenerateShortestPathTree(root, t_edge);
disp(shortestPathTree.tostring);
