function H = readFromFile()
fileID = fopen('web_google.txt', 'r');
H = fscanf(fileID, '%d %d', [2 inf]);
fclose(fileID);
H = (H + 1)';
end

