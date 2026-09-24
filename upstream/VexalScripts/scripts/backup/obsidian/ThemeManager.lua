local a=(cloneref or clonereference or function(a:any)return a end)local b=(clonefunction or
copyfunction or function(b)return b end)local c:HttpService=a(game:GetService('HttpService'))local
d,e,f=isfolder,isfile,listfiles if typeof(b)=='function'then local g,h,i=b(d),b(e),b(f)local j,k=
pcall(function()return g('test'..tostring(math.random(1000000,9999999)))end)if j==false or typeof(k
)~='boolean'then d=function(l)local m,n=pcall(g,l)return(if m then n else false)end e=function(l)
local m,n=pcall(h,l)return(if m then n else false)end f=function(l)local m,n=pcall(i,l)return(if m
then n else{})end end end local g={'FontColor','MainColor','AccentColor','BackgroundColor',
'OutlineColor'}local h={Library=nil,Folder='ObsidianLibSettings',AppliedToTab=false,
DefaultThemeName=nil,BuiltInThemes={['Default']={1,{FontColor='ffffff',MainColor='191919',
AccentColor='7d55ff',BackgroundColor='0f0f0f',OutlineColor='282828',BackgroundImage=''}},['BBot']={
2,{FontColor='ffffff',MainColor='1e1e1e',AccentColor='7e48a3',BackgroundColor='232323',OutlineColor
='141414',BackgroundImage=''}},['Fatality']={3,{FontColor='ffffff',MainColor='1e1842',AccentColor=
'c50754',BackgroundColor='191335',OutlineColor='3c355d',BackgroundImage=''}},['Jester']={4,{
FontColor='ffffff',MainColor='242424',AccentColor='db4467',BackgroundColor='1c1c1c',OutlineColor=
'373737',BackgroundImage=''}},['Mint']={5,{FontColor='ffffff',MainColor='242424',AccentColor=
'3db488',BackgroundColor='1c1c1c',OutlineColor='373737',BackgroundImage=''}},['Tokyo Night']={6,{
FontColor='ffffff',MainColor='191925',AccentColor='6759b3',BackgroundColor='16161f',OutlineColor=
'323232',BackgroundImage=''}},['Ubuntu']={7,{FontColor='ffffff',MainColor='3e3e3e',AccentColor=
'e2581e',BackgroundColor='323232',OutlineColor='191919',BackgroundImage=''}},['Quartz']={8,{
FontColor='ffffff',MainColor='232330',AccentColor='426e87',BackgroundColor='1d1b26',OutlineColor=
'27232f',BackgroundImage=''}},['Nord']={9,{FontColor='eceff4',MainColor='3b4252',AccentColor=
'88c0d0',BackgroundColor='2e3440',OutlineColor='4c566a',BackgroundImage=''}},['Dracula']={10,{
FontColor='f8f8f2',MainColor='44475a',AccentColor='ff79c6',BackgroundColor='282a36',OutlineColor=
'6272a4',BackgroundImage=''}},['Monokai']={11,{FontColor='f8f8f2',MainColor='272822',AccentColor=
'f92672',BackgroundColor='1e1f1c',OutlineColor='49483e',BackgroundImage=''}},['Gruvbox']={12,{
FontColor='ebdbb2',MainColor='3c3836',AccentColor='fb4934',BackgroundColor='282828',OutlineColor=
'504945',BackgroundImage=''}},['Solarized']={13,{FontColor='839496',MainColor='073642',AccentColor=
'cb4b16',BackgroundColor='002b36',OutlineColor='586e75',BackgroundImage=''}},['Catppuccin']={14,{
FontColor='d9e0ee',MainColor='302d41',AccentColor='f5c2e7',BackgroundColor='1e1e2e',OutlineColor=
'575268',BackgroundImage=''}},['One Dark']={15,{FontColor='abb2bf',MainColor='282c34',AccentColor=
'c678dd',BackgroundColor='21252b',OutlineColor='5c6370',BackgroundImage=''}},['Cyberpunk']={16,{
FontColor='f9f9f9',MainColor='262335',AccentColor='00ff9f',BackgroundColor='1a1a2e',OutlineColor=
'413c5e',BackgroundImage=''}},['Oceanic Next']={17,{FontColor='d8dee9',MainColor='1b2b34',
AccentColor='6699cc',BackgroundColor='16232a',OutlineColor='343d46',BackgroundImage=''}},[
'Material']={18,{FontColor='eeffff',MainColor='212121',AccentColor='82aaff',BackgroundColor=
'151515',OutlineColor='424242',BackgroundImage=''}}}}function h:SetLibrary(i)h.Library=i end
local function Trim(i:string)return i:match('^%s*(.-)%s*$')end local function IsStringEmpty(i:
string):boolean return if typeof(i)=='string'then Trim(i)==''else true end local function
IsValidFolderPath(i:string):boolean return typeof(i)=='string'and(Trim(i)~=''and not i:match(
'^%s*$')and not i:find('[<>:"|%?%*%z]'))end local function SplitPath(i:string):{string}local j={}
local k=''for l in string.gmatch(i,'[^/]+')do k=if k==''then l else(k..'/'..l)table.insert(j,k)end
return j end local function GetFolderPath():false|string if IsStringEmpty(h.Folder)then return
false end return string.format('%s/themes',h.Folder)end local i=GetFolderPath local function
GetThemePath(j:string):false|string local k=i()return if k==false then false else string.format(
'%s/%s.json',k,j)end local function DoesThemeExist(j:string,k:boolean):boolean if h.BuiltInThemes[j
]then return true end local l=GetThemePath(j)return if l==false then false else e(l)end
local function GetDefaultThemePath():false|string local j=i()return if j==false then false else
string.format('%s/default.txt',j)end function h:GetPaths():{string}local j=GetFolderPath()return if
j==false then{}else SplitPath(j)end function h:BuildFolderTree(j:boolean?)local k=h:GetPaths()if#k
==0 then return false end if j==true then if d(k[1])then return true end end for l,m in k do if d(m
)then continue end makefolder(m)end return true end function h:CheckFolderTree()return h:
BuildFolderTree(true)end function h:SetFolder(j:string)assert(IsValidFolderPath(j),
'Invalid path provided')h.Folder=j h:BuildFolderTree()end function h:ReloadCustomThemes()local j=i(
)if j==false then return{}end local k,l=pcall(f,j)if not(k and typeof(l)=='table')then h.Library:
Notify(string.format('Failed to load theme list: %s',tostring(l)))return{}end local m={}for n,o in
l do local p=o:match('(.+)%..+$')if not p then continue end local q=p:gsub('\\','/'):find('/[^/]*$'
)local r=q and p:sub(q+1)or p if not r or r=='default'then continue end table.insert(m,r)end return
m end function h:GetCustomTheme(j:string):any if IsStringEmpty(j)then return nil end local k=
GetThemePath(j)if k==false or not e(k)then return nil end local l,m=pcall(readfile,k)if not l then
return nil end local n,o=pcall(c.JSONDecode,c,m)if not n or typeof(o)~='table'then return nil end
return o end function h:SaveCustomTheme(j:string):any if IsStringEmpty(j)then return false,
'Invalid theme name provided'end if string.lower(j)=='default'then return false,
'Invalid theme name provided'end local k=GetThemePath(j)if k==false then return false,
'Invalid theme name provided'end h:CheckFolderTree()local l=h.Library local m={FontFace=l.Options.
FontFace.Value,BackgroundImage=l.Options.BackgroundImage.Value}for n,o in g do m[o]=l.Options[o].
Value:ToHex()end local n,o=pcall(c.JSONEncode,c,m)if not n then return false,
'Failed to encode data'end local p,q=pcall(writefile,k,o)if not p then return false,
'Failed to write theme file: '..tostring(q)end return true end function h:Delete(j:string):(boolean
|string?)if IsStringEmpty(j)then return false,'No theme is selected'end local k=GetThemePath(j)if k
==false or not e(k)then return false,'Theme file does not exist'end local l,m=pcall(delfile,k)if
not l then return false,'Failed to delete theme file: '..tostring(m)end if j==h.DefaultThemeName
then h:DeleteDefaultTheme()end return true end function h:GetDefaultTheme():(string,boolean,string?
)h:CheckFolderTree()local j=GetDefaultThemePath()if j==false then return'none',false,
'Invalid path provided'end if not e(j)then return'none',false,'Default theme is not set'end local k
,l=pcall(readfile,j)if not(k and typeof(l)=='string')then return'none',false,l end local m=
DoesThemeExist(l,true)if not m then return'none',false,'Theme file not found'end h.DefaultThemeName
=l return l,true end function h:SetDefaultTheme(j:any)assert(h.Library,
[[Library is not set, call ThemeManager:SetLibrary(Library) first.]])assert(not h.AppliedToTab,
[[Cannot set default theme after applying ThemeManager to a tab!]])local k=h.Library local l=h.
BuiltInThemes['Default'][2]local m={}local n={}for o,p in g do local q=j[p]local r=typeof(q)if r==
'Color3'then m[p]=q n[p]=string.format('#%s',q:ToHex())elseif r=='string'then m[p]=Color3.fromHex(q
)n[p]=if q:sub(1,1)=='#'then q else string.format('#%s',q)else local s=l[p]m[p]=Color3.fromHex(s)n[
p]=s end end local o=j['FontFace']local p=typeof(o)if p=='EnumItem'then m.Font=Font.fromEnum(o)n.
FontFace=o.Name elseif p=='string'then m.Font=Font.fromEnum(Enum.Font[o])n.FontFace=o else m.Font=
Font.fromEnum(Enum.Font.Code)n.FontFace='Code'end for q,r in{'RedColor','DestructiveColor',
'DarkColor','WhiteColor'}do m[r]=k.Scheme[r]end k.Scheme=m h.BuiltInThemes['Default']={1,n}k:
UpdateColorsUsingRegistry()end function h:SaveDefault(j:string):(boolean,string?)if IsStringEmpty(j
)then return false,'No theme is selected'end h:CheckFolderTree()local k=GetDefaultThemePath()if k==
false then return false,'Invalid path provided'end if not DoesThemeExist(j,true)then return false,
'Theme does not exist'end local l,m=pcall(writefile,k,j)if not l then return false,m end h.
DefaultThemeName=j return true end function h:LoadDefault()local j,k,l=h:GetDefaultTheme()if not k
or l then if l~='Default theme is not set'then h.Library:Notify(string.format(
'Failed to apply default theme: %s',l))end return end if not h:GetCustomTheme(j)then h.Library.
Options.ThemeManager_ThemeList:SetValue(j)return end local m,n=h:ApplyTheme(j)if not m then h.
Library:Notify(string.format('Failed to apply default theme: %s',n))return end h.Library:Notify(
string.format('Successfully applied default theme %q',j))end function h:DeleteDefaultTheme():(
boolean,string?)h:CheckFolderTree()local j=GetDefaultThemePath()if j==false then return false,
'Invalid path provided'end if not e(j)then return false,'Default theme is not set'end local k,l=
pcall(delfile,j)if not k then return false,l end h.DefaultThemeName=nil return true end function h:
ThemeUpdate()local j=h.Library for k,l in g do local m=j.Options[l]if not m then continue end j.
Scheme[l]=m.Value end j:UpdateColorsUsingRegistry()end function h:ApplyTheme(j:string)if
IsStringEmpty(j)then return false,'No theme is selected'end local k=h:GetCustomTheme(j)local l=k or
h.BuiltInThemes[j]if not l then return false,'Theme not found'end local m=h.Library local n=l[2]
local o=k or n for p,q in o do if p=='VideoLink'then continue end local r=m.Options[p]local s=q if
p=='FontFace'then h.Library:SetFont(Enum.Font[s])elseif p=='BackgroundImage'then h.Library:
SetBackgroundImage(s)else s=Color3.fromHex(q)m.Scheme[p]=s end if r then r:SetValue(s)end end h:
ThemeUpdate()return true end local function ShowDialog(j:()->boolean,k:string,l:string,m:string,n:
string,o:()->nil)if j()==false then return o()end return h.Library.Window:AddDialog(k,{Title=l,
Description=m,AutoDismiss=false,FooterButtons={Cancel={Title='Cancel',Variant='Ghost',Order=1,
Callback=function(p)p:Dismiss()end},DestructiveAction={Title=n,Variant='Destructive',Order=2,
Callback=function(p)p:Dismiss()o()end}}})end function h:CreateThemeManager(j:any)assert(h.Library,
[[Library is not set, call ThemeManager:SetLibrary(Library) first.]])local k={}for l,m in h.
BuiltInThemes do table.insert(k,l)end local l,m,n,o,p,q local function RefreshList()l:SetValues(h:
ReloadCustomThemes())l:SetValue(nil)n:SetValues(k)end local function RefreshDefaultThemeLabel()
local r,s,t=h:GetDefaultTheme()q:SetText(string.format('Current default theme: %s',r))if l then
RefreshList()end end table.sort(k,function(r,s)return h.BuiltInThemes[r][1]<h.BuiltInThemes[s][1]
end)local function CreateColorOption(r,s)j:AddLabel(r):AddColorPicker(s,{Default=h.Library.Scheme[s
]})return h.Library.Options[s]end local r=CreateColorOption('Background color','BackgroundColor')
local s=CreateColorOption('Main color','MainColor')local t=CreateColorOption('Accent color',
'AccentColor')local u=CreateColorOption('Outline color','OutlineColor')local v=CreateColorOption(
'Font color','FontColor')j:AddDropdown('FontFace',{Text='Font Face',Default='Code',Values={
'BuilderSans','Code','Fantasy','Gotham','Jura','Roboto','RobotoMono','SourceSans'},AllowNull=false,
Multi=false})j:AddInput('BackgroundImage',{Text='Background Image',Default='',Finished=true,
ClearTextOnFocus=false,ClearTextOnBlur=false})j:AddDivider()j:AddDropdown('ThemeManager_ThemeList',
{Text='Theme list',Values=k,AllowNull=true,Multi=false,FormatDisplayValue=function(w:any)if w~=
'Default'and w==h.DefaultThemeName then return string.format('%s (default)',w)end return w end,
FormatListValue=function(w:any)if w~='Default'and w==h.DefaultThemeName then return string.format(
'%s (default)',w)end return w end})j:AddButton('Set as default',function()local w=n.Value h:
SaveDefault(w)h.Library:Notify(string.format('Successfully set default theme to %q',w))
RefreshDefaultThemeLabel()end)j:AddDivider()m=j:AddInput('ThemeManager_CustomThemeName',{Text=
'Custom theme name'})j:AddButton('Create theme',function()local w=m.Value if IsStringEmpty(w)then h
.Library:Notify('Theme name cannot be empty.')return end if string.lower(w)=='default'then h.
Library:Notify('Invalid theme name provided.')return end ShowDialog(function():boolean return h:
GetCustomTheme(w)~=nil end,'ThemeManager_CreateTheme','Theme already exists',string.format(
[[A custom theme named %q already exists. Overwriting it will replace it with your current colors.]]
,w),'Overwrite',function()local x,y=h:SaveCustomTheme(w)if not x then h.Library:Notify(string.
format('Failed to create theme %q: %s',w,y))return end h.Library:Notify(string.format(
'Successfully created theme %q',w))RefreshList()end)end)j:AddDivider()l=j:AddDropdown(
'ThemeManager_CustomThemeList',{Text='Custom themes',Values=h:ReloadCustomThemes(),AllowNull=true,
Multi=false,FormatDisplayValue=function(w:any)if w==h.DefaultThemeName then return string.format(
'%s (default)',w)end return w end,FormatListValue=function(w:any)if w==h.DefaultThemeName then
return string.format('%s (default)',w)end return w end})j:AddButton('Load theme',function()local w=
l.Value if IsStringEmpty(w)then h.Library:Notify('Please select a theme first.')return end h:
ApplyTheme(w)h.Library:Notify(string.format('Successfully loaded theme %q',w))end)j:AddButton(
'Overwrite theme',function()local w=l.Value if IsStringEmpty(w)then h.Library:Notify(
'Please select a theme first.')return end ShowDialog(function():boolean return true end,
'ThemeManager_OverwriteTheme','Overwrite theme',string.format(
[[Are you sure you want to overwrite %q with your current colors? This cannot be undone.]],w),
'Overwrite',function()h:SaveCustomTheme(w)h.Library:Notify(string.format(
'Successfully overwrote theme %q',w))end)end)j:AddButton('Delete theme',function()local w=l.Value
if IsStringEmpty(w)then h.Library:Notify('Please select a theme first.')return end ShowDialog(
function():boolean return true end,'ThemeManager_DeleteTheme','Delete theme',string.format(
'Are you sure you want to delete %q? This cannot be undone.',w),'Delete',function()local x,y=h:
Delete(w)if not x then h.Library:Notify(string.format('Failed to delete theme: %s',y))return end h.
Library:Notify(string.format('Successfully deleted theme %q',w))RefreshDefaultThemeLabel()end)end)j
:AddButton('Refresh list',RefreshList)j:AddButton('Set as default',function()local w=l.Value if
IsStringEmpty(w)then h.Library:Notify('Please select a theme first.')return end h:SaveDefault(w)h.
Library:Notify(string.format('Successfully set default theme to %q',w))RefreshDefaultThemeLabel()
end)j:AddButton('Reset default',function()ShowDialog(function():boolean return true end,
'ThemeManager_ResetDefault','Reset default theme',
[[Are you sure you want to clear the default theme? The library will revert to its built-in default on next load.]]
,'Reset',function()local w,x=h:DeleteDefaultTheme()if not w then h.Library:Notify(string.format(
'Failed to reset default theme: %s',x))return end h.Library:Notify(
'Successfully reset default theme.')RefreshDefaultThemeLabel()end)end)q=j:AddLabel(
'Current default theme: ...',true)l,m,n,o,p=h.Library.Options.ThemeManager_CustomThemeList,h.
Library.Options.ThemeManager_CustomThemeName,h.Library.Options.ThemeManager_ThemeList,h.Library.
Options.FontFace,h.Library.Options.BackgroundImage n:OnChanged(function()h:ApplyTheme(n.Value)end)
local function UpdateTheme()h:ThemeUpdate()end r:OnChanged(UpdateTheme)s:OnChanged(UpdateTheme)t:
OnChanged(UpdateTheme)u:OnChanged(UpdateTheme)v:OnChanged(UpdateTheme)o:OnChanged(function(w)h.
Library:SetFont(Enum.Font[w])end)p:OnChanged(function(w)h.Library:SetBackgroundImage(w)end)h:
LoadDefault()h.AppliedToTab=true RefreshDefaultThemeLabel()return j end function h:CreateGroupBox(j
:any,k:string)return j:AddLeftGroupbox('Themes',k or'paintbrush')end function h:ApplyToTab(j:any,k:
string)local l=h:CreateGroupBox(j,k)return h:CreateThemeManager(l)end function h:ApplyToGroupbox(j:
any)return h:CreateThemeManager(j)end getgenv().ObsidianThemeManager=h return h
