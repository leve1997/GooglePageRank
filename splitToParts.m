function indexes = splitToParts(m, k, start)
% dijelimo dangling nodove u m particija
% start = broj nondangling cvorova - da znamo od kud pocinjemo brojati
if start < 1
    return;
end
pom = floor(m / k);
remainder = mod(m, k);
% indexes(1,:) - pocetan index, indexes(2,:) - zadnji index u pojedinim
% vektorima
indexes = zeros(2,k + 1); %alokacija
%inicijalizacija
indexes(1, 1) = 1;
indexes(2, 1) = start;
for i = 2:k+1
    indexes(1, i) = indexes(2, i - 1) + 1;
    if remainder > 0
        indexes(2, i) = indexes(1, i) + pom;
        remainder = remainder - 1;
    else
        indexes(2, i) = indexes(1, i) + pom - 1;
    end
end
end

