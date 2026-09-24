local a=(cloneref or clonereference or function(a:any)return a end)local b:CoreGui=a(game:
GetService('CoreGui'))local c:Players=a(game:GetService('Players'))local d:RunService=a(game:
GetService('RunService'))local e:SoundService=a(game:GetService('SoundService'))local f:
UserInputService=a(game:GetService('UserInputService'))local g:TextService=a(game:GetService(
'TextService'))local h:Teams=a(game:GetService('Teams'))local i:TweenService=a(game:GetService(
'TweenService'))local j=getgenv or function()return shared end local k=setclipboard or nil local l=
protectgui or(syn and syn.protect_gui)or function()end local m=gethui or function()return b end
local n=c.LocalPlayer or c.PlayerAdded:Wait()local o=a(n:GetMouse())local p={}local q={}local r={}
local s={}local t={}local u=
[[https://raw.githubusercontent.com/deividcomsono/Obsidian/refs/heads/main/]]local v={}local w={
TransparencyTexture={RobloxId=139785960036434,Path='Obsidian/assets/TransparencyTexture.png',URL=u
..'assets/TransparencyTexture.png',Id=nil},SaturationMap={RobloxId=4155801252,Path=
'Obsidian/assets/SaturationMap.png',URL=u..'assets/SaturationMap.png',Id=nil},LoadingIcon={RobloxId
=97544096941083,Path='Obsidian/assets/LoadingIcon.png',URL=u..'assets/LoadingIcon.png',Id=nil},
CheckIcon={RobloxId=97682394690683,Path='Obsidian/assets/CheckIcon.png',URL=u..
'assets/CheckIcon.png',Id=nil}}do local function RecursiveCreatePath(x:string,y:boolean?)if not
isfolder or not makefolder then return end local z=x:split('/')local A=''if y then table.remove(z,#
z)end for B,C in ipairs(z)do if not isfolder(A..C)then makefolder(A..C)end A=A..C..'/'end return A
end function v.AddAsset(x:string,y:number,z:string,A:boolean?)if w[x]~=nil then error(string.
format('Asset %q already exists',x))end assert(typeof(y)=='number','RobloxAssetId must be a number'
)w[x]={RobloxId=y,Path=string.format('Obsidian/custom_assets/%s',x),URL=z,Id=nil}v.DownloadAsset(x,
A)end function v.GetAsset(x:string)if not w[x]then return nil end local y=w[x]if y.Id then return y
.Id end local z=string.format('rbxassetid://%s',y.RobloxId)if getcustomasset then local A,B=pcall(
getcustomasset,y.Path)if A and B then z=B end end y.Id=z return z end function v.DownloadAsset(x:
string,y:boolean?)if not getcustomasset or not writefile or not isfile then return false,
'missing functions'end local z=w[x]RecursiveCreatePath(z.Path,true)if y~=true and isfile(z.Path)
then return true,nil end local A,B=pcall(function()writefile(z.Path,game:HttpGet(z.URL))end)return
A,B end for x,y in w do v.DownloadAsset(x)end end local x={LocalPlayer=n,IsRobloxFocused=true,
DevicePlatform=nil,IsMobile=false,ScreenGui=nil,Window=nil,WindowContainer=nil,SearchText='',
Searching=false,GlobalSearch=false,LastSearchTab=nil,ActiveTab=nil,Tabs={},TabButtons={},
DependencyBoxes={},KeybindFrame=nil,KeybindContainer=nil,KeybindToggles={},Notifications={},
NotifySide='Right',NotifyTweenInfo=TweenInfo.new(0.25,Enum.EasingStyle.Quad,Enum.EasingDirection.
Out),Dialogues={},ActiveDialog=nil,ActiveLoading=nil,Corners={},SpecificCorners={},TweenInfo=
TweenInfo.new(0.1,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),TabTransitionInfo=TweenInfo.new(
0.22,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),TabSwipeOffset=26,TabSwipeFrom='bottom',
WindowAnimationInfo=TweenInfo.new(0.35,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
DropdownTransitionInfo=TweenInfo.new(0.18,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
KeyPickerTransitionInfo=TweenInfo.new(0.15,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
GroupboxTweenInfo=TweenInfo.new(0.2,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
RotatingChevronTweenInfo=TweenInfo.new(0.3,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
Animations={ToggleWindow=false,TabSwitch=false,Groupbox=false,Dropdown=false,KeyPicker=false},
Toggled=false,Unloaded=false,Labels=p,Buttons=q,Toggles=r,Options=s,ToggleKeybind=Enum.KeyCode.
RightControl,ShowToggleFrameInKeybinds=true,NotifyOnError=false,ShowCustomCursor=true,ForceCheckbox
=false,CantDragForced=false,DraggableElements={},Signals={},UnloadSignals={},OriginalMinSize=
Vector2.new(480,360),MinSize=Vector2.new(480,360),DPIScale=1,CornerRadius=4,IsLightTheme=false,
Scheme={BackgroundColor=Color3.fromRGB(15,15,15),MainColor=Color3.fromRGB(25,25,25),AccentColor=
Color3.fromRGB(125,85,255),OutlineColor=Color3.fromRGB(40,40,40),FontColor=Color3.new(1,1,1),Font=
Font.fromEnum(Enum.Font.Code),RedColor=Color3.fromRGB(255,50,50),DestructiveColor=Color3.fromRGB(
220,38,38),DarkColor=Color3.new(0,0,0),WhiteColor=Color3.new(1,1,1),BackgroundImage=''},Registry={}
,Scales={},ScalesOffset={},ImageManager=v,ShowCursorBinding=string.sub(tostring({}),10),Notify=nil,
Toggle=nil}if d:IsStudio()then if f.TouchEnabled and not f.MouseEnabled then x.IsMobile=true x.
OriginalMinSize=Vector2.new(480,240)else x.IsMobile=false x.OriginalMinSize=Vector2.new(480,360)end
else pcall(function()x.DevicePlatform=f:GetPlatform()end)x.IsMobile=(x.DevicePlatform==Enum.
Platform.Android or x.DevicePlatform==Enum.Platform.IOS)x.OriginalMinSize=x.IsMobile and Vector2.
new(480,240)or Vector2.new(480,360)end local y={Frame={BorderSizePixel=0},ImageLabel={
BackgroundTransparency=1,BorderSizePixel=0},ImageButton={AutoButtonColor=false,BorderSizePixel=0},
ScrollingFrame={BorderSizePixel=0},TextLabel={BorderSizePixel=0,FontFace='Font',RichText=true,
TextColor3='FontColor'},TextButton={AutoButtonColor=false,BorderSizePixel=0,FontFace='Font',
RichText=true,TextColor3='FontColor'},TextBox={BorderSizePixel=0,FontFace='Font',PlaceholderColor3=
function()local y,z,A=x.Scheme.FontColor:ToHSV()return Color3.fromHSV(y,z,A/2)end,Text='',
TextColor3='FontColor'},UIListLayout={SortOrder=Enum.SortOrder.LayoutOrder},UIStroke={
ApplyStrokeMode=Enum.ApplyStrokeMode.Border},Window={Title='No Title',Footer='No Footer',Position=
UDim2.fromOffset(6,6),Size=UDim2.fromOffset(720,600),IconSize=UDim2.fromOffset(30,30),AutoShow=true
,Center=true,Resizable=true,SearchbarSize=UDim2.fromScale(1,1),GlobalSearch=false,CornerRadius=4,
NotifySide='Right',ShowCustomCursor=true,Font=Enum.Font.Code,ToggleKeybind=Enum.KeyCode.
RightControl,ShowMobileButtons=true,MobileButtonsSide='Left',UnlockMouseWhileOpen=true,
EnableSidebarResize=false,EnableCompacting=true,DisableCompactingSnap=false,SidebarCompacted=false,
MinContainerWidth=256,MinSidebarWidth=128,SidebarCompactWidth=48,SidebarCollapseThreshold=0.5,
CompactWidthActivation=128,BackgroundImage='',Animations={ToggleWindow=false,TabSwitch=false,
Groupbox=false,Dropdown=false,KeyPicker=false},TabTransitionTime=0.22,TabSwipeOffset=26,
TabSwipeFrom='bottom'},Dialog={Title='Dialog',Description='Description',AutoDismiss=true,
OutsideClickDismiss=true,FooterButtons={}},Loading={Title='mspaint',Icon=95816097006870,IconSize=
UDim2.fromOffset(30,30),LoadingIcon=v.GetAsset('LoadingIcon'),LoadingIconColor=nil,
LoadingIconTweenTime=1,CurrentStep=0,TotalSteps=10,ShowSidebar=false,AutoResizeHeight=false,
WindowWidth=450,WindowHeight=275,ContentWidth=450,SidebarWidth=250},Toggle={Text='Toggle',Default=
false,Callback=function()end,Changed=function()end,Risky=false,Disabled=false,Visible=true},Input={
Text='Input',Default='',Finished=false,Numeric=false,ClearTextOnFocus=true,ClearTextOnBlur=false,
Placeholder='',AllowEmpty=true,EmptyReset='---',Callback=function()end,Changed=function()end,
VerifyValue=nil,Disabled=false,Visible=true},Slider={Text='Slider',Default=0,Min=0,Max=100,Rounding
=0,Prefix='',Suffix='',Callback=function()end,Changed=function()end,Disabled=false,Visible=true,
AllowRightClickInput=true},Dropdown={Values={},DisabledValues={},ValueImages={},Multi=false,
DragSelect=false,MaxVisibleDropdownItems=8,Callback=function()end,Changed=function()end,Disabled=
false,Visible=true},Viewport={Object=nil,Camera=nil,Clone=true,AutoFocus=true,Interactive=false,
Height=200,Visible=true},Image={Image='',Transparency=0,BackgroundTransparency=0,Color=Color3.new(1
,1,1),RectOffset=Vector2.zero,RectSize=Vector2.zero,ScaleType=Enum.ScaleType.Fit,Height=200,Visible
=true},Video={Video='',Looped=false,Playing=false,Volume=1,Height=200,Visible=true},UIPassthrough={
Instance=nil,Height=24,Visible=true},KeyPicker={Text='KeyPicker',Default='None',DefaultModifiers={}
,Blacklisted={},BlacklistedModifiers={},Whitelisted={},WhitelistedModifiers={},Mode='Toggle',Modes=
{'Always','Toggle','Hold'},SyncToggleState=false,Callback=function()end,ChangedCallback=function()
end,Changed=function()end,Clicked=function()end},ColorPicker={Default=Color3.new(1,1,1),Callback=
function()end,Changed=function()end}}local z={Bottom={0,1},Right={1,0}}local A={Left={0.5,1},Right=
{0.5,1}}local B={RedColor='Red',WhiteColor='White',DarkColor='Dark'}local C={Red='RedColor',White=
'WhiteColor',Dark='DarkColor'}local function GetSchemeValue(D)if not D then return nil end local E=
B[D]if E and x.Scheme[E]~=nil then x.Scheme[D]=x.Scheme[E]x.Scheme[E]=nil return x.Scheme[D]end
local F=C[D]if F and x.Scheme[F]~=nil then warn(string.format(
'Scheme Value %q is deprecated, please use %q instead.',D,F))return x.Scheme[F]end return x.Scheme[
D]end local function WaitForEvent(D,E,F)local G=Instance.new('BindableEvent')local H=D:Once(
function(...)if not F or typeof(F)=='function'and F(...)then G:Fire(true)else G:Fire(false)end end)
task.delay(E,function()H:Disconnect()G:Fire(false)end)local I=G.Event:Wait()G:Destroy()return I end
local function IsMouseInput(D:InputObject,E:boolean?)return D.UserInputType==Enum.UserInputType.
MouseButton1 or(E==true and D.UserInputType==Enum.UserInputType.MouseButton2)or D.UserInputType==
Enum.UserInputType.Touch end local function IsClickInput(D:InputObject,E:boolean?)return
IsMouseInput(D,E)and D.UserInputState==Enum.UserInputState.Begin and x.IsRobloxFocused end
local function IsHoverInput(D:InputObject)return(D.UserInputType==Enum.UserInputType.MouseMovement
or D.UserInputType==Enum.UserInputType.Touch)and D.UserInputState==Enum.UserInputState.Change end
local function IsDragInput(D:InputObject,E:boolean?)return IsMouseInput(D,E)and(D.UserInputState==
Enum.UserInputState.Begin or D.UserInputState==Enum.UserInputState.Change)and x.IsRobloxFocused end
local function IsMouseClickInput(D:InputObject)return D.UserInputType==Enum.UserInputType.
MouseButton1 or D.UserInputType==Enum.UserInputType.MouseButton2 or D.UserInputType==Enum.
UserInputType.MouseButton3 end local function IsMovementInput(D:InputObject)return(D.UserInputType
==Enum.UserInputType.MouseMovement or D.UserInputType==Enum.UserInputType.Touch)and x.
IsRobloxFocused end local function GetTableSize(D:{[any]:any})local E=0 for F,G in D do E+=1 end
return E end local function StopTween(D:TweenBase,E:boolean?)if not D then return end if D.
PlaybackState==Enum.PlaybackState.Playing then D:Cancel()end if E==true then pcall(D.Destroy,D)end
end local function Trim(D:string)return D:match('^%s*(.-)%s*$')end local function Round(D,E)assert(
E>=0,'Invalid rounding number.')if E==0 then return math.floor(D)end return tonumber(string.format(
'%.'..E..'f',D))end local function GetPlayers(D:boolean?)local E=c:GetPlayers()if D then local G=
table.find(E,n)if G then table.remove(E,G)end end table.sort(E,function(G,H)return G.Name:lower()<H
.Name:lower()end)return E end local function GetTeams()local D=h:GetTeams()table.sort(D,function(E,
G)return E.Name:lower()<G.Name:lower()end)return D end function x:UpdateDependencyBoxes()for D,E in
x.DependencyBoxes do E:Update(true)end if x.Searching then x:UpdateSearch(x.SearchText)end end
local function CheckDepbox(D,E)local G=0 for H,I in D.Elements do if I.Type=='Divider'then I.Holder
.Visible=false continue elseif I.SubButton then local J=false if I.Text:lower():match(E)and I.
Visible then J=true else I.Base.Visible=false end if I.SubButton.Text:lower():match(E)and I.
SubButton.Visible then J=true else I.SubButton.Base.Visible=false end I.Holder.Visible=J if J then
G+=1 end continue end if I.Text and I.Text:lower():match(E)and I.Visible then I.Holder.Visible=true
G+=1 else I.Holder.Visible=false end end for H,I in D.DependencyBoxes do if not I.Visible then
continue end G+=CheckDepbox(I,E)end D.Holder.Visible=G>0 return G end local function RestoreDepbox(
D)for E,G in D.Elements do G.Holder.Visible=G.Visible~=false if G.SubButton then G.Base.Visible=G.
Visible G.SubButton.Base.Visible=G.SubButton.Visible end end D:Resize()D.Holder.Visible=true for E,
G in D.DependencyBoxes do if not G.Visible then continue end RestoreDepbox(G)end end local function
ApplySearchToTab(D,E)if not D then return end local G=false for H,I in D.Groupboxes do if I.Visible
==false then continue end local J=0 for K,L in I.Elements do if L.Type=='Divider'then L.Holder.
Visible=false continue elseif L.SubButton then local M=false if L.Text:lower():match(E)and L.
Visible then M=true else L.Base.Visible=false end if L.SubButton.Text:lower():match(E)and L.
SubButton.Visible then M=true else L.SubButton.Base.Visible=false end L.Holder.Visible=M if M then
J+=1 end continue end if L.Text and L.Text:lower():match(E)and L.Visible then L.Holder.Visible=true
J+=1 else L.Holder.Visible=false end end for K,L in I.DependencyBoxes do if not L.Visible then
continue end J+=CheckDepbox(L,E)end if J>0 then I:Resize()G=true end I.BoxHolder.Visible=J>0 end
for H,I in D.Tabboxes do local J=0 local K={}for L,M in I.Tabs do K[M]=0 for N,O in M.Elements do
if O.Type=='Divider'then O.Holder.Visible=false continue elseif O.SubButton then local P=false if O
.Text:lower():match(E)and O.Visible then P=true else O.Base.Visible=false end if O.SubButton.Text:
lower():match(E)and O.SubButton.Visible then P=true else O.SubButton.Base.Visible=false end O.
Holder.Visible=P if P then K[M]+=1 end continue end if O.Text and O.Text:lower():match(E)and O.
Visible then O.Holder.Visible=true K[M]+=1 else O.Holder.Visible=false end end for N,O in M.
DependencyBoxes do if not O.Visible then continue end K[M]+=CheckDepbox(O,E)end end for L,M in K do
L.ButtonHolder.Visible=M>0 if M>0 then J+=1 G=true if I.ActiveTab==L then L:Resize()elseif I.
ActiveTab and K[I.ActiveTab]==0 then L:Show()end end end I.BoxHolder.Visible=J>0 end return G end
local function ResetTab(D)if not D then return end for E,G in D.Groupboxes do for H,I in G.Elements
do I.Holder.Visible=I.Visible~=false if I.SubButton then I.Base.Visible=I.Visible I.SubButton.Base.
Visible=I.SubButton.Visible end end for H,I in G.DependencyBoxes do if not I.Visible then continue
end RestoreDepbox(I)end G:Resize()G.BoxHolder.Visible=G.Visible~=false end for E,G in D.Tabboxes do
for H,I in G.Tabs do for J,K in I.Elements do K.Holder.Visible=K.Visible~=false if K.SubButton then
K.Base.Visible=K.Visible K.SubButton.Base.Visible=K.SubButton.Visible end end for J,K in I.
DependencyBoxes do if not K.Visible then continue end RestoreDepbox(K)end I.ButtonHolder.Visible=
true end if G.ActiveTab then G.ActiveTab:Resize()end G.BoxHolder.Visible=true end end function x:
UpdateSearch(D)x.SearchText=D local E={}if x.GlobalSearch then for G,H in x.Tabs do if typeof(H)==
'table'and not H.IsKeyTab then table.insert(E,H)end end elseif x.LastSearchTab and typeof(x.
LastSearchTab)=='table'then table.insert(E,x.LastSearchTab)end for G,H in ipairs(E)do ResetTab(H)
end local G=D:lower()if Trim(G)==''then x.Searching=false x.LastSearchTab=nil return end if not x.
GlobalSearch and x.ActiveTab and x.ActiveTab.IsKeyTab then x.Searching=false x.LastSearchTab=nil
return end x.Searching=true local H={}if x.GlobalSearch then H=E if#H==0 then for I,J in x.Tabs do
if typeof(J)=='table'and not J.IsKeyTab then table.insert(H,J)end end end elseif x.ActiveTab then
table.insert(H,x.ActiveTab)end local I local J=false for K,L in ipairs(H)do local M=
ApplySearchToTab(L,G)if M then if not I then I=L end if L==x.ActiveTab then J=true end end end if x
.GlobalSearch then if J and x.ActiveTab then x.ActiveTab:RefreshSides()elseif I then local K=D task
.defer(function()if x.SearchText~=K then return end if x.ActiveTab~=I then I:Show()end end)end x.
LastSearchTab=nil else x.LastSearchTab=x.ActiveTab end end function x:AddToRegistry(D,E)x.Registry[
D]=E end function x:RemoveFromRegistry(D)x.Registry[D]=nil end function x:UpdateColorsUsingRegistry
()for D,E in x.Registry do for G,H in E do local I=GetSchemeValue(H)if I or typeof(H)=='function'
then D[G]=I or H()end end end end function x:SetDPIScale(D:number)x.DPIScale=D/100 x.MinSize=x.
OriginalMinSize*x.DPIScale for E,G in x.Scales do G.Scale=x.DPIScale-(tonumber(x.ScalesOffset[G])or
0)end for E,G in s do if G.Type=='Dropdown'then G:RecalculateListSize()end end for E,G in x.
Notifications do G:Resize()end x:UpdateNotificationPositions(true)end function x:GiveSignal(D:
RBXScriptConnection|RBXScriptSignal)local E=typeof(D)if D and(E=='RBXScriptConnection'or E==
'RBXScriptSignal')then table.insert(x.Signals,D)end return D end function IsValidCustomIcon(D:
string)return typeof(D)=='string'and(D:match('^rbxasset://textures/')or D:match(
'roblox%.com/asset/%?id=')or D:match('rbxthumb://type='))end local function IsCustomAssetIcon(D:
string,E:boolean)return typeof(D)=='string'and(D:match('^content://')or D:match('^rbxasset://%x+/')
or(E==true and D:match('^rbxassetid://')))end type Icon={Url:string,Id:number,IconName:string,
ImageRectOffset:Vector2,ImageRectSize:Vector2}type IconModule={Icons:{string},GetAsset:(Name:string
)->Icon?}local D,E=pcall(function()return(loadstring(game:HttpGet(
[[https://gitlab.com/upio/lucide-roblox-direct/-/raw/main/source.lua]]))::()->IconModule)()end)
function x:GetIcon(G:string)if not D then return end local H,I=pcall(E.GetAsset,G)if not H then
return end return I end function x:GetCustomIcon(G:string):any if not G then return nil end if
tonumber(G)then G=string.format('rbxassetid://%s',tostring(G))end if IsCustomAssetIcon(G,true)then
return{Url=G,ImageRectOffset=Vector2.zero,ImageRectSize=Vector2.zero}elseif IsValidCustomIcon(G)
then return{Url=G,ImageRectOffset=Vector2.zero,ImageRectSize=Vector2.zero,Custom=true}end local H=x
:GetIcon(G)if H then return H end return nil end function x:Validate(G:{[string]:any},H:{[string]:
any}):{[string]:any}if typeof(G)~='table'then return H end for I,J in H do if typeof(I)=='number'
then continue end if typeof(J)=='table'then G[I]=x:Validate(G[I],J)elseif G[I]==nil then G[I]=J end
end return G end local function FillInstance(G:{[string]:any},H:GuiObject)local I=x.Registry[H]or{}
for J,K in G do if J~='Text'then local L=GetSchemeValue(K)if L or typeof(K)=='function'then I[J]=K
K=L or K()else I[J]=nil end end H[J]=K end if GetTableSize(I)>0 then x.Registry[H]=I end end
local function New(G:string,H:{[string]:any}):any local I=Instance.new(G)if y[G]then FillInstance(y
[G],I)end FillInstance(H,I)if H['Parent']and not H['ZIndex']then pcall(function()I.ZIndex=H.Parent.
ZIndex end)end return I end local function SafeParentUI(G:Instance,H:Instance|(()->Instance))local
I,J=pcall(function()if not H then H=b end local I if typeof(H)=='function'then I=H()else I=H end G.
Parent=I end)if not(I and G.Parent)then G.Parent=x.LocalPlayer:WaitForChild('PlayerGui',math.huge)
end end local function ParentUI(G:Instance,H:boolean?)if H then SafeParentUI(G,b)return end pcall(l
,G)SafeParentUI(G,m)end local G=New('ScreenGui',{Name='Obsidian',DisplayOrder=998,ResetOnSpawn=
false})ParentUI(G)x.ScreenGui=G G.DescendantRemoving:Connect(function(H)x:RemoveFromRegistry(H)end)
local H=New('TextButton',{BackgroundTransparency=1,Modal=false,Size=UDim2.fromScale(0,0),
AnchorPoint=Vector2.zero,Text='',ZIndex=-999,Parent=G})local I,J do I=New('Frame',{AnchorPoint=
Vector2.new(0.5,0.5),BackgroundColor3='WhiteColor',Size=UDim2.fromOffset(9,1),Visible=false,ZIndex=
11000,Parent=G})New('Frame',{AnchorPoint=Vector2.new(0.5,0.5),BackgroundColor3='DarkColor',Position
=UDim2.fromScale(0.5,0.5),Size=UDim2.new(1,2,1,2),ZIndex=10999,Parent=I})local K=New('Frame',{
AnchorPoint=Vector2.new(0.5,0.5),BackgroundColor3='WhiteColor',Position=UDim2.fromScale(0.5,0.5),
Size=UDim2.fromOffset(1,9),ZIndex=11000,Parent=I})New('Frame',{AnchorPoint=Vector2.new(0.5,0.5),
BackgroundColor3='DarkColor',Position=UDim2.fromScale(0.5,0.5),Size=UDim2.new(1,2,1,2),ZIndex=10999
,Parent=K})J=New('ImageLabel',{AnchorPoint=Vector2.new(0.5,0.5),BackgroundTransparency=1,Position=
UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(20,20),ZIndex=11000,Visible=false,Parent=I})end
local K local L={}do K=New('Frame',{AnchorPoint=Vector2.new(1,0),BackgroundTransparency=1,Position=
UDim2.new(1,-6,0,6),Size=UDim2.new(0,300,1,-6),Parent=G})table.insert(x.Scales,New('UIScale',{
Parent=K}))end function x:ResetCursorIcon()J.Visible=false J.Size=UDim2.fromOffset(20,20)end
function x:ChangeCursorIcon(M:string)if not M or M==''then x:ResetCursorIcon()return end local N=x:
GetCustomIcon(M)assert(N,
[[Image must be a valid Roblox asset or a valid URL or a valid lucide icon.]])J.Visible=true J.
Image=N.Url J.ImageRectOffset=N.ImageRectOffset J.ImageRectSize=N.ImageRectSize end function x:
ChangeCursorIconSize(M:UDim2)assert(typeof(M)=='UDim2','UDim2 expected.')J.Size=M end function x:
GetBetterColor(M:Color3,N:number):Color3 N=N*(x.IsLightTheme and-4 or 2)return Color3.fromRGB(math.
clamp(M.R*255+N,0,255),math.clamp(M.G*255+N,0,255),math.clamp(M.B*255+N,0,255))end function x:
GetLighterColor(M:Color3):Color3 local N,O,P=M:ToHSV()return Color3.fromHSV(N,math.max(0,O-0.1),
math.min(1,P+0.1))end function x:GetDarkerColor(M:Color3):Color3 local N,O,P=M:ToHSV()return Color3
.fromHSV(N,O,P/2)end function x:GetKeyString(M:Enum.KeyCode)if M.EnumType==Enum.KeyCode and M.Value
>33 and M.Value<127 then return string.char(M.Value)end return M.Name end function x:GetTextBounds(
M:string,N:Font,O:number,P:number?):(number,number)local Q=Instance.new('GetTextBoundsParams')Q.
Text=M Q.RichText=true Q.Font=N Q.Size=O Q.Width=P or workspace.CurrentCamera.ViewportSize.X-32
local R=g:GetTextBoundsAsync(Q)return R.X,R.Y end function x:MouseIsOverFrame(M:GuiObject,N:Vector2
):boolean local O,P=M.AbsolutePosition,M.AbsoluteSize return N.X>=O.X and N.X<=O.X+P.X and N.Y>=O.Y
and N.Y<=O.Y+P.Y end function x:IsInsideFrame(M:GuiObject,N:GuiObject)local O=N.AbsolutePosition
local P=N.AbsoluteSize local Q=M.AbsolutePosition local R=M.AbsoluteSize return O.X>=Q.X and O.X+P.
X<=Q.X+R.X and O.Y>=Q.Y and O.Y+P.Y<=Q.Y+R.Y end function x:SafeCallback(M:(...any)->...any,...:any
)if not(M and typeof(M)=='function')then return end local N=table.pack(xpcall(M,function(N)task.
defer(error,debug.traceback(N,2))if x.NotifyOnError and x.Notify then x:Notify(N)end return N end,
...))if not N[1]then return nil end return table.unpack(N,2,N.n)end function
GetOverlappingDraggable(M:GuiObject,N:Vector2?)local O=N or M.AbsolutePosition local P=M.
AbsoluteSize for Q,R in ipairs(x.DraggableElements)do if R==M or not R.Visible or not R.Parent then
continue end local S=R.AbsolutePosition local T=R.AbsoluteSize if O.X<S.X+T.X and O.X+P.X>S.X and O
.Y<S.Y+T.Y and O.Y+P.Y>S.Y then return R end end return nil end function GetNonOverlappingPosition(
M:GuiObject,N:UDim2?)local O=(workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize or
Vector2.new(1920,1080))-Vector2.new(100,100)local P=N and Vector2.new(N.X.Offset,N.Y.Offset)or
Vector2.new(6,6)local Q=6 local R=P.X local S=P.Y local T=M.AbsoluteSize if T.X==0 and T.Y==0 then
d.RenderStepped:Wait()T=M.AbsoluteSize end if T.X==0 then T=Vector2.new(150,40)end local U=T.X
while true do local V=GetOverlappingDraggable(M,Vector2.new(R,S))if not V then break end if V.
AbsoluteSize.X>U then U=V.AbsoluteSize.X end local W=V.AbsolutePosition.Y+V.AbsoluteSize.Y+Q if W+T
.Y>O.Y-Q then local X=R+U+Q if X+T.X>O.X-Q then break end S=P.Y R=X U=T.X else S=W end end return
UDim2.fromOffset(R,S)end function PositionDraggable(M:GuiObject,N:UDim2?)M.Position=
GetNonOverlappingPosition(M,N)end function x:MakeDraggable(M:GuiObject,N:GuiObject,O:boolean?,P:
boolean?)local Q local R local S=false local T local U local V U=N.InputBegan:Connect(function(W:
InputObject)if not IsClickInput(W)or P and x.CantDragForced then return end Q=W.Position R=M.
Position S=true T=W.Changed:Connect(function()if W.UserInputState~=Enum.UserInputState.End then
return end S=false if T and T.Connected then T:Disconnect()T=nil end end)end)V=f.InputChanged:
Connect(function(W:InputObject)if(not O and not x.Toggled)or(P and x.CantDragForced)or not(G and G.
Parent)then S=false if T and T.Connected then T:Disconnect()T=nil end return end if S and
IsHoverInput(W)then local X=W.Position-Q M.Position=UDim2.new(R.X.Scale,R.X.Offset+X.X,R.Y.Scale,R.
Y.Offset+X.Y)end end)x:GiveSignal(V)x:GiveSignal(U)M.Destroying:Once(function()if V and V.Connected
then V:Disconnect()end if U and U.Connected then U:Disconnect()end if T and T.Connected then T:
Disconnect()end local W=table.find(x.Signals,V)if W then table.remove(x.Signals,W)end local X=table
.find(x.Signals,U)if X then table.remove(x.Signals,X)end end)end function x:MakeResizable(M:
GuiObject,N:GuiObject,O:(()->())?)local P local Q local R=false local S local T local U T=N.
InputBegan:Connect(function(V:InputObject)if not IsClickInput(V)then return end P=V.Position Q=M.
Size R=true S=V.Changed:Connect(function()if V.UserInputState~=Enum.UserInputState.End then return
end R=false if S and S.Connected then S:Disconnect()S=nil end end)end)U=f.InputChanged:Connect(
function(V:InputObject)if not M.Visible or not(G and G.Parent)then R=false if S and S.Connected
then S:Disconnect()S=nil end return end if R and IsHoverInput(V)then local W=V.Position-P M.Size=
UDim2.new(Q.X.Scale,math.clamp(Q.X.Offset+W.X,x.MinSize.X,math.huge),Q.Y.Scale,math.clamp(Q.Y.
Offset+W.Y,x.MinSize.Y,math.huge))if O then x:SafeCallback(O)end end end)x:GiveSignal(U)x:
GiveSignal(T)M.Destroying:Once(function()if U and U.Connected then U:Disconnect()end if T and T.
Connected then T:Disconnect()end if S and S.Connected then S:Disconnect()end local V=table.find(x.
Signals,U)if V then table.remove(x.Signals,V)end local W=table.find(x.Signals,T)if W then table.
remove(x.Signals,W)end end)end function x:MakeCover(M:GuiObject,N:string)local O=z[N]or{0,0}local P
=A[N]or{1,0.5}local Q=New('Frame',{AnchorPoint=Vector2.new(O[1],O[2]),BackgroundColor3=M.
BackgroundColor3,Position=UDim2.fromScale(O[1],O[2]),Size=UDim2.fromScale(P[1],P[2]),Parent=M})
return Q end function x:MakeLine(M:GuiObject,N)local O=New('Frame',{AnchorPoint=N.AnchorPoint or
Vector2.zero,BackgroundColor3='OutlineColor',Position=N.Position,Size=N.Size,ZIndex=N.ZIndex or M.
ZIndex,Parent=M})return O end function x:AddOutline(M:GuiObject)local N=New('UIStroke',{Color=
'OutlineColor',Thickness=1,ZIndex=2,Parent=M})local O=New('UIStroke',{Color='DarkColor',Thickness=
1.5,ZIndex=1,Parent=M})return N,O end function x:AddBlank(M:GuiObject,N:UDim2)return New('Frame',{
BackgroundTransparency=1,Size=N or UDim2.fromScale(0,0),Parent=M})end local M={}local N=
setmetatable({},{__mode='k'})function x:PlayTabAnimation(O:CanvasGroup,P:boolean,Q:(()->())?)if not
O then if Q then Q()end return end local R=N[O]if R then StopTween(R,true)N[O]=nil end local S=O.
ZIndex if not(x.Animations and x.Animations.TabSwitch)then O.Visible=P O.GroupTransparency=P and 0
or 1 O.Position=UDim2.fromScale(0,0)O.ZIndex=S if Q then Q()end return end if P then local T=x.
TabTransitionInfo or TweenInfo.new(0.22,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)local U=x.
TabSwipeOffset or 26 local V=string.lower(x.TabSwipeFrom or'bottom')local W if V=='left'then W=
UDim2.fromOffset(-U,0)elseif V=='top'then W=UDim2.fromOffset(0,-U)elseif V=='right'then W=UDim2.
fromOffset(U,0)else W=UDim2.fromOffset(0,U)end O.ZIndex=S+1 O.GroupTransparency=1 O.Position=W O.
Visible=true local X=i:Create(O,T,{GroupTransparency=0,Position=UDim2.fromScale(0,0)})N[O]=X X:
Play()local Y Y=X.Completed:Connect(function(Z)if Y then Y:Disconnect()end if N[O]==X then N[O]=nil
end if Z==Enum.PlaybackState.Cancelled then return end O.ZIndex=S if Q then Q()end end)else O.
GroupTransparency=1 O.Visible=false O.Position=UDim2.fromScale(0,0)O.ZIndex=S if Q then Q()end end
end function x:MakeOutline(O:GuiObject,P:number?,Q:number?)warn(
[[Obsidian:MakeOutline is deprecated, please use Obsidian:AddOutline instead.]])local R=New('Frame'
,{BackgroundColor3='DarkColor',Position=UDim2.fromOffset(-2,-2),Size=UDim2.new(1,4,1,4),ZIndex=Q,
Parent=O})local S=New('Frame',{BackgroundColor3='OutlineColor',Position=UDim2.fromOffset(1,1),Size=
UDim2.new(1,-2,1,-2),ZIndex=Q,Parent=R})if P and P>0 then New('UICorner',{CornerRadius=UDim.new(0,P
+1),Parent=R})New('UICorner',{CornerRadius=UDim.new(0,P),Parent=S})end return R,S end function x:
AddDraggableLabel(...)local O=select(1,...)local P local Q local R='left'if typeof(O)=='table'then
P=O.Text Q=O.Icon R=O.IconPosition or'left'elseif typeof(O)=='string'then P=O Q=select(2,...)R=
select(3,...)or'left'end if typeof(R)~='string'then R='left'end R=string.lower(R)assert(R=='left'or
R=='right',"Icon Position needs to be either 'left' or 'right'.")local S={Connections={},Destroyed=
false}local T local U=New('TextLabel',{AutomaticSize=Enum.AutomaticSize.XY,BackgroundColor3=
'BackgroundColor',Size=UDim2.fromOffset(0,0),Position=UDim2.fromOffset(6,6),Text=P,TextSize=15,
ZIndex=10,Parent=G})table.insert(x.Corners,New('UICorner',{CornerRadius=UDim.new(0,x.CornerRadius),
Parent=U}))local V=New('UIPadding',{PaddingBottom=UDim.new(0,6),PaddingLeft=UDim.new(0,12),
PaddingRight=UDim.new(0,12),PaddingTop=UDim.new(0,6),Parent=U})table.insert(x.Scales,New('UIScale',
{Parent=U}))x:AddOutline(U)x:MakeDraggable(U,U,true)function S:SetText(W:string)U.Text=W end
function S:SetIcon(W:string)Q=W local X=Q and Trim(tostring(Q))~=''if X then local Y=x:
GetCustomIcon(Q)assert(Y,
[[Icon must be a valid Roblox asset or a valid URL or a valid lucide icon.]])T=T or New(
'ImageLabel',{BackgroundTransparency=1,ImageColor3='FontColor',Size=UDim2.fromOffset(16,16),ZIndex=
11,Parent=U})T.Image=Y.Url T.ImageRectOffset=Y.ImageRectOffset T.ImageRectSize=Y.ImageRectSize end
if T then T.Visible=X end S:SetIconPosition(R)end function S:SetIconPosition(W:string)R=string.
lower(W)assert(R=='left'or R=='right',"Icon Position needs to be either 'left' or 'right'.")local X
=Q and Trim(tostring(Q))~=''V.PaddingLeft=UDim.new(0,(X and R=='left')and 34 or 12)V.PaddingRight=
UDim.new(0,(X and R=='right')and 34 or 12)if T then if R=='left'then T.AnchorPoint=Vector2.new(0,
0.5)T.Position=UDim2.new(0,-22,0.5,0)else T.AnchorPoint=Vector2.new(1,0.5)T.Position=UDim2.new(1,22
,0.5,0)end end end function S:SetVisible(W:boolean)U.Visible=W end S:SetIcon(Q)S.Label=U if not
table.find(x.DraggableElements,U)then table.insert(x.DraggableElements,U)end PositionDraggable(U,U.
Position)function S:Destroy()S.Destroyed=true if S.Connections then for W,X in S.Connections do X:
Disconnect()end end local W=table.find(x.DraggableElements,U)if W then table.remove(x.
DraggableElements,W)end if U then U:Destroy()end end return S end function x:AddDraggableButton(...
)local O=select(1,...)local P local Q local R local S if typeof(O)=='table'then P=O.Text Q=O.
Callback or O.Func R=O.ExcludeScaling S=O.ExcludeDragging elseif typeof(O)=='string'then P=O Q=
select(2,...)R=select(3,...)S=select(4,...)end local T={Connections={},Destroyed=false}local U=New(
'TextButton',{BackgroundColor3='BackgroundColor',Position=UDim2.fromOffset(6,6),TextSize=16,ZIndex=
10,Parent=G})table.insert(x.Corners,New('UICorner',{CornerRadius=UDim.new(0,x.CornerRadius),Parent=
U}))if not R then table.insert(x.Scales,New('UIScale',{Parent=U}))end x:AddOutline(U)local V=if S
then 0.25 else math.huge U.InputBegan:Connect(function(W:InputObject)if not IsClickInput(W)then
return end local X=tick()local Y Y=W.Changed:Connect(function()if W.UserInputState~=Enum.
UserInputState.End then return end local Z=tick()-X>V if Z then return end x:SafeCallback(Q,T)if Y
and Y.Connected then Y:Disconnect()Y=nil end end)end)function T:SetText(W:string)local X,Y=x:
GetTextBounds(W,x.Scheme.Font,16)U.Text=W U.Size=UDim2.fromOffset(X*2,Y*2)end x:MakeDraggable(U,U,
true)T:SetText(P)T.Button=U if not table.find(x.DraggableElements,U)then table.insert(x.
DraggableElements,U)end PositionDraggable(U,U.Position)function T:Destroy()T.Destroyed=true if T.
Connections then for W,X in T.Connections do X:Disconnect()end end local W=table.find(x.
DraggableElements,U)if W then table.remove(x.DraggableElements,W)end if U then U:Destroy()end end
return T end function x:AddDraggableMenu(O:string)local P=New('Frame',{AutomaticSize=Enum.
AutomaticSize.XY,BackgroundColor3='BackgroundColor',Position=UDim2.fromOffset(6,6),Size=UDim2.
fromOffset(0,0),ZIndex=10,Parent=G})table.insert(x.Corners,New('UICorner',{CornerRadius=UDim.new(0,
x.CornerRadius),Parent=P}))table.insert(x.Scales,New('UIScale',{Parent=P}))x:AddOutline(P)x:
MakeLine(P,{Position=UDim2.fromOffset(0,34),Size=UDim2.new(1,0,0,1)})local Q=New('TextLabel',{
BackgroundTransparency=1,Size=UDim2.new(1,0,0,34),Text=O,TextSize=15,TextXAlignment=Enum.
TextXAlignment.Left,Parent=P})New('UIPadding',{PaddingLeft=UDim.new(0,12),PaddingRight=UDim.new(0,
12),Parent=Q})local R=New('Frame',{BackgroundTransparency=1,Position=UDim2.fromOffset(0,35),Size=
UDim2.new(1,0,1,-35),Parent=P})New('UIListLayout',{Padding=UDim.new(0,7),Parent=R})New('UIPadding',
{PaddingBottom=UDim.new(0,7),PaddingLeft=UDim.new(0,7),PaddingRight=UDim.new(0,7),PaddingTop=UDim.
new(0,7),Parent=R})x:MakeDraggable(P,Q,true)if not table.find(x.DraggableElements,P)then table.
insert(x.DraggableElements,P)end PositionDraggable(P,P.Position)return P,R end function x:
AddDraggableImageButton(...)local O=select(1,...)local P local Q local R local S local T if typeof(
O)=='table'then P=O.Icon Q=O.IconSize or 24 R=O.Callback or O.Func S=O.ExcludeScaling T=O.
ExcludeDragging elseif typeof(O)=='string'or typeof(O)=='number'then P=O Q=select(2,...)R=select(3,
...)S=select(4,...)T=select(5,...)end local U={}local V=New('TextButton',{BackgroundColor3=
'BackgroundColor',Position=UDim2.fromOffset(6,6),Size=UDim2.fromOffset(Q+12,Q+12),Text='',ZIndex=10
,Parent=G})local W=New('ImageLabel',{BackgroundTransparency=1,AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(Q,Q),ImageColor3='FontColor',ZIndex=11,
Parent=V})table.insert(x.Corners,New('UICorner',{CornerRadius=UDim.new(0,x.CornerRadius),Parent=V})
)if not S then table.insert(x.Scales,New('UIScale',{Parent=V}))end x:AddOutline(V)local X=if T then
0.25 else math.huge V.InputBegan:Connect(function(Y:InputObject)if not IsClickInput(Y)then return
end local Z=tick()local _ _=Y.Changed:Connect(function()if Y.UserInputState~=Enum.UserInputState.
End then return end local aa=tick()-Z>X if aa then return end x:SafeCallback(R,U)if _ and _.
Connected then _:Disconnect()_=nil end end)end)function U:SetIcon(aa:string)P=aa or P local Y=x:
GetCustomIcon(P)assert(Y,
[[Icon must be a valid Roblox asset or a valid URL or a valid lucide icon.]])W.Image=Y.Url W.
ImageRectOffset=Y.ImageRectOffset W.ImageRectSize=Y.ImageRectSize end function U:SetIconSize(aa:
number)Q=aa W.Size=UDim2.fromOffset(Q,Q)V.Size=UDim2.fromOffset(Q+12,Q+12)end x:MakeDraggable(V,V,
true)U:SetIcon(P)U.Button=V if not table.find(x.DraggableElements,V)then table.insert(x.
DraggableElements,V)end PositionDraggable(V,V.Position)return U end do local aa=x:
AddDraggableLabel('')aa:SetVisible(false)function x:SetWatermark(O:string)warn(
[[Watermark is deprecated, please use Library:AddDraggableLabel instead.]])aa:SetText(O)end
function x:SetWatermarkVisibility(O:boolean)warn(
[[Watermark is deprecated, please use Library:AddDraggableLabel instead.]])aa:SetVisible(O)end end
local aa function x:AddContextMenu(O:GuiObject,P:UDim2|(()->()),Q:{[number]:number}|(()->{}),R:
number?,S:((Active:boolean)->())?,T:boolean?,U:('top'|'bottom'|'no_left'|'no_top_left')?,V:(
'Dropdown'|'KeyPicker'|'none')?)local W local X=O:FindFirstAncestorOfClass('ScreenGui')local Y=math
.max(10,O.ZIndex+1)if X~=G and(x.ActiveLoading and X~=x.ActiveLoading.ScreenGui)then X=G end if R
then W=New('ScrollingFrame',{AutomaticCanvasSize=R==2 and Enum.AutomaticSize.Y or Enum.
AutomaticSize.None,AutomaticSize=R==1 and Enum.AutomaticSize.Y or Enum.AutomaticSize.None,
BackgroundColor3='BackgroundColor',BottomImage='rbxasset://textures/ui/Scroll/scroll-middle.png',
CanvasSize=UDim2.fromOffset(0,0),ScrollBarImageColor3='OutlineColor',ScrollBarThickness=R==2 and 2
or 0,Size=typeof(P)=='function'and P()or P,TopImage=
'rbxasset://textures/ui/Scroll/scroll-middle.png',Visible=false,ZIndex=Y,Parent=X})else W=New(
'Frame',{BackgroundColor3='BackgroundColor',Size=typeof(P)=='function'and P()or P,Visible=false,
ZIndex=Y,Parent=X})end table.insert(x.Scales,New('UIScale',{Parent=W}))New('UIStroke',{Color=
'OutlineColor',Parent=W})local Z if T~=true then if U=='top'then Z=New('UICorner',{TopLeftRadius=
UDim.new(0,x.CornerRadius/2),TopRightRadius=UDim.new(0,x.CornerRadius/2),BottomRightRadius=UDim.
new(0,0),BottomLeftRadius=UDim.new(0,0),Parent=W})table.insert(x.SpecificCorners,Z)elseif U==
'bottom'then Z=New('UICorner',{TopLeftRadius=UDim.new(0,0),TopRightRadius=UDim.new(0,0),
BottomRightRadius=UDim.new(0,x.CornerRadius/2),BottomLeftRadius=UDim.new(0,x.CornerRadius/2),Parent
=W})table.insert(x.SpecificCorners,Z)elseif U=='no_left'then Z=New('UICorner',{TopLeftRadius=UDim.
new(0,0),TopRightRadius=UDim.new(0,x.CornerRadius/2),BottomRightRadius=UDim.new(0,x.CornerRadius/2)
,BottomLeftRadius=UDim.new(0,0),Parent=W})table.insert(x.SpecificCorners,Z)elseif U=='no_top_left'
then Z=New('UICorner',{TopLeftRadius=UDim.new(0,0),TopRightRadius=UDim.new(0,x.CornerRadius/2),
BottomRightRadius=UDim.new(0,x.CornerRadius/2),BottomLeftRadius=UDim.new(0,x.CornerRadius/2),Parent
=W})table.insert(x.SpecificCorners,Z)else Z=New('UICorner',{CornerRadius=UDim.new(0,x.CornerRadius/
2),Parent=W})table.insert(x.Corners,Z)end end local _={Connections={},Destroyed=false,Active=false,
Holder=O,Menu=W,List=nil,Signal=nil,Size=P,AutoSizeY=R==1,OpenCloseTween=nil,Animated=function()if
not V or V=='none'then return false end if not(x.Animations and x.Animations[V]==true)then return
false end return true,x[string.format('%sTransitionInfo',V)]or TweenInfo.new(0.18,Enum.EasingStyle.
Quad,Enum.EasingDirection.Out)end}if R then _.List=New('UIListLayout',{Parent=W})end function _:
Open()if aa==_ then return elseif aa then aa:Close()end aa=_ _.Active=true if typeof(Q)=='function'
then W.Position=UDim2.fromOffset(math.floor(O.AbsolutePosition.X+Q()[1]),math.floor(O.
AbsolutePosition.Y+Q()[2]))else W.Position=UDim2.fromOffset(math.floor(O.AbsolutePosition.X+Q[1]),
math.floor(O.AbsolutePosition.Y+Q[2]))end local ab=typeof(_.Size)=='function'and _.Size()or _.Size
if typeof(S)=='function'then x:SafeCallback(S,true)end if _.OpenCloseTween then StopTween(_.
OpenCloseTween,true)_.OpenCloseTween=nil end local ac,ad=_.Animated()if ac==true then local ae=ab
if _.AutoSizeY then local af=W.AbsoluteSize.Y W.AutomaticSize=Enum.AutomaticSize.None ae=UDim2.new(
ab.X.Scale,ab.X.Offset,0,af)end W.Size=UDim2.new(ae.X.Scale,ae.X.Offset,0,0)W.Visible=true local af
=i:Create(W,ad,{Size=ae})_.OpenCloseTween=af local ag ag=x:GiveSignal(af.Completed:Once(function()
if ag then ag:Disconnect()end if _.OpenCloseTween==af then StopTween(_.OpenCloseTween,true)_.
OpenCloseTween=nil if _.AutoSizeY then W.AutomaticSize=Enum.AutomaticSize.Y end end end))af:Play()
else W.Size=ab W.Visible=true end _.Signal=O:GetPropertyChangedSignal('AbsolutePosition'):Connect(
function()if typeof(Q)=='function'then W.Position=UDim2.fromOffset(math.floor(O.AbsolutePosition.X+
Q()[1]),math.floor(O.AbsolutePosition.Y+Q()[2]))else W.Position=UDim2.fromOffset(math.floor(O.
AbsolutePosition.X+Q[1]),math.floor(O.AbsolutePosition.Y+Q[2]))end if not x:IsInsideFrame(x.
WindowContainer,O)and _.Active then _:Close()end end)end function _:Close()if aa~=_ then return end
if _.Signal then _.Signal:Disconnect()_.Signal=nil end _.Active=false aa=nil if typeof(S)==
'function'then x:SafeCallback(S,false)end if _.OpenCloseTween then StopTween(_.OpenCloseTween,true)
_.OpenCloseTween=nil end local ab,ac=_.Animated()if ab==true then if _.AutoSizeY then W.
AutomaticSize=Enum.AutomaticSize.None end local ad=W.Size local ae=UDim2.new(ad.X.Scale,ad.X.Offset
,0,0)local af=i:Create(W,ac,{Size=ae})_.OpenCloseTween=af local ag ag=x:GiveSignal(af.Completed:
Once(function(ah)if ag then ag:Disconnect()end if _.OpenCloseTween==af then StopTween(_.
OpenCloseTween,true)_.OpenCloseTween=nil W.Visible=false if _.AutoSizeY then W.AutomaticSize=Enum.
AutomaticSize.Y end end end))af:Play()else W.Visible=false end end function _:Toggle()if _.Active
then _:Close()else _:Open()end end function _:SetSize(ab)_.Size=ab W.Size=typeof(ab)=='function'and
ab()or ab end function _:Destroy()_.Destroyed=true if _.Connections then for ab,ac in _.Connections
do ac:Disconnect()end end if aa==_ then _:Close()end if _.OpenCloseTween then StopTween(_.
OpenCloseTween,true)_.OpenCloseTween=nil end if W then W:Destroy()end end return _ end x:
GiveSignal(f.InputBegan:Connect(function(ab:InputObject)if x.Unloaded then return end if
IsClickInput(ab,true)then local ac=ab.Position if aa and not(x:MouseIsOverFrame(aa.Menu,ac)or x:
MouseIsOverFrame(aa.Holder,ac))then aa:Close()end end end))local ab=New('TextLabel',{AutomaticSize=
Enum.AutomaticSize.Y,BackgroundColor3='BackgroundColor',TextSize=14,TextWrapped=true,Visible=false,
ZIndex=20,Parent=G})New('UIPadding',{PaddingBottom=UDim.new(0,2),PaddingLeft=UDim.new(0,4),
PaddingRight=UDim.new(0,4),PaddingTop=UDim.new(0,2),Parent=ab})table.insert(x.Scales,New('UIScale',
{Parent=ab}))New('UIStroke',{Color='OutlineColor',Parent=ab})table.insert(x.Corners,New('UICorner',
{CornerRadius=UDim.new(0,x.CornerRadius/2),Parent=ab}))ab:GetPropertyChangedSignal(
'AbsolutePosition'):Connect(function()if x.Unloaded then return end local ac,ad=x:GetTextBounds(ab.
Text,ab.FontFace,ab.TextSize,(workspace.CurrentCamera.ViewportSize.X-ab.AbsolutePosition.X-8)/x.
DPIScale)ab.Size=UDim2.fromOffset(ac+8,0)end)local ac function x:AddTooltip(ad:string,ae:string,af:
GuiObject)local ag={Disabled=false,Hovering=false,Signals={}}local function DoHover()if ac==af or x
.ActiveDialog or(aa and x:MouseIsOverFrame(aa.Menu,o))or(ag.Disabled and typeof(ae)~='string')or(
not ag.Disabled and typeof(ad)~='string')then return end ac=af local ah=af:
FindFirstAncestorOfClass('ScreenGui')if ah~=G and(x.ActiveLoading and ah~=x.ActiveLoading.ScreenGui
)then ah=G end ab.Parent=ah ab.Text=ag.Disabled and ae or ad ab.Visible=true while(x.Toggled or x.
ActiveLoading)and not x.ActiveDialog and x:MouseIsOverFrame(af,o)and not(aa and x:MouseIsOverFrame(
aa.Menu,o))do ab.Position=UDim2.fromOffset(o.X+(x.ShowCustomCursor and 8 or 14),o.Y+(x.
ShowCustomCursor and 8 or 12))d.RenderStepped:Wait()end ab.Visible=false ac=nil end local function
GiveSignal(ah:RBXScriptConnection|RBXScriptSignal)local O=typeof(ah)if ah and(O==
'RBXScriptConnection'or O=='RBXScriptSignal')then table.insert(ag.Signals,ah)end return ah end
GiveSignal(af.MouseEnter:Connect(DoHover))GiveSignal(af.MouseMoved:Connect(DoHover))GiveSignal(af.
MouseLeave:Connect(function()if ac~=af then return end ab.Visible=false ac=nil end))function ag:
Destroy()for ah=#ag.Signals,1,-1 do local O=table.remove(ag.Signals,ah)if O and O.Connected then O:
Disconnect()end end if ac==af then if ab then ab.Visible=false end ac=nil end end table.insert(t,ab
)return ag end function x:OnUnload(ad)table.insert(x.UnloadSignals,ad)end local ad=x:GetIcon(
'check')local ae=x:GetIcon('chevron-up')local af=x:GetIcon('move-diagonal-2')local ag=x:GetIcon(
'key')local ah=x:GetIcon('move')function x:SetIconModule(O:IconModule)D=true E=O ad=x:GetIcon(
'check')ae=x:GetIcon('chevron-up')af=x:GetIcon('move-diagonal-2')ag=x:GetIcon('key')ah=x:GetIcon(
'move')end local O={}do local P={}function P:AddKeyPicker(Q,R)if self.Destroyed then return nil end
R=x:Validate(R,y.KeyPicker)local S=self local T=S.TextLabel if S.Type=='Button'or S.Type==
'SubButton'then assert(R.Mode=='Press',
[[KeyPicker on Buttons can only be applied with the 'Press' mode.]])T=S.Base end local U={
Connections={},Text=R.Text,Value=R.Default,Modifiers=R.DefaultModifiers,DisplayValue=R.Default,
Blacklisted=R.Blacklisted,BlacklistedModifiers=R.BlacklistedModifiers,Whitelisted=R.Whitelisted,
WhitelistedModifiers=R.WhitelistedModifiers,Toggled=false,Mode=R.Mode,SyncToggleState=R.
SyncToggleState,Callback=R.Callback,ChangedCallback=R.ChangedCallback,Changed=R.Changed,Clicked=R.
Clicked,Type='KeyPicker'}if U.Mode=='Press'then assert(S.Type=='Label'or S.Type=='Button'or S.Type
=='SubButton',[[KeyPicker with the mode 'Press' can be only applied on Labels and Buttons.]])U.
SyncToggleState=false R.Modes={'Press'}R.Mode='Press'end if U.SyncToggleState then R.Modes={
'Toggle','Hold'}if not table.find(R.Modes,R.Mode)then R.Mode='Toggle'end end local V=false local W=
S.Type=='Button'or S.Type=='SubButton'local X={['MB1']=Enum.UserInputType.MouseButton1,['MB2']=Enum
.UserInputType.MouseButton2,['MB3']=Enum.UserInputType.MouseButton3}local Y={[Enum.UserInputType.
MouseButton1]='MB1',[Enum.UserInputType.MouseButton2]='MB2',[Enum.UserInputType.MouseButton3]='MB3'
}local Z={['LAlt']=Enum.KeyCode.LeftAlt,['RAlt']=Enum.KeyCode.RightAlt,['LCtrl']=Enum.KeyCode.
LeftControl,['RCtrl']=Enum.KeyCode.RightControl,['LShift']=Enum.KeyCode.LeftShift,['RShift']=Enum.
KeyCode.RightShift,['Tab']=Enum.KeyCode.Tab,['CapsLock']=Enum.KeyCode.CapsLock}local _={[Enum.
KeyCode.LeftAlt]='LAlt',[Enum.KeyCode.RightAlt]='RAlt',[Enum.KeyCode.LeftControl]='LCtrl',[Enum.
KeyCode.RightControl]='RCtrl',[Enum.KeyCode.LeftShift]='LShift',[Enum.KeyCode.RightShift]='RShift',
[Enum.KeyCode.Tab]='Tab',[Enum.KeyCode.CapsLock]='CapsLock'}local ai=function(ai)return ai.
UserInputType==Enum.UserInputType.Keyboard and _[ai.KeyCode]~=nil end local aj=function()local aj={
}for ak,al in Z do if table.find(aj,ak)then continue end if not f:IsKeyDown(al)then continue end
table.insert(aj,ak)end return aj end local ak=function(ak)if not(typeof(ak)=='table'and
GetTableSize(ak)>0)then return true end local al=aj()local am=true for an,ao in ak do if table.
find(al,ao)then continue end am=false break end return am end local al=function(al)if not al then
return false end if Y[al.UserInputType]~=nil then return f:IsMouseButtonPressed(al.UserInputType)
and not f:GetFocusedTextBox()elseif al.UserInputType==Enum.UserInputType.Keyboard then return f:
IsKeyDown(al.KeyCode)and not f:GetFocusedTextBox()else return false end end local am=function(am)
local an={}for ao,ap in am do table.insert(an,Z[ap])end return an end local an=function(an)if
typeof(an)~='table'then return{}end local ao={}for ap,aq in an do if not Z[aq]then continue end
table.insert(ao,aq)end return ao end U.Modifiers=an(U.Modifiers)local ao=true local ap=75 local aq
local ar=0 local as local at local au=function(au)if au~=Enum.PlaybackState.Completed then return
end task.wait(1.5)if at then at:Play()end end local av=function(av)if av~=Enum.PlaybackState.
Completed then return end task.wait(1.5)if as then as:Play()end end local aw=function()if as then
StopTween(as,true)as=nil end if at then as(at,true)at=nil end end local ax=New('TextButton',{
BackgroundColor3='MainColor',Size=UDim2.fromOffset(18,18),Text=(W and ao)and''or U.Value,TextSize=
14,Parent=T})if W and ao then ax.ClipsDescendants=true aq=New('TextLabel',{BackgroundTransparency=1
,Size=UDim2.new(1,0,1,0),Position=UDim2.new(0,0,0,0),Text=U.Value,TextSize=14,FontFace=ax.FontFace,
TextXAlignment=Enum.TextXAlignment.Center,Parent=ax})x:AddToRegistry(aq,{TextColor3='FontColor'})
end New('UIStroke',{Color='OutlineColor',Parent=ax})local ay=New('UICorner',{TopLeftRadius=UDim.
new(0,x.CornerRadius/2),TopRightRadius=UDim.new(0,x.CornerRadius/2),BottomRightRadius=UDim.new(0,x.
CornerRadius/2),BottomLeftRadius=UDim.new(0,x.CornerRadius/2),Parent=ax})table.insert(x.
SpecificCorners,ay)if W then local az=New('Frame',{BackgroundTransparency=1,Size=UDim2.new(1,0,0,21
),Parent=T.Parent})New('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,HorizontalFlex=
Enum.UIFlexAlignment.Fill,Padding=UDim.new(0,9),Parent=az})T.Parent=az ax.Parent=az ax.Size=UDim2.
new(0,18,1,0)end local az={Normal=U.Mode~='Toggle'}do local aA=New('TextButton',{
BackgroundTransparency=1,Size=UDim2.new(1,0,0,16),Text='',Visible=not R.NoUI,Parent=x.
KeybindContainer})local aB=New('TextLabel',{AutomaticSize=Enum.AutomaticSize.X,
BackgroundTransparency=1,Size=UDim2.fromScale(0,1),Text='',TextSize=14,TextTransparency=0.5,Parent=
aA})local aC=New('Frame',{AnchorPoint=Vector2.new(0,0.5),BackgroundColor3='MainColor',Position=
UDim2.fromScale(0,0.5),Size=UDim2.fromOffset(14,14),SizeConstraint=Enum.SizeConstraint.RelativeYY,
Parent=aA})table.insert(x.Corners,New('UICorner',{CornerRadius=UDim.new(0,x.CornerRadius/2),Parent=
aC}))New('UIStroke',{Color='OutlineColor',Parent=aC})local aD=New('ImageLabel',{Image=ad and ad.Url
or'',ImageColor3='FontColor',ImageRectOffset=ad and ad.ImageRectOffset or Vector2.zero,
ImageRectSize=ad and ad.ImageRectSize or Vector2.zero,ImageTransparency=1,Position=UDim2.
fromOffset(2,2),Size=UDim2.new(1,-4,1,-4),Parent=aC})function az:Display(aE)aB.TextTransparency=aE
and 0 or 0.5 aD.ImageTransparency=aE and 0 or 1 end function az:SetText(aE)aB.Text=aE end function
az:SetVisibility(aE)aA.Visible=aE end function az:SetNormal(aE)az.Normal=aE aA.Active=not aE aB.
Position=aE and UDim2.fromOffset(0,0)or UDim2.fromOffset(22,0)aC.Visible=not aE end U.DoClick=
function(...)end aA.MouseButton1Click:Connect(function()if az.Normal then return end U.Toggled=not
U.Toggled U:DoClick()end)az.Holder=aA az.Label=aB az.Checkbox=aC az.Loaded=true table.insert(x.
KeybindToggles,az)end local aA={}local aB=GetTableSize(R.Modes)local aC=x:AddContextMenu(ax,UDim2.
fromOffset(62,0),function()return{ax.AbsoluteSize.X+1.5,0.5}end,1,function(aC:boolean)ay.
TopRightRadius=aC and UDim.new(0,0)or UDim.new(0,x.CornerRadius/2)ay.BottomRightRadius=aC and UDim.
new(0,0)or UDim.new(0,x.CornerRadius/2)end,false,if aB==1 then'no_left'else'no_top_left',
'KeyPicker')U.Menu=aC for aD,aE in R.Modes do local aF={}local aG=New('TextButton',{
BackgroundColor3='MainColor',BackgroundTransparency=1,Size=UDim2.new(1,0,0,W and 21 or(aB==1 and 18
or 19)),Text=aE,TextSize=14,TextTransparency=0.5,Parent=aC.Menu})if aD==1 and aB==1 then table.
insert(x.SpecificCorners,New('UICorner',{TopLeftRadius=UDim.new(0,0),TopRightRadius=UDim.new(0,x.
CornerRadius/2),BottomLeftRadius=UDim.new(0,0),BottomRightRadius=UDim.new(0,x.CornerRadius/2),
Parent=aG}))elseif aD==1 then table.insert(x.SpecificCorners,New('UICorner',{TopLeftRadius=UDim.
new(0,0),TopRightRadius=UDim.new(0,x.CornerRadius/2),BottomLeftRadius=UDim.new(0,0),
BottomRightRadius=UDim.new(0,0),Parent=aG}))elseif aD==aB then table.insert(x.SpecificCorners,New(
'UICorner',{TopLeftRadius=UDim.new(0,0),TopRightRadius=UDim.new(0,0),BottomLeftRadius=UDim.new(0,x.
CornerRadius/2),BottomRightRadius=UDim.new(0,x.CornerRadius/2),Parent=aG}))end function aF:Select()
for aH,aI in aA do aI:Deselect()end U.Mode=aE aG.BackgroundTransparency=0 aG.TextTransparency=0 aC:
Close()end function aF:Deselect()U.Mode=nil aG.BackgroundTransparency=1 aG.TextTransparency=0.5 end
aG.MouseButton1Click:Connect(function()aF:Select()end)if U.Mode==aE then aF:Select()end aA[aE]=aF
end function U:Display(aD)if x.Unloaded then return end local aE=aD or U.DisplayValue if W and ao
then if ar==ax.AbsoluteSize.X then return end local aF,aG=x:GetTextBounds(aE,ax.FontFace,ax.
TextSize,10000)aq.Text=aE local aH=aF+9 local aI=math.min(aH,ap)ax.Size=UDim2.new(0,aI,1,0)if aH>aI
then aq.TextXAlignment=Enum.TextXAlignment.Left aq.Size=UDim2.new(0,aH,1,0)aq.Position=UDim2.
fromOffset(4.5,0)d.RenderStepped:Wait()local aJ=ax.AbsoluteSize.X if aJ<=0 then aJ=aI end ar=aJ
local aK=aH-aJ-4.5 if aK>0 then aw()local aL=aK/25 local aM=TweenInfo.new(aL,Enum.EasingStyle.
Linear,Enum.EasingDirection.InOut)as=i:Create(aq,aM,{Position=UDim2.fromOffset(-aK,0)})at=i:Create(
aq,aM,{Position=UDim2.fromOffset(4.5,0)})as:Play()as.Completed:Connect(au)at.Completed:Connect(av)
else aw()aq.TextXAlignment=Enum.TextXAlignment.Center aq.Size=UDim2.new(1,0,1,0)aq.Position=UDim2.
new(0,0,0,0)end else aw()aq.TextXAlignment=Enum.TextXAlignment.Center aq.Size=UDim2.new(1,0,1,0)aq.
Position=UDim2.new(0,0,0,0)end else local aF,aG=x:GetTextBounds(aE,ax.FontFace,ax.TextSize,T.
AbsoluteSize.X)ax.Text=aE ax.Size=W and UDim2.new(0,aF+9,1,0)or UDim2.fromOffset((aF+9),(aG+4))end
end function U:Update()U:Display()if R.NoUI then return end if U.Mode=='Toggle'and S.Type=='Toggle'
and S.Disabled then az:SetVisibility(false)return end local aD=U:GetState()local aE=x.
ShowToggleFrameInKeybinds and U.Mode=='Toggle'if U.SyncToggleState and S.Value~=aD then S:SetValue(
aD)end if az.Loaded then if aE then az:SetNormal(false)else az:SetNormal(true)end az:SetText((
'[%s] %s (%s)'):format(U.DisplayValue,U.Text,U.Mode))az:SetVisibility(true)az:Display(aD)end end
function U:GetState()if U.Mode=='Always'then return true elseif U.Mode=='Hold'then local aD=U.Value
if aD=='None'then return false end if not ak(U.Modifiers)then return false end if V then return
false end if X[aD]~=nil then if x.Toggled then return false end return f:IsMouseButtonPressed(X[aD]
)and not f:GetFocusedTextBox()else return f:IsKeyDown(Enum.KeyCode[aD]::any)and not f:
GetFocusedTextBox()end else return U.Toggled end end function U:OnChanged(aD)U.Changed=aD end
function U:OnClick(aD)U.Clicked=aD end function U:DoClick()if V then return end if U.Mode=='Press'
then if U.Toggled and R.WaitForCallback==true then return end U.Toggled=true end x:SafeCallback(U.
Callback,U.Toggled)x:SafeCallback(U.Clicked,U.Toggled)if W then x:SafeCallback(S.Func,U.Toggled)end
if x.ToggleKeybind==U and x.Toggle then x:Toggle()end if U.Mode=='Press'then U.Toggled=false end
end function U:RunChanged(aD,aE)if aD==nil or aE==nil then aD,aE=pcall(function()if U.Value=='None'
then return nil end if X[U.Value]==nil then return Enum.KeyCode[U.Value]end return X[U.Value]end)
end local aF=am(U.Modifiers)x:SafeCallback(U.ChangedCallback,aE,aF)x:SafeCallback(U.Changed,aE,aF)
end function U:SetValue(aD)local aE,aF,aG=aD[1],aD[2],aD[3]local aH,aI=pcall(function()if aE==
'None'then aE=nil return nil end if X[aE]==nil then return Enum.KeyCode[aE]end return X[aE]end)if
aE==nil then U.Value='None'elseif aH then U.Value=aE else U.Value='Unknown'end U.Modifiers=an(if
typeof(aG)=='table'then aG else U.Modifiers)U.DisplayValue=if GetTableSize(U.Modifiers)>0 then(
table.concat(U.Modifiers,' + ')..' + '..U.Value)else U.Value if aA[aF]then aA[aF]:Select()end U:
Update()U:RunChanged(aH,aI)end function U:SetText(aD)az:SetText(aD)U:Update()end local aD=function(
aD)V=aD x.IsPicking=aD if S then S.AnyKeyPickerPicking=V end if W then T.Visible=not V d.
RenderStepped:Wait()end U:Update()end ax.MouseButton1Click:Connect(function()if V or x.IsPicking
then return end aD(true)if W and ao then U:Display('...')else ax.Text='...'ax.Size=W and UDim2.new(
0,29,1,0)or UDim2.fromOffset(29,18)end local aE={}local aF local aG=function(aG)if aG.KeyCode==Enum
.KeyCode.Escape then return true end local aH=ai(aG)local aI if Y[aG.UserInputType]~=nil then aI=Y[
aG.UserInputType]elseif aG.UserInputType==Enum.UserInputType.Keyboard then if aH then aI=_[aG.
KeyCode]else aI=aG.KeyCode.Name end end if aI then if aH then if U.WhitelistedModifiers and#U.
WhitelistedModifiers>0 and not table.find(U.WhitelistedModifiers,aI)then return false end if U.
BlacklistedModifiers and table.find(U.BlacklistedModifiers,aI)then return false end else if U.
Whitelisted and#U.Whitelisted>0 and not table.find(U.Whitelisted,aI)then return false end if U.
Blacklisted and table.find(U.Blacklisted,aI)then return false end end end return true end while
true do local aH=f.InputBegan:Wait()if f:GetFocusedTextBox()~=nil then aD(false)return end if aG(aH
)then aF=aH break end end while ai(aF)do if aF.KeyCode==Enum.KeyCode.Escape then break end local aH
=_[aF.KeyCode]if aH then local aI=if#aE>0 then table.concat(aE,' + ')..' + '..aH..' + ...'else aH..
' + ...'U:Display(aI)end local aI local aJ=false local aK local aL aK=f.InputBegan:Connect(function
(aM)if f:GetFocusedTextBox()~=nil then return end if aG(aM)then aI=aM end end)aL=f.InputEnded:
Connect(function(aM)if aM.KeyCode==aF.KeyCode then aJ=true end end)repeat task.wait()until aJ or aI
or f:GetFocusedTextBox()~=nil or x.Unloaded if aK then aK:Disconnect()end if aL then aL:Disconnect(
)end if f:GetFocusedTextBox()~=nil or x.Unloaded then aD(false)return end if aJ then break elseif
aI then local aM=_[aF.KeyCode]if aM and not table.find(aE,aM)then aE[#aE+1]=aM end aF=aI if aF.
KeyCode==Enum.KeyCode.Escape then break end end end local aH='Unknown'if Y[aF.UserInputType]~=nil
then aH=Y[aF.UserInputType]elseif aF.UserInputType==Enum.UserInputType.Keyboard then aH=aF.KeyCode
==Enum.KeyCode.Escape and'None'or aF.KeyCode.Name end aE=if aF.KeyCode==Enum.KeyCode.Escape or aH==
'Unknown'then{}else aE U.Toggled=if S.Type=='Toggle'then S.Value else false U:SetValue({aH,U.Mode,
aE})repeat task.wait()until not al(aF)or f:GetFocusedTextBox()aD(false)end)ax.MouseButton2Click:
Connect(aC.Toggle)table.insert(U.Connections,f.InputBegan:Connect(function(aE:InputObject)if x.
Unloaded then return end local aF=IsMouseClickInput(aE)if U.Mode=='Always'or U.Value=='Unknown'or U
.Value=='None'or V or x.IsPicking or f:GetFocusedTextBox()or(aF and x.Toggled)then return end local
aG=U.Value local aH=ak(U.Modifiers)local aI=false if aG and aH==true and(Y[aE.UserInputType]==aG or
(aE.UserInputType==Enum.UserInputType.Keyboard and aE.KeyCode.Name==aG))then aI=true end if U.Mode
=='Toggle'then if aI then U.Toggled=not U.Toggled U:DoClick()end elseif U.Mode=='Press'then if aI
then U:DoClick()end end U:Update()end))table.insert(U.Connections,f.InputEnded:Connect(function(aE:
InputObject)if x.Unloaded then return end local aF=IsMouseClickInput(aE)if U.Value=='Unknown'or U.
Value=='None'or V or x.IsPicking or f:GetFocusedTextBox()or(aF and x.Toggled)then return end U:
Update()end))U:Update()if S.Addons then table.insert(S.Addons,U)end U.Default=U.Value U.
DefaultModifiers=table.clone(U.Modifiers or{})function U:Destroy()U.Destroyed=true if U.Connections
then for aE,aF in U.Connections do aF:Disconnect()end end if az and az.Loaded then if az.Holder
then az.Holder:Destroy()end local aE=table.find(x.KeybindToggles,az)if aE then table.remove(x.
KeybindToggles,aE)end end if aC then aC:Destroy()end if W and ao then if as then as:Destroy()end if
at then at:Destroy()end end if ax then ax:Destroy()end if S and S.Addons then local aE=table.find(S
.Addons,U)if aE then table.remove(S.Addons,aE)end end s[Q]=nil end s[Q]=U return self end local ai=
{}for aj=0,1,0.1 do table.insert(ai,ColorSequenceKeypoint.new(aj,Color3.fromHSV(aj,1,1)))end
function P:AddColorPicker(aj,ak)if self.Destroyed then return nil end ak=x:Validate(ak,y.
ColorPicker)local al=self local am=al.TextLabel local an={Connections={},Destroyed=false,Value=ak.
Default,Transparency=ak.Transparency or 0,Title=ak.Title,Callback=ak.Callback,Changed=ak.Changed,
Type='ColorPicker'}an.Hue,an.Sat,an.Vib=an.Value:ToHSV()local ao=New('TextButton',{BackgroundColor3
=an.Value,Size=UDim2.fromOffset(18,18),Text='',Parent=am})local ap=New('UIStroke',{Color=x:
GetDarkerColor(an.Value),Parent=ao})local aq=New('UICorner',{TopLeftRadius=UDim.new(0,x.
CornerRadius/2),TopRightRadius=UDim.new(0,x.CornerRadius/2),BottomRightRadius=UDim.new(0,x.
CornerRadius/2),BottomLeftRadius=UDim.new(0,x.CornerRadius/2),Parent=ao})table.insert(x.
SpecificCorners,aq)local ar=New('ImageLabel',{Image=v.GetAsset('TransparencyTexture'),
ImageTransparency=(1-an.Transparency),ScaleType=Enum.ScaleType.Tile,Position=UDim2.new(0,-1,0,-1),
Size=UDim2.new(1,2,1,2),TileSize=UDim2.fromOffset(9,9),Parent=ao})table.insert(x.Corners,New(
'UICorner',{CornerRadius=UDim.new(0,x.CornerRadius/2),Parent=ar}))local as=x:AddContextMenu(ao,
UDim2.fromOffset(ak.Transparency and 256 or 234,0),function()return{0.5,ao.AbsoluteSize.Y+1.5}end,1
,function(as:boolean)aq.BottomRightRadius=as and UDim.new(0,0)or UDim.new(0,x.CornerRadius/2)aq.
BottomLeftRadius=as and UDim.new(0,0)or UDim.new(0,x.CornerRadius/2)end,false,'no_top_left')as.List
.Padding=UDim.new(0,8)an.ColorMenu=as New('UIPadding',{PaddingBottom=UDim.new(0,6),PaddingLeft=UDim
.new(0,6),PaddingRight=UDim.new(0,6),PaddingTop=UDim.new(0,6),Parent=as.Menu})if typeof(an.Title)==
'string'then New('TextLabel',{BackgroundTransparency=1,Size=UDim2.new(1,0,0,8),Text=an.Title,
TextSize=14,TextXAlignment=Enum.TextXAlignment.Left,Parent=as.Menu})end local at=New('Frame',{
BackgroundTransparency=1,Size=UDim2.new(1,0,0,200),Parent=as.Menu})New('UIListLayout',{
FillDirection=Enum.FillDirection.Horizontal,Padding=UDim.new(0,6),Parent=at})local au=New(
'ImageButton',{BackgroundColor3=an.Value,Image=v.GetAsset('SaturationMap'),Size=UDim2.fromOffset(
200,200),Parent=at})local av=New('Frame',{AnchorPoint=Vector2.new(0.5,0.5),BackgroundColor3=
'WhiteColor',Size=UDim2.fromOffset(6,6),Parent=au})New('UICorner',{CornerRadius=UDim.new(1,0),
Parent=av})New('UIStroke',{Color='DarkColor',Parent=av})local aw=New('TextButton',{Size=UDim2.
fromOffset(16,200),Text='',Parent=at})New('UIGradient',{Color=ColorSequence.new(ai),Rotation=90,
Parent=aw})local ax=New('Frame',{AnchorPoint=Vector2.new(0.5,0.5),BackgroundColor3='WhiteColor',
BorderColor3='DarkColor',BorderSizePixel=1,Position=UDim2.fromScale(0.5,an.Hue),Size=UDim2.new(1,2,
0,1),Parent=aw})local ay,az,aA if ak.Transparency then ay=New('ImageButton',{Image=v.GetAsset(
'TransparencyTexture'),ScaleType=Enum.ScaleType.Tile,Size=UDim2.fromOffset(16,200),TileSize=UDim2.
fromOffset(8,8),Parent=at})az=New('Frame',{BackgroundColor3=an.Value,Size=UDim2.fromScale(1,1),
Parent=ay})New('UIGradient',{Rotation=90,Transparency=NumberSequence.new({NumberSequenceKeypoint.
new(0,0),NumberSequenceKeypoint.new(1,1)}),Parent=az})aA=New('Frame',{AnchorPoint=Vector2.new(0.5,
0.5),BackgroundColor3='WhiteColor',BorderColor3='DarkColor',BorderSizePixel=1,Position=UDim2.
fromScale(0.5,an.Transparency),Size=UDim2.new(1,2,0,1),Parent=ay})end local aB=New('Frame',{
BackgroundTransparency=1,Size=UDim2.new(1,0,0,20),Parent=as.Menu})New('UIListLayout',{FillDirection
=Enum.FillDirection.Horizontal,HorizontalFlex=Enum.UIFlexAlignment.Fill,Padding=UDim.new(0,8),
Parent=aB})local aC=New('TextBox',{BackgroundColor3='MainColor',ClearTextOnFocus=false,Size=UDim2.
fromScale(1,1),Text='#??????',TextSize=14,Parent=aB})New('UIStroke',{Color='OutlineColor',Parent=aC
})table.insert(x.Corners,New('UICorner',{CornerRadius=UDim.new(0,x.CornerRadius/2),Parent=aC}))
local aD=New('TextBox',{BackgroundColor3='MainColor',ClearTextOnFocus=false,Size=UDim2.fromScale(1,
1),Text='?, ?, ?',TextSize=14,Parent=aB})New('UIStroke',{Color='OutlineColor',Parent=aD})table.
insert(x.Corners,New('UICorner',{CornerRadius=UDim.new(0,x.CornerRadius/2),Parent=aD}))local aE=x:
AddContextMenu(ao,UDim2.fromOffset(93,0),function()return{ao.AbsoluteSize.X+1.5,0.5}end,1,function(
aE:boolean)aq.TopRightRadius=aE and UDim.new(0,0)or UDim.new(0,x.CornerRadius/2)aq.
BottomRightRadius=aE and UDim.new(0,0)or UDim.new(0,x.CornerRadius/2)end,false,'no_top_left')an.
ContextMenu=aE aE.List.Padding=UDim.new(0,6)do local function CreateButton(aF,aG)local aH=New(
'TextButton',{BackgroundTransparency=1,Size=UDim2.new(1,0,0,21),Text=aF,TextSize=14,Parent=aE.Menu}
)aH.MouseButton1Click:Connect(function()x:SafeCallback(aG)aE:Close()end)end CreateButton(
'Copy color',function()x.CopiedColor={an.Value,an.Transparency}end)an.SetValueRGB=function(...)end
CreateButton('Paste color',function()an:SetValueRGB(x.CopiedColor[1],x.CopiedColor[2])end)if k then
CreateButton('Copy Hex',function()k(tostring(an.Value:ToHex()))end)CreateButton('Copy RGB',function
()k(table.concat({math.floor(an.Value.R*255),math.floor(an.Value.G*255),math.floor(an.Value.B*255)}
,', '))end)end end function an:SetHSVFromRGB(aF)an.Hue,an.Sat,an.Vib=aF:ToHSV()end function an:
Display()if x.Unloaded then return end an.Value=Color3.fromHSV(an.Hue,an.Sat,an.Vib)ao.
BackgroundColor3=an.Value ap.Color=x:GetDarkerColor(an.Value)ar.ImageTransparency=(1-an.
Transparency)au.BackgroundColor3=Color3.fromHSV(an.Hue,1,1)if az then az.BackgroundColor3=an.Value
end av.Position=UDim2.fromScale(an.Sat,1-an.Vib)ax.Position=UDim2.fromScale(0.5,an.Hue)if aA then
aA.Position=UDim2.fromScale(0.5,an.Transparency)end aC.Text='#'..an.Value:ToHex()aD.Text=table.
concat({math.floor(an.Value.R*255),math.floor(an.Value.G*255),math.floor(an.Value.B*255)},', ')end
function an:RunChanged()x:SafeCallback(an.Callback,an.Value)x:SafeCallback(an.Changed,an.Value)end
function an:Update()an:Display()an:RunChanged()end function an:OnChanged(aF)an.Changed=aF end
function an:SetValue(aF,aG)if typeof(aF)=='Color3'then an:SetValueRGB(aF,aG)return end local aH=
Color3.fromHSV(aF[1],aF[2],aF[3])an.Transparency=ak.Transparency and aG or 0 an:SetHSVFromRGB(aH)an
:Update()end function an:SetValueRGB(aF,aG)an.Transparency=ak.Transparency and aG or 0 an:
SetHSVFromRGB(aF)an:Update()end table.insert(an.Connections,ao.MouseButton1Click:Connect(as.Toggle)
)table.insert(an.Connections,ao.MouseButton2Click:Connect(aE.Toggle))table.insert(an.Connections,au
.InputBegan:Connect(function(aF:InputObject)while IsDragInput(aF)and not an.Destroyed do local aG=
au.AbsolutePosition.X local aH=aG+au.AbsoluteSize.X local aI=math.clamp(o.X,aG,aH)local aJ=au.
AbsolutePosition.Y local aK=aJ+au.AbsoluteSize.Y local aL=math.clamp(o.Y,aJ,aK)local aM=an.Sat
local Q=an.Vib an.Sat=(aI-aG)/(aH-aG)an.Vib=1-((aL-aJ)/(aK-aJ))if an.Sat~=aM or an.Vib~=Q then an:
Update()end d.RenderStepped:Wait()end end))table.insert(an.Connections,aw.InputBegan:Connect(
function(aF:InputObject)while IsDragInput(aF)and not an.Destroyed do local aG=aw.AbsolutePosition.Y
local aH=aG+aw.AbsoluteSize.Y local aI=math.clamp(o.Y,aG,aH)local aJ=an.Hue an.Hue=(aI-aG)/(aH-aG)
if an.Hue~=aJ then an:Update()end d.RenderStepped:Wait()end end))if ay then table.insert(an.
Connections,ay.InputBegan:Connect(function(aF:InputObject)while IsDragInput(aF)and not an.Destroyed
do local aG=ay.AbsolutePosition.Y local aH=ay.AbsolutePosition.Y+ay.AbsoluteSize.Y local aI=math.
clamp(o.Y,aG,aH)local aJ=an.Transparency an.Transparency=(aI-aG)/(aH-aG)if an.Transparency~=aJ then
an:Update()end d.RenderStepped:Wait()end end))end table.insert(an.Connections,aC.FocusLost:Connect(
function(aF)if not aF then return end local aG,aH=pcall(Color3.fromHex,aC.Text)if aG and typeof(aH)
=='Color3'then an.Hue,an.Sat,an.Vib=aH:ToHSV()end an:Update()end))table.insert(an.Connections,aD.
FocusLost:Connect(function(aF)if not aF then return end local aG,aH,aI=aD.Text:match(
'(%d+),%s*(%d+),%s*(%d+)')if aG and aH and aI then an:SetHSVFromRGB(Color3.fromRGB(aG,aH,aI))end an
:Update()end))an:Display()if al.Addons then table.insert(al.Addons,an)end an.Default=an.Value
function an:Destroy()an.Destroyed=true if an.Connections then for aF,aG in an.Connections do aG:
Disconnect()end end if as then as:Destroy()end if aE then aE:Destroy()end if ao then ao:Destroy()
end if al and al.Addons then local aF=table.find(al.Addons,an)if aF then table.remove(al.Addons,aF)
end end s[aj]=nil end s[aj]=an return self end O.__index=P O.__namecall=function(aj,ak,...)return P
[ak](...)end end local ai={}do local aj={}function aj:AddDivider(...)if self.Destroyed then return
nil end local ak=select(1,...)local al local am=0 local an=0 if typeof(ak)=='table'then al=ak.Text
am=ak.MarginTop or ak.Margin or 0 an=ak.MarginBottom or ak.Margin or 0 elseif typeof(ak)=='string'
then al=ak end local ao=self local ap=ao.Container local aq=New('Frame',{BackgroundTransparency=1,
Size=UDim2.new(1,0,0,6+am+an),Parent=ap})local ar=New('Frame',{BackgroundTransparency=1,Size=UDim2.
new(1,0,1,0),Parent=aq})New('UIPadding',{PaddingTop=UDim.new(0,am),PaddingBottom=UDim.new(0,an),
Parent=aq})if al then local as=New('TextLabel',{AutomaticSize=Enum.AutomaticSize.X,
BackgroundTransparency=1,Size=UDim2.fromScale(1,0),Text=al,TextSize=14,TextTransparency=0.5,
TextXAlignment=Enum.TextXAlignment.Center,Parent=ar})local at,au=x:GetTextBounds(al,as.FontFace,as.
TextSize,as.AbsoluteSize.X)local av=at//2+10 New('Frame',{AnchorPoint=Vector2.new(0,0.5),
BackgroundColor3='MainColor',BorderColor3='OutlineColor',BorderSizePixel=1,Position=UDim2.
fromScale(0,0.5),Size=UDim2.new(0.5,-av,0,2),Parent=ar})New('Frame',{AnchorPoint=Vector2.new(1,0.5)
,BackgroundColor3='MainColor',BorderColor3='OutlineColor',BorderSizePixel=1,Position=UDim2.
fromScale(1,0.5),Size=UDim2.new(0.5,-av,0,2),Parent=ar})else New('Frame',{AnchorPoint=Vector2.new(0
,0.5),BackgroundColor3='MainColor',BorderColor3='OutlineColor',BorderSizePixel=1,Position=UDim2.
fromScale(0,0.5),Size=UDim2.new(1,0,0,2),Parent=ar})end ao:Resize()local as={Connections={},
Destroyed=false,Holder=aq,Text=al,MarginTop=am,MarginBottom=an,Type='Divider'}function as:
SetVisible(at)aq.Visible=at==true ao:Resize()end function as:Destroy()as.Destroyed=true if as.
Connections then for at,au in as.Connections do au:Disconnect()end end if aq then aq:Destroy()end
local at=table.find(ao.Elements,as)if at then table.remove(ao.Elements,at)end ao:Resize()end table.
insert(ao.Elements,as)return as end function aj:AddLabel(...)if self.Destroyed then return nil end
local ak={}local al={}local am=select(1,...)local an=select(2,...)if typeof(am)=='table'or typeof(
an)=='table'then local ao=typeof(am)=='table'and am or an ak.Text=ao.Text or''ak.DoesWrap=ao.
DoesWrap or false ak.Size=ao.Size or 14 ak.Visible=ao.Visible or true ak.Idx=typeof(an)=='table'and
am or nil else ak.Text=am or''ak.DoesWrap=an or false ak.Size=14 ak.Visible=true ak.Idx=select(3,
...)or nil end local ao=self local ap=ao.Container local aq={Connections={},Destroyed=false,Text=ak
.Text,DoesWrap=ak.DoesWrap,Addons=al,Visible=ak.Visible,Type='Label'}local ar=New('TextLabel',{
BackgroundTransparency=1,Size=UDim2.new(1,0,0,18),Text=aq.Text,TextSize=ak.Size,TextWrapped=aq.
DoesWrap,TextXAlignment=ao.IsKeyTab and Enum.TextXAlignment.Center or Enum.TextXAlignment.Left,
Parent=ap})function aq:Display()if not aq.DoesWrap then return end local as=ar.AbsoluteSize.X if as
<=0 then return end local at,au=x:GetTextBounds(aq.Text,ar.FontFace,ar.TextSize,as)ar.Size=UDim2.
new(1,0,0,au+4)end function aq:SetVisible(as:boolean)aq.Visible=as ar.Visible=aq.Visible ao:Resize(
)end function aq:SetText(as:string)aq.Text=as ar.Text=as aq:Display()ao:Resize()end if aq.DoesWrap
then aq:Display()local as=ar.AbsoluteSize ar:GetPropertyChangedSignal('AbsoluteSize'):Connect(
function()if ar.AbsoluteSize==as then return end aq:Display()as=ar.AbsoluteSize ao:Resize()end)else
New('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,HorizontalAlignment=Enum.
HorizontalAlignment.Right,Padding=UDim.new(0,6),Parent=ar})end ao:Resize()aq.TextLabel=ar aq.
Container=ap if not ak.DoesWrap then setmetatable(aq,O)end aq.Holder=ar table.insert(ao.Elements,aq
)if ak.Idx then p[ak.Idx]=aq else table.insert(p,aq)end function aq:Destroy()aq.Destroyed=true if
aq.Connections then for as,at in aq.Connections do at:Disconnect()end end if aq.Addons then for as=
#aq.Addons,1,-1 do local at=table.remove(aq.Addons,as)if at and at.Destroy then at:Destroy()end end
end if ar then ar:Destroy()end local as=table.find(ao.Elements,aq)if as then table.remove(ao.
Elements,as)end ao:Resize()if ak.Idx then p[ak.Idx]=nil else local at=table.find(p,aq)if at then
table.remove(p,at)end end end return aq end function aj:AddButton(...)if self.Destroyed then return
nil end local function GetInfo(...)local ak={}local al=select(1,...)local am=select(2,...)if
typeof(al)=='table'or typeof(am)=='table'then local an=typeof(al)=='table'and al or am ak.Text=an.
Text or''ak.Func=an.Func or an.Callback or function()end ak.DoubleClick=an.DoubleClick ak.Tooltip=
an.Tooltip ak.DisabledTooltip=an.DisabledTooltip ak.Risky=an.Risky or false ak.Disabled=an.Disabled
or false ak.Visible=an.Visible or true ak.Idx=typeof(am)=='table'and al or nil else ak.Text=al or''
ak.Func=am or function()end ak.DoubleClick=false ak.Tooltip=nil ak.DisabledTooltip=nil ak.Risky=
false ak.Disabled=false ak.Visible=true ak.Idx=select(3,...)or nil end return ak end local ak=
GetInfo(...)local al=self local am=al.Container local an={Connections={},Destroyed=false,Text=ak.
Text,Func=ak.Func,DoubleClick=ak.DoubleClick,Tooltip=ak.Tooltip,DisabledTooltip=ak.DisabledTooltip,
TooltipTable=nil,Risky=ak.Risky,Disabled=ak.Disabled,Visible=ak.Visible,Tween=nil,Type='Button'}
local ao=New('Frame',{BackgroundTransparency=1,Size=UDim2.new(1,0,0,21),Parent=am})New(
'UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,HorizontalFlex=Enum.UIFlexAlignment.
Fill,Padding=UDim.new(0,9),Parent=ao})local function CreateButton(ap)local aq=New('TextButton',{
Active=not ap.Disabled,BackgroundColor3=ap.Disabled and'BackgroundColor'or'MainColor',Size=UDim2.
fromScale(1,1),Text=ap.Text,TextSize=14,TextTransparency=0.4,Visible=ap.Visible,Parent=ao})local ar
=New('UIStroke',{Color='OutlineColor',Transparency=ap.Disabled and 0.5 or 0,Parent=aq})table.
insert(x.Corners,New('UICorner',{CornerRadius=UDim.new(0,x.CornerRadius/2),Parent=aq}))return aq,ar
end local function InitEvents(ap)ap.Base.MouseEnter:Connect(function()if ap.Disabled then return
end ap.Tween=i:Create(ap.Base,x.TweenInfo,{TextTransparency=0})ap.Tween:Play()end)ap.Base.
MouseLeave:Connect(function()if ap.Disabled then return end ap.Tween=i:Create(ap.Base,x.TweenInfo,{
TextTransparency=0.4})ap.Tween:Play()end)ap.Base.MouseButton1Click:Connect(function()if ap.Disabled
or ap.Locked then return end if ap.DoubleClick then ap.Locked=true ap.Base.Text='Are you sure?'ap.
Base.TextColor3=x.Scheme.AccentColor x.Registry[ap.Base].TextColor3='AccentColor'local aq=
WaitForEvent(ap.Base.MouseButton1Click,0.5)ap.Base.Text=ap.Text ap.Base.TextColor3=ap.Risky and x.
Scheme.RedColor or x.Scheme.FontColor x.Registry[ap.Base].TextColor3=ap.Risky and'RedColor'or
'FontColor'if aq then x:SafeCallback(ap.Func)end d.RenderStepped:Wait()ap.Locked=false return end x
:SafeCallback(ap.Func)end)end an.Base,an.Stroke=CreateButton(an)InitEvents(an)function an:AddButton
(...)local ap=GetInfo(...)local aq={Connections={},Destroyed=false,Text=ap.Text,Func=ap.Func,
DoubleClick=ap.DoubleClick,Tooltip=ap.Tooltip,DisabledTooltip=ap.DisabledTooltip,TooltipTable=nil,
Risky=ap.Risky,Disabled=ap.Disabled,Visible=ap.Visible,Tween=nil,Type='SubButton'}an.SubButton=aq
aq.Base,aq.Stroke=CreateButton(aq)InitEvents(aq)function aq:UpdateColors()if x.Unloaded then return
end StopTween(aq.Tween)aq.Base.BackgroundColor3=aq.Disabled and x.Scheme.BackgroundColor or x.
Scheme.MainColor aq.Base.TextTransparency=aq.Disabled and 0.8 or 0.4 aq.Stroke.Transparency=aq.
Disabled and 0.5 or 0 x.Registry[aq.Base].BackgroundColor3=aq.Disabled and'BackgroundColor'or
'MainColor'end function aq:SetDisabled(ar:boolean)aq.Disabled=ar if aq.TooltipTable then aq.
TooltipTable.Disabled=aq.Disabled end aq.Base.Active=not aq.Disabled aq:UpdateColors()end function
aq:SetVisible(ar:boolean)aq.Visible=ar aq.Base.Visible=aq.Visible al:Resize()end function aq:
SetText(ar:string)aq.Text=ar aq.Base.Text=ar end if typeof(aq.Tooltip)=='string'or typeof(aq.
DisabledTooltip)=='string'then aq.TooltipTable=x:AddTooltip(aq.Tooltip,aq.DisabledTooltip,aq.Base)
aq.TooltipTable.Disabled=aq.Disabled end if aq.Risky then aq.Base.TextColor3=x.Scheme.RedColor x.
Registry[aq.Base].TextColor3='RedColor'end aq:UpdateColors()if ap.Idx then q[ap.Idx]=aq else table.
insert(q,aq)end aq.AddKeyPicker=O.__index.AddKeyPicker function aq:Destroy()aq.Destroyed=true if aq
.TooltipTable then aq.TooltipTable:Destroy()end if aq.Tween then aq.Tween:Destroy()end if aq.Base
then aq.Base:Destroy()end if ap.Idx then q[ap.Idx]=nil else local ar=table.find(q,aq)if ar then
table.remove(q,ar)end end end return aq end function an:UpdateColors()if x.Unloaded then return end
StopTween(an.Tween)an.Base.BackgroundColor3=an.Disabled and x.Scheme.BackgroundColor or x.Scheme.
MainColor an.Base.TextTransparency=an.Disabled and 0.8 or 0.4 an.Stroke.Transparency=an.Disabled
and 0.5 or 0 x.Registry[an.Base].BackgroundColor3=an.Disabled and'BackgroundColor'or'MainColor'end
function an:SetDisabled(ap:boolean)an.Disabled=ap if an.TooltipTable then an.TooltipTable.Disabled=
an.Disabled end an.Base.Active=not an.Disabled an:UpdateColors()end function an:SetVisible(ap:
boolean)an.Visible=ap ao.Visible=an.Visible al:Resize()end function an:SetText(ap:string)an.Text=ap
an.Base.Text=ap end if typeof(an.Tooltip)=='string'or typeof(an.DisabledTooltip)=='string'then an.
TooltipTable=x:AddTooltip(an.Tooltip,an.DisabledTooltip,an.Base)an.TooltipTable.Disabled=an.
Disabled end if an.Risky then an.Base.TextColor3=x.Scheme.RedColor x.Registry[an.Base].TextColor3=
'RedColor'end an:UpdateColors()al:Resize()an.Holder=ao table.insert(al.Elements,an)if ak.Idx then q
[ak.Idx]=an else table.insert(q,an)end an.AddKeyPicker=O.__index.AddKeyPicker function an:Destroy()
an.Destroyed=true if an.TooltipTable then an.TooltipTable:Destroy()end if an.Tween then an.Tween:
Destroy()end if an.SubButton then an.SubButton:Destroy()end if ao then ao:Destroy()end local ap=
table.find(al.Elements,an)if ap then table.remove(al.Elements,ap)end al:Resize()if ak.Idx then q[ak
.Idx]=nil else local aq=table.find(q,an)if aq then table.remove(q,aq)end end end return an end
function aj:AddCheckbox(ak,al)if self.Destroyed then return nil end al=x:Validate(al,y.Toggle)local
am=self local an=am.Container local ao={Connections={},Destroyed=false,Text=al.Text,Value=al.
Default,Tooltip=al.Tooltip,DisabledTooltip=al.DisabledTooltip,TooltipTable=nil,Callback=al.Callback
,Changed=al.Changed,Risky=al.Risky,Disabled=al.Disabled,Visible=al.Visible,Addons={},
AnyKeyPickerPicking=false,Variant='Checkbox',Type='Toggle'}local ap=New('TextButton',{Active=not ao
.Disabled,BackgroundTransparency=1,Size=UDim2.new(1,0,0,18),Text='',Visible=ao.Visible,Parent=an})
local aq=New('TextLabel',{BackgroundTransparency=1,Position=UDim2.fromOffset(26,0),Size=UDim2.new(1
,-26,1,0),Text=ao.Text,TextSize=14,TextTransparency=0.4,TextXAlignment=Enum.TextXAlignment.Left,
Parent=ap})New('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,HorizontalAlignment=Enum
.HorizontalAlignment.Right,Padding=UDim.new(0,6),Parent=aq})local ar=New('Frame',{BackgroundColor3=
'MainColor',Size=UDim2.fromScale(1,1),SizeConstraint=Enum.SizeConstraint.RelativeYY,Parent=ap})
table.insert(x.Corners,New('UICorner',{CornerRadius=UDim.new(0,x.CornerRadius/2),Parent=ar}))local
as=New('UIStroke',{Color='OutlineColor',Parent=ar})local at=New('ImageLabel',{Image=ad and ad.Url
or'',ImageColor3='FontColor',ImageRectOffset=ad and ad.ImageRectOffset or Vector2.zero,
ImageRectSize=ad and ad.ImageRectSize or Vector2.zero,ImageTransparency=1,Position=UDim2.
fromOffset(2,2),Size=UDim2.new(1,-4,1,-4),Parent=ar})function ao:UpdateColors()ao:Display()end
function ao:Display()if x.Unloaded then return end as.Transparency=ao.Disabled and 0.5 or 0 if ao.
Disabled then aq.TextTransparency=0.8 at.ImageTransparency=ao.Value and 0.8 or 1 ar.
BackgroundColor3=x.Scheme.BackgroundColor x.Registry[ar].BackgroundColor3='BackgroundColor'return
end i:Create(aq,x.TweenInfo,{TextTransparency=ao.Value and 0 or 0.4}):Play()i:Create(at,x.TweenInfo
,{ImageTransparency=ao.Value and 0 or 1}):Play()ar.BackgroundColor3=x.Scheme.MainColor x.Registry[
ar].BackgroundColor3='MainColor'end function ao:OnChanged(au)ao.Changed=au end function ao:
RunChanged()x:SafeCallback(ao.Callback,ao.Value)x:SafeCallback(ao.Changed,ao.Value)end function ao:
SetValue(au)if ao.Disabled then return end ao.Value=au ao:Display()for av,aw in ao.Addons do if aw.
Type=='KeyPicker'and aw.SyncToggleState then aw.Toggled=ao.Value aw:Update()end end x:
UpdateDependencyBoxes()if not ao.AnyKeyPickerPicking then ao:RunChanged()end end function ao:
SetDisabled(au:boolean)ao.Disabled=au if ao.TooltipTable then ao.TooltipTable.Disabled=ao.Disabled
end for av,aw in ao.Addons do if aw.Type=='KeyPicker'and aw.SyncToggleState then aw:Update()end end
ap.Active=not ao.Disabled ao:Display()end function ao:SetVisible(au:boolean)ao.Visible=au ap.
Visible=ao.Visible am:Resize()end function ao:SetText(au:string)ao.Text=au aq.Text=au end table.
insert(ao.Connections,ap.MouseButton1Click:Connect(function()if ao.Disabled then return end ao:
SetValue(not ao.Value)end))if typeof(ao.Tooltip)=='string'or typeof(ao.DisabledTooltip)=='string'
then ao.TooltipTable=x:AddTooltip(ao.Tooltip,ao.DisabledTooltip,ap)ao.TooltipTable.Disabled=ao.
Disabled end if ao.Risky then aq.TextColor3=x.Scheme.RedColor x.Registry[aq].TextColor3='RedColor'
end ao:Display()am:Resize()ao.TextLabel=aq ao.Container=an setmetatable(ao,O)ao.Holder=ap table.
insert(am.Elements,ao)ao.Default=ao.Value r[ak]=ao function ao:Destroy()ao.Destroyed=true if ao.
Connections then for au,av in ao.Connections do av:Disconnect()end end if ao.TooltipTable then ao.
TooltipTable:Destroy()end if ap then ap:Destroy()end if ao.Addons then for au=#ao.Addons,1,-1 do
local av=table.remove(ao.Addons,au)if av and av.Destroy then av:Destroy()end end end local au=table
.find(am.Elements,ao)if au then table.remove(am.Elements,au)end am:Resize()r[ak]=nil end return ao
end function aj:AddToggle(ak,al)if self.Destroyed then return nil end if x.ForceCheckbox then
return aj.AddCheckbox(self,ak,al)end al=x:Validate(al,y.Toggle)local am=self local an=am.Container
local ao={Connections={},Destroyed=false,Text=al.Text,Value=al.Default,Tooltip=al.Tooltip,
DisabledTooltip=al.DisabledTooltip,TooltipTable=nil,Callback=al.Callback,Changed=al.Changed,Risky=
al.Risky,Disabled=al.Disabled,Visible=al.Visible,Addons={},AnyKeyPickerPicking=false,Variant=
'Switch',Type='Toggle'}local ap=New('TextButton',{Active=not ao.Disabled,BackgroundTransparency=1,
Size=UDim2.new(1,0,0,18),Text='',Visible=ao.Visible,Parent=an})local aq=New('TextLabel',{
BackgroundTransparency=1,Size=UDim2.new(1,-40,1,0),Text=ao.Text,TextSize=14,TextTransparency=0.4,
TextXAlignment=Enum.TextXAlignment.Left,Parent=ap})New('UIListLayout',{FillDirection=Enum.
FillDirection.Horizontal,HorizontalAlignment=Enum.HorizontalAlignment.Right,Padding=UDim.new(0,6),
Parent=aq})local ar=New('Frame',{AnchorPoint=Vector2.new(1,0),BackgroundColor3='MainColor',Position
=UDim2.fromScale(1,0),Size=UDim2.fromOffset(32,18),Parent=ap})New('UICorner',{CornerRadius=UDim.
new(1,0),Parent=ar})New('UIPadding',{PaddingBottom=UDim.new(0,2),PaddingLeft=UDim.new(0,2),
PaddingRight=UDim.new(0,2),PaddingTop=UDim.new(0,2),Parent=ar})local as=New('UIStroke',{Color=
'OutlineColor',Parent=ar})local at=New('Frame',{BackgroundColor3='FontColor',Size=UDim2.fromScale(1
,1),SizeConstraint=Enum.SizeConstraint.RelativeYY,Parent=ar})New('UICorner',{CornerRadius=UDim.new(
1,0),Parent=at})function ao:UpdateColors()ao:Display()end function ao:Display()if x.Unloaded then
return end local au=ao.Value and 1 or 0 ar.BackgroundTransparency=ao.Disabled and 0.75 or 0 as.
Transparency=ao.Disabled and 0.75 or 0 ar.BackgroundColor3=ao.Value and x.Scheme.AccentColor or x.
Scheme.MainColor as.Color=ao.Value and x.Scheme.AccentColor or x.Scheme.OutlineColor x.Registry[ar]
.BackgroundColor3=ao.Value and'AccentColor'or'MainColor'x.Registry[as].Color=ao.Value and
'AccentColor'or'OutlineColor'if ao.Disabled then aq.TextTransparency=0.8 at.AnchorPoint=Vector2.
new(au,0)at.Position=UDim2.fromScale(au,0)at.BackgroundColor3=x:GetDarkerColor(x.Scheme.FontColor)x
.Registry[at].BackgroundColor3=function()return x:GetDarkerColor(x.Scheme.FontColor)end return end
i:Create(aq,x.TweenInfo,{TextTransparency=ao.Value and 0 or 0.4}):Play()i:Create(at,x.TweenInfo,{
AnchorPoint=Vector2.new(au,0),Position=UDim2.fromScale(au,0)}):Play()at.BackgroundColor3=x.Scheme.
FontColor x.Registry[at].BackgroundColor3='FontColor'end function ao:OnChanged(au)ao.Changed=au end
function ao:RunChanged()x:SafeCallback(ao.Callback,ao.Value)x:SafeCallback(ao.Changed,ao.Value)end
function ao:SetValue(au)if ao.Disabled then return end ao.Value=au ao:Display()for av,aw in ao.
Addons do if aw.Type=='KeyPicker'and aw.SyncToggleState then aw.Toggled=ao.Value aw:Update()end end
x:UpdateDependencyBoxes()if not ao.AnyKeyPickerPicking then ao:RunChanged()end end function ao:
SetDisabled(au:boolean)ao.Disabled=au if ao.TooltipTable then ao.TooltipTable.Disabled=ao.Disabled
end for av,aw in ao.Addons do if aw.Type=='KeyPicker'and aw.SyncToggleState then aw:Update()end end
ap.Active=not ao.Disabled ao:Display()end function ao:SetVisible(au:boolean)ao.Visible=au ap.
Visible=ao.Visible am:Resize()end function ao:SetText(au:string)ao.Text=au aq.Text=au end table.
insert(ao.Connections,ap.MouseButton1Click:Connect(function()if ao.Disabled then return end ao:
SetValue(not ao.Value)end))if typeof(ao.Tooltip)=='string'or typeof(ao.DisabledTooltip)=='string'
then ao.TooltipTable=x:AddTooltip(ao.Tooltip,ao.DisabledTooltip,ap)ao.TooltipTable.Disabled=ao.
Disabled end if ao.Risky then aq.TextColor3=x.Scheme.RedColor x.Registry[aq].TextColor3='RedColor'
end ao:Display()am:Resize()ao.TextLabel=aq ao.Container=an setmetatable(ao,O)ao.Holder=ap table.
insert(am.Elements,ao)ao.Default=ao.Value r[ak]=ao function ao:Destroy()ao.Destroyed=true if ao.
Connections then for au,av in ao.Connections do av:Disconnect()end end if ao.TooltipTable then ao.
TooltipTable:Destroy()end if ap then ap:Destroy()end if ao.Addons then for au=#ao.Addons,1,-1 do
local av=table.remove(ao.Addons,au)if av and av.Destroy then av:Destroy()end end end local au=table
.find(am.Elements,ao)if au then table.remove(am.Elements,au)end am:Resize()r[ak]=nil end return ao
end function aj:AddInput(ak,al)if self.Destroyed then return nil end if typeof(al)=='table'and(
typeof(al.VerifyValue)=='function'and al.Finished~=true)then al.Finished=true end al=x:Validate(al,
y.Input)local am=self local an=am.Container local ao={Connections={},Destroyed=false,Text=al.Text,
Value=al.Default,Finished=al.Finished,Numeric=al.Numeric,ClearTextOnFocus=al.ClearTextOnFocus,
ClearTextOnBlur=al.ClearTextOnBlur,Placeholder=al.Placeholder,AllowEmpty=al.AllowEmpty,EmptyReset=
al.EmptyReset,Tooltip=al.Tooltip,DisabledTooltip=al.DisabledTooltip,TooltipTable=nil,Callback=al.
Callback,Changed=al.Changed,VerifyValue=al.VerifyValue,Disabled=al.Disabled,Visible=al.Visible,Type
='Input'}local ap=New('Frame',{BackgroundTransparency=1,Size=UDim2.new(1,0,0,39),Visible=ao.Visible
,Parent=an})local aq=New('TextLabel',{BackgroundTransparency=1,Size=UDim2.new(1,0,0,14),Text=ao.
Text,TextSize=14,TextXAlignment=Enum.TextXAlignment.Left,Parent=ap})local ar=New('TextBox',{
AnchorPoint=Vector2.new(0,1),BackgroundColor3='MainColor',ClearTextOnFocus=not ao.Disabled and ao.
ClearTextOnFocus,PlaceholderText=ao.Placeholder,Position=UDim2.fromScale(0,1),Size=UDim2.new(1,0,0,
21),Text=ao.Value,TextEditable=not ao.Disabled,TextScaled=true,TextXAlignment=Enum.TextXAlignment.
Left,Parent=ap})New('UIPadding',{PaddingBottom=UDim.new(0,3),PaddingLeft=UDim.new(0,8),PaddingRight
=UDim.new(0,8),PaddingTop=UDim.new(0,4),Parent=ar})New('UIStroke',{Color='OutlineColor',Parent=ar})
table.insert(x.Corners,New('UICorner',{CornerRadius=UDim.new(0,x.CornerRadius/2),Parent=ar}))
function ao:UpdateColors()if x.Unloaded then return end aq.TextTransparency=ao.Disabled and 0.8 or
0 ar.TextTransparency=ao.Disabled and 0.8 or 0 end function ao:OnChanged(as)ao.Changed=as end
function ao:RunChanged()x:SafeCallback(ao.Callback,ao.Value)x:SafeCallback(ao.Changed,ao.Value)end
function ao:SetValue(as)if not ao.AllowEmpty and Trim(as)==''then as=ao.EmptyReset end if al.
MaxLength and#as>al.MaxLength then as=as:sub(1,al.MaxLength)end if ao.Numeric then if#tostring(as)>
0 and not tonumber(as)then as=ao.Value end end if typeof(al.VerifyValue)=='function'and(as~=ao.
EmptyReset and al.VerifyValue(as)~=true)then as=ao.EmptyReset end ao.Value=as ar.Text=as if not ao.
Disabled then ao:RunChanged()end end function ao:SetDisabled(as:boolean)ao.Disabled=as if ao.
TooltipTable then ao.TooltipTable.Disabled=ao.Disabled end ar.ClearTextOnFocus=not ao.Disabled and
ao.ClearTextOnFocus ar.TextEditable=not ao.Disabled ao:UpdateColors()end function ao:SetVisible(as:
boolean)ao.Visible=as ap.Visible=ao.Visible am:Resize()end function ao:SetText(as:string)ao.Text=as
aq.Text=as end if ao.Finished then table.insert(ao.Connections,ar.FocusLost:Connect(function(as)if
not as then if ao.ClearTextOnBlur then ar.Text=ao.Value end return end ao:SetValue(ar.Text)end))
else table.insert(ao.Connections,ar:GetPropertyChangedSignal('Text'):Connect(function()if ar.Text==
ao.Value then return end ao:SetValue(ar.Text)end))end if typeof(ao.Tooltip)=='string'or typeof(ao.
DisabledTooltip)=='string'then ao.TooltipTable=x:AddTooltip(ao.Tooltip,ao.DisabledTooltip,ar)ao.
TooltipTable.Disabled=ao.Disabled end am:Resize()ao.Holder=ap table.insert(am.Elements,ao)ao.
Default=ao.Value if typeof(al.VerifyValue)=='function'and(ao.Default~=ao.EmptyReset and al.
VerifyValue(ao.Default)~=true)then ao:SetValue(ao.EmptyReset)ao.Default=ao.EmptyReset end s[ak]=ao
function ao:Destroy()ao.Destroyed=true if ao.Connections then for as,at in ao.Connections do at:
Disconnect()end end if ao.TooltipTable then ao.TooltipTable:Destroy()end if ap then ap:Destroy()end
local as=table.find(am.Elements,ao)if as then table.remove(am.Elements,as)end am:Resize()s[ak]=nil
end return ao end function aj:AddSlider(ak,al)if self.Destroyed then return nil end al=x:Validate(
al,y.Slider)local am=self local an=am.Container local ao={Connections={},Destroyed=false,Text=al.
Text,Value=al.Default,Min=al.Min,Max=al.Max,Prefix=al.Prefix,Suffix=al.Suffix,Compact=al.Compact,
Rounding=al.Rounding,HideMax=al.HideMax,Tooltip=al.Tooltip,DisabledTooltip=al.DisabledTooltip,
TooltipTable=nil,Callback=al.Callback,Changed=al.Changed,Disabled=al.Disabled,Visible=al.Visible,
AllowRightClickInput=al.AllowRightClickInput,Type='Slider'}local ap=New('Frame',{
BackgroundTransparency=1,Size=UDim2.new(1,0,0,al.Compact and 15 or 33),Visible=ao.Visible,Parent=an
})local aq if not al.Compact then aq=New('TextLabel',{BackgroundTransparency=1,Size=UDim2.new(1,0,0
,14),Text=ao.Text,TextSize=14,TextXAlignment=Enum.TextXAlignment.Left,Parent=ap})end local ar=New(
'TextButton',{Active=not ao.Disabled,AnchorPoint=Vector2.new(0,1),BackgroundColor3='MainColor',
Position=UDim2.fromScale(0,1),Size=UDim2.new(1,0,0,15),Text='',Parent=ap})New('UIStroke',{Color=
'OutlineColor',Parent=ar})local as=New('TextLabel',{BackgroundTransparency=1,Size=UDim2.fromScale(1
,1),Text='',TextSize=14,ZIndex=ar.ZIndex+2,Parent=ar})New('UIStroke',{ApplyStrokeMode=Enum.
ApplyStrokeMode.Contextual,Color='DarkColor',LineJoinMode=Enum.LineJoinMode.Miter,Parent=as})local
at if al.AllowRightClickInput then at=New('TextBox',{BackgroundTransparency=1,Size=UDim2.fromScale(
1,1),Text='',TextSize=14,ZIndex=ar.ZIndex+3,Visible=false,ClearTextOnFocus=false,Parent=ar})New(
'UIStroke',{ApplyStrokeMode=Enum.ApplyStrokeMode.Contextual,Color='DarkColor',LineJoinMode=Enum.
LineJoinMode.Miter,Parent=at})end local au=New('Frame',{BackgroundColor3='AccentColor',Size=UDim2.
fromScale(0.5,1),ZIndex=ar.ZIndex+1,Parent=ar})table.insert(x.Corners,New('UICorner',{CornerRadius=
UDim.new(0,x.CornerRadius/2),Parent=ar}))table.insert(x.Corners,New('UICorner',{CornerRadius=UDim.
new(0,x.CornerRadius/2),Parent=au}))function ao:UpdateColors()if x.Unloaded then return end if aq
then aq.TextTransparency=ao.Disabled and 0.8 or 0 end as.TextTransparency=ao.Disabled and 0.8 or 0
if al.AllowRightClickInput then at.TextTransparency=ao.Disabled and 0.8 or 0 end au.
BackgroundColor3=ao.Disabled and x.Scheme.OutlineColor or x.Scheme.AccentColor x.Registry[au].
BackgroundColor3=ao.Disabled and'OutlineColor'or'AccentColor'end function ao:Display()if x.Unloaded
then return end local av if al.FormatDisplayValue then av=al.FormatDisplayValue(ao,ao.Value)end if
av then as.Text=tostring(av)else if al.Compact then as.Text=string.format('%s: %s%s%s',ao.Text,ao.
Prefix,ao.Value,ao.Suffix)elseif al.HideMax then as.Text=string.format('%s%s%s',ao.Prefix,ao.Value,
ao.Suffix)else as.Text=string.format('%s%s%s/%s%s%s',ao.Prefix,ao.Value,ao.Suffix,ao.Prefix,ao.Max,
ao.Suffix)end end local aw=(ao.Value-ao.Min)/(ao.Max-ao.Min)au.Size=UDim2.fromScale(aw,1)end
function ao:OnChanged(av)ao.Changed=av end function ao:SetMax(av)assert(av>ao.Min,
'Max value cannot be less than the current min value.')ao:SetValue(math.clamp(ao.Value,ao.Min,av))
ao.Max=av ao:Display()end function ao:SetMin(av)assert(av<ao.Max,
'Min value cannot be greater than the current max value.')ao:SetValue(math.clamp(ao.Value,av,ao.Max
))ao.Min=av ao:Display()end function ao:RunChanged()x:SafeCallback(ao.Callback,ao.Value)x:
SafeCallback(ao.Changed,ao.Value)end function ao:SetValue(av)if ao.Disabled then return end local
aw=tonumber(av)if not aw or aw==ao.Value then return end aw=math.clamp(aw,ao.Min,ao.Max)ao.Value=aw
ao:Display()ao:RunChanged()end function ao:SetDisabled(av:boolean)ao.Disabled=av if ao.TooltipTable
then ao.TooltipTable.Disabled=ao.Disabled end ar.Active=not ao.Disabled ao:UpdateColors()end
function ao:SetVisible(av:boolean)ao.Visible=av ap.Visible=ao.Visible am:Resize()end function ao:
SetText(av:string)ao.Text=av if aq then aq.Text=av return end ao:Display()end function ao:SetPrefix
(av:string)ao.Prefix=av ao:Display()end function ao:SetSuffix(av:string)ao.Suffix=av ao:Display()
end if al.AllowRightClickInput then local av=''table.insert(ao.Connections,at:
GetPropertyChangedSignal('Text'):Connect(function()local aw=at.Text local ax=tonumber(aw)if#
tostring(aw)>0 and not ax and aw~='-'then at.Text=av else if ao.Rounding==0 and aw:find('%.')then
at.Text=av return end local ay=aw:find('%.')if ay and ao.Rounding>0 then local az=#aw-ay if az>ao.
Rounding then at.Text=av return end end av=aw if ax then if ax>ao.Max then at.Text=tostring(ao.Max)
elseif ax<ao.Min then at.Text=tostring(ao.Min)end end end end))table.insert(ao.Connections,at.
FocusLost:Connect(function()at.Visible=false as.Visible=true local aw=tonumber(at.Text)if not aw
then return end aw=Round(aw,ao.Rounding)ao:SetValue(aw)end))end local av=0 table.insert(ao.
Connections,ar.InputBegan:Connect(function(aw:InputObject)local ax=IsClickInput(aw)or aw.
UserInputType==Enum.UserInputType.MouseButton2 if not ax or ao.Disabled then return end if al.
AllowRightClickInput then local ay=aw.UserInputType==Enum.UserInputType.MouseButton2 local az=false
if x.IsMobile and aw.UserInputType==Enum.UserInputType.Touch then if tick()-av<0.3 then az=true end
av=tick()end if ay or az then at.Text=tostring(ao.Value)at.Visible=true as.Visible=false task.
spawn(at.CaptureFocus,at)return end end if not IsClickInput(aw)then return end if x.ActiveTab then
for ay,az in x.ActiveTab.Sides do az.ScrollingEnabled=false end end if x.ActiveLoading and x.
ActiveLoading.Sidebar then x.ActiveLoading.Sidebar.Container.ScrollingEnabled=false end while
IsDragInput(aw)and not ao.Destroyed do local ay=o.X local az=math.clamp((ay-ar.AbsolutePosition.X)/
ar.AbsoluteSize.X,0,1)local aA=ao.Value ao.Value=Round(ao.Min+((ao.Max-ao.Min)*az),ao.Rounding)ao:
Display()if ao.Value~=aA then ao:RunChanged()end d.RenderStepped:Wait()end if x.ActiveTab then for
ay,az in x.ActiveTab.Sides do az.ScrollingEnabled=true end end if x.ActiveLoading and x.
ActiveLoading.Sidebar then x.ActiveLoading.Sidebar.Container.ScrollingEnabled=true end end))if
typeof(ao.Tooltip)=='string'or typeof(ao.DisabledTooltip)=='string'then ao.TooltipTable=x:
AddTooltip(ao.Tooltip,ao.DisabledTooltip,ar)ao.TooltipTable.Disabled=ao.Disabled end ao:
UpdateColors()ao:Display()am:Resize()ao.Holder=ap table.insert(am.Elements,ao)ao.Default=ao.Value s
[ak]=ao function ao:Destroy()ao.Destroyed=true if ao.Connections then for aw,ax in ao.Connections
do ax:Disconnect()end end if ao.TooltipTable then ao.TooltipTable:Destroy()end if ap then ap:
Destroy()end local aw=table.find(am.Elements,ao)if aw then table.remove(am.Elements,aw)end am:
Resize()s[ak]=nil end return ao end function aj:AddDropdown(ak,al)if self.Destroyed then return nil
end al=x:Validate(al,y.Dropdown)local am=self local an=am.Container if al.SpecialType=='Player'then
al.Values=GetPlayers(al.ExcludeLocalPlayer)al.AllowNull=true elseif al.SpecialType=='Team'then al.
Values=GetTeams()al.AllowNull=true end local ao={Connections={},Destroyed=false,Text=typeof(al.Text
)=='string'and al.Text or nil,Value=al.Multi and{}or nil,Values=al.Values,DisabledValues=al.
DisabledValues,ValueImages=al.ValueImages,Multi=al.Multi,DragSelect=al.Multi and not x.IsMobile and
al.DragSelect==true,SpecialType=al.SpecialType,ExcludeLocalPlayer=al.ExcludeLocalPlayer,
EnablePlayerImages=al.EnablePlayerImages,Tooltip=al.Tooltip,DisabledTooltip=al.DisabledTooltip,
TooltipTable=nil,Callback=al.Callback,Changed=al.Changed,Disabled=al.Disabled,Visible=al.Visible,
Type='Dropdown'}local ap=New('Frame',{BackgroundTransparency=1,Size=UDim2.new(1,0,0,ao.Text and 39
or 21),Visible=ao.Visible,Parent=an})local aq=New('TextLabel',{BackgroundTransparency=1,Size=UDim2.
new(1,0,0,14),Text=ao.Text,TextSize=14,TextXAlignment=Enum.TextXAlignment.Left,Visible=not not al.
Text,ZIndex=3,Parent=ap})local ar=New('TextButton',{AnchorPoint=Vector2.new(0,1),BackgroundColor3=
'MainColor',Position=UDim2.fromScale(0,1),Size=UDim2.new(1,0,0,21),Text='',TextTransparency=1,
ZIndex=2,Parent=ap})New('UIPadding',{PaddingLeft=UDim.new(0,8),PaddingRight=UDim.new(0,4),Parent=ar
})New('UIStroke',{Color='OutlineColor',Parent=ar})local as=New('UICorner',{TopLeftRadius=UDim.new(0
,x.CornerRadius/2),TopRightRadius=UDim.new(0,x.CornerRadius/2),BottomRightRadius=UDim.new(0,x.
CornerRadius/2),BottomLeftRadius=UDim.new(0,x.CornerRadius/2),Parent=ar})table.insert(x.
SpecificCorners,as)local at=New('ImageLabel',{BackgroundTransparency=1,Position=UDim2.fromOffset(-4
,3),Size=UDim2.fromOffset(16,16),Image='',ImageTransparency=1,ZIndex=2,Parent=ar})local au=New(
'TextButton',{Active=not ao.Disabled,BackgroundTransparency=1,Size=UDim2.new(1,0,0,21),Text='---',
TextSize=14,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=2,Parent=ar})local av=New('ImageLabel',{
AnchorPoint=Vector2.new(1,0.5),Image=ae and ae.Url or'',ImageColor3='FontColor',ImageRectOffset=ae
and ae.ImageRectOffset or Vector2.zero,ImageRectSize=ae and ae.ImageRectSize or Vector2.zero,
ImageTransparency=0.5,Position=UDim2.fromScale(1,0.5),Size=UDim2.fromOffset(16,16),Parent=ar})local
aw if al.Searchable then aw=New('TextBox',{BackgroundTransparency=1,PlaceholderText='Search...',
Position=UDim2.fromOffset(-8,0),Size=UDim2.new(1,-12,1,0),TextSize=14,TextXAlignment=Enum.
TextXAlignment.Left,Visible=false,Parent=au})New('UIPadding',{PaddingLeft=UDim.new(0,8),Parent=aw})
end local ax=function(ax)if not ax then return nil end local ay if ao.SpecialType=='Player'and ao.
EnablePlayerImages==true then if typeof(ax)=='Instance'and ax:IsA('Player')then ay={Url=string.
format('rbxthumb://type=AvatarHeadShot&id=%s&w=48&h=48',tostring(ax.UserId))}end else if al.
ValueImages and al.ValueImages[ax]then ay=x:GetCustomIcon(al.ValueImages[ax])end end return ay end
local ay=x:AddContextMenu(ar,function()return UDim2.fromOffset((ar.AbsoluteSize.X/x.DPIScale),0)end
,function()return{0.5,ar.AbsoluteSize.Y+1.5}end,2,function(ay:boolean)au.TextTransparency=(ay and
aw)and 1 or 0 av.ImageTransparency=ay and 0 or 0.5 av.Rotation=ay and 180 or 0 if aw then aw.Text=
''aw.Visible=ay end as.BottomRightRadius=ay and UDim.new(0,0)or UDim.new(0,x.CornerRadius/2)as.
BottomLeftRadius=ay and UDim.new(0,0)or UDim.new(0,x.CornerRadius/2)end,false,'bottom','Dropdown')
ao.Menu=ay function ao:RecalculateListSize(az)local aA=math.clamp((az or GetTableSize(ao.Values))*
21,0,al.MaxVisibleDropdownItems*21)ay:SetSize(function()return UDim2.fromOffset((ar.AbsoluteSize.X/
x.DPIScale),aA)end)end function ao:UpdateColors()if x.Unloaded then return end aq.TextTransparency=
ao.Disabled and 0.8 or 0 au.TextTransparency=ao.Disabled and 0.8 or 0 at.ImageTransparency=ao.
Disabled and 0.8 or 0 av.ImageTransparency=ao.Disabled and 0.8 or ay.Active and 0 or 0.5 end
function ao:Display()if x.Unloaded then return end local az=''local aA if al.Multi then for aB,aC
in ao.Values do if ao.Value[aC]then if not aA then aA=ax(aC)end az=az..(al.FormatDisplayValue and
tostring(al.FormatDisplayValue(aC))or tostring(aC))..', 'end end az=az:sub(1,#az-2)else aA=ax(ao.
Value)az=ao.Value and tostring(ao.Value)or''if az~=''and al.FormatDisplayValue then az=tostring(al.
FormatDisplayValue(az))end end if#az>25 then az=az:sub(1,22)..'...'end au.Text=(az==''and'---'or az
)if aA then at.Image=aA.Url at.ImageRectOffset=aA.ImageRectOffset or Vector2.zero at.ImageRectSize=
aA.ImageRectSize or Vector2.zero at.ImageTransparency=0 else at.Image=''at.ImageTransparency=1 end
au.Size=aA and UDim2.new(1,-8,0,21)or UDim2.new(1,0,0,21)au.Position=aA and UDim2.fromOffset(14,0)
or UDim2.fromOffset(0,0)end function ao:OnChanged(az)ao.Changed=az end function ao:GetActiveValues(
az)local aA={}if al.Multi then for aB,aC in ao.Value do table.insert(aA,aB)end else if ao.Value
then table.insert(aA,ao.Value)end end return az==true and GetTableSize(aA)or aA end local az={}
local aA=false local aB local aC={}local aD local aE local function StopDragSelect()aA=false aB=nil
table.clear(aC)if aD then aD:Disconnect()aD=nil end if aE then aE:Disconnect()aE=nil end end
local function UpdateDrag(aF)local aG=math.min(aB,aF)local aH=math.max(aB,aF)for aI,aJ in az do
local aK=aJ.Index>=aG and aJ.Index<=aH local aL=aC[aJ.Value]if aK then aL=not aL end if not(ao:
GetActiveValues(true)==1 and not aL and not al.AllowNull)then ao.Value[aJ.Value]=aL and true or nil
end aJ:UpdateButton()end ao:Display()end function ao:BuildDropdownList()local aF=ao.Values local aG
=ao.DisabledValues StopDragSelect()for aH,aI in az do if not(aH and aH.Parent)then continue end aH.
Parent:Destroy()end table.clear(az)local aH=0 local aI=0 local aJ=GetTableSize(aF)+GetTableSize(aG)
for aK,aL in aF do aI+=1 local aM=tostring(al.FormatListValue and al.FormatListValue(aL)or aL)if aw
and not aM:lower():match(aw.Text:lower())then continue end aH+=1 local P=table.find(aG,aL)local Q={
}local R=ax(aL)local S=New('Frame',{BackgroundColor3='MainColor',BackgroundTransparency=1,
LayoutOrder=P and 1 or 0,Size=UDim2.new(1,0,0,21),Parent=ay.Menu})if aI==aJ then local T=New(
'UICorner',{TopLeftRadius=UDim.new(0,0),TopRightRadius=UDim.new(0,0),BottomRightRadius=UDim.new(0,x
.CornerRadius/2),BottomLeftRadius=UDim.new(0,x.CornerRadius/2),Parent=S})table.insert(x.
SpecificCorners,T)end local T=R and New('ImageLabel',{BackgroundTransparency=1,Image=R.Url,
ImageRectOffset=R.ImageRectOffset,ImageRectSize=R.ImageRectSize,ImageTransparency=0.5,Size=UDim2.
fromOffset(16,16),Position=UDim2.fromOffset(4,3),Parent=S})local U=New('TextButton',{
BackgroundTransparency=1,Size=R and UDim2.new(1,-18,0,21)or UDim2.new(1,0,0,21),Position=R and
UDim2.fromOffset(18,0)or UDim2.fromOffset(0,0),Text=aM,TextSize=14,TextTransparency=0.5,
TextXAlignment=Enum.TextXAlignment.Left,Parent=S})New('UIPadding',{PaddingLeft=UDim.new(0,7),
PaddingRight=UDim.new(0,7),Parent=U})local V if al.Multi then V=ao.Value[aL]else V=ao.Value==aL end
function Q:UpdateButton()if al.Multi then V=ao.Value[aL]else V=ao.Value==aL end S.
BackgroundTransparency=V and 0 or 1 U.TextTransparency=P and 0.8 or V and 0 or 0.5 if T then T.
ImageTransparency=P and 0.8 or V and 0 or 0.5 end end Q.Index=aH Q.Value=aL if not P then U.
MouseButton1Click:Connect(function()if aA then return end local W=not V if not(ao:GetActiveValues(
true)==1 and not W and not al.AllowNull)then V=W if al.Multi then ao.Value[aL]=V and true or nil
else ao.Value=V and aL or nil end for X,Y in az do Y:UpdateButton()end end Q:UpdateButton()ao:
Display()x:UpdateDependencyBoxes()ao:RunChanged()end)if al.Multi and ao.DragSelect and not x.
IsMobile then U.InputBegan:Connect(function(W)if not IsMouseInput(W)then return end aA=true aB=Q.
Index table.clear(aC)for X,Y in az do aC[Y.Value]=ao.Value[Y.Value]end UpdateDrag(Q.Index)if aD
then aD:Disconnect()end if aE then aE:Disconnect()end aE=x:GiveSignal(f.InputChanged:Connect(
function(X)if not IsMovementInput(X)and X~=W then return end local Y=X.Position for Z,_ in az do if
x:MouseIsOverFrame(Z,Y)then UpdateDrag(_.Index)break end end end))aD=x:GiveSignal(f.InputEnded:
Connect(function(X)if X~=W and not(IsMouseInput(X)and X.UserInputType==W.UserInputType)then return
end x:UpdateDependencyBoxes()ao:RunChanged()StopDragSelect()end))table.insert(ao.Connections,aD)
table.insert(ao.Connections,aE)end)end end Q:UpdateButton()ao:Display()az[U]=Q end ao:
RecalculateListSize(aH)end function ao:RunChanged()x:SafeCallback(ao.Callback,ao.Value)x:
SafeCallback(ao.Changed,ao.Value)end function ao:SetValue(aF)if al.Multi then local aG={}for aH,aI
in aF or{}do if typeof(aI)~='boolean'then aG[aI]=true elseif aI and table.find(ao.Values,aH)then aG
[aH]=true end end ao.Value=aG else if table.find(ao.Values,aF)then ao.Value=aF elseif not aF then
ao.Value=nil end end ao:Display()for aG,aH in az do aH:UpdateButton()end if not ao.Disabled then x:
UpdateDependencyBoxes()ao:RunChanged()end end function ao:SetValues(aF)ao.Values=aF ao:
BuildDropdownList()end function ao:AddValues(aF)if typeof(aF)=='table'then for aG,aH in aF do table
.insert(ao.Values,aH)end elseif typeof(aF)=='string'then table.insert(ao.Values,aF)else return end
ao:BuildDropdownList()end function ao:SetDisabledValues(aF)ao.DisabledValues=aF ao:
BuildDropdownList()end function ao:AddDisabledValues(aF)if typeof(aF)=='table'then for aG,aH in aF
do table.insert(ao.DisabledValues,aH)end elseif typeof(aF)=='string'then table.insert(ao.
DisabledValues,aF)else return end ao:BuildDropdownList()end function ao:SetValueImages(aF)if
typeof(aF)~='table'then return end ao.ValueImages=aF ao:BuildDropdownList()end function ao:
AddValueImages(aF)if typeof(aF)~='table'then return end for aG,aH in aF do ao.ValueImages[aG]=aH
end ao:BuildDropdownList()end function ao:SetDisabled(aF:boolean)ao.Disabled=aF if ao.TooltipTable
then ao.TooltipTable.Disabled=ao.Disabled end ay:Close()au.Active=not ao.Disabled ao:UpdateColors()
end function ao:SetVisible(aF:boolean)ao.Visible=aF ap.Visible=ao.Visible am:Resize()end function
ao:SetText(aF:string)ao.Text=aF ap.Size=UDim2.new(1,0,0,aF and 39 or 21)aq.Text=aF and aF or''aq.
Visible=not not aF end function ao:SetDragSelect(aF:boolean)if not al.Multi or x.IsMobile then aF=
false end ao.DragSelect=aF==true ao:BuildDropdownList()end local aF=function()if ao.Disabled then
return end ay:Toggle()end table.insert(ao.Connections,ar.MouseButton1Click:Connect(aF))table.
insert(ao.Connections,au.MouseButton1Click:Connect(aF))if aw then table.insert(ao.Connections,aw:
GetPropertyChangedSignal('Text'):Connect(ao.BuildDropdownList))end local aG={}if typeof(al.Default)
=='string'then local aH=table.find(ao.Values,al.Default)if aH then table.insert(aG,aH)end elseif
typeof(al.Default)=='table'then for aH,aI in next,al.Default do local aJ=table.find(ao.Values,aI)if
aJ then table.insert(aG,aJ)end end elseif ao.Values[al.Default]~=nil then table.insert(aG,al.
Default)end if next(aG)then for aH=1,#aG do local aI=aG[aH]if al.Multi then ao.Value[ao.Values[aI]
]=true else ao.Value=ao.Values[aI]end if not al.Multi then break end end end if typeof(ao.Tooltip)
=='string'or typeof(ao.DisabledTooltip)=='string'then ao.TooltipTable=x:AddTooltip(ao.Tooltip,ao.
DisabledTooltip,ar)ao.TooltipTable.Disabled=ao.Disabled end ao:UpdateColors()ao:Display()ao:
BuildDropdownList()am:Resize()ao.Holder=ap table.insert(am.Elements,ao)ao.Default=aG ao.
DefaultValues=ao.Values s[ak]=ao function ao:Destroy()ao.Destroyed=true StopDragSelect()if ao.
Connections then for aH,aI in ao.Connections do aI:Disconnect()end end if ao.TooltipTable then ao.
TooltipTable:Destroy()end if ay then ay:Destroy()end if ap then ap:Destroy()end local aH=table.
find(am.Elements,ao)if aH then table.remove(am.Elements,aH)end am:Resize()s[ak]=nil end return ao
end function aj:AddViewport(ak,al)if self.Destroyed then return nil end al=x:Validate(al,y.Viewport
)local am=self local an=am.Container local ao,ap=false,false local aq,ar=0 local as=al.Object if al
.Clone and typeof(al.Object)=='Instance'then if al.Object.Archivable then as=as:Clone()else al.
Object.Archivable=true as=as:Clone()al.Object.Archivable=false end end local at={Connections={},
Destroyed=false,Object=as::PVInstance,Camera=if not al.Camera then Instance.new('Camera')else al.
Camera,Interactive=al.Interactive,AutoFocus=al.AutoFocus,Visible=al.Visible,Type='Viewport'}assert(
typeof(at.Object)=='Instance'and(at.Object:IsA('BasePart')or at.Object:IsA('Model')),
'Instance must be a BasePart or Model.')assert(typeof(at.Camera)=='Instance'and at.Camera:IsA(
'Camera'),'Camera must be a valid Camera instance.')local function GetModelSize(au)if au:IsA(
'BasePart')then return au.Size end return select(2,au:GetBoundingBox())end local function
FocusCamera()local au=GetModelSize(at.Object)local av=math.max(au.X,au.Y,au.Z)local aw=av*2 local
ax=(at.Object::PVInstance):GetPivot().Position at.Camera.CFrame=CFrame.new(ax+Vector3.new(0,av/2,aw
),ax)end local au=New('Frame',{BackgroundTransparency=1,Size=UDim2.new(1,0,0,al.Height),Visible=at.
Visible,Parent=an})local av=New('Frame',{AnchorPoint=Vector2.new(0,1),BackgroundColor3='MainColor',
BorderColor3='OutlineColor',BorderSizePixel=1,Position=UDim2.fromScale(0,1),Size=UDim2.fromScale(1,
1),Parent=au})New('UIPadding',{PaddingBottom=UDim.new(0,3),PaddingLeft=UDim.new(0,8),PaddingRight=
UDim.new(0,8),PaddingTop=UDim.new(0,4),Parent=av})local aw=New('ViewportFrame',{
BackgroundTransparency=1,Size=UDim2.fromScale(1,1),Parent=av,CurrentCamera=at.Camera,Active=at.
Interactive})table.insert(at.Connections,aw.MouseEnter:Connect(function()if not at.Interactive then
return end for ax,ay in am.Tab.Sides do ay.ScrollingEnabled=false end end))table.insert(at.
Connections,aw.MouseLeave:Connect(function()if not at.Interactive then return end for ax,ay in am.
Tab.Sides do ay.ScrollingEnabled=true end end))table.insert(at.Connections,aw.InputBegan:Connect(
function(ax)if not at.Interactive then return end if ax.UserInputType==Enum.UserInputType.
MouseButton2 then ao=true ar=ax.Position elseif ax.UserInputType==Enum.UserInputType.Touch and not
ap then ao=true ar=ax.Position end end))table.insert(at.Connections,f.InputEnded:Connect(function(
ax)if x.Unloaded then return end if not at.Interactive then return end if ax.UserInputType==Enum.
UserInputType.MouseButton2 then ao=false elseif ax.UserInputType==Enum.UserInputType.Touch then ao=
false end end))table.insert(at.Connections,f.InputChanged:Connect(function(ax)if x.Unloaded then
return end if not at.Interactive or not ao or ap then return end if ax.UserInputType==Enum.
UserInputType.MouseMovement or ax.UserInputType==Enum.UserInputType.Touch then local ay=ax.Position
-ar ar=ax.Position local az=(at.Object::PVInstance):GetPivot().Position local aA=at.Camera local aB
=CFrame.fromAxisAngle(Vector3.new(0,1,0),-ay.X*0.01)aA.CFrame=CFrame.new(az)*aB*CFrame.new(-az)*aA.
CFrame local aC=CFrame.fromAxisAngle(aA.CFrame.RightVector,-ay.Y*0.01)local aD=CFrame.new(az)*aC*
CFrame.new(-az)*aA.CFrame if aD.UpVector.Y>0.1 then aA.CFrame=aD end end end))table.insert(at.
Connections,aw.InputChanged:Connect(function(ax)if not at.Interactive then return end if ax.
UserInputType==Enum.UserInputType.MouseWheel then local ay=ax.Position.Z*2 at.Camera.CFrame+=at.
Camera.CFrame.LookVector*ay end end))table.insert(at.Connections,f.TouchPinch:Connect(function(ax,
ay,az,aA)if x.Unloaded then return end if not at.Interactive or not x:MouseIsOverFrame(aw,ax[1])
then return end if aA==Enum.UserInputState.Begin then ap=true ao=false aq=(ax[1]-ax[2]).Magnitude
elseif aA==Enum.UserInputState.Change then local aB=(ax[1]-ax[2]).Magnitude local aC=(aB-aq)*0.1 aq
=aB at.Camera.CFrame+=at.Camera.CFrame.LookVector*aC elseif aA==Enum.UserInputState.End or aA==Enum
.UserInputState.Cancel then ap=false end end));(at.Object::PVInstance).Parent=aw if at.AutoFocus
then FocusCamera()end function at:SetObject(ax:Instance,ay:boolean?)assert(ax,
'Object cannot be nil.')if ay then ax=ax:Clone()end if at.Object then at.Object:Destroy()end at.
Object=ax;(at.Object::PVInstance).Parent=aw am:Resize()end function at:SetHeight(ax:number)assert(
ax>0,'Height must be greater than 0.')au.Size=UDim2.new(1,0,0,ax)am:Resize()end function at:Focus()
if not at.Object then return end FocusCamera()end function at:SetCamera(ax:Instance)assert(ax and
typeof(ax)=='Instance'and ax:IsA('Camera'),'Camera must be a valid Camera instance.')at.Camera=ax
aw.CurrentCamera=ax end function at:SetInteractive(ax:boolean)at.Interactive=ax aw.Active=ax end
function at:SetVisible(ax:boolean)at.Visible=ax au.Visible=at.Visible am:Resize()end am:Resize()at.
Holder=au table.insert(am.Elements,at)s[ak]=at function at:Destroy()at.Destroyed=true if at.
Connections then for ax,ay in at.Connections do ay:Disconnect()end end if au then au:Destroy()end
local ax=table.find(am.Elements,at)if ax then table.remove(am.Elements,ax)end am:Resize()s[ak]=nil
end return at end function aj:AddImage(ak,al)if self.Destroyed then return nil end al=x:Validate(al
,y.Image)local am=self local an=am.Container local ao={Connections={},Destroyed=false,Image=al.
Image,Color=al.Color,RectOffset=al.RectOffset,RectSize=al.RectSize,Height=al.Height,ScaleType=al.
ScaleType,Transparency=al.Transparency,BackgroundTransparency=al.BackgroundTransparency,Visible=al.
Visible,Type='Image'}local ap=New('Frame',{BackgroundTransparency=1,Size=UDim2.new(1,0,0,al.Height)
,Visible=ao.Visible,Parent=an})local aq=New('Frame',{AnchorPoint=Vector2.new(0,1),BackgroundColor3=
'MainColor',BorderColor3='OutlineColor',BorderSizePixel=1,BackgroundTransparency=ao.
BackgroundTransparency,Position=UDim2.fromScale(0,1),Size=UDim2.fromScale(1,1),Parent=ap})New(
'UIPadding',{PaddingBottom=UDim.new(0,3),PaddingLeft=UDim.new(0,8),PaddingRight=UDim.new(0,8),
PaddingTop=UDim.new(0,4),Parent=aq})local ar={BackgroundTransparency=1,Size=UDim2.fromScale(1,1),
Image=ao.Image,ImageTransparency=ao.Transparency,ImageColor3=ao.Color,ImageRectOffset=ao.RectOffset
,ImageRectSize=ao.RectSize,ScaleType=ao.ScaleType,Parent=aq}local as=x:GetCustomIcon(ar.Image)
assert(as,[[Image must be a valid Roblox asset or a valid URL or a valid lucide icon.]])ar.Image=as
.Url ar.ImageRectOffset=as.ImageRectOffset ar.ImageRectSize=as.ImageRectSize local at=New(
'ImageLabel',ar)function ao:SetHeight(au:number)assert(au>0,'Height must be greater than 0.')ao.
Height=au ap.Size=UDim2.new(1,0,0,au)am:Resize()end function ao:SetImage(au:string)assert(typeof(au
)=='string','Image must be a string.')local av=x:GetCustomIcon(au)assert(av,
[[Image must be a valid Roblox asset or a valid URL or a valid lucide icon.]])au=av.Url ao.
RectOffset=av.ImageRectOffset ao.RectSize=av.ImageRectSize at.Image=au ao.Image=au end function ao:
SetColor(au:Color3)assert(typeof(au)=='Color3','Color must be a Color3 value.')at.ImageColor3=au ao
.Color=au end function ao:SetRectOffset(au:Vector2)assert(typeof(au)=='Vector2',
'RectOffset must be a Vector2 value.')at.ImageRectOffset=au ao.RectOffset=au end function ao:
SetRectSize(au:Vector2)assert(typeof(au)=='Vector2','RectSize must be a Vector2 value.')at.
ImageRectSize=au ao.RectSize=au end function ao:SetScaleType(au:Enum.ScaleType)assert(typeof(au)==
'EnumItem'and au:IsA('ScaleType'),'ScaleType must be a valid Enum.ScaleType.')at.ScaleType=au ao.
ScaleType=au end function ao:SetTransparency(au:number)assert(typeof(au)=='number',
'Transparency must be a number between 0 and 1.')assert(au>=0 and au<=1,
'Transparency must be between 0 and 1.')at.ImageTransparency=au ao.Transparency=au end function ao:
SetVisible(au:boolean)ao.Visible=au ap.Visible=ao.Visible am:Resize()end am:Resize()ao.Holder=ap
table.insert(am.Elements,ao)s[ak]=ao function ao:Destroy()ao.Destroyed=true if ap then ap:Destroy()
end local au=table.find(am.Elements,ao)if au then table.remove(am.Elements,au)end am:Resize()s[ak]=
nil end return ao end function aj:AddVideo(ak,al)if self.Destroyed then return nil end al=x:
Validate(al,y.Video)local am=self local an=am.Container local ao={Connections={},Destroyed=false,
Video=al.Video,Looped=al.Looped,Playing=al.Playing,Volume=al.Volume,Height=al.Height,Visible=al.
Visible,Type='Video'}local ap=New('Frame',{BackgroundTransparency=1,Size=UDim2.new(1,0,0,al.Height)
,Visible=ao.Visible,Parent=an})local aq=New('Frame',{AnchorPoint=Vector2.new(0,1),BackgroundColor3=
'MainColor',BorderColor3='OutlineColor',BorderSizePixel=1,Position=UDim2.fromScale(0,1),Size=UDim2.
fromScale(1,1),Parent=ap})New('UIPadding',{PaddingBottom=UDim.new(0,3),PaddingLeft=UDim.new(0,8),
PaddingRight=UDim.new(0,8),PaddingTop=UDim.new(0,4),Parent=aq})local ar=New('VideoFrame',{
BackgroundTransparency=1,Size=UDim2.fromScale(1,1),Video=ao.Video,Looped=ao.Looped,Volume=ao.Volume
,Parent=aq})ar.Playing=ao.Playing function ao:SetHeight(as:number)assert(as>0,
'Height must be greater than 0.')ao.Height=as ap.Size=UDim2.new(1,0,0,as)am:Resize()end function ao
:SetVideo(as:string)assert(typeof(as)=='string','Video must be a string.')ar.Video=as ao.Video=as
end function ao:SetLooped(as:boolean)assert(typeof(as)=='boolean','Looped must be a boolean.')ar.
Looped=as ao.Looped=as end function ao:SetVolume(as:number)assert(typeof(as)=='number',
'Volume must be a number between 0 and 10.')ar.Volume=as ao.Volume=as end function ao:SetPlaying(as
:boolean)assert(typeof(as)=='boolean','Playing must be a boolean.')ar.Playing=as ao.Playing=as end
function ao:Play()ar.Playing=true ao.Playing=true end function ao:Pause()ar.Playing=false ao.
Playing=false end function ao:SetVisible(as:boolean)ao.Visible=as ap.Visible=ao.Visible am:Resize()
end am:Resize()ao.Holder=ap ao.VideoFrame=ar table.insert(am.Elements,ao)s[ak]=ao function ao:
Destroy()ao.Destroyed=true if ao.Connections then for as,at in ao.Connections do at:Disconnect()end
end if ap then ap:Destroy()end local as=table.find(am.Elements,ao)if as then table.remove(am.
Elements,as)end am:Resize()s[ak]=nil end return ao end function aj:AddUIPassthrough(ak,al)if self.
Destroyed then return nil end al=x:Validate(al,y.UIPassthrough)local am=self local an=am.Container
assert(al.Instance,'Instance must be provided.')assert(typeof(al.Instance)=='Instance'and al.
Instance:IsA('GuiBase2d'),'Instance must inherit from GuiBase2d.')assert(typeof(al.Height)==
'number'and al.Height>0,'Height must be a number greater than 0.')local ao={Connections={},
Destroyed=false,Instance=al.Instance,Height=al.Height,Visible=al.Visible,Type='UIPassthrough'}local
ap=New('Frame',{BackgroundTransparency=1,Size=UDim2.new(1,0,0,al.Height),Visible=ao.Visible,Parent=
an})ao.Instance.Parent=ap am:Resize()function ao:SetHeight(aq:number)assert(typeof(aq)=='number'and
aq>0,'Height must be a number greater than 0.')ao.Height=aq ap.Size=UDim2.new(1,0,0,aq)am:Resize()
end function ao:SetInstance(aq:Instance)assert(aq,'Instance must be provided.')assert(typeof(aq)==
'Instance'and aq:IsA('GuiBase2d'),'Instance must inherit from GuiBase2d.')if ao.Instance then ao.
Instance.Parent=nil end ao.Instance=aq ao.Instance.Parent=ap end function ao:SetVisible(aq:boolean)
ao.Visible=aq ap.Visible=ao.Visible am:Resize()end ao.Holder=ap table.insert(am.Elements,ao)s[ak]=
ao function ao:Destroy()ao.Destroyed=true if ao.Connections then for aq,ar in ao.Connections do ar:
Disconnect()end end if ap then ap:Destroy()end local aq=table.find(am.Elements,ao)if aq then table.
remove(am.Elements,aq)end am:Resize()s[ak]=nil end return ao end function aj:AddDependencyBox()if
self.Destroyed then return nil end local ak=self local al=ak.Container local am local an do am=New(
'Frame',{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),Visible=false,Parent=al})an=New(
'UIListLayout',{Padding=UDim.new(0,8),Parent=am})end local ao={Connections={},Destroyed=false,
Visible=false,Dependencies={},Holder=am,Container=am,Elements={},DependencyBoxes={}}function ao:
Resize()am.Size=UDim2.new(1,0,0,an.AbsoluteContentSize.Y/x.DPIScale)ak:Resize()end function ao:
Update(ap)for aq,ar in ao.Dependencies do local as=ar[1]local at=ar[2]if as.Type=='Toggle'and as.
Value~=at then am.Visible=false ao.Visible=false return elseif as.Type=='Dropdown'then if typeof(as
.Value)=='table'then if not as.Value[at]then am.Visible=false ao.Visible=false return end else if
as.Value~=at then am.Visible=false ao.Visible=false return end end end end ao.Visible=true am.
Visible=true if not x.Searching then task.defer(function()ao:Resize()end)elseif not ap then x:
UpdateSearch(x.SearchText)end end an:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(
function()if not ao.Visible then return end ao:Resize()end)function ao:SetupDependencies(ap)for aq,
ar in ap do assert(typeof(ar)=='table','Dependency should be a table.')assert(ar[1]~=nil,
'Dependency is missing element.')assert(ar[2]~=nil,'Dependency is missing expected value.')end ao.
Dependencies=ap ao:Update()end am:GetPropertyChangedSignal('Visible'):Connect(function()ao:Resize()
end)setmetatable(ao,ai)table.insert(ak.DependencyBoxes,ao)table.insert(x.DependencyBoxes,ao)
function ao:Destroy()ao.Destroyed=true if ao.Connections then for ap,aq in ao.Connections do aq:
Disconnect()end end for ap,aq in ao.Elements do if aq.Destroy then aq:Destroy()end end for ap,aq in
ao.DependencyBoxes do if aq.Destroy then aq:Destroy()end end if am then am:Destroy()end local ap=
table.find(ak.DependencyBoxes,ao)if ap then table.remove(ak.DependencyBoxes,ap)end local aq=table.
find(x.DependencyBoxes,ao)if aq then table.remove(x.DependencyBoxes,aq)end end return ao end
function aj:AddDependencyGroupbox()if self.Destroyed then return nil end local ak=self local al=ak.
Tab local am=ak.BoxHolder local an local ao do an=New('Frame',{BackgroundColor3='BackgroundColor',
Size=UDim2.fromScale(1,0),Visible=false,Parent=am})table.insert(x.Corners,New('UICorner',{
CornerRadius=UDim.new(0,x.CornerRadius),Parent=an}))x:AddOutline(an)ao=New('UIListLayout',{Padding=
UDim.new(0,8),Parent=an})New('UIPadding',{PaddingBottom=UDim.new(0,7),PaddingLeft=UDim.new(0,7),
PaddingRight=UDim.new(0,7),PaddingTop=UDim.new(0,7),Parent=an})end local ap={Connections={},
Destroyed=false,Visible=false,Dependencies={},BoxHolder=am,Holder=an,Container=an,Tab=al,Elements={
},DependencyBoxes={}}function ap:Resize()an.Size=UDim2.new(1,0,0,(ao.AbsoluteContentSize.Y/x.
DPIScale)+18)end function ap:Update(aq)for ar,as in ap.Dependencies do local at=as[1]local au=as[2]
if at.Type=='Toggle'and at.Value~=au then an.Visible=false ap.Visible=false return elseif at.Type==
'Dropdown'then if typeof(at.Value)=='table'then if not at.Value[au]then an.Visible=false ap.Visible
=false return end else if at.Value~=au then an.Visible=false ap.Visible=false return end end end
end ap.Visible=true if not x.Searching then an.Visible=true ap:Resize()elseif not aq then x:
UpdateSearch(x.SearchText)end end function ap:SetupDependencies(aq)for ar,as in aq do assert(
typeof(as)=='table','Dependency should be a table.')assert(as[1]~=nil,
'Dependency is missing element.')assert(as[2]~=nil,'Dependency is missing expected value.')end ap.
Dependencies=aq ap:Update()end setmetatable(ap,ai)table.insert(al.DependencyGroupboxes,ap)table.
insert(x.DependencyBoxes,ap::any)function ap:Destroy()ap.Destroyed=true if ap.Connections then for
aq,ar in ap.Connections do ar:Disconnect()end end for aq,ar in ap.Elements do if ar.Destroy then ar
:Destroy()end end for aq,ar in ap.DependencyBoxes do if ar.Destroy then ar:Destroy()end end if an
then an:Destroy()end local aq=table.find(al.DependencyGroupboxes,ap)if aq then table.remove(al.
DependencyGroupboxes,aq)end local ar=table.find(x.DependencyBoxes,ap)if ar then table.remove(x.
DependencyBoxes,ar)end end return ap end ai.__index=aj ai.__namecall=function(ak,al,...)return aj[
al](...)end end function x:SetFont(aj)if typeof(aj)=='EnumItem'then aj=Font.fromEnum(aj::any)end x.
Scheme.Font=aj x:UpdateColorsUsingRegistry()end function x:SetBackgroundImage(aj:string|number)
assert(typeof(aj)=='string'or typeof(aj)=='number','Expected string/number got '..typeof(aj))x.
Scheme.BackgroundImage=aj if x.Window then x.Window:SetBackgroundImage(aj)end x:
UpdateColorsUsingRegistry()end function x:UpdateNotificationPositions(aj:boolean?)local ak=x.
NotifySide:lower()=='left'local al=ak and 0 or 1 local am=0 for an,ao in L do local ap=x.
Notifications[ao]if not(ap and ao.Parent)then continue end local aq=UDim2.new(al,0,0,am)if aj or
not ap.PositionInitialized then ao.Position=aq ap.PositionInitialized=true elseif ao.Position~=aq
then i:Create(ao,x.NotifyTweenInfo,{Position=aq}):Play()end am=am+ao.AbsoluteSize.Y+8 end end
function x:SetNotifySide(aj:string)x.NotifySide=aj local ak=aj:lower()=='left'if ak then K.
AnchorPoint=Vector2.new(0,0)K.Position=UDim2.fromOffset(6,6)else K.AnchorPoint=Vector2.new(1,0)K.
Position=UDim2.new(1,-6,0,6)end for al in x.Notifications do if not(al and al.Parent)then continue
end al.AnchorPoint=if ak then Vector2.new(0,0)else Vector2.new(1,0)end x:
UpdateNotificationPositions(true)end function x:Notify(...)local aj={}local ak=select(1,...)if
typeof(ak)=='table'then aj.Title=tostring(ak.Title)aj.TitleColor=ak.TitleColor aj.Description=
tostring(ak.Description)aj.DescriptionColor=ak.DescriptionColor aj.Time=ak.Time or 5 aj.SoundId=ak.
SoundId aj.Steps=ak.Steps aj.Persist=ak.Persist aj.Icon=ak.Icon aj.BigIcon=ak.BigIcon aj.IconColor=
ak.IconColor aj.Volume=tonumber(ak.Volume)or 3 else aj.Description=tostring(ak)aj.Time=select(2,...
)or 5 aj.SoundId=select(3,...)aj.Volume=select(4,...)or 3 end aj.Destroyed=false local al=false
local am if typeof(aj.Time)=='Instance'then am=aj.Time.Destroying:Connect(function()al=true am:
Disconnect()am=nil end)end local an=New('Frame',{AnchorPoint=x.NotifySide:lower()=='left'and
Vector2.new(0,0)or Vector2.new(1,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
Size=UDim2.fromScale(1,0),Visible=false,Parent=K})local ao=New('Frame',{AutomaticSize=Enum.
AutomaticSize.Y,BackgroundColor3='MainColor',Position=x.NotifySide:lower()=='left'and UDim2.new(-1,
-8,0,-2)or UDim2.new(1,8,0,-2),Size=UDim2.fromScale(1,1),ZIndex=5,Parent=an})table.insert(x.Corners
,New('UICorner',{CornerRadius=UDim.new(0,x.CornerRadius),Parent=ao}))New('UIListLayout',{Padding=
UDim.new(0,4),Parent=ao})New('UIPadding',{PaddingBottom=UDim.new(0,8),PaddingLeft=UDim.new(0,8),
PaddingRight=UDim.new(0,8),PaddingTop=UDim.new(0,8),Parent=ao})x:AddOutline(ao)local ap=New('Frame'
,{BackgroundTransparency=1,AutomaticSize=Enum.AutomaticSize.XY,Size=UDim2.fromScale(1,0),Parent=ao}
)if aj.BigIcon then New('UIListLayout',{Padding=UDim.new(0,8),FillDirection=Enum.FillDirection.
Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,Parent=ap})end local aq if aj.BigIcon
then local ar=x:GetCustomIcon(aj.BigIcon)if ar then aq=New('ImageLabel',{BackgroundTransparency=1,
Size=UDim2.fromOffset(24,24),Image=ar.Url,ImageColor3=aj.IconColor or'AccentColor',ImageRectOffset=
ar.ImageRectOffset,ImageRectSize=ar.ImageRectSize,Parent=ap})end end local ar=New('Frame',{
BackgroundTransparency=1,AutomaticSize=Enum.AutomaticSize.XY,Size=UDim2.fromScale(0,0),Parent=ap})
New('UIListLayout',{Padding=UDim.new(0,4),Parent=ar})local as if aj.Title then as=New('Frame',{
BackgroundTransparency=1,Size=UDim2.fromScale(0,0),Parent=ar})end local at if aj.Icon and as then
local au=x:GetCustomIcon(aj.Icon)if au then at=New('ImageLabel',{BackgroundTransparency=1,
AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5,1),Size=UDim2.fromOffset(15,15),Image=au.
Url,ImageColor3=aj.IconColor or'FontColor',ImageRectOffset=au.ImageRectOffset,ImageRectSize=au.
ImageRectSize,Parent=as})end end local au local av local aw=0 local ax=0 local ay if aj.Title then
au=New('TextLabel',{AutomaticSize=Enum.AutomaticSize.None,BackgroundTransparency=1,AnchorPoint=
Vector2.new(0,0.5),Position=UDim2.new(0,(aj.Icon and 21 or 0),0.5,0),Size=UDim2.fromScale(0,0),Text
=aj.Title,TextColor3=aj.TitleColor or'FontColor',TextSize=15,TextXAlignment=Enum.TextXAlignment.
Left,TextYAlignment=Enum.TextYAlignment.Center,TextWrapped=true,Parent=as})end if aj.Description
then av=New('TextLabel',{AutomaticSize=Enum.AutomaticSize.None,BackgroundTransparency=1,Size=UDim2.
fromScale(0,0),Text=aj.Description,TextColor3=aj.DescriptionColor or'FontColor',TextSize=14,
TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,Parent=ar})end function aj:Resize()local
az=aq and 32 or 0 local aA=at and 21 or 0 if au then local aB,aC=x:GetTextBounds(au.Text,au.
FontFace,au.TextSize,(K.AbsoluteSize.X/x.DPIScale)-24-az-aA)au.Size=UDim2.fromOffset(aB,aC)aw=aB+aA
as.Size=UDim2.fromOffset(aw,math.max(aC,at and 16 or 0))end if av then local aB,aC=x:GetTextBounds(
av.Text,av.FontFace,av.TextSize,(K.AbsoluteSize.X/x.DPIScale)-24-az)av.Size=UDim2.fromOffset(aB,aC)
ax=aB end an.Size=UDim2.fromOffset(math.max(aw,ax)+24+az,0)if x.Notifications[an]then x:
UpdateNotificationPositions()end end function aj:ChangeTitle(az)if au then aj.Title=tostring(az)au.
Text=aj.Title aj:Resize()end end function aj:ChangeDescription(az)if av then aj.Description=
tostring(az)av.Text=aj.Description aj:Resize()end end function aj:ChangeStep(az)if ay and aj.Steps
then az=math.clamp(az or 0,0,aj.Steps)ay.Size=UDim2.fromScale(az/aj.Steps,1)end end function aj:
Destroy()aj.Destroyed=true if typeof(aj.Time)=='Instance'then pcall(aj.Time.Destroy,aj.Time)end if
am then am:Disconnect()end if an then local az=table.find(L,an)if az then table.remove(L,az)end end
x:UpdateNotificationPositions()i:Create(ao,x.NotifyTweenInfo,{Position=x.NotifySide:lower()=='left'
and UDim2.new(-1,-8,0,-2)or UDim2.new(1,8,0,-2)}):Play()task.delay(x.NotifyTweenInfo.Time,function(
)x.Notifications[an]=nil an:Destroy()end)end aj:Resize()local az=New('Frame',{
BackgroundTransparency=1,Size=UDim2.new(1,0,0,7),Visible=(aj.Persist~=true and typeof(aj.Time)~=
'Instance')or typeof(aj.Steps)=='number',Parent=ao})local aA=New('Frame',{BackgroundColor3=
'BackgroundColor',BorderColor3='OutlineColor',BorderSizePixel=1,Position=UDim2.fromOffset(0,3),Size
=UDim2.new(1,0,0,2),Parent=az})ay=New('Frame',{BackgroundColor3='AccentColor',Size=UDim2.fromScale(
1,1),Parent=aA})if typeof(aj.Time)=='Instance'then ay.Size=UDim2.fromScale(0,1)end if aj.SoundId
then local aB=aj.SoundId if typeof(aB)=='number'then aB=string.format('rbxassetid://%d',aB)end New(
'Sound',{SoundId=aB,Volume=tonumber(aj.Volume)or 3,PlayOnRemove=true,Parent=e}):Destroy()end aj.
Holder=ao table.insert(L,an)x.Notifications[an]=aj x:UpdateNotificationPositions()an.Visible=true i
:Create(ao,x.NotifyTweenInfo,{Position=UDim2.fromOffset(0,0)}):Play()task.delay(x.NotifyTweenInfo.
Time,function()if aj.Persist then return elseif typeof(aj.Time)=='Instance'then repeat task.wait()
until al or aj.Destroyed else i:Create(ay,TweenInfo.new(aj.Time,Enum.EasingStyle.Linear,Enum.
EasingDirection.InOut),{Size=UDim2.fromScale(0,1)}):Play()task.wait(aj.Time)end if not aj.Destroyed
then aj:Destroy()end end)return aj end function x:CreateWindow(aj)aj=x:Validate(aj,y.Window)local
ak:Vector2=workspace.CurrentCamera.ViewportSize if d:IsStudio()and ak.X<=5 and ak.Y<=5 then repeat
ak=workspace.CurrentCamera.ViewportSize task.wait()until ak.X>5 and ak.Y>5 end local al=ak.X-64
local am=ak.Y-64 x.OriginalMinSize=Vector2.new(math.min(x.OriginalMinSize.X,al),math.min(x.
OriginalMinSize.Y,am))x.MinSize=x.OriginalMinSize aj.Size=UDim2.fromOffset(math.clamp(aj.Size.X.
Offset,x.MinSize.X,al),math.clamp(aj.Size.Y.Offset,x.MinSize.Y,am))if typeof(aj.Font)=='EnumItem'
then aj.Font=Font.fromEnum(aj.Font::any)end aj.CornerRadius=math.min(aj.CornerRadius,20)if aj.
Compact~=nil then aj.SidebarCompacted=aj.Compact end if aj.SidebarMinWidth~=nil then aj.
MinSidebarWidth=aj.SidebarMinWidth end aj.MinSidebarWidth=math.max(64,aj.MinSidebarWidth)aj.
SidebarCompactWidth=math.max(48,aj.SidebarCompactWidth)aj.SidebarCollapseThreshold=math.clamp(aj.
SidebarCollapseThreshold,0.1,0.9)aj.CompactWidthActivation=math.max(48,aj.CompactWidthActivation)x.
CornerRadius=aj.CornerRadius x:SetNotifySide(aj.NotifySide)x.ShowCustomCursor=aj.ShowCustomCursor x
.Scheme.Font=aj.Font x.ToggleKeybind=aj.ToggleKeybind x.GlobalSearch=aj.GlobalSearch x.Animations=
aj.Animations x.TabTransitionInfo=TweenInfo.new(math.max(0,aj.TabTransitionTime or 0.22),Enum.
EasingStyle.Quad,Enum.EasingDirection.Out)x.TabSwipeOffset=math.max(1,aj.TabSwipeOffset or 26)x.
TabSwipeFrom=aj.TabSwipeFrom or'right'local an=aj.SearchbarSize==UDim2.fromScale(1,1)local ao local
ap local aq local ar local as local at local au local av local aw local ax local ay local az local
aA local aB local aC local aD local aE local aF=math.ceil(aj.Size.X.Offset*0.3)local aG=aj.
SidebarCompacted local aH=aF do x.KeybindFrame,x.KeybindContainer=x:AddDraggableMenu('Keybinds')x.
KeybindFrame.AnchorPoint=Vector2.new(0,0.5)x.KeybindFrame.Position=UDim2.new(0,6,0.5,0)x.
KeybindFrame.Visible=false ao=New('TextButton',{BackgroundColor3=function()return x:GetBetterColor(
x.Scheme.BackgroundColor,-1)end,Name='Main',Text='',Position=aj.Position,Size=aj.Size,Visible=false
,Parent=G})table.insert(x.Corners,New('UICorner',{CornerRadius=UDim.new(0,aj.CornerRadius),Parent=
ao}))table.insert(x.Scales,New('UIScale',{Parent=ao}))x:AddOutline(ao)x:MakeLine(ao,{Position=UDim2
.fromOffset(0,48),Size=UDim2.new(1,0,0,1)})ap=New('Frame',{BackgroundColor3='OutlineColor',Position
=UDim2.fromOffset(aF,0),Size=UDim2.new(0,1,1,-21),Parent=ao,ZIndex=2})local aI=x:GetCustomIcon(aj.
BackgroundImage)aB=New('ImageLabel',{Image=aI and aI.Url or'',ImageRectOffset=aI and aI.
ImageRectOffset or Vector2.zero,ImageRectSize=aI and aI.ImageRectSize or Vector2.zero,Position=
UDim2.fromScale(0,0),Size=UDim2.fromScale(1,1),ScaleType=Enum.ScaleType.Stretch,ZIndex=999,
BackgroundTransparency=1,ImageTransparency=0.75,Visible=aI~=nil,Parent=ao})table.insert(x.Corners,
New('UICorner',{CornerRadius=UDim.new(0,aj.CornerRadius),Parent=aB}))if aj.Center then ao.Position=
UDim2.new(0.5,-ao.Size.X.Offset/2,0.5,-ao.Size.Y.Offset/2)end aE=New('Frame',{
BackgroundTransparency=1,Size=UDim2.new(1,0,0,48),Parent=ao})x:MakeDraggable(ao,aE,false,true)aq=
New('Frame',{BackgroundTransparency=1,Size=UDim2.new(0,aF,1,0),Parent=aE})New('UIListLayout',{
FillDirection=Enum.FillDirection.Horizontal,HorizontalAlignment=Enum.HorizontalAlignment.Center,
VerticalAlignment=Enum.VerticalAlignment.Center,Padding=UDim.new(0,6),Parent=aq})if aj.Icon then
local aJ=x:GetCustomIcon(aj.Icon)as=New('ImageLabel',{Image=aJ.Url,ImageRectOffset=aJ.
ImageRectOffset,ImageRectSize=aJ.ImageRectSize,Size=aj.IconSize,Parent=aq})else as=New('TextLabel',
{BackgroundTransparency=1,Size=aj.IconSize,Text=aj.Title:sub(1,1),TextScaled=true,Visible=false,
Parent=aq})end local aJ=x:GetTextBounds(aj.Title,x.Scheme.Font,20,aq.AbsoluteSize.X-(aj.Icon and aj
.IconSize.X.Offset+6 or 0)-12)ar=New('TextLabel',{BackgroundTransparency=1,Size=UDim2.new(0,aJ,1,0)
,Text=aj.Title,TextSize=20,Parent=aq})at=New('Frame',{AnchorPoint=Vector2.new(1,0.5),
BackgroundTransparency=1,Position=UDim2.new(1,-49,0.5,0),Size=UDim2.new(1,-aF-57-1,1,-16),Parent=aE
})New('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,HorizontalAlignment=Enum.
HorizontalAlignment.Left,VerticalAlignment=Enum.VerticalAlignment.Center,Padding=UDim.new(0,8),
Parent=at})av=New('Frame',{Size=UDim2.fromScale(aj.DisableSearch and 1 or 0.5,1),Visible=false,
BackgroundTransparency=1,Parent=at})New('UIFlexItem',{FlexMode=Enum.UIFlexMode.Grow,Parent=av})New(
'UIListLayout',{FillDirection=Enum.FillDirection.Vertical,HorizontalAlignment=Enum.
HorizontalAlignment.Left,VerticalAlignment=Enum.VerticalAlignment.Center,Parent=av})New('UIPadding'
,{PaddingBottom=UDim.new(0,8),PaddingLeft=UDim.new(0,8),PaddingRight=UDim.new(0,8),PaddingTop=UDim.
new(0,8),Parent=av})aw=New('TextLabel',{BackgroundTransparency=1,Size=UDim2.fromScale(1,0),
AutomaticSize=Enum.AutomaticSize.Y,Text='',TextSize=14,TextXAlignment=Enum.TextXAlignment.Left,
Parent=av})ax=New('TextLabel',{BackgroundTransparency=1,Size=UDim2.fromScale(1,0),AutomaticSize=
Enum.AutomaticSize.Y,Text='',TextWrapped=true,TextSize=14,TextXAlignment=Enum.TextXAlignment.Left,
TextTransparency=0.5,Parent=av})au=New('TextBox',{BackgroundColor3='MainColor',PlaceholderText=
'Search',Size=aj.SearchbarSize,TextScaled=true,Visible=not(aj.DisableSearch or false),Parent=at})
New('UIFlexItem',{FlexMode=Enum.UIFlexMode.Shrink,Parent=au})table.insert(x.Corners,New('UICorner',
{CornerRadius=UDim.new(0,aj.CornerRadius),Parent=au}))New('UIPadding',{PaddingBottom=UDim.new(0,8),
PaddingLeft=UDim.new(0,8),PaddingRight=UDim.new(0,8),PaddingTop=UDim.new(0,8),Parent=au})New(
'UIStroke',{Color='OutlineColor',Parent=au})local aK=x:GetIcon('search')if aK then New('ImageLabel'
,{Image=aK.Url,ImageColor3='FontColor',ImageRectOffset=aK.ImageRectOffset,ImageRectSize=aK.
ImageRectSize,ImageTransparency=0.5,Size=UDim2.fromScale(1,1),SizeConstraint=Enum.SizeConstraint.
RelativeYY,Parent=au})end if ah then New('ImageLabel',{AnchorPoint=Vector2.new(1,0.5),Image=ah.Url,
ImageColor3='OutlineColor',ImageRectOffset=ah.ImageRectOffset,ImageRectSize=ah.ImageRectSize,
Position=UDim2.new(1,-10,0.5,0),Size=UDim2.fromOffset(28,28),SizeConstraint=Enum.SizeConstraint.
RelativeYY,Parent=aE})end aC=New('Frame',{AnchorPoint=Vector2.new(0,1),BackgroundColor3=function()
return x:GetBetterColor(x.Scheme.BackgroundColor,4)end,Position=UDim2.fromScale(0,1),Size=UDim2.
new(1,0,0,20+aj.CornerRadius),Parent=ao})x:MakeLine(ao,{AnchorPoint=Vector2.new(0,1),Position=UDim2
.new(0,0,1,-20),Size=UDim2.new(1,0,0,1)})local aL=New('Frame',{AnchorPoint=Vector2.new(0,1),
BackgroundTransparency=1,Position=UDim2.fromScale(0,1),Size=UDim2.new(1,0,0,20),Parent=ao})table.
insert(x.Corners,New('UICorner',{CornerRadius=UDim.new(0,aj.CornerRadius),Parent=aC}))aD=New(
'TextLabel',{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),Text=aj.Footer,TextSize=14,
TextTransparency=0.5,Parent=aL})if aj.Resizable then ay=New('TextButton',{AnchorPoint=Vector2.new(1
,0),BackgroundTransparency=1,Position=UDim2.new(1,-aj.CornerRadius/4,0,0),Size=UDim2.fromScale(1,1)
,SizeConstraint=Enum.SizeConstraint.RelativeYY,Text='',Parent=aL})x:MakeResizable(ao,ay,function()
for aM,P in x.Tabs do P:Resize(true)end end)end New('ImageLabel',{Image=af and af.Url or'',
ImageColor3='FontColor',ImageRectOffset=af and af.ImageRectOffset or Vector2.zero,ImageRectSize=af
and af.ImageRectSize or Vector2.zero,ImageTransparency=0.5,Position=UDim2.fromOffset(2,2),Size=
UDim2.new(1,-4,1,-4),Parent=ay})az=New('ScrollingFrame',{AutomaticCanvasSize=Enum.AutomaticSize.Y,
BackgroundColor3='BackgroundColor',CanvasSize=UDim2.fromScale(0,0),Position=UDim2.fromOffset(0,49),
ScrollBarThickness=0,Size=UDim2.new(0,aF,1,-70),Parent=ao})New('UIListLayout',{Parent=az})aA=New(
'Frame',{AnchorPoint=Vector2.new(1,0),BackgroundColor3=function()return x:GetBetterColor(x.Scheme.
BackgroundColor,1)end,ClipsDescendants=true,Name='Container',Position=UDim2.new(1,0,0,49),Size=
UDim2.new(1,-aF-1,1,-70),Parent=ao})New('UIPadding',{PaddingBottom=UDim.new(0,0),PaddingLeft=UDim.
new(0,6),PaddingRight=UDim.new(0,6),PaddingTop=UDim.new(0,0),Parent=aA})x.WindowContainer=aA end
local aI={}local aJ=false local function SetUICorner(aK,aL,aM,P,Q)local R=aK[aL]if R.Offset==0 and
R.Scale==0 then return end aK[aL]=R.Offset==aM and P or Q end function aI:ChangeTitle(aK)assert(
typeof(aK)=='string','Expected string for title got: '..typeof(aK))ar.Text=aK aj.Title=aK end
function aI:SetBackgroundImage(aK:string)local aL=false if typeof(aK)=='string'then local aM=x:
GetCustomIcon(aK)if aM then aL=true aB.Image=aM.Url aB.ImageRectOffset=aM.ImageRectOffset aB.
ImageRectSize=aM.ImageRectSize aB.Visible=true elseif aK:match('http://')or aK:match('https://')
then local P=aK:match('(.+)%..+$')local Q,R=aK:match('^(https?://)([^/]+)')if P and R then local S=
string.sub(aK,#P+1,#aK)local T=P:gsub('\\','/'):find('/[^/]*$')local U=T and aK:sub(T+1)or nil if U
then aL=true local V=R..U if#V>255 then local W=255-#R-#S if W<0 then V=R..S else V=R..string.sub(U
:sub(1,#U-#S),1,W)..S end end if w[U]==nil then v.AddAsset(U,0,aK)else v.DownloadAsset(U,true)end
aB.Image=v.GetAsset(U)aB.ImageRectOffset=Vector2.zero aB.ImageRectSize=Vector2.zero aB.Visible=true
end end end end if not aL then aB.Image=''aB.ImageRectOffset=Vector2.zero aB.ImageRectSize=Vector2.
zero aB.Visible=false end aj.BackgroundImage=aK end function aI:SetFooter(aK:string)assert(typeof(
aK)=='string','Expected string for footer got: '..typeof(aK))aD.Text=aK aj.Footer=aK end function
aI:SetCornerRadius(aK:number)assert(typeof(aK)=='number','Expected number for Radius got: '..
typeof(aK))aK=math.min(aK,20)local aL=UDim.new(0,aK/2)local aM=UDim.new(0,aK)local P=x.CornerRadius
/2 for Q,R in x.Corners do if R.CornerRadius.Offset==P then R.CornerRadius=aL else R.CornerRadius=
aM end end for Q,R in x.SpecificCorners do SetUICorner(R,'TopRightRadius',P,aL,aM)SetUICorner(R,
'TopLeftRadius',P,aL,aM)SetUICorner(R,'BottomRightRadius',P,aL,aM)SetUICorner(R,'BottomLeftRadius',
P,aL,aM)end x.CornerRadius=aK aj.CornerRadius=aK ay.Position=UDim2.new(1,-aK/4,0,0)aC.Size=UDim2.
new(1,0,0,20+aK)for Q,R in x.Tabs do if R.IsKeyTab then continue end for S,T in R.Tabboxes do T:
UpdateCorners()end end end function aI:SetAnimations(aK:{[string]:boolean}?,aL:number?,aM:number?,P
:('left'|'right'|'top'|'bottom'|string)?)if typeof(aK)=='table'then aj.Animations=aK x.Animations=
aK end if typeof(aL)=='number'then local Q=TweenInfo.new(math.max(0,aL or 0.22),Enum.EasingStyle.
Quad,Enum.EasingDirection.Out)aj.TabTransitionInfo=Q x.TabTransitionInfo=Q end if typeof(aM)==
'number'then aM=math.max(1,aM)aj.TabSwipeOffset=aM x.TabSwipeOffset=aM end if typeof(P)=='string'
then P=string.lower(P)aj.TabSwipeFrom=P x.TabSwipeFrom=P end end local function ApplyCompact()aG=aI
:GetSidebarWidth()==aj.SidebarCompactWidth if aj.DisableCompactingSnap then aG=aI:GetSidebarWidth()
<=aj.CompactWidthActivation end ar.Visible=not aG if not aj.Icon then as.Visible=aG end for aK,aL
in x.TabButtons do if not aL.Icon then continue end aL.Label.Visible=not aG aL.Padding.
PaddingBottom=UDim.new(0,aG and 6 or 11)aL.Padding.PaddingLeft=UDim.new(0,aG and 6 or 12)aL.Padding
.PaddingRight=UDim.new(0,aG and 6 or 12)aL.Padding.PaddingTop=UDim.new(0,aG and 6 or 11)aL.Icon.
SizeConstraint=aG and Enum.SizeConstraint.RelativeXY or Enum.SizeConstraint.RelativeYY end end
function aI:IsSidebarCompacted()return aG end function aI:SetCompact(aK)aI:SetSidebarWidth(aK and
aj.SidebarCompactWidth or aH)end function aI:GetSidebarWidth()return az.Size.X.Offset end function
aI:SetSidebarWidth(aK)aK=math.clamp(aK,48,ao.Size.X.Offset-aj.MinContainerWidth-1)ap.Position=UDim2
.fromOffset(aK,0)aq.Size=UDim2.new(0,aK,1,0)at.Size=UDim2.new(1,-aK-57-1,1,-16)az.Size=UDim2.new(0,
aK,1,-70)aA.Size=UDim2.new(1,-aK-1,1,-70)if aj.EnableCompacting then ApplyCompact()end if not aG
then aH=aK end end function aI:ShowTabInfo(aK,aL)aw.Text=aK ax.Text=aL if an then au.Size=UDim2.
fromScale(0.5,1)end av.Visible=true end function aI:HideTabInfo()av.Visible=false if an then au.
Size=UDim2.fromScale(1,1)end end function aI:AddTab(...)local aK local aL local aM if select('#',
...)==1 and typeof(...)=='table'then local P=select(1,...)aK=P.Name or'Tab'aL=P.Icon aM=P.
Description else aK=select(1,...)aL=select(2,...)aM=select(3,...)end local P:TextButton local Q
local R local S local T local U local V aL=x:GetCustomIcon(aL)do P=New('TextButton',{
BackgroundColor3='MainColor',BackgroundTransparency=1,Size=UDim2.new(1,0,0,40),Text='',Parent=az})
local W=New('UIPadding',{PaddingBottom=UDim.new(0,aG and 6 or 11),PaddingLeft=UDim.new(0,aG and 6
or 12),PaddingRight=UDim.new(0,aG and 6 or 12),PaddingTop=UDim.new(0,aG and 6 or 11),Parent=P})Q=
New('TextLabel',{BackgroundTransparency=1,Position=UDim2.fromOffset(30,0),Size=UDim2.new(1,-30,1,0)
,Text=aK,TextSize=16,TextTransparency=0.5,TextXAlignment=Enum.TextXAlignment.Left,Visible=not aG,
Parent=P})if aL then R=New('ImageLabel',{Image=aL.Url,ImageColor3=aL.Custom and'WhiteColor'or
'AccentColor',ImageRectOffset=aL.ImageRectOffset,ImageRectSize=aL.ImageRectSize,ImageTransparency=
0.5,ScaleType=Enum.ScaleType.Fit,Size=UDim2.fromScale(1,1),SizeConstraint=aG and Enum.
SizeConstraint.RelativeXY or Enum.SizeConstraint.RelativeYY,Parent=P})end table.insert(x.TabButtons
,{Label=Q,Padding=W,Icon=R})T=New('CanvasGroup',{BackgroundTransparency=1,ClipsDescendants=true,
GroupTransparency=0,Size=UDim2.fromScale(1,1),Visible=false,Parent=aA})S=New('Frame',{
BackgroundTransparency=1,Position=UDim2.fromScale(0,0),Size=UDim2.fromScale(1,1),Visible=true,
Parent=T})U=New('ScrollingFrame',{AutomaticCanvasSize=Enum.AutomaticSize.Y,BackgroundTransparency=1
,CanvasSize=UDim2.fromScale(0,0),ScrollBarImageTransparency=1,ScrollBarThickness=0,Size=UDim2.new(
0.5,-3,1,0),Parent=S})New('UIListLayout',{Padding=UDim.new(0,2),Parent=U})New('UIPadding',{
PaddingBottom=UDim.new(0,2),PaddingLeft=UDim.new(0,2),PaddingRight=UDim.new(0,2),PaddingTop=UDim.
new(0,2),Parent=U})do New('Frame',{BackgroundTransparency=1,LayoutOrder=-1,Parent=U})New('Frame',{
BackgroundTransparency=1,LayoutOrder=1,Parent=U})end V=New('ScrollingFrame',{AnchorPoint=Vector2.
new(1,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,CanvasSize=UDim2.
fromScale(0,0),Position=UDim2.fromScale(1,0),ScrollBarImageTransparency=1,ScrollBarThickness=0,Size
=UDim2.new(0.5,-3,1,0),Parent=S})New('UIListLayout',{Padding=UDim.new(0,2),Parent=V})New(
'UIPadding',{PaddingBottom=UDim.new(0,2),PaddingLeft=UDim.new(0,2),PaddingRight=UDim.new(0,2),
PaddingTop=UDim.new(0,2),Parent=V})do New('Frame',{BackgroundTransparency=1,LayoutOrder=-1,Parent=V
})New('Frame',{BackgroundTransparency=1,LayoutOrder=1,Parent=V})end end local W=New('Frame',{
AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,Position=UDim2.fromOffset(0,7),Size=
UDim2.fromScale(1,0),Visible=false,Parent=S})local X local Y local Z local _ local aN local aO
local aP do X=New('Frame',{BackgroundColor3='BackgroundColor',Position=UDim2.fromOffset(2,0),Size=
UDim2.new(1,-5,0,0),Parent=W})table.insert(x.Corners,New('UICorner',{CornerRadius=UDim.new(0,aj.
CornerRadius),Parent=X}))Y,Z=x:AddOutline(X)_=New('ScrollingFrame',{BackgroundTransparency=1,
BorderSizePixel=0,Size=UDim2.fromScale(1,1),CanvasSize=UDim2.new(0,0,0,0),ScrollBarThickness=3,
ScrollingDirection=Enum.ScrollingDirection.Y,Parent=X})New('UIPadding',{PaddingBottom=UDim.new(0,4)
,PaddingLeft=UDim.new(0,6),PaddingRight=UDim.new(0,6),PaddingTop=UDim.new(0,4),Parent=_})aN=New(
'TextLabel',{BackgroundTransparency=1,Size=UDim2.new(1,-4,0,14),Text='',TextColor3=Color3.fromRGB(
255,50,50),TextSize=14,TextXAlignment=Enum.TextXAlignment.Left,Parent=_})aO=New('UIStroke',{
ApplyStrokeMode=Enum.ApplyStrokeMode.Contextual,Color=Color3.fromRGB(169,0,0),LineJoinMode=Enum.
LineJoinMode.Miter,Parent=aN})aP=New('TextLabel',{BackgroundTransparency=1,Position=UDim2.
fromOffset(0,16),Size=UDim2.new(1,-4,0,0),Text='',TextSize=14,TextWrapped=true,Parent=_,
TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top})New('UIStroke',{
ApplyStrokeMode=Enum.ApplyStrokeMode.Contextual,Color='DarkColor',LineJoinMode=Enum.LineJoinMode.
Miter,Parent=aP})end local aQ={Description=aM,Connections={},Destroyed=false,Window=aI,Canvas=T,
Sides={U,V},WarningBox={IsNormal=false,LockSize=false,Visible=false,Title='WARNING',Text=''},
Groupboxes={},Tabboxes={},DependencyGroupboxes={}}function aQ:UpdateWarningBox(aR)if typeof(aR.
IsNormal)=='boolean'then aQ.WarningBox.IsNormal=aR.IsNormal end if typeof(aR.LockSize)=='boolean'
then aQ.WarningBox.LockSize=aR.LockSize end if typeof(aR.Visible)=='boolean'then aQ.WarningBox.
Visible=aR.Visible end if typeof(aR.Title)=='string'then aQ.WarningBox.Title=aR.Title end if
typeof(aR.Text)=='string'then aQ.WarningBox.Text=aR.Text end W.Visible=aQ.WarningBox.Visible aN.
Text=aQ.WarningBox.Title aP.Text=aQ.WarningBox.Text aQ:Resize(true)X.BackgroundColor3=aQ.WarningBox
.IsNormal==true and x.Scheme.BackgroundColor or Color3.fromRGB(127,0,0)Z.Color=aQ.WarningBox.
IsNormal==true and x.Scheme.DarkColor or Color3.fromRGB(85,0,0)Y.Color=aQ.WarningBox.IsNormal==true
and x.Scheme.OutlineColor or Color3.fromRGB(255,50,50)aN.TextColor3=aQ.WarningBox.IsNormal==true
and x.Scheme.FontColor or Color3.fromRGB(255,50,50)aO.Color=aQ.WarningBox.IsNormal==true and x.
Scheme.OutlineColor or Color3.fromRGB(169,0,0)if not x.Registry[X]then x:AddToRegistry(X,{})end if
not x.Registry[Z]then x:AddToRegistry(Z,{})end if not x.Registry[Y]then x:AddToRegistry(Y,{})end if
not x.Registry[aN]then x:AddToRegistry(aN,{})end if not x.Registry[aO]then x:AddToRegistry(aO,{})
end x.Registry[X].BackgroundColor3=function()return aQ.WarningBox.IsNormal==true and x.Scheme.
BackgroundColor or Color3.fromRGB(127,0,0)end x.Registry[Z].Color=function()return aQ.WarningBox.
IsNormal==true and x.Scheme.DarkColor or Color3.fromRGB(85,0,0)end x.Registry[Y].Color=function()
return aQ.WarningBox.IsNormal==true and x.Scheme.OutlineColor or Color3.fromRGB(255,50,50)end x.
Registry[aN].TextColor3=function()return aQ.WarningBox.IsNormal==true and x.Scheme.FontColor or
Color3.fromRGB(255,50,50)end x.Registry[aO].Color=function()return aQ.WarningBox.IsNormal==true and
x.Scheme.OutlineColor or Color3.fromRGB(169,0,0)end end function aQ:RefreshSides()local aR=W.
Visible and X.Size.Y.Offset+8 or 0 for aS,aT in aQ.Sides do aT.Position=UDim2.new(aT.Position.X.
Scale,0,0,aR)aT.Size=UDim2.new(0.5,-3,1,-aR)end end function aQ:Resize(aR:boolean?)if aR then local
aS=math.floor(S.AbsoluteSize.Y/3.25)local aT,aU=x:GetTextBounds(aP.Text,x.Scheme.Font,aP.TextSize,
aP.AbsoluteSize.X)local aV=24+aU if aQ.WarningBox.LockSize==true and aV>=aS then _.CanvasSize=UDim2
.fromOffset(0,aV)aV=aS else _.CanvasSize=UDim2.fromOffset(0,0)end aP.Size=UDim2.new(1,-4,0,aU)X.
Size=UDim2.new(1,-5,0,aV+4)end aQ:RefreshSides()end local function AddTabbox(aR,aS)local aT=aR
local aU=New('Frame',{AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,Size=UDim2.
fromScale(1,0),Parent=if aT.Type=='Groupbox'then aT.Container else(aS.Side==1 and U or V)})New(
'UIListLayout',{Padding=UDim.new(0,6),Parent=aU})New('UIPadding',{PaddingBottom=UDim.new(0,4),
PaddingTop=UDim.new(0,4),Parent=aU})local aV local aW do aV=New('Frame',{BackgroundColor3=
'BackgroundColor',Size=UDim2.fromScale(1,0),Parent=aU})table.insert(x.Corners,New('UICorner',{
CornerRadius=UDim.new(0,aj.CornerRadius),Parent=aV}))x:AddOutline(aV)aW=New('Frame',{
BackgroundTransparency=1,Size=UDim2.new(1,0,0,34),Parent=aV})New('UIListLayout',{FillDirection=Enum
.FillDirection.Horizontal,HorizontalFlex=Enum.UIFlexAlignment.Fill,Parent=aW})end local aX=0 local
aY local aZ local a_={Connections={},Destroyed=false,ActiveTab=nil,BoxHolder=aU,Holder=aV,Tabs={}}
function a_:UpdateCorners()for a0,a1 in a_.Tabs do a1:UpdateCorners()end end function a_:AddTab(a0,
a1)aX=aX+1 local a2=aX aZ=a2 if not aY then aY=a2 end local a3=a0==nil or Trim(tostring(a0))==''
local a4=a3 and tostring(a2)or a0 local a5=New('TextButton',{BackgroundColor3='MainColor',
BackgroundTransparency=0,Size=UDim2.fromOffset(0,34),Text='',Parent=aW})local a6=New('UICorner',{
TopLeftRadius=UDim.new(0,aj.CornerRadius),TopRightRadius=UDim.new(0,aj.CornerRadius),
BottomRightRadius=UDim.new(0,0),BottomLeftRadius=UDim.new(0,0),Parent=a5})table.insert(x.
SpecificCorners,a6)local a7=New('Frame',{AnchorPoint=Vector2.new(0.5,0.5),AutomaticSize=Enum.
AutomaticSize.X,BackgroundTransparency=1,Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(0,
16),Parent=a5})New('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,HorizontalAlignment=
Enum.HorizontalAlignment.Center,VerticalAlignment=Enum.VerticalAlignment.Center,Padding=UDim.new(0,
8),Parent=a7})local a8 local a9=x:GetCustomIcon(a1)if a9 then a8=New('ImageLabel',{Image=a9.Url,
ImageColor3=a9.Custom and'WhiteColor'or'AccentColor',ImageRectOffset=a9.ImageRectOffset,
ImageRectSize=a9.ImageRectSize,ImageTransparency=0.5,Size=a3 and UDim2.fromOffset(16,16)or UDim2.
fromOffset(18,18),Parent=a7})end local ba if not a3 then ba=New('TextLabel',{AutomaticSize=Enum.
AutomaticSize.X,BackgroundTransparency=1,Size=UDim2.fromOffset(0,16),Text=a0,TextSize=15,
TextTransparency=0.5,Parent=a7})end local bb=x:MakeLine(a5,{AnchorPoint=Vector2.new(0,1),Position=
UDim2.new(0,0,1,1),Size=UDim2.new(1,0,0,1)})local bc=New('Frame',{BackgroundTransparency=1,Position
=UDim2.fromOffset(0,35),Size=UDim2.new(1,0,1,-35),Visible=false,Parent=aV})local bd=New(
'UIListLayout',{Padding=UDim.new(0,8),Parent=bc})New('UIPadding',{PaddingBottom=UDim.new(0,7),
PaddingLeft=UDim.new(0,7),PaddingRight=UDim.new(0,7),PaddingTop=UDim.new(0,7),Parent=bc})local be={
Connections={},Destroyed=false,ButtonHolder=a5,Container=bc,ButtonCorner=a6,Tab=aQ,Elements={},
DependencyBoxes={}}function be:Show()if a_.ActiveTab then a_.ActiveTab:Hide()end a5.
BackgroundTransparency=1 if ba then ba.TextTransparency=0 end if a8 then a8.ImageTransparency=0 end
bb.Visible=false bc.Visible=true a_.ActiveTab=be be:Resize()end function be:Hide()a5.
BackgroundTransparency=0 if ba then ba.TextTransparency=0.5 end if a8 then a8.ImageTransparency=0.5
end bb.Visible=true bc.Visible=false a_.ActiveTab=nil end function be:Resize()if a_.ActiveTab~=be
then return end aV.Size=UDim2.new(1,0,0,(bd.AbsoluteContentSize.Y/x.DPIScale)+49)if aT.Type==
'Groupbox'then aT:Resize()end end function be:UpdateCorners()local bf=aj.CornerRadius a6.
TopLeftRadius=UDim.new(0,a2==aY and bf or 0)a6.TopRightRadius=UDim.new(0,a2==aZ and bf or 0)end
function be:Destroy()be.Destroyed=true if be.Connections then for bf,bg in be.Connections do bg:
Disconnect()end end for bf,bg in be.Elements do if bg.Destroy then bg:Destroy()end end for bf,bg in
be.DependencyBoxes do if bg.Destroy then bg:Destroy()end end if bc then bc:Destroy()end if a5 then
a5:Destroy()end end if not a_.ActiveTab then be:Show()end a5.MouseButton1Click:Connect(be.Show)
setmetatable(be,ai)a_.Tabs[a4]=be a_:UpdateCorners()return be,a4 end function a_:Destroy()a_.
Destroyed=true if a_.Connections then for a0,a1 in a_.Connections do a1:Disconnect()end end for a0,
a1 in a_.Tabs do if a1.Destroy then a1:Destroy()end end if aV then aV:Destroy()end if aU then aU:
Destroy()end end if aS.Name then aQ.Tabboxes[aS.Name]=a_ else table.insert(aQ.Tabboxes,a_)end
return a_ end aQ.AddTabbox=AddTabbox function aQ:AddLeftTabbox(aR)return aQ:AddTabbox({Side=1,Name=
aR})end function aQ:AddRightTabbox(aR)return aQ:AddTabbox({Side=2,Name=aR})end function aQ:
AddGroupbox(aR)local aS=New('Frame',{AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
Size=UDim2.fromScale(1,0),Parent=aR.Side==1 and U or V})New('UIListLayout',{Padding=UDim.new(0,6),
Parent=aS})New('UIPadding',{PaddingBottom=UDim.new(0,4),PaddingTop=UDim.new(0,4),Parent=aS})local
aT local aU local aV local aW local aX local aY do aT=New('Frame',{BackgroundColor3=
'BackgroundColor',Size=UDim2.fromScale(1,0),Parent=aS})table.insert(x.Corners,New('UICorner',{
CornerRadius=UDim.new(0,aj.CornerRadius),Parent=aT}))x:AddOutline(aT)aY=x:MakeLine(aT,{Position=
UDim2.fromOffset(0,34),Size=UDim2.new(1,0,0,1)})local aZ=x:GetCustomIcon(aR.IconName)if aZ then
New('ImageLabel',{Image=aZ.Url,ImageColor3=aZ.Custom and'WhiteColor'or'AccentColor',ImageRectOffset
=aZ.ImageRectOffset,ImageRectSize=aZ.ImageRectSize,Position=UDim2.fromOffset(6,6),Size=UDim2.
fromOffset(22,22),Parent=aT})end aU=New('TextLabel',{BackgroundTransparency=1,Position=UDim2.
fromOffset(aZ and 24 or 0,0),Size=UDim2.new(1,0,0,34),Text=aR.Name,TextSize=15,TextXAlignment=Enum.
TextXAlignment.Left,Parent=aT})New('UIPadding',{PaddingLeft=UDim.new(0,12),PaddingRight=UDim.new(0,
12),Parent=aU})if aR.DisableCollapsing~=true then aX=New('ImageButton',{Image=ae and ae.Url or'',
ImageColor3='WhiteColor',ImageRectOffset=ae and ae.ImageRectOffset or Vector2.zero,ImageRectSize=ae
and ae.ImageRectSize or Vector2.zero,BackgroundTransparency=1,Rotation=180,Position=UDim2.new(1,-28
,0,6),Size=UDim2.fromOffset(22,22),Parent=aT})end aV=New('Frame',{BackgroundTransparency=1,Position
=UDim2.fromOffset(0,35),Size=UDim2.new(1,0,1,-35),Parent=aT})aW=New('UIListLayout',{Padding=UDim.
new(0,8),Parent=aV})New('UIPadding',{PaddingBottom=UDim.new(0,7),PaddingLeft=UDim.new(0,7),
PaddingRight=UDim.new(0,7),PaddingTop=UDim.new(0,7),Parent=aV})end local aZ={Type='Groupbox',
Connections={},Destroyed=false,Visible=true,Collapsed=false,BoxHolder=aS,Holder=aT,Container=aV,Tab
=aQ,DependencyBoxes={},Elements={}}local a_ local a0 function aZ:Resize()if a_ then StopTween(a_,
true)a_=nil end local a1=UDim2.new(1,0,0,if aZ.Collapsed then 34 else(aW.AbsoluteContentSize.Y/x.
DPIScale)+49)aY.Visible=not aZ.Collapsed if x.Animations and x.Animations.Groupbox then local a2=x.
GroupboxTweenInfo or TweenInfo.new(0.2,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)local a3=i:
Create(aT,a2,{Size=a1})a_=a3 local a4 a4=x:GiveSignal(a3.Completed:Once(function()if a4 then a4:
Disconnect()end if a_==a3 then StopTween(a_,true)a_=nil end end))a3:Play()else aT.Size=a1 end end
function aZ:SetCollapsed(a1:boolean)if aR.DisableCollapsing==true then return end aZ.Collapsed=a1
if a0 then StopTween(a0,true)a0=nil end local a2=if a1 then 0 else 180 aV.Visible=not a1 if x.
Animations and x.Animations.Groupbox then local a3=x.GroupboxTweenInfo or TweenInfo.new(0.3,Enum.
EasingStyle.Back,Enum.EasingDirection.Out)local a4=i:Create(aX,a3,{Rotation=a2})a0=a4 local a5 a5=x
:GiveSignal(a4.Completed:Connect(function()if a5 then a5:Disconnect()end if a0==a4 then StopTween(
a0,true)a0=nil end end))a4:Play()else aX.Rotation=a2 end aZ:Resize()end function aZ:ToggleCollapsed
()if aR.DisableCollapsing==true then return end aZ:SetCollapsed(not aZ.Collapsed)end function aZ:
Destroy()aZ.Destroyed=true if a_ then StopTween(a_,true)a_=nil end if a0 then StopTween(a0,true)a0=
nil end if aZ.Connections then for a1,a2 in aZ.Connections do a2:Disconnect()end end for a1,a2 in
aZ.Elements do if a2.Destroy then a2:Destroy()end end table.clear(aZ.Elements)for a1,a2 in aZ.
DependencyBoxes do if a2.Destroy then a2:Destroy()end end table.clear(aZ.DependencyBoxes)if aT then
aT:Destroy()end if aS then aS:Destroy()end end function aZ:SetVisible(a1:boolean)aZ.Visible=a1 aS.
Visible=a1 if a1==true and x.Searching then x:UpdateSearch(x.SearchText)end end function aZ:Show()
aZ:SetVisible(true)end function aZ:Hide()aZ:SetVisible(false)end if aR.DisableCollapsing~=true then
aX.MouseButton1Click:Connect(function()aZ:ToggleCollapsed()end)end aZ.AddTabbox=AddTabbox
setmetatable(aZ,ai)aZ:Resize()aQ.Groupboxes[aR.Name]=aZ if aR.Visible==false then aZ:Hide()end if
aR.DisableCollapsing~=true and aR.Collapsed==true then aZ:SetCollapsed(true)end return aZ end
function aQ:AddLeftGroupbox(aR,aS,aT,aU,aV)return aQ:AddGroupbox({Side=1,Name=aR,IconName=aS,
Visible=aT,Collapsed=aU,DisableCollapsing=aV})end function aQ:AddRightGroupbox(aR,aS,aT,aU,aV)
return aQ:AddGroupbox({Side=2,Name=aR,IconName=aS,Visible=aT,Collapsed=aU,DisableCollapsing=aV})end
function aQ:Hover(aR)if x.ActiveTab==aQ then return end i:Create(Q,x.TweenInfo,{TextTransparency=aR
and 0.25 or 0.5}):Play()if R then i:Create(R,x.TweenInfo,{ImageTransparency=aR and 0.25 or 0.5}):
Play()end end function aQ:Show()if x.ActiveTab==aQ then return end if x.ActiveTab then x.ActiveTab:
Hide()end i:Create(P,x.TweenInfo,{BackgroundTransparency=0}):Play()i:Create(Q,x.TweenInfo,{
TextTransparency=0}):Play()if R then i:Create(R,x.TweenInfo,{ImageTransparency=0}):Play()end if aM
then aI:ShowTabInfo(aK,aM)end x:PlayTabAnimation(T,true)aQ:RefreshSides()x.ActiveTab=aQ if x.
Searching then x:UpdateSearch(x.SearchText)end end function aQ:Hide()i:Create(P,x.TweenInfo,{
BackgroundTransparency=1}):Play()i:Create(Q,x.TweenInfo,{TextTransparency=0.5}):Play()if R then i:
Create(R,x.TweenInfo,{ImageTransparency=0.5}):Play()end x:PlayTabAnimation(T,false)aI:HideTabInfo()
x.ActiveTab=nil end function aQ:SetVisible(aR:boolean)P.Visible=aR if not aR and x.ActiveTab==aQ
then aQ:Hide()end end function aQ:Destroy()aQ.Destroyed=true if aQ.Connections then for aR,aS in aQ
.Connections do aS:Disconnect()end end for aR,aS in aQ.Groupboxes do if aS.Destroy then aS:Destroy(
)end end table.clear(aQ.Groupboxes)for aR,aS in aQ.Tabboxes do if aS.Destroy then aS:Destroy()end
end table.clear(aQ.Tabboxes)for aR,aS in aQ.DependencyGroupboxes do if aS.Destroy then aS:Destroy()
end end if T then T:Destroy()elseif S then S:Destroy()end if P then for aR,aS in x.TabButtons do if
typeof(aS)=='table'and aS.Button==P then table.remove(x.TabButtons,aR)break end end P:Destroy()end
x.Tabs[aK]=nil end if not x.ActiveTab then aQ:Show()end P.MouseEnter:Connect(function()aQ:Hover(
true)end)P.MouseLeave:Connect(function()aQ:Hover(false)end)P.MouseButton1Click:Connect(aQ.Show)x.
Tabs[aK]=aQ return aQ end function aI:AddKeyTab(...)local aK local aL local aM if select('#',...)==
1 and typeof(...)=='table'then local aN=select(1,...)aK=aN.Name or'Tab'aL=aN.Icon aM=aN.Description
else aK=select(1,...)or'Tab'aL=select(2,...)aM=select(3,...)end aL=aL or'key'local aN:TextButton
local aO local aP local aQ local aR aL=if aL=='key'then ag else x:GetCustomIcon(aL)do aN=New(
'TextButton',{BackgroundColor3='MainColor',BackgroundTransparency=1,Size=UDim2.new(1,0,0,40),Text=
'',Parent=az})local aS=New('UIPadding',{PaddingBottom=UDim.new(0,aG and 6 or 11),PaddingLeft=UDim.
new(0,aG and 6 or 12),PaddingRight=UDim.new(0,aG and 6 or 12),PaddingTop=UDim.new(0,aG and 6 or 11)
,Parent=aN})aO=New('TextLabel',{BackgroundTransparency=1,Position=UDim2.fromOffset(30,0),Size=UDim2
.new(1,-30,1,0),Text=aK,TextSize=16,TextTransparency=0.5,TextXAlignment=Enum.TextXAlignment.Left,
Visible=not aG,Parent=aN})if aL then aP=New('ImageLabel',{Image=aL.Url,ImageColor3=aL.Custom and
'WhiteColor'or'AccentColor',ImageRectOffset=aL.ImageRectOffset,ImageRectSize=aL.ImageRectSize,
ImageTransparency=0.5,Size=UDim2.fromScale(1,1),SizeConstraint=aG and Enum.SizeConstraint.
RelativeXY or Enum.SizeConstraint.RelativeYY,Parent=aN})end table.insert(x.TabButtons,{Label=aO,
Padding=aS,Icon=aP})aQ=New('CanvasGroup',{BackgroundTransparency=1,ClipsDescendants=true,
GroupTransparency=0,Size=UDim2.fromScale(1,1),Visible=false,Parent=aA})aR=New('ScrollingFrame',{
AutomaticCanvasSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,CanvasSize=UDim2.fromScale(0,0),
ScrollBarThickness=0,Position=UDim2.fromScale(0,0),Size=UDim2.fromScale(1,1),Visible=true,Parent=aQ
})New('UIListLayout',{HorizontalAlignment=Enum.HorizontalAlignment.Center,Padding=UDim.new(0,8),
VerticalAlignment=Enum.VerticalAlignment.Center,Parent=aR})New('UIPadding',{PaddingLeft=UDim.new(0,
1),PaddingRight=UDim.new(0,1),Parent=aR})end local aS={Description=aM,IsKeyTab=true,Elements={},
Window=aI,Canvas=aQ}function aS:AddKeyBox(aT)assert(typeof(aT)=='function',
'Callback must be a function')local aU=New('Frame',{BackgroundTransparency=1,Size=UDim2.new(0.75,0,
0,21),Parent=aR})local aV=New('TextBox',{BackgroundColor3='MainColor',PlaceholderText='Key',Size=
UDim2.new(1,-71,1,0),TextSize=14,TextXAlignment=Enum.TextXAlignment.Left,Parent=aU})New('UIPadding'
,{PaddingLeft=UDim.new(0,8),PaddingRight=UDim.new(0,8),Parent=aV})New('UIStroke',{Color=
'OutlineColor',Parent=aV})table.insert(x.Corners,New('UICorner',{CornerRadius=UDim.new(0,x.
CornerRadius/2),Parent=aV}))local aW=New('TextButton',{AnchorPoint=Vector2.new(1,0),
BackgroundColor3='MainColor',Position=UDim2.fromScale(1,0),Size=UDim2.new(0,63,1,0),Text='Execute',
TextSize=14,Parent=aU})New('UIStroke',{Color='OutlineColor',Parent=aW})table.insert(x.Corners,New(
'UICorner',{CornerRadius=UDim.new(0,x.CornerRadius/2),Parent=aW}))aW.InputBegan:Connect(function(aX
)if not IsClickInput(aX)then return end if not x:MouseIsOverFrame(aW,aX.Position)then return end
aT(aV.Text)end)end function aS:Destroy()if aQ then aQ:Destroy()elseif aR then aR:Destroy()end if aN
then for aT,aU in x.TabButtons do if typeof(aU)=='table'and aU.Button==aN then table.remove(x.
TabButtons,aT)break end end aN:Destroy()end x.Tabs[aK]=nil end function aS:RefreshSides()end
function aS:Resize()end function aS:UpdateCorners()end function aS:Hover(aT)if x.ActiveTab==aS then
return end i:Create(aO,x.TweenInfo,{TextTransparency=aT and 0.25 or 0.5}):Play()if aP then i:
Create(aP,x.TweenInfo,{ImageTransparency=aT and 0.25 or 0.5}):Play()end end function aS:Show()if x.
ActiveTab==aS then return end if x.ActiveTab then x.ActiveTab:Hide()end i:Create(aN,x.TweenInfo,{
BackgroundTransparency=0}):Play()i:Create(aO,x.TweenInfo,{TextTransparency=0}):Play()if aP then i:
Create(aP,x.TweenInfo,{ImageTransparency=0}):Play()end x:PlayTabAnimation(aQ,true)if aM then aI:
ShowTabInfo(aK,aM)end aS:RefreshSides()x.ActiveTab=aS if x.Searching then x:UpdateSearch(x.
SearchText)end end function aS:Hide()i:Create(aN,x.TweenInfo,{BackgroundTransparency=1}):Play()i:
Create(aO,x.TweenInfo,{TextTransparency=0.5}):Play()if aP then i:Create(aP,x.TweenInfo,{
ImageTransparency=0.5}):Play()end x:PlayTabAnimation(aQ,false)aI:HideTabInfo()x.ActiveTab=nil end
function aS:SetVisible(aT:boolean)aN.Visible=aT if not aT and x.ActiveTab==aS then aS:Hide()end end
if not x.ActiveTab then aS:Show()end aN.MouseEnter:Connect(function()aS:Hover(true)end)aN.
MouseLeave:Connect(function()aS:Hover(false)end)aN.MouseButton1Click:Connect(aS.Show)aS.Container=
aR setmetatable(aS,ai)x.Tabs[aK]=aS return aS end function aI:AddDialog(aK,aL)aL=x:Validate(aL,y.
Dialog)local aM local aN local aO local aP local aQ={}aN=New('TextButton',{AutoButtonColor=false,
BackgroundColor3='DarkColor',BackgroundTransparency=1,Size=UDim2.fromScale(1,1),Text='',Active=
false,ZIndex=9000,Visible=true,Parent=ao})i:Create(aN,x.TweenInfo,{BackgroundTransparency=0.5}):
Play()aM=New('TextButton',{AnchorPoint=Vector2.new(0.5,0.5),BackgroundColor3='BackgroundColor',
Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(300,0),AutomaticSize=Enum.AutomaticSize.Y,
Text='',AutoButtonColor=false,ZIndex=9001,Parent=aN})table.insert(x.Corners,New('UICorner',{
CornerRadius=UDim.new(0,aj.CornerRadius),Parent=aM}))x:AddOutline(aM)local aR=New('Frame',{
BackgroundTransparency=1,Size=UDim2.fromScale(1,0),AutomaticSize=Enum.AutomaticSize.Y,ZIndex=9002,
Parent=aM})local aS=New('UIScale',{Scale=0.95,Parent=aM})i:Create(aS,x.TweenInfo,{Scale=1}):Play()
local aT=New('UIPadding',{PaddingBottom=UDim.new(0,15),PaddingLeft=UDim.new(0,15),PaddingRight=UDim
.new(0,15),PaddingTop=UDim.new(0,15),Parent=aR})local aU=New('UIListLayout',{Padding=UDim.new(0,10)
,SortOrder=Enum.SortOrder.LayoutOrder,Parent=aR})local aV=New('Frame',{BackgroundTransparency=1,
Size=UDim2.fromScale(1,0),AutomaticSize=Enum.AutomaticSize.Y,LayoutOrder=1,ZIndex=9002,Parent=aR})
New('UIListLayout',{Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder,Parent=aV})New(
'UIPadding',{PaddingBottom=UDim.new(0,5),Parent=aV})local aW=New('Frame',{BackgroundTransparency=1,
Size=UDim2.new(1,0,0,20),AutomaticSize=Enum.AutomaticSize.Y,LayoutOrder=1,ZIndex=9002,Parent=aV})
New('UIListLayout',{Padding=UDim.new(0,6),FillDirection=Enum.FillDirection.Horizontal,
VerticalAlignment=Enum.VerticalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=aW})if
aL.Icon then local aX=x:GetCustomIcon(aL.Icon)if aX then local aY=New('ImageLabel',{
BackgroundTransparency=1,Size=UDim2.fromOffset(16,16),Image=aX.Url,ImageColor3='FontColor',
ImageRectOffset=aX.ImageRectOffset,ImageRectSize=aX.ImageRectSize,LayoutOrder=1,ZIndex=9002,Parent=
aW})if aL.TitleColor then aY.ImageColor3=aL.TitleColor end end end local aX=New('TextLabel',{
BackgroundTransparency=1,Size=UDim2.new(1,0,0,18),AutomaticSize=Enum.AutomaticSize.Y,Text=aL.Title,
TextSize=18,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=2,ZIndex=9002,Parent=aW})if aL.
TitleColor then aX.TextColor3=aL.TitleColor end local aY=New('TextLabel',{BackgroundTransparency=1,
Size=UDim2.new(1,0,0,14),AutomaticSize=Enum.AutomaticSize.Y,Text=aL.Description,TextSize=14,
TextTransparency=aL.DescriptionColor and 0 or 0.2,TextXAlignment=Enum.TextXAlignment.Left,
TextWrapped=true,LayoutOrder=2,ZIndex=9002,Parent=aV})if aL.DescriptionColor then aY.TextColor3=aL.
DescriptionColor end aO=New('Frame',{BackgroundTransparency=1,Size=UDim2.fromScale(1,0),
AutomaticSize=Enum.AutomaticSize.Y,LayoutOrder=4,ZIndex=9002,Parent=aR})local aZ=New('UIListLayout'
,{Padding=UDim.new(0,8),SortOrder=Enum.SortOrder.LayoutOrder,Parent=aO})New('UIPadding',{
PaddingBottom=UDim.new(0,5),Parent=aO})local a_=New('Frame',{BackgroundColor3='OutlineColor',
BackgroundTransparency=0,BorderSizePixel=0,Size=UDim2.new(1,0,0,1),LayoutOrder=5,ZIndex=9002,Parent
=aR})aP=New('Frame',{BackgroundTransparency=1,Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.
AutomaticSize.Y,LayoutOrder=6,ZIndex=9002,Parent=aR})New('UIListLayout',{Padding=UDim.new(0,8),
FillDirection=Enum.FillDirection.Horizontal,HorizontalAlignment=Enum.HorizontalAlignment.Right,
Wraps=true,SortOrder=Enum.SortOrder.LayoutOrder,Parent=aP})New('UIPadding',{PaddingTop=UDim.new(0,5
),Parent=aP})local a0={Destroyed=false,Elements={},Container=aO}function a0:Resize()local a1=ao.
AbsoluteSize.X*0.75 local a2=400 local a3=0 local a4=0 local a5=false for a6,a7 in aQ do a5=true a4
=a4+1 a3=a3+a7.Container.Size.X.Offset end local a6=a2 if a5 then local a7=a3+((a4-1)*8)+30 a6=math
.max(a2,math.min(a7,a1))end aM.Size=UDim2.fromOffset(a6,0)local a7,a8=x:GetTextBounds(aY.Text,x.
Scheme.Font,14,a6-30)aY.Size=UDim2.new(1,0,0,a8)local a9=false for ba,bb in aO:GetChildren()do if
not bb:IsA('UIListLayout')and not bb:IsA('UIPadding')then a9=true break end end aO.Visible=a9 aP.
Visible=a5 a_.Visible=a5 end function a0:SetTitle(a1)aX.Text=a1 a0:Resize()end function a0:
SetDescription(a1)aY.Text=a1 a0:Resize()end function a0:Dismiss()if a0.Destroyed then return end a0
.Destroyed=true if x.ActiveDialog==a0 then x.ActiveDialog=nil end for a1=#a0.Elements,1,-1 do local
a2=a0.Elements[a1]if a2 and a2.Destroy then a2:Destroy()end end table.clear(a0.Elements)local a1=i:
Create(aS,x.TweenInfo,{Scale=0.95})i:Create(aN,x.TweenInfo,{BackgroundTransparency=1}):Play()a1:
Play()task.delay(x.TweenInfo.Time,function()aN:Destroy()end)x.Dialogues[aK]=nil end aN.
MouseButton1Click:Connect(function()if aL.OutsideClickDismiss then a0:Dismiss()end end)function a0:
RemoveFooterButton(a1)if aQ[a1]then aQ[a1].Container:Destroy()aQ[a1]=nil end end function a0:
SetButtonDisabled(a1,a2)if aQ[a1]and type(aQ[a1].SetDisabled)=='function'then aQ[a1]:SetDisabled(a2
)end end function a0:SetButtonOrder(a1,a2)if aQ[a1]and aQ[a1].Container then aQ[a1].Container.
LayoutOrder=a2 end end function a0:AddFooterButton(a1,a2)a0:RemoveFooterButton(a1)local a3=a2.
WaitTime or 0 local a4=New('Frame',{BackgroundTransparency=1,Size=UDim2.fromOffset(0,26),
LayoutOrder=a2.Order or 0,ZIndex=9002,Parent=aP})local a5='MainColor'local a6='OutlineColor'local
a7=a2.Variant or'Primary'if a7=='Primary'then a5='FontColor'a6='FontColor'elseif a7=='Secondary'
then a5='MainColor'a6='OutlineColor'elseif a7=='Destructive'then a5='DestructiveColor'a6=
'DestructiveColor'elseif a7=='Ghost'then a5='BackgroundColor'a6='BackgroundColor'end local a8=New(
'TextButton',{BackgroundColor3=a5,BorderColor3=a6,BackgroundTransparency=a3>0 and 0.5 or 0,Size=
UDim2.fromOffset(0,26),Text='',AutoButtonColor=false,ZIndex=9002,Parent=a4})x:AddOutline(a8)table.
insert(x.Corners,New('UICorner',{CornerRadius=UDim.new(0,x.CornerRadius),Parent=a8}))local a9=New(
'UIPadding',{PaddingLeft=UDim.new(0,15),PaddingRight=UDim.new(0,15),Parent=a8})local ba=x.Scheme.
FontColor if a7=='Primary'then ba=x.Scheme.BackgroundColor elseif a7=='Destructive'then ba=Color3.
new(1,1,1)end local bb=New('TextLabel',{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),Text=a2.
Title or a1,TextColor3=ba,TextTransparency=a3>0 and 0.5 or 0,TextSize=14,ZIndex=9002,Parent=a8})
local bc,bd=x:GetTextBounds(bb.Text,x.Scheme.Font,14,250)a4.Size=UDim2.fromOffset(bc+30,26)a8.Size=
UDim2.fromOffset(bc+30,26)local be if a3>0 then be=New('Frame',{BackgroundColor3='AccentColor',
BorderSizePixel=0,Position=UDim2.new(0,0,1,-2),Size=UDim2.new(0,0,0,2),ZIndex=2,Parent=a8})table.
insert(x.Corners,New('UICorner',{CornerRadius=UDim.new(0,x.CornerRadius),Parent=be}))end local bf=
a3<=0 local bg={Container=a4,SetDisabled=function(bg,P)bf=not P if P then i:Create(a8,x.TweenInfo,{
BackgroundTransparency=0.5}):Play()i:Create(bb,x.TweenInfo,{TextTransparency=0.5}):Play()else i:
Create(a8,x.TweenInfo,{BackgroundTransparency=0}):Play()i:Create(bb,x.TweenInfo,{TextTransparency=0
}):Play()end end}local P=typeof(a5)=='Color3'and a5 or x.Scheme[a5]local Q=a7=='Ghost'and x.Scheme.
MainColor or x:GetBetterColor(P,10)a8.MouseEnter:Connect(function()if not bf then return end i:
Create(a8,x.TweenInfo,{BackgroundColor3=Q}):Play()end)a8.MouseLeave:Connect(function()if not bf
then return end i:Create(a8,x.TweenInfo,{BackgroundColor3=P}):Play()end)a8.MouseButton1Click:
Connect(function()if not bf then return end if a2.Callback then a2.Callback(a0)end if aL.
AutoDismiss then a0:Dismiss()end end)if a3>0 then i:Create(be,TweenInfo.new(a3,Enum.EasingStyle.
Linear),{Size=UDim2.new(1,0,0,2)}):Play()task.delay(a3,function()bg:SetDisabled(false)if be then i:
Create(be,x.TweenInfo,{BackgroundTransparency=1}):Play()end end)end aQ[a1]=bg end for a1,a2 in aL.
FooterButtons do if type(a1)=='number'and a2.Id then a1=a2.Id end a0:AddFooterButton(a1,a2)end
setmetatable(a0,ai)x.Dialogues[aK]=a0 a0:Resize()x.ActiveDialog=a0 return a0 end local aK={
'BackgroundTransparency'}local aL={'BackgroundTransparency','ImageTransparency'}local aM={
'BackgroundTransparency','TextTransparency'}local aN={'Transparency'}local function FadeInstance(aO
,aP)local aQ=M[aO]if not aQ then aQ={}M[aO]=aQ end for aR,aS in aP do if not x.Toggled then aQ[aS]=
aO[aS]end if aQ[aS]~=nil and aQ[aS]~=1 then i:Create(aO,x.WindowAnimationInfo,{[aS]=x.Toggled and
aQ[aS]or 1}):Play()end end end function aI:Toggle(aO:boolean?)if aJ then return end if x.
ActiveLoading then if aO==true then return end if not x.Toggled then return end end if typeof(aO)==
'boolean'then x.Toggled=aO else x.Toggled=not x.Toggled end if x.Animations and x.Animations.
ToggleWindow==true then local aP=x.WindowAnimationInfo.Time aJ=true if x.Toggled then ao.Visible=
true end if x.Toggled then FadeInstance(ao,{'BackgroundTransparency'})task.wait(aP/2)else task.
delay(aP/2,FadeInstance,ao,{'BackgroundTransparency'})end for aQ,aR in ao:GetDescendants()do if aR
==aE then continue end if aR:IsA('GuiObject')then local aS=aR.ClassName if aS=='ImageLabel'or aS==
'ImageButton'then FadeInstance(aR,aL)elseif aS=='TextLabel'or aS=='TextBox'or aS=='TextButton'then
FadeInstance(aR,aM)else FadeInstance(aR,aK)end elseif aR.ClassName=='UIStroke'then FadeInstance(aR,
aN)end end task.delay(aP,function()ao.Visible=x.Toggled aJ=false end)else ao.Visible=x.Toggled end
if aj.UnlockMouseWhileOpen then H.Modal=x.Toggled end if x.Toggled and not x.IsMobile then local aP
=f.MouseIconEnabled local aQ=x.ShowCursorBinding pcall(function()d:UnbindFromRenderStep(aQ)end)d:
BindToRenderStep(aQ,Enum.RenderPriority.Last.Value,function()f.MouseIconEnabled=not x.
ShowCustomCursor I.Position=UDim2.fromOffset(o.X,o.Y)I.Visible=x.ShowCustomCursor if not(x.Toggled
and G and G.Parent)then f.MouseIconEnabled=aP I.Visible=false d:UnbindFromRenderStep(aQ)end end)
elseif not x.Toggled then ab.Visible=false for aP,aQ in x.Options do if aQ.Type=='ColorPicker'then
aQ.ColorMenu:Close()aQ.ContextMenu:Close()elseif aQ.Type=='Dropdown'or aQ.Type=='KeyPicker'then aQ.
Menu:Close()end end end end function x:Toggle(aO:boolean?)return aI:Toggle(aO)end if aj.
EnableSidebarResize then local aO=(aj.MinSidebarWidth+aj.SidebarCompactWidth)*aj.
SidebarCollapseThreshold local aP,aQ local aR=false local aS local aT=New('TextButton',{AnchorPoint
=Vector2.new(0.5,0),BackgroundTransparency=1,Position=UDim2.fromScale(0.5,0),Size=UDim2.new(0,8,1,0
),Text='',Parent=ap})aT.MouseEnter:Connect(function()i:Create(ap,x.TweenInfo,{BackgroundColor3=x:
GetLighterColor(x.Scheme.OutlineColor)}):Play()end)aT.MouseLeave:Connect(function()if aR then
return end i:Create(ap,x.TweenInfo,{BackgroundColor3=x.Scheme.OutlineColor}):Play()end)aT.
InputBegan:Connect(function(aU:InputObject)if not IsClickInput(aU)then return end x.CantDragForced=
true aP=aU.Position aQ=aI:GetSidebarWidth()aR=true aS=aU.Changed:Connect(function()if aU.
UserInputState~=Enum.UserInputState.End then return end x.CantDragForced=false i:Create(ap,x.
TweenInfo,{BackgroundColor3=x.Scheme.OutlineColor}):Play()aR=false if aS and aS.Connected then aS:
Disconnect()aS=nil end end)end)x:GiveSignal(f.InputChanged:Connect(function(aU:InputObject)if not x
.Toggled or not(G and G.Parent)then aR=false if aS and aS.Connected then aS:Disconnect()aS=nil end
return end if aR and IsHoverInput(aU)then local aV=aU.Position-aP local aW=aQ+aV.X if aj.
DisableCompactingSnap then aI:SetSidebarWidth(aW)return end if aW>aO then aI:SetSidebarWidth(math.
max(aW,aj.MinSidebarWidth))else aI:SetSidebarWidth(aj.SidebarCompactWidth)end end end))end if aj.
EnableCompacting and aj.SidebarCompacted then aI:SetSidebarWidth(aj.SidebarCompactWidth)end if aj.
AutoShow and not x.ActiveLoading then task.spawn(x.Toggle)end if x.IsMobile then local aO=x:
AddDraggableButton('Toggle',function()x:Toggle()end,true,true)local aP=x:AddDraggableButton('Lock',
function(aP)x.CantDragForced=not x.CantDragForced aP:SetText(x.CantDragForced and'Unlock'or'Lock')
end,true,true)if aj.MobileButtonsSide=='Right'then aO.Button.AnchorPoint=Vector2.new(1,0)aO.Button.
Position=UDim2.new(1,-6,0,6)aP.Button.AnchorPoint=Vector2.new(1,0)aP.Button.Position=UDim2.new(1,-(
aO.Button.Size.X.Offset+12),0,6)else aO.Button.AnchorPoint=Vector2.new(0,0)aO.Button.Position=UDim2
.fromOffset(6,6)aP.Button.AnchorPoint=Vector2.new(0,0)aP.Button.Position=UDim2.fromOffset(aO.Button
.Size.X.Offset+12,6)end if aj.ShowMobileButtons==false then aO.Button.Visible=false aP.Button.
Visible=false end end x:GiveSignal(au:GetPropertyChangedSignal('Text'):Connect(function()x:
UpdateSearch(au.Text)end))x:GiveSignal(f.InputBegan:Connect(function(aO:InputObject)if x.Unloaded
then return end if f:GetFocusedTextBox()then return end if aO.KeyCode==x.ToggleKeybind then x:
Toggle()end end))x:GiveSignal(f.WindowFocused:Connect(function()x.IsRobloxFocused=true end))x:
GiveSignal(f.WindowFocusReleased:Connect(function()x.IsRobloxFocused=false end))x.Window=aI return
aI end function x:CreateLoading(aj)if x.ActiveLoading then warn(
[[Loading GUI already exists, you cannot create multiple Loading GUIs.]])return x.ActiveLoading end
aj=x:Validate(aj,y.Loading)local ak={CurrentStep=aj.CurrentStep,TotalSteps=aj.TotalSteps,
ShowSidebar=aj.ShowSidebar,AutoResizeHeight=aj.AutoResizeHeight,IsError=false,Destroyed=false,
WindowWidth=aj.WindowWidth,WindowHeight=aj.WindowHeight,BaseWindowHeight=aj.WindowHeight,
WindowErrorHeight=aj.WindowHeight,ContentWidth=aj.ContentWidth,SidebarWidth=aj.SidebarWidth}local
al=New('ScreenGui',{Name='ObsidianLoading',DisplayOrder=999,ResetOnSpawn=false})ParentUI(al)ak.
ScreenGui=al al.DescendantRemoving:Connect(function(am)x:RemoveFromRegistry(am)end)local am=New(
'TextButton',{Name='Main',AnchorPoint=Vector2.new(0.5,0.5),BackgroundColor3=function()return x:
GetBetterColor(x.Scheme.BackgroundColor,-1)end,Position=UDim2.fromScale(0.5,0.5),Size=UDim2.
fromOffset(ak.ShowSidebar and(ak.ContentWidth+ak.SidebarWidth)or ak.WindowWidth,ak.WindowHeight),
ClipsDescendants=true,Text='',AutoButtonColor=false,Parent=al})x:AddOutline(am)table.insert(x.
Corners,New('UICorner',{CornerRadius=UDim.new(0,x.CornerRadius),Parent=am}))local an=New('UIScale',
{Scale=x.IsMobile and 0.8 or 1,Parent=am})table.insert(x.Scales,an)x.ScalesOffset[an]=x.IsMobile
and 0.2 or 0 local ao=New('Frame',{Name='Content',BackgroundTransparency=1,Position=UDim2.
fromOffset(0,0),Size=UDim2.new(0,ak.ContentWidth,1,0),Parent=am})local ap=New('Frame',{Name=
'SideBar',BackgroundTransparency=1,Position=UDim2.fromOffset(ak.ContentWidth,0),Size=UDim2.new(0,ak
.ShowSidebar and ak.SidebarWidth or 0,1,0),ClipsDescendants=true,Visible=ak.ShowSidebar,Parent=am})
local aq=New('UICorner',{CornerRadius=UDim.new(0,x.CornerRadius),Parent=ap})table.insert(x.Corners,
aq)x:AddOutline(ap)local ar=New('Frame',{BackgroundColor3='OutlineColor',BorderSizePixel=0,Position
=UDim2.fromOffset(0,0),Size=UDim2.new(0,1,1,0),Visible=ak.ShowSidebar,Parent=ap})local as=New(
'Frame',{Name='TopBar',BackgroundTransparency=1,Size=UDim2.new(1,0,0,48),ZIndex=2,Parent=ao})x:
MakeDraggable(am,as,true,true)local at=New('Frame',{BackgroundTransparency=1,Size=UDim2.new(1,0,1,0
),Parent=as})New('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,HorizontalAlignment=
Enum.HorizontalAlignment.Left,VerticalAlignment=Enum.VerticalAlignment.Center,Padding=UDim.new(0,6)
,Parent=at})New('UIPadding',{PaddingLeft=UDim.new(0,12),Parent=at})if aj.Icon then local au=x:
GetCustomIcon(aj.Icon)local av=New('ImageLabel',{Image=au.Url,ImageRectOffset=au.ImageRectOffset,
ImageRectSize=au.ImageRectSize,Size=aj.IconSize,Parent=at})else local au=New('TextLabel',{
BackgroundTransparency=1,Size=aj.IconSize,Text=aj.Title:sub(1,1),TextScaled=true,Visible=false,
Parent=at})end local au=x:GetTextBounds(aj.Title,x.Scheme.Font,20,at.AbsoluteSize.X-(aj.Icon and(aj
.IconSize.X.Offset+6)or 0)-12)local av=New('TextLabel',{BackgroundTransparency=1,Size=UDim2.new(0,
au,1,0),Text=aj.Title,TextSize=20,Parent=at})x:MakeLine(ao,{Position=UDim2.fromOffset(0,48),Size=
UDim2.new(1,0,0,1)})local aw=New('Frame',{Name='InnerContent',BackgroundTransparency=1,Position=
UDim2.fromOffset(0,49),Size=UDim2.new(1,0,1,-49),Parent=ao})New('UIListLayout',{FillDirection=Enum.
FillDirection.Vertical,HorizontalAlignment=Enum.HorizontalAlignment.Center,VerticalAlignment=Enum.
VerticalAlignment.Center,Padding=UDim.new(0,12),Parent=aw})local ax=New('Frame',{Name='IconHolder',
BackgroundTransparency=1,Size=UDim2.fromOffset(64,64),Parent=aw})local ay=x:GetCustomIcon(aj.
LoadingIcon)local az=New('ImageLabel',{Name='LoaderIcon',AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=1,Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromScale(1,1),Image=ay.Url,
ImageRectOffset=ay.ImageRectOffset,ImageRectSize=ay.ImageRectSize,ImageColor3=aj.LoadingIconColor
or((aj.LoadingIcon==y.Loading.LoadingIcon)and'AccentColor'or'WhiteColor'),Parent=ax})local aA if aj
.LoadingIconTweenTime>0 then aA=i:Create(az,TweenInfo.new(aj.LoadingIconTweenTime,Enum.EasingStyle.
Linear,Enum.EasingDirection.Out,-1),{Rotation=360})aA:Play()end local aB=New('TextLabel',{
BackgroundTransparency=1,AutomaticSize=ak.AutoResizeHeight and Enum.AutomaticSize.Y or Enum.
AutomaticSize.XY,Size=ak.AutoResizeHeight and UDim2.new(1,-60,0,0)or UDim2.fromOffset(0,0),Text='',
TextSize=18,TextWrapped=ak.AutoResizeHeight,Parent=aw})local aC=New('TextLabel',{
BackgroundTransparency=1,AutomaticSize=ak.AutoResizeHeight and Enum.AutomaticSize.Y or Enum.
AutomaticSize.XY,Size=ak.AutoResizeHeight and UDim2.new(1,-60,0,0)or UDim2.fromOffset(0,0),Text='',
TextSize=14,TextTransparency=0.5,TextWrapped=ak.AutoResizeHeight,Parent=aw})local aD=New('Frame',{
BackgroundColor3='MainColor',Size=UDim2.new(0.7,0,0,15),Parent=aw})x:AddOutline(aD)table.insert(x.
Corners,New('UICorner',{CornerRadius=UDim.new(0,x.CornerRadius/2),Parent=aD}))local aE=New('Frame',
{BackgroundColor3='AccentColor',BorderSizePixel=0,Size=UDim2.fromScale(0,1),Parent=aD})table.
insert(x.Corners,New('UICorner',{CornerRadius=UDim.new(0,x.CornerRadius/2),Parent=aE}))local aF=
New('TextLabel',{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),Text='',TextSize=14,ZIndex=2,
Parent=aD})New('UIStroke',{ApplyStrokeMode=Enum.ApplyStrokeMode.Contextual,Color='DarkColor',
LineJoinMode=Enum.LineJoinMode.Miter,Parent=aF})local aG=New('ScrollingFrame',{
BackgroundTransparency=1,BorderSizePixel=0,CanvasSize=UDim2.new(0,0,0,0),Size=UDim2.fromScale(1,1),
ScrollBarThickness=2,ScrollBarImageColor3='OutlineColor',Parent=ap})local aH=New('UIListLayout',{
Padding=UDim.new(0,8),SortOrder=Enum.SortOrder.LayoutOrder,Parent=aG})New('UIPadding',{
PaddingBottom=UDim.new(0,12),PaddingLeft=UDim.new(0,12),PaddingRight=UDim.new(0,12),PaddingTop=UDim
.new(0,12),Parent=aG})local aI={Elements={},DependencyBoxes={},Tabboxes={},BoxHolder=aG,Container=
aG,Resize=function(aI)aG.CanvasSize=UDim2.fromOffset(0,aH.AbsoluteContentSize.Y+24)end,Tab={
Elements={},DependencyBoxes={},DependencyGroupboxes={},Tabboxes={}}}aH:GetPropertyChangedSignal(
'AbsoluteContentSize'):Connect(function()aI:Resize()end)setmetatable(aI,ai)ak.Sidebar=aI local aJ=
New('Frame',{Name='Error',BackgroundTransparency=1,Position=UDim2.fromOffset(0,49),Size=UDim2.new(1
,0,1,-49),ClipsDescendants=true,Visible=false,Parent=ao})local aK=New('TextLabel',{
BackgroundTransparency=1,Position=UDim2.fromOffset(15,15),Size=UDim2.new(1,-30,0,18),Text='Error',
TextColor3='RedColor',TextSize=18,TextXAlignment=Enum.TextXAlignment.Left,Parent=aJ})local aL=New(
'TextLabel',{BackgroundTransparency=1,Position=UDim2.fromOffset(15,39),Size=UDim2.new(1,-30,1,-90),
Text='Error Message',TextSize=14,TextTransparency=0.2,TextWrapped=true,TextXAlignment=Enum.
TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,Parent=aJ})local aM=New('Frame',{
BackgroundColor3='OutlineColor',BackgroundTransparency=0,BorderSizePixel=0,AnchorPoint=Vector2.new(
0.5,0),Position=UDim2.new(0.5,0,1,-48),Size=UDim2.new(1,-30,0,1),Visible=false,Parent=aJ})local aN=
New('Frame',{AnchorPoint=Vector2.new(0.5,1),BackgroundTransparency=1,Position=UDim2.new(0.5,0,1,0),
Size=UDim2.new(1,0,0,42),Visible=false,Parent=aJ})New('UIListLayout',{Padding=UDim.new(0,8),
FillDirection=Enum.FillDirection.Horizontal,HorizontalAlignment=Enum.HorizontalAlignment.Right,
VerticalAlignment=Enum.VerticalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=aN})
New('UIPadding',{PaddingTop=UDim.new(0,5),PaddingBottom=UDim.new(0,15),PaddingRight=UDim.new(0,15),
Parent=aN})function ak:UpdateLayout()if ak.IsError then ak:RecalculateErrorHeight()end local aO=ak.
ShowSidebar local aP=aO and(ak.ContentWidth+ak.SidebarWidth)or ak.WindowWidth local aQ=ak.IsError
and ak.WindowErrorHeight or ak.WindowHeight if aO then ap.Visible=true ar.Visible=true end i:
Create(am,x.TweenInfo,{Size=UDim2.fromOffset(aP,aQ)}):Play()i:Create(ap,x.TweenInfo,{Position=UDim2
.fromOffset(ak.ContentWidth,0),Size=UDim2.new(0,aO and ak.SidebarWidth or 0,1,0)}):Play()i:Create(
ao,x.TweenInfo,{Size=UDim2.new(0,aO and ak.ContentWidth or ak.WindowWidth,1,0)}):Play()if not aO
then task.delay(x.TweenInfo.Time,function()if not ak.ShowSidebar then ap.Visible=false ar.Visible=
false end end)end end function ak:RecalculateLoadingHeight()if not ak.AutoResizeHeight then return
end local aO=97+aw.UIListLayout.AbsoluteContentSize.Y ak.WindowHeight=math.max(ak.BaseWindowHeight,
aO)end function ak:SetMessage(aO)aB.Text=aO if ak.AutoResizeHeight then ak:
RecalculateLoadingHeight()ak:UpdateLayout()end end function ak:SetDescription(aO)aC.Text=aO if ak.
AutoResizeHeight then ak:RecalculateLoadingHeight()ak:UpdateLayout()end end function ak:
SetLoadingIcon(aO)local aP=x:GetCustomIcon(aO)az.Image=aP.Url az.ImageRectOffset=aP.ImageRectOffset
az.ImageRectSize=aP.ImageRectSize end function ak:SetLoadingIconTweenTime(aO)if aA then StopTween(
aA,true)aA=nil end if aO>0 then aA=i:Create(az,TweenInfo.new(aO,Enum.EasingStyle.Linear,Enum.
EasingDirection.Out,-1),{Rotation=360})aA:Play()else az.Rotation=0 end end function ak:
SetLoadingIconColor(aO)az.ImageColor3=aO end function ak:SetCurrentStep(aO)ak.CurrentStep=math.
clamp(aO,0,ak.TotalSteps)local aP=ak.CurrentStep/ak.TotalSteps i:Create(aE,x.TweenInfo,{Size=UDim2.
fromScale(aP,1)}):Play()aF.Text=string.format('%d/%d',ak.CurrentStep,ak.TotalSteps)end function ak:
SetTotalSteps(aO)ak.TotalSteps=aO ak:SetCurrentStep(ak.CurrentStep)end function ak:SetWindowHeight(
aO)ak.WindowHeight=aO ak:UpdateLayout()end function ak:SetWindowWidth(aO)ak.WindowWidth=aO ak:
UpdateLayout()end function ak:SetContentWidth(aO)ak.ContentWidth=aO ak:UpdateLayout()end function
ak:SetSidebarWidth(aO)ak.SidebarWidth=aO ak:UpdateLayout()end function ak:ShowSidebarPage(aO)ak.
ShowSidebar=aO ak:UpdateLayout()end function ak:ShowErrorPage(aO)ak.IsError=aO aw.Visible=not aO aJ
.Visible=aO if ak.ShowSidebar then ak:ShowSidebarPage(not aO)else ak:UpdateLayout()end end function
ak:RecalculateErrorHeight()local aO=(ak.ShowSidebar and ak.ContentWidth or ak.WindowWidth)-30 local
aP,aQ=x:GetTextBounds(aL.Text,x.Scheme.Font,14,aO)aL.Size=UDim2.new(1,-30,0,aQ)local aR=aN.Visible
local aS=88+aQ+15+(aR and 48 or 0)ak.WindowErrorHeight=aS end function ak:SetErrorMessage(aO)aL.
Text=aO ak:UpdateLayout()end function ak:SetErrorButtons(aO)assert(typeof(aO)=='table',
'Buttons must be a table')for aP,aQ in aN:GetChildren()do if aQ:IsA('Frame')then aQ:Destroy()end
end local aP=GetTableSize(aO)>0 aN.Visible=aP aM.Visible=aP for aQ,aR in aO do local aS=New('Frame'
,{BackgroundTransparency=1,Size=UDim2.fromOffset(0,26),Parent=aN})local aT='MainColor'local aU=
'OutlineColor'local aV=aR.Variant or'Primary'if aV=='Primary'then aT='FontColor'aU='FontColor'
elseif aV=='Secondary'then aT='MainColor'aU='OutlineColor'elseif aV=='Destructive'then aT=
'DestructiveColor'aU='DestructiveColor'elseif aV=='Ghost'then aT='BackgroundColor'aU=
'BackgroundColor'end local aW=New('TextButton',{BackgroundColor3=aT,BorderColor3=aU,Size=UDim2.
fromOffset(0,26),Text='',AutoButtonColor=false,Parent=aS})x:AddOutline(aW)table.insert(x.Corners,
New('UICorner',{CornerRadius=UDim.new(0,x.CornerRadius),Parent=aW}))New('UIPadding',{PaddingLeft=
UDim.new(0,15),PaddingRight=UDim.new(0,15),Parent=aW})local aX=x.Scheme.FontColor if aV=='Primary'
then aX=x.Scheme.BackgroundColor elseif aV=='Destructive'then aX=Color3.new(1,1,1)end local aY=New(
'TextLabel',{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),Text=aR.Title or aQ,TextColor3=aX,
TextSize=14,Parent=aW})local aZ,a_=x:GetTextBounds(aY.Text,x.Scheme.Font,14,250)aS.Size=UDim2.
fromOffset(aZ+30,26)aW.Size=UDim2.fromOffset(aZ+30,26)local a0=typeof(aT)=='Color3'and aT or x.
Scheme[aT]local a1=aV=='Ghost'and x.Scheme.MainColor or x:GetBetterColor(a0,10)aW.MouseEnter:
Connect(function()i:Create(aW,x.TweenInfo,{BackgroundColor3=a1}):Play()end)aW.MouseLeave:Connect(
function()i:Create(aW,x.TweenInfo,{BackgroundColor3=a0}):Play()end)aW.MouseButton1Click:Connect(
function()if aR.Callback then aR.Callback(ak)end end)end ak:UpdateLayout()end function ak:Destroy()
if aA then StopTween(aA,true)aA=nil end al:Destroy()ak.Destroyed=true x.ActiveLoading=nil if x.
Toggle and x.Toggled==false and x.Unloaded~=true then x:Toggle(true)end end ak.Continue=ak.Destroy
if x.Toggle and x.Toggled and x.Unloaded~=true then x:Toggle(false)end ak:SetCurrentStep(ak.
CurrentStep)x.ActiveLoading=ak return ak end local function OnPlayerChange()if x.Unloaded then
return end local aj,ak=GetPlayers(),GetPlayers(true)for al,am in s do if am.Type=='Dropdown'and am.
SpecialType=='Player'then am:SetValues(am.ExcludeLocalPlayer and ak or aj)end end end
local function OnTeamChange()if x.Unloaded then return end local aj=GetTeams()for ak,al in s do if
al.Type=='Dropdown'and al.SpecialType=='Team'then al:SetValues(aj)end end end x:GiveSignal(c.
PlayerAdded:Connect(OnPlayerChange))x:GiveSignal(c.PlayerRemoving:Connect(OnPlayerChange))x:
GiveSignal(h.ChildAdded:Connect(OnTeamChange))x:GiveSignal(h.ChildRemoved:Connect(OnTeamChange))
function x:Unload()x.Unloaded=true for aj=#x.Signals,1,-1 do local ak=table.remove(x.Signals,aj)if
ak and ak.Connected then ak:Disconnect()end end for aj=1,#x.UnloadSignals do local ak=table.remove(
x.UnloadSignals,1)if ak then x:SafeCallback(ak)end end for aj=#x.Tabs,1,-1 do local ak=table.
remove(x.Tabs,aj)if ak and ak.Destroy then x:SafeCallback(ak.Destroy,ak)end end for aj=#t,1,-1 do
local ak=table.remove(t,aj)if ak and ak.Destroy then x:SafeCallback(ak.Destroy,ak)end end if x.
ActiveLoading then x.ActiveLoading:Destroy()end if G then G:Destroy()end table.clear(x.Registry)
table.clear(s)table.clear(r)table.clear(q)table.clear(p)table.clear(t)table.clear(x.Tabs)table.
clear(x.TabButtons)table.clear(x.Scales)table.clear(x.ScalesOffset)table.clear(x.Corners)table.
clear(x.SpecificCorners)table.clear(x.Notifications)table.clear(x.Dialogues)table.clear(x.
DraggableElements)table.clear(x.KeybindToggles)table.clear(x.DependencyBoxes)table.clear(M)table.
clear(N)x.Toggle=function(...)end x.ScreenGui=nil x.WindowContainer=nil x.KeybindFrame=nil x.
KeybindContainer=nil j().Library=nil end j().Library=x return x
