function [ S ] = RandomSolve( P )
    [nbInf,nbP]=size(P.X);
    S = P.X;
    
    while sum(sum(S))<sum(P.N)
        
        S = P.X;
        R = 1:nbInf*nbP;
        Weights = repmat(P.N,1,nbInf);
        Weights = Weights./sum(Weights);
        %Pour toutes les cases du tableau de manière aléatoire
        for  d=1:nbInf*nbP
            if d~=nbInf*nbP
                r = randsample(R, 1, true, Weights);
            else
                r = R(1);
            end
            ind = find(R==r);
            R(ind)=[];
            Weights(ind)=[];
            i=ceil(r/nbP);
            j=mod(r,nbP);
            if j==0
               j=nbP;
            end
            %Si la case est non remplie,y placer une infirmière
            if S(i,j)==-1
                if sum(S(i,:)==1) < P.Tmax(i) %l'infirmière est encore disponible, on l'affecte à cette periode
                    if sum(S(:,j)==1)< P.N(j) %S'il y a encore besoin d'une infirmère pour cette periode
                        S(i,j)=1;
                        if j-1 > 0
                            S(i,j-1) = 0;
                        end
                        if j-2 > 0
                            S(i,j-2) = 0;
                        end
                        if j+1 <= nbP
                            S(i,j+1) = 0;
                        end
                        if j+2 <= nbP
                            S(i,j+2) = 0;
                        end
                    else %La periode n'a plus besoin d'infirmère
                        for l=1:nbInf
                            if S(l,j)==-1
                               S(l,j)=0; 
                            end
                        end
                    end
                else %L'infirmière n'est plus disponible, on remplit le restant de ses périodes à allouer à 0
                    for l=1:nbP
                        if S(i,l)==-1
                            S(i,l)=0;
                        end
                    end
                end
            end
        end
    end
end
