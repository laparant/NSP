function [ S ] = RandomSolve( P )
    [nbInf,nbP]=size(P.X);
    
    
    S = P.X;
    

    while sum(sum(S))<sum(P.N)
        S= P.X;
        R = randperm(nbInf*nbP);
        
        %Pour toutes les cases du tableau de mani�re al�atoire
        for  d=1:nbInf*nbP
            r=R(d);
            i=ceil(r/nbInf);
            j=mod(r,nbInf);
            if j==0
               j=nbInf ;
            end
            %Si la case est non remplie,y placer une infirmi�re
            if S(i,j)==-1
                if sum(S(i,:)==1) < P.Tmax(1,i) %l'infirmi�re est encore disponible, on l'affecte � cette periode
                    if sum(S(:,j)==1)< P.N(1,j) %S'il y a encore besoijn d'une infirm�re pour cette periode
                        S(i,j)=1;
                        switch j
                           case 1
                               S(i,j+1)=0;
                               S(i,j+2)=0;
                           case 2
                               S(i,j-1)=0;
                               S(i,j+1)=0;
                               S(i,j+2)=0;
                           case nbP
                               S(i,j-1)=0;
                               S(i,j-2)=0;
                           case nbP-1
                               S(i,j+1)=0;
                               S(i,j-1)=0;
                               S(i,j-2)=0;
                           otherwise
                               S(i,j-2)=0;
                               S(i,j-1)=0;
                               S(i,j+1)=0;
                               S(i,j+2)=0;
                        end
                    else %La periode n'a plus besoin d'infirm�re
                        for l=1:nbInf
                            if S(l,j)==-1
                               S(l,j)=0; 
                            end
                        end
                    end
                else %L'infirmi�re n'est plus disponible, on remplit le restant de ses p�riodes � allouer � 0
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
