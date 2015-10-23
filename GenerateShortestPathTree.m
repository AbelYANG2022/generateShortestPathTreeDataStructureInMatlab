

function [t] = GenerateShortestPathTree(root, t_edge)
%% tree data structure generator function
%% input: 
    %root: the root node | data type: cell | eg. {'1'}
    %t_edge: the shortest path data structure | data type: digraph | eg.
        %t_edge.Edges = table: '2' '1'; '2' '0'  
%% output:
    %t: the tree data structure | dta type: tree
    
%%
    t = tree(root);%node is cell format
    tem = t_edge.Edges{:,:}(:,1);
    indexChild = find(str2num(cell2mat(tem(:, 1))) == str2num(cell2mat(root(1))));% find the edge start with root
    child = t_edge.Edges{indexChild,:}(:,2);%find the child, cell
    if isempty(child)
        return;
    end
    for i = 1: numel(child)
        subTree = GenerateShortestPathTree(child(i), t_edge);
        t = t.graft(1, subTree);%add the subtree to the current node
    end
end
