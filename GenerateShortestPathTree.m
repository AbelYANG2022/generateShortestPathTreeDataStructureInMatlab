function [t] = GenerateShortestPathTree(root, t_edge)
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
