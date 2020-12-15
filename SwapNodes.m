function [matrix] = SwapNodes(matrix, i, j)
    matrix(:,[i,j])=matrix(:,[j,i]);
    matrix([i,j],:)=matrix([j,i],:);
end