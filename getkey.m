%This function returns the ascii character code of the key typing by the user.
function key = getkey() 
%This part will be read the pressed key character by the user.And set
%Userdata as the ascii character code of that key.
keypressaction ='set(gcbf,''Userdata'',double(get(gcbf,''Currentcharacter''))) ; uiresume ';
%create a struct for the Key Press action.
K = figure('keypressfcn',keypressaction, ...
    'windowstyle','modal',...    
    'position',[0 0 1 1],...
    'Name','GETKEY', ...
    'userdata','timeout') ; 
try
    uiwait ;%uiwait blocks execution until uiresume is called or the figure K is deleted.
    key = get(K,'Userdata') ;%get the key code that is the value of Userdata.
    if isempty(key),
        key = NaN ;%if the key is an unknown key than it is NaN.
    end
catch
    %If there would be an error than the key will be empty.
    key = [] ;
end

delete(K) ;%renew the key action on each iteration.