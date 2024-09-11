% 读取 JSON 文件
filename = '../data/广东省.json';
fid = fopen(filename, 'r', 'n', 'utf-8');
raw = fread(fid, inf);
str = char(raw');
fclose(fid);
data = jsondecode(str);

% 初始化城市坐标
guangzhou = [];
shenzhen = [];
foshan = [];
dongguan = [];

% 遍历 JSON 文件中的 features
for i = 1:length(data.features)
    feature = data.features(i);
    name = feature.properties.name;

    % 根据城市名称提取坐标
    if strcmp(name, '广州市')
        disp(['名称: ', name])
        guangzhou = feature.geometry.coordinates{1}{1};
    elseif strcmp(name, '深圳市')
        disp(['名称: ', name])
        shenzhen = feature.geometry.coordinates{1}{1};
    elseif strcmp(name, '东莞市')
        disp(['名称: ', name])
        dongguan = feature.geometry.coordinates{1}{1};
    elseif strcmp(name, '佛山市')
        disp(['名称: ', name])
        foshan = feature.geometry.coordinates{1}{1};
    end
end

disp(guangzhou)