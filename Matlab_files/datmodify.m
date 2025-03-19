function datmodify(dataarray, tmin, tmax, movex,filename)
temporary=zeros(tmax-tmin+1,411,3);
for ii=tmin:1:tmax
    for posx=1:1:411
       if (mod(posx+movex,411)==0)
         temporary(ii-tmin+1,411,:)=dataarray(ii,posx,:);
       else
           temporary(ii-tmin+1,mod(posx+movex,411),:)=dataarray(ii,posx,:);
       end
    end
end

for jj=tmin:1:tmax
   dataarray(jj,:,:)= temporary(jj-tmin+1,:,:);
end

dlmwrite(filename,dataarray);

end