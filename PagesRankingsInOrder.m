function [tbl] = PagesRankingsInOrder(pr,perm,nodes)
Pagerank=pr';
WebPage=nodes(perm);
tbl=table(Pagerank, WebPage);
tbl=sortrows(tbl,{'Pagerank'},{'descend'});
end