%computes MI for all pairs of districts.  MI matrix will be symmetric
clear MI
%number of bins
Nx=30;
Ny=30;
N=775;  %number of weeks
M=56;  %number of counties
MI=zeros(M,M);
H=zeros(M,M);
num=linspace(1,56,56);
for k=1:M
    for l=1:M
    
         C1=dat(:,k);
         C2=dat(:,l);
      
        E=zeros(Nx,1);
        EY=zeros(Nx,1);
        EXY=zeros(Nx,1);

        %make frequency tables
if k==40
    if l==30
        marg1=hist(C1,Ny)/N;
        marg2=hist(C2,Nx)/N;
        joint=hist3(v, [Nx,Ny])/N;
    end
end
    
        C1dist=hist(C1,Ny)/N;
        C2dist=hist(C2,Nx)/N;

        v=[C1 C2]; %samples to be binned up
        PP=hist3(v, [Nx,Ny]);   %make a 2D histogram of both, with given bin sizes
        Pdist=PP/(N);   %normalize it

        %use entropy formulas for pdfs
        %compute H(X,Y) joint entropy
        sumH=0;
        for j=1:Nx
            sum1=0;
            for i=1:Ny
                if Pdist(j,i) ~= 0 
                    sum1=sum1+Pdist(j,i)*log2(Pdist(j,i));
                end
            end
            sumH=sumH+sum1;
        end

        sum2=0;
        %compute H for D2 (X)
        for i=1:Nx
            if C2dist(i) ~= 0 
                sum2=sum2+C2dist(i)*log2(C2dist(i));
            end
        end

        sum3=0;
        %compute H for D1 (Y)
        for i=1:Ny
            if C1dist(i) ~= 0 
                sum3=sum3+C1dist(i)*log2(C1dist(i));
            end
        end

        HX=-sum2;
        HY=-sum3;
        HXY=-sumH;

        %MI=HY+HX-HXY
        MI(k,l)=(HY+HX-HXY)/(HX+HY)*2;
        H(k,l)=HXY;

    end
end
tot=sum(MI);

MItotshort=[num' tot'];
sortedMItotshort=bubblevecsort(MItotshort);

%xticklabels({['Te ','BW',' Cus',' YS ','Car',' Fal',' Lin',' Val',' Par',' Pon',' Gal',' Fer',' Daw ','Rav ','DL ','SB ','Cho ','Roo',' Mis ','Hil',' Cas',' FH ','Jef ','SW ','Bla ','She',' L&C']}) 
%xticklabels({['L&C','BH','YS','Glac','Cas','Beav','Linc','SB','Gal','FH','Lake','MSO','Rav']})