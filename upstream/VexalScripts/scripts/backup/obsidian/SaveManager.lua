local a=(cloneref or clonereference or function(a:any)return a end)local b=(clonefunction or
copyfunction or function(b)return b end)local c:HttpService=a(game:GetService('HttpService'))local
d,e,f=isfolder,isfile,listfiles if typeof(b)=='function'then local g,h,i=b(d),b(e),b(f)local j,k=
pcall(function()return g('test'..tostring(math.random(1000000,9999999)))end)if j==false or typeof(k
)~='boolean'then d=function(l)local m,n=pcall(g,l)return(if m then n else false)end e=function(l)
local m,n=pcall(h,l)return(if m then n else false)end f=function(l)local m,n=pcall(i,l)return(if m
then n else{})end end end local g={Library=nil,Folder='ObsidianLibSettings',SubFolder='',Ignore={},
LoadingOrder={},UseLoadingOrder=false,AutoloadConfig=nil}function g:SetLibrary(h)g.Library=h end
local h={UDim2={Encode=function(h:UDim2)return{X={Scale=h.X.Scale,Offset=h.X.Offset},Y={Scale=h.Y.
Scale,Offset=h.Y.Offset}}end,Decode=function(h:any)local i=typeof(h)if i=='table'then return UDim2.
new(h.X.Scale,h.X.Offset,h.Y.Scale,h.Y.Offset)elseif i=='UDim2'then return h end return nil end}}
local i={}do local function CreateParser(j:string,k:string,l:(string,any,...any)->any,m:(any?,any
)->any,n:boolean?)i[j]={Save=function(o:string,p:any,...)local q=l(o,p,...)q.type=j q.idx=o return
q end,Load=function(o:string?,p:any)if n==true then return m(nil,p)end local q=g.Library and g.
Library[k]local r=q and q[o]return m(r,p)end}end CreateParser('Toggle','Toggles',function(j:string,
k:any)return{value=k.Value}end,function(j:any?,k:any)if not j then return end if j.Value==k.value
then j:RunChanged()return end j:SetValue(k.value)end)CreateParser('Slider','Options',function(j:
string,k:any)return{value=tostring(k.Value)}end,function(j:any?,k:any)if not j then return end if j
.Value==k.value then j:RunChanged()return end j:SetValue(k.value)end)CreateParser('Dropdown',
'Options',function(j:string,k:any)return{value=k.Value,multi=k.Multi}end,function(j:any?,k:any)if
not j then return end if j.Value==k.value then j:RunChanged()return end j:SetValue(k.value)end)
CreateParser('ColorPicker','Options',function(j:string,k:any)return{value=k.Value:ToHex(),
transparency=k.Transparency}end,function(j:any?,k:any)if not j then return end j:SetValueRGB(Color3
.fromHex(k.value),k.transparency)end)CreateParser('KeyPicker','Options',function(j:string,k:any)
return{mode=k.Mode,key=k.Value,modifiers=k.Modifiers,toggled=k.Toggled}end,function(j:any?,k:any)if
not j then return end j:SetValue({k.key,k.mode,k.modifiers})if k.mode=='Toggle'and k.toggled~=nil
then j.Toggled=k.toggled j:Update()end end)CreateParser('Input','Options',function(j:string,k:any)
return{text=k.Value}end,function(j:any?,k:any)if not j then return end if typeof(k.text)~='string'
then return end if j.Value==k.text then j:RunChanged()return end j:SetValue(k.text)end)
CreateParser('Groupbox','Tabs',function(j:string,k:any,l:string)return{collapsed=k.Collapsed,tabIdx
=l}end,function(j,k:any)local l,m=k.tabIdx,k.idx if typeof(l)~='string'or typeof(m)~='string'then
return end local n=g.Library and g.Library.Tabs local o=n and n[l]if not o then return end local p=
o.Groupboxes[m]if not p or p.Collapsed==k.collapsed then return end p:SetCollapsed(k.collapsed==
true)end,true)end local function Trim(j:string)return j:match('^%s*(.-)%s*$')end local function
IsStringEmpty(j:string):boolean return if typeof(j)=='string'then Trim(j)==''else true end
local function IsValidFolderPath(j:string):boolean return typeof(j)=='string'and(Trim(j)~=''and not
j:match('^%s*$')and not j:find('[<>:"|%?%*%z]'))end local function SplitPath(j:string):{string}
local k={}local l=''for m in string.gmatch(j,'[^/]+')do l=if l==''then m else(l..'/'..m)table.
insert(k,l)end return k end local function GetFolderPath():false|string if IsStringEmpty(g.Folder)
then return false end return string.format('%s/settings',g.Folder)end local function
GetSubFolderPath():false|string if IsStringEmpty(g.Folder)or IsStringEmpty(g.SubFolder)then return
false end return string.format('%s/settings/%s',g.Folder,g.SubFolder)end local function
GetCurrentSettingsPath():false|string local j=GetSubFolderPath()return if j==false then
GetFolderPath()else j end local function GetConfigPath(j:string):false|string local k=
GetCurrentSettingsPath()return if k==false then false else string.format('%s/%s.json',k,j)end
local function DoesConfigExist(j:string):boolean local k=GetConfigPath(j)return if k==false then
false else e(k)end local function GetAutoloadPath():false|string local j=GetCurrentSettingsPath()
return if j==false then false else string.format('%s/autoload.txt',j)end function g:SetLoadingOrder
(j:boolean,k:{string}?)g.UseLoadingOrder=j==true g.LoadingOrder=typeof(k)=='table'and k or g.
LoadingOrder end function g:SetIgnoreIndexes(j:{string}?)assert(typeof(j)=='table',
'Expected table, got '..typeof(j))for k,l in j do g.Ignore[l]=true end end function g:
IgnoreThemeSettings()g:SetIgnoreIndexes({'BackgroundColor','MainColor','AccentColor','OutlineColor'
,'FontColor','FontFace','BackgroundImage','ThemeManager_ThemeList','ThemeManager_CustomThemeList',
'ThemeManager_CustomThemeName'})end function g:GetPaths():{string}local j=GetSubFolderPath()if j==
false then local k=GetFolderPath()return if k==false then{}else SplitPath(k)end return SplitPath(j)
end function g:BuildFolderTree(j:boolean?)local k=g:GetPaths()if#k==0 then return false end if j==
true then if d(k[1])then return true end end for l,m in k do if d(m)then continue end makefolder(m)
end return true end function g:CheckFolderTree()return g:BuildFolderTree(true)end function g:
CheckSubFolder(j:boolean)local k=GetSubFolderPath()if k==false then return false end local l=d(k)if
not j then return l end makefolder(k)return true end function g:SetFolder(j:string)assert(
IsValidFolderPath(j),'Invalid path provided')g.Folder=j g:BuildFolderTree()end function g:
SetSubFolder(j:string)assert(IsValidFolderPath(j),'Invalid path provided')g.SubFolder=j g:
BuildFolderTree()end function g:RefreshConfigList()local j=GetCurrentSettingsPath()if j==false then
return{}end local k,l=pcall(f,j)if not(k and typeof(l)=='table')then g.Library:Notify(string.
format('Failed to load config list: %s',tostring(l)))return{}end local m={}for n,o in l do local p=
o:match('(.+)%..+$')if not p then continue end local q=p:gsub('\\','/'):find('/[^/]*$')local r=q
and p:sub(q+1)or p if not r or r=='autoload'then continue end table.insert(m,r)end return m end
function g:Save(j:string):(boolean,string?)if IsStringEmpty(j)then return false,
'Invalid config name provided'end if string.lower(j)=='autoload'then return false,
'Invalid config name provided'end local k=GetConfigPath(j)if k==false then return false,
'Invalid config name provided'end g:CheckFolderTree()local l=g.Library local m=g.Ignore local n={
timestamp=os.date('%d.%m.%Y %H:%M:%S'),name=j,objects={},keybindMenu=if l.KeybindFrame then{visible
=l.KeybindFrame.Visible,position=h.UDim2.Encode(l.KeybindFrame.Position)}else nil}for o,p in l.
Toggles do if not p.Type then continue end if m[o]then continue end local q=i[p.Type]if not q then
continue end table.insert(n.objects,q.Save(o,p))end for o,p in l.Options do if not p.Type then
continue end if m[o]then continue end local q=i[p.Type]if not q then continue end table.insert(n.
objects,q.Save(o,p))end for o,p in l.Tabs do if not p.Groupboxes then continue end for q,r in p.
Groupboxes do if m[q]then continue end local s=i.Groupbox if not s then continue end table.insert(n
.objects,s.Save(q,r,o))end end local o,p=pcall(c.JSONEncode,c,n)if not o then return false,
'Failed to encode data'end local q,r=pcall(writefile,k,p)if not q then return false,
'Failed to write config file: '..tostring(r)end return true end function g:Load(j:string):(boolean,
string?)if IsStringEmpty(j)then return false,'No config is selected'end local k=GetConfigPath(j)if
k==false or not e(k)then return false,'Config file does not exist'end local l,m=pcall(readfile,k)if
not l then return false,'Failed to read config file'end local n,o=pcall(c.JSONDecode,c,m)if not n
or typeof(o)~='table'or typeof(o.objects)~='table'then return false,'Failed to decode config data'
end local p=g.Library local q=g.LoadingOrder local r=g.Ignore if g.UseLoadingOrder==true and
typeof(q)=='table'then table.sort(o.objects,function(s,t)local u=table.find(q,s.type)or math.huge
local v=table.find(q,t.type)or math.huge return u<v end)end if p.KeybindFrame and typeof(o.
keybindMenu)=='table'then local s=o.keybindMenu local t=s.visible==true local u=h.UDim2.Decode(s.
position)p.KeybindFrame.Visible=t p.KeybindFrame.Position=u or p.KeybindFrame.Position local v=p.
Options and p.Options.KeybindMenuOpen if v then v:SetValue(t)end end for s,t in o.objects do if not
t.type then continue end if r[t.idx]then continue end local u=i[t.type]if not u then continue end
task.defer(u.Load,t.idx,t)end return true end function g:Delete(j:string):(boolean|string?)if
IsStringEmpty(j)then return false,'No config is selected'end local k=GetConfigPath(j)if k==false or
not e(k)then return false,'Config file does not exist'end local l,m=pcall(delfile,k)if not l then
return false,'Failed to delete config file: '..tostring(m)end if j==g.AutoloadConfig then g:
DeleteAutoLoadConfig()end return true end function g:GetAutoloadConfig():(string,boolean,string?)g:
CheckFolderTree()local j=GetAutoloadPath()if j==false then return'none',false,
'Invalid path provided'end if not e(j)then return'none',false,'Autoload config is not set'end local
k,l=pcall(readfile,j)if not(k and typeof(l)=='string')then return'none',false,l end local m=
DoesConfigExist(l)if not m then return'none',false,'Config file not found'end g.AutoloadConfig=l
return l,true end function g:SaveAutoloadConfig(j:string):(boolean,string?)if IsStringEmpty(j)then
return false,'No config is selected'end g:CheckFolderTree()local k=GetAutoloadPath()if k==false
then return false,'Invalid path provided'end if not DoesConfigExist(j)then return false,
'Config does not exist'end local l,m=pcall(writefile,k,j)if not l then return false,m end g.
AutoloadConfig=j return true end function g:LoadAutoloadConfig()local j,k,l=g:GetAutoloadConfig()if
not k or l then if l~='Autoload config is not set'then g.Library:Notify(string.format(
'Failed to load autoload config: %s',l))end return end local m,n=g:Load(j)if not m then g.Library:
Notify(string.format('Failed to load autoload config: %s',n))return end g.Library:Notify(string.
format('Successfully loaded autoload config %q',j))end function g:DeleteAutoLoadConfig():(boolean,
string?)g:CheckFolderTree()local j=GetAutoloadPath()if j==false then return false,
'Invalid path provided'end if not e(j)then return false,'Autoload config is not set'end local k,l=
pcall(delfile,j)if not k then return false,l end g.AutoloadConfig=nil return true end
local function ShowDialog(j:()->boolean,k:string,l:string,m:string,n:string,o:()->nil)if j()==false
then return o()end return g.Library.Window:AddDialog(k,{Title=l,Description=m,AutoDismiss=false,
FooterButtons={Cancel={Title='Cancel',Variant='Ghost',Order=1,Callback=function(p)p:Dismiss()end},
DestructiveAction={Title=n,Variant='Destructive',Order=2,Callback=function(p)p:Dismiss()o()end}}})
end function g:BuildConfigSection(j:any,k:string)assert(g.Library,
[[Library is not set, call SaveManager:SetLibrary(Library) first.]])local l=j:AddRightGroupbox(
'Configuration',k or'folder-cog')local m,n,o local function RefreshList()n:SetValues(g:
RefreshConfigList())n:SetValue(nil)end local function RefreshAutoloadConfigLabel()local p,q,r=g:
GetAutoloadConfig()o:SetText(string.format('Current autoload config: %s',p))if n then RefreshList()
end end l:AddInput('SaveManager_ConfigName',{Text='Config name'})l:AddButton('Create config',
function()local p=m.Value if IsStringEmpty(p)then g.Library:Notify(
'Configuration name cannot be empty.')return end if string.lower(p)=='autoload'then g.Library:
Notify('Invalid config name provided.')return end ShowDialog(function():boolean return
DoesConfigExist(p)end,'SaveManager_CreateConfig','Config already exists',string.format(
[[A config named %q already exists. Overwriting will replace it with your current settings.]],p),
'Overwrite',function()local q,r=g:Save(p)if not q then g.Library:Notify(string.format(
'Failed to create config %q: %s',p,r))return end g.Library:Notify(string.format(
'Successfully created config %q',p))RefreshList()end)end)l:AddDivider()l:AddDropdown(
'SaveManager_ConfigList',{Text='Config list',Values=g:RefreshConfigList(),AllowNull=true,Multi=
false,FormatDisplayValue=function(p:any)if p==g.AutoloadConfig then return string.format(
'%s (autoload)',p)end return p end,FormatListValue=function(p:any)if p==g.AutoloadConfig then
return string.format('%s (autoload)',p)end return p end})l:AddButton({Text='Load config',
DoubleClick=false,Func=function()local p=n.Value if IsStringEmpty(p)then g.Library:Notify(
'Please select a config first.')return end local q,r=g:Load(p)if not q then g.Library:Notify(string
.format('Failed to load config %q: %s',p,r))return end g.Library:Notify(string.format(
'Successfully loaded config %q',p))end})l:AddButton({Text='Overwrite config',DoubleClick=false,Func
=function()local p=n.Value if IsStringEmpty(p)then g.Library:Notify('Please select a config first.'
)return end ShowDialog(function():boolean return true end,'SaveManager_OverwriteConfig',
'Overwrite config',string.format(
[[Are you sure you want to overwrite %q with your current settings? This cannot be undone.]],p),
'Overwrite',function()local q,r=g:Save(p)if not q then g.Library:Notify(string.format(
'Failed to overwrite config %q: %s',p,r))return end g.Library:Notify(string.format(
'Successfully overwrote config %q',p))end)end})l:AddButton({Text='Delete config',DoubleClick=false,
Func=function()local p=n.Value if IsStringEmpty(p)then g.Library:Notify(
'Please select a config first.')return end ShowDialog(function():boolean return true end,
'SaveManager_DeleteConfig','Delete config',string.format(
'Are you sure you want to delete %q? This cannot be undone.',p),'Delete',function()local q,r=g:
Delete(p)if not q then g.Library:Notify(string.format('Failed to delete config %q: %s',p,r))return
end g.Library:Notify(string.format('Successfully deleted config %q',p))RefreshAutoloadConfigLabel()
end)end})l:AddButton('Refresh list',RefreshList)l:AddButton({Text='Set as autoload',DoubleClick=
false,Func=function()local p=n.Value if IsStringEmpty(p)then g.Library:Notify(
'Please select a config first.')return end local q,r=g:SaveAutoloadConfig(p)if not q then g.Library
:Notify(string.format('Failed to set autoload config %q: %s',p,r))return end g.Library:Notify(
string.format('Successfully set autoload config to %q',p))RefreshAutoloadConfigLabel()end})l:
AddButton({Text='Reset autoload',DoubleClick=false,Func=function()ShowDialog(function():boolean
return true end,'SaveManager_ResetAutoload','Reset autoload config',
[[Are you sure you want to clear the autoload config? No config will be loaded automatically on next launch.]]
,'Reset',function()local p,q=g:DeleteAutoLoadConfig()if not p then g.Library:Notify(string.format(
'Failed to reset autoload config: %s',q))return end g.Library:Notify(
'Successfully reset autoload config.')RefreshAutoloadConfigLabel()end)end})o=l:AddLabel(
'Current autoload config: ...',true)m,n=g.Library.Options.SaveManager_ConfigName,g.Library.Options.
SaveManager_ConfigList RefreshAutoloadConfigLabel()g:SetIgnoreIndexes({'SaveManager_ConfigList',
'SaveManager_ConfigName'})return l end g:BuildFolderTree()return g
