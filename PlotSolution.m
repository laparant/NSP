function PlotSolution(S,P)
% Planning
subplot(211);
[r, c] = size(S);
imagesc((1:c), (1:r),S);
colormap([1 1 1; 0.8 0.5 0.4]);
set(gca,'xtick', 1:(c+1));
set(gca,'yTick', 1:(r+1));
axis tight;
set(gca,'xlimmode','manual','ylimmode','manual','layer','bottom'); % Hide ticks
hold all;
for n = 0.5:size(S,1)+0.5
    plot(xlim,[n n],'k');
end
for p = 0.5:size(S,2)+0.5
    plot([p p], ylim,'k');
end
% Y labels
nurses = {};
for n = 1:1:r
    nurses = [nurses;strcat(['Nurse ',num2str(n)])];
end
yticklabels(nurses);
xticklabels(repmat({'AM','PM','N'},1,size(S,2)));

title(['Nurses Schedule' 10 ...
       'Total wages : $' num2str(ObjectiveValue(P,S))],'FontSize',12);

   
% Nurses number constraint
subplot(212);
% Wanted nurses number
plot(1:size(S,2),P.N(:),'.-','linewidth',3,'markersize',30,'color',[0.3 0.4 0.8]);
hold on;
% Actual number of nurses
plot(1:size(S,2),P.N(:),'--.','linewidth',2,'markersize',16,'color',[1 0.5 .3]);

xlim([1 size(S,2)]);
ylim([0 round(max(P.N)/5)+5]);
set(gca,'xtick',1:size(S,2),'ytick',0:round(max(P.N)/5)+5);
grid on;
title(['Nurses Scheduled'],'FontSize',16);
legend({'Nurses required', 'Nurses Scheduled'});
end