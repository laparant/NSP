function TabuList = updateTabuList(NSP,mvt, TabuList)
for j =1:1:size(TabuList,1)
    for i=1:1:size(TabuList,2)-1
        for k=i+1:1:size(TabuList,2)
            if isequal(mvt,[j i k])
                TabuList(j,i,k) = NSP.TabuLength;
            else
                TabuList(j,i,k) = max(TabuList(j,i,k)-1,0);
            end
        end
    end
end
end

