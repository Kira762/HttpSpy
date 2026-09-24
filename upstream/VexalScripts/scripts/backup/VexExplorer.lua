-- performance boost
getgenv().VexExecutedCheck=false local a={'EncodingService','ExperienceStateRecordingService',
'LodDataService','TelemetryService','BrowserService','CommerceService','HSRDataContentProvider',
'StylingService','ControllerService','AvatarEditorService','GenericChallengeService',
'CSGDictionaryService','EditableService','AchievementService','CollectionService',
'ScriptRegistrationService','AdService','InsertService','StudioData','RobloxReplicatedStorage',
'LogService','SolidModelContentProvider','ExperienceNotificationService','Visit','SoundService',
'ScriptService','ChangeHistoryService','RuntimeContentService','HapticService','MaterialService',
'ContentProvider','IXPService','UserService','NonReplicatedCSGDictionaryService','TextService',
'Stats','NetworkClient','TweenService','PlatformLibraries','GuidRegistryService',
'PlayerHydrationService','KeyframeSequenceProvider','HttpRbxApiService','CorePackages','GuiService'
,'Teleport Service','TextBoxService','CookiesService','VRService','FaceAnimatorService',
'CreatorStoreService','PhysicsService','AvatarSettings','LocalizationTable','RuntimeScriptService',
'HttpService','ThirdPartyUserService','PlatformFriendsService','UIDragDetectorService',
'HeapProfilerService','FilteredSelection','FacialAgeEstimationService',
'PlatformCloudStorageService','SessionService','CaptureService','ModerationService',
'ExperienceService','AuroraService','RtMessagingService','PolicyService','GroupService',
'SpawnerService','RbxAnalyticsService','Chat','AudioFocusService','Selection','VoiceChatService',
'SlimContentProvider','ExperienceAuthService','GamepadService','TouchInputService','Run Service',
'SharedTableRegistry','Script Context','AvatarCreationService','FriendService',
'ScriptProfilerService','AppLifecycleObserverService','SafetyService','SocialService',
'AssetService','AvatarChatService','AnimationClipProvider','TemporaryCageMeshProvider',
'LinkingService','PlayerEmulatorService','MemStorageService','RobloxServerStorage','TestService',
'ProximityPromptService','VideoService','MessageBusService','TextChatService','BadgeService',
'ExperienceStateCaptureService','EventIngestService','WebViewService','PermissionsService',
'MarketplaceService','MeshContentProvider','TimerService','AppStorageService','UserInputService',
'NetworkServer','MouseService','LocalizationService','RecommendationService','AnalyticsService',
'Instance','KeyboardService','JointsService','HeatmapService','NotificationService',
'MicroProfilerService','VideoCaptureService','ContextActionService','PointsService',
'FeatureRestrictionManager','GamePassService','GenerationService','SlimReplicationService',
'SlimAnimationReplicationService','Packages','Debris','ServerScriptService','ServerStorage'}local b
=Instance.new local c=(function()local c=cloneref if not c then return function(d)return d end end
local d=setmetatable({},{__mode='v'})return function(e)if not e then return nil end local f=e:
GetDebugId()local g=d[f]if g then return g end local h=c(e)d[f]=h return h end end)()local function 
GetService(d)return c(game:GetService(d))end local d={Players=GetService('Players'),
UserInputService=GetService('UserInputService'),TweenService=GetService('TweenService'),RunService=
GetService('RunService'),HttpService=GetService('HttpService'),CoreGui=GetService('CoreGui'),
TeleportService=GetService('TeleportService'),CollectionService=game:GetService('CollectionService'
),GuiService=GetService('GuiService')}task.wait(0.2)do local e={}local f,g=pcall(gethui)if f and g
then table.insert(e,g)end table.insert(e,d.CoreGui)for h,i in e do for j,k in i:GetChildren()do if
k.Name=='VexExplorer'then pcall(function()k:Destroy()end)end end end end local e=c(d.Players.
LocalPlayer)local f=game.GetChildren local g=game.GetDescendants local function ClonerefInstance(h)
if c then local i,j=pcall(c,h)if i then return j end end return h end local function 
WeakGetChildren(h)local i,j=pcall(f,h)if not i or type(j)~='table'then return setmetatable({},{
__mode='v'})end setmetatable(j,{__mode='v'})local k={}for l=1,#j do k[l]=ClonerefInstance(j[l])end
return k end local function WeakGetDescendants(h)local i,j=pcall(g,h)if not i or type(j)~='table'
then return setmetatable({},{__mode='v'})end setmetatable(j,{__mode='v'})local k={}for l=1,#j do k[
l]=ClonerefInstance(j[l])end return k end local h=false local i={}local function Track(j)table.
insert(i,j)return j end local function CompactConnections()local j={}for k,l in i do if l and l.
Connected then j[#j+1]=l end end i=j end local function SafeGet(j,k)local l,m=pcall(function()
return j[k]end)if l then return m end return nil end local function SafeSet(j,k,l)pcall(function()j
[k]=l end)end local j={Parent=true,ClassName=true,RobloxLocked=true,Archivable=true,DataCost=true,
Container=true,LocalPlayer=true,Character=true,Position=true,Orientation=true,Rotation=true,
Attributes=true}local k={Name=1,CFrame=2,Size=3,Color=4,Material=5,Anchored=6,CanCollide=7}local 
function FormatLuaString(l)return string.format('%q',l)end local function FormatNumber(l)if l~=l
then return'0/0'end if l==math.huge then return'math.huge'end if l==-math.huge then return
'-math.huge'end if math.floor(l)==l and math.abs(l)<1e15 then return tostring(math.floor(l))end
return string.format('%.6g',l)end local function FormatStringForCode(l)if type(l)~='string'then
return tostring(l)end if not l:find('["\\\n\r]')then return`"{l}"`end local m=0 while l:find(`]{
string.rep('=',m)}]`,1,true)do m+=1 end local n=string.rep('=',m)local o=l:sub(1,1)=='\n'and'\n'or
''return`[{n}[{o}{l}]{n}]`end local l={['and']=true,['break']=true,['do']=true,['else']=true,[
'elseif']=true,['end']=true,['false']=true,['for']=true,['function']=true,['goto']=true,['if']=true
,['in']=true,['local']=true,['nil']=true,['not']=true,['or']=true,['repeat']=true,['return']=true,[
'then']=true,['true']=true,['until']=true,['while']=true,['continue']=true}local function 
IsValidIdentifier(m)if type(m)~='string'or m==''then return false end if l[m]then return false end
return m:match('^[%a_][%w_]*$')~=nil end local function BuildLuaPath(m)if typeof(m)~='Instance'then
return'nil'end local n={}local o=m while o and o.Parent~=nil do table.insert(n,1,o.Name)o=o.Parent
end if#n==0 then return'game'end local p='game'local q=1 local r=n[1]p=`game:GetService("{r}")`q=2
for s=q,#n do local t=n[s]if IsValidIdentifier(t)then p=`{p}.{t}`else p=`{p}[{FormatStringForCode(t
)}]`end end return p end local function SerializeValue(m)local n=typeof(m)if n=='string'then return
FormatStringForCode(m)elseif n=='number'then return FormatNumber(m)elseif n=='boolean'then return
tostring(m)elseif n=='nil'then return'nil'elseif n=='Vector3'then return`Vector3.new({FormatNumber(
m.X)}, {FormatNumber(m.Y)}, {FormatNumber(m.Z)})`elseif n=='Vector2'then return`Vector2.new({
FormatNumber(m.X)}, {FormatNumber(m.Y)})`elseif n=='UDim'then return`UDim.new({FormatNumber(m.Scale
)}, {FormatNumber(m.Offset)})`elseif n=='UDim2'then return`UDim2.new({FormatNumber(m.X.Scale)}, {
FormatNumber(m.X.Offset)}, {FormatNumber(m.Y.Scale)}, {FormatNumber(m.Y.Offset)})`elseif n==
'Color3'then return`Color3.fromRGB({math.floor(m.R*255+0.5)}, {math.floor(m.G*255+0.5)}, {math.
floor(m.B*255+0.5)})`elseif n=='BrickColor'then return`BrickColor.new({FormatLuaString(m.Name)})`
elseif n=='CFrame'then local o={m:GetComponents()}local p={}for q,r in o do p[q]=FormatNumber(r)end
return`CFrame.new({table.concat(p,', ')})`elseif n=='EnumItem'then return`Enum.{tostring(m.EnumType
)}.{m.Name}`elseif n=='Rect'then return`Rect.new({FormatNumber(m.Min.X)}, {FormatNumber(m.Min.Y)}, {
FormatNumber(m.Max.X)}, {FormatNumber(m.Max.Y)})`elseif n=='NumberRange'then return`NumberRange.new({
FormatNumber(m.Min)}, {FormatNumber(m.Max)})`elseif n=='NumberSequence'then local o={}for p,q in m.
Keypoints do table.insert(o,`NumberSequenceKeypoint.new({FormatNumber(q.Time)}, {FormatNumber(q.
Value)}, {FormatNumber(q.Envelope)})`)end return'NumberSequence.new({'..table.concat(o,', ')..'})'
elseif n=='ColorSequence'then local o={}for p,q in m.Keypoints do table.insert(o,`ColorSequenceKeypoint.new({
FormatNumber(q.Time)}, {SerializeValue(q.Value)})`)end return'ColorSequence.new({'..table.concat(o,
', ')..'})'elseif n=='Vector3int16'then return`Vector3int16.new({m.X}, {m.Y}, {m.Z})`elseif n==
'Vector2int16'then return`Vector2int16.new({m.X}, {m.Y})`elseif n=='Instance'then return`nil --[[ ref: {
m:GetFullName()} ]]`elseif n=='Font'then return`Font.new({FormatLuaString(m.Family)}, Enum.FontWeight.{
m.Weight.Name}, Enum.FontStyle.{m.Style.Name})`end return`nil --[[ unsupported {n} ]]`end local m={
Position=true,Orientation=true,Rotation=true,brickColor=true,BrickColor=true,size=true,
Size_Deprecated=true,CollisionGroupId=true,AssemblyCenterOfMass=true,AssemblyMass=true,
AssemblyRootPart=true,AssemblyLinearVelocity=true,AssemblyAngularVelocity=true,ExtentsCFrame=true,
ExtentsSize=true,Mass=true,ReceiveAge=true,DataCost=true,Container=true,Archivable=true,
RobloxLocked=true,LocalTransparencyModifier=true,ChatHistory=true}local n={ClassName=true,
AccountAge=true,UserId=true,MembershipType=true,FollowUserId=true,LocalPlayer=true,NumPlayers=true,
MaxPlayers=true,PreferredPlayers=true,IsLoaded=true,IsPlaying=true,IsPaused=true,TimeLength=true,
Occupant=true,AssemblyLinearVelocity=true,AssemblyAngularVelocity=true,WorldCFrame=true,
WorldPosition=true}local o local function GetPropertyDiff(p)local q,r=pcall(function()return p.
ClassName end)if not q then return{}end local s,t=pcall(Instance.new,r)if not s or not t then
return{}end local u=o(p)local v={}for w,x in u do if j[x]then continue end if m[x]then continue end
if n and n[x]then continue end if x=='Parent'then continue end local y,z=pcall(function()return p[x
]end)if not y then continue end if typeof(z)=='Instance'then continue end local A,B=pcall(function(
)return t[x]end)if not A then table.insert(v,{Name=x,Value=z})continue end if z~=B then table.
insert(v,{Name=x,Value=z})end end pcall(function()t:Destroy()end)table.sort(v,function(w,x)local y=
k[w.Name]or 1000 local z=k[x.Name]or 1000 if y~=z then return y<z end return w.Name<x.Name end)
return v end local function SerializeInstance(p)if typeof(p)~='Instance'then return
'-- not an instance'end local q={}local r='Object'local s=BuildLuaPath(p)table.insert(q,`local {r} = Instance.new("{
p.ClassName}")`)local t=GetPropertyDiff(p)for u,v in t do table.insert(q,`{r}.{v.Name} = {
SerializeValue(v.Value)}`)end local u,v=pcall(function()return p:GetAttributes()end)if u and type(v
)=='table'then local w={}for x in v do table.insert(w,x)end table.sort(w)if#w>0 then table.insert(q
,'')for x,y in w do table.insert(q,`{r}:SetAttribute("{y}", {SerializeValue(v[y])})`)end end end
local w,x=pcall(function()return d.CollectionService:GetTags(p)end)if w and type(x)=='table'and#x>0
then table.insert(q,'')table.insert(q,`local CollectionService = game:GetService("CollectionService")`
)for y,z in x do table.insert(q,`CollectionService:AddTag({r}, {FormatLuaString(z)})`)end end table
.insert(q,'')table.insert(q,`-- Source: {s}`)table.insert(q,`{r}.Parent = {BuildLuaPath(p.Parent)or
'workspace'}`)return table.concat(q,'\n')end local p='Vex/ErrorLogs'local q local r=false local 
function InitialiseErrorLog()if r then return end if not makefolder or not isfolder or not isfile
or not writefile then return end pcall(function()if not isfolder('Vex')then makefolder('Vex')end if
not isfolder(p)then makefolder(p)end end)local s=1 while true do local t=`{p}/ErrorLog_{s}.txt`if
not isfile(t)then q=t break end s+=1 if s>100 then q=`{p}/ErrorLog_overflow.txt`break end end
pcall(function()local t=`=== Vex Explorer error log session started {os.date('%Y-%m-%d %H:%M:%S')} ===\n`
writefile(q,t)end)r=true end local function AppendErrorLog(s)InitialiseErrorLog()if not q then
return end local t=os.date('[%H:%M:%S]')local u=`{t} {s}\n`if appendfile then pcall(appendfile,q,u)
else return end end local s local function NotifyError(t)if s and s.ShowErrorNotification then
pcall(function()s:ShowErrorNotification(t)end)end end local function Handle(t,u)local v,w=xpcall(t,
function(v)local w='*?*'for x=2,20 do local y=debug.getinfo(x)if not y then break end if y.
currentline and y.currentline>0 then w=y.currentline break end end if h or VexExecutedCheck then
return task.wait(9e9)end local x=`[Vex] {u} Error at line {w} [Time: {DateTime.now()}]: {v}`
AppendErrorLog(x)NotifyError(`{u} (line {w})`)return v end)if not v then return end return w end
local t=decompile local u=0 getgenv().decompile=function(v)local w,x=pcall(getscriptbytecode,v)if
not w then return'-- failed to read script bytecode\n--[[\n'..tostring(x)..'\n--]]'end local y=os.
clock()-u if y<0.12 then task.wait(0.12-y)end local z=base64_encode if not z then z=function(A)
local B=[[ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/]]return((A:gsub('.',
function(C)local D,E='',C:byte()for F=8,1,-1 do D=D..(E%2^F-E%2^(F-1)>0 and'1'or'0')end return D
end)..'0000'):gsub('%d%d%d?%d?%d?%d?',function(C)if#C<6 then return''end local D=0 for E=1,6 do D=D
+(C:sub(E,E)=='1'and 2^(6-E)or 0)end return B:sub(D+1,D+1)end)..({'','==','='})[#A%3+1])end end
local A=request({Url='https://api.lua.expert/decompile',Method='POST',Headers={['content-type']=
'application/json'},Body=d.HttpService:JSONEncode({script=z(x)})})u=os.clock()if not A or A.
StatusCode~=200 then return'-- api request error\n--[[\n'..(A and A.Body or'no response')..'\n--]]'
end return A.Body end local v=
[[https://raw.githubusercontent.com/Vezise/2026/main/Vez/Libraries/VexExplorer/Assets]]local w=
'Vex'local x='Vex/Assets'local y={Accessory=true,AnimationTrack=true,Attachment=true,Backpack=true,
BindableEvent=true,BindableFunction=true,BodyVelocity=true,BoxHandleAdornment=true,Camera=true,Chat
=true,ClickDetector=true,ColorCorrectionEffect=true,ConeHandleAdornment=true,Configuration=true,
ConsoleIcon=true,CoreGui=true,CylinderHandleAdornment=true,Explosion=true,Fire=true,Flag=true,
FlagStand=true,Folder=true,Frame=true,FreezeIcon=true,Highlight=true,HingeConstraint=true,Humanoid=
true,ImageButton=true,ImageFrame=true,ImageHandleAdornment=true,ImageLabel=true,InsertService=true,
JointsService=true,Lighting=true,LineHandleAdornment=true,LocalScript=true,MeshPart=true,Model=true
,ModuleScript=true,Motor6D=true,NetworkClient=true,NumberValue=true,Pants=true,Part=true,
ParticleEffect=true,Player=true,Players=true,RemoteEvent=true,RemoteFunction=true,ReplicatedFirst=
true,ReplicatedStorage=true,ScreenGui=true,Script=true,Seat=true,Selection=true,SelectionPartLasso=
true,Shirt=true,Sky=true,Smoke=true,Sound=true,SpawnLocation=true,SphereHandleAdornment=true,
StarterGui=true,StarterPlayer=true,StringValue=true,SearchIcon=true,SettingsIcon=true,SurfaceGui=
true,TShirt=true,Team=true,Teams=true,Terrain=true,TestService=true,TextButton=true,TextChatService
=true,TextLabel=true,Texture=true,Tool=true,TouchInterest=true,UIListLayout=true,UnionOperation=
true,Unspecified=true,Weld=true,Workspace=true}local z={Workspace='Workspace',Terrain='Terrain',
Players='Players',Player='Player',Lighting='Lighting',ReplicatedFirst='ReplicatedFirst',
ReplicatedStorage='ReplicatedStorage',StarterPlayer='StarterPlayer',StarterPlayerScripts='Folder',
StarterCharacterScripts='Folder',StarterPack='Backpack',StarterGui='StarterGui',CoreGui='CoreGui',
PlayerGui='ScreenGui',ServerScriptService='Folder',ServerStorage='Folder',SoundService='Sound',Chat
='Chat',TextChatService='TextChatService',Teams='Teams',Team='Team',TestService='TestService',
InsertService='InsertService',JointsService='JointsService',NetworkClient='NetworkClient',Folder=
'Folder',Configuration='Configuration',Backpack='Backpack',Model='Model',Part='Part',MeshPart=
'MeshPart',UnionOperation='UnionOperation',WedgePart='Part',CornerWedgePart='Part',TrussPart='Part'
,SpawnLocation='SpawnLocation',Seat='Seat',VehicleSeat='Seat',Script='Script',LocalScript=
'LocalScript',ModuleScript='ModuleScript',Camera='Camera',Humanoid='Humanoid',HumanoidDescription=
'Humanoid',HumanoidRootPart='Part',Animation='AnimationTrack',AnimationTrack='AnimationTrack',
Animator='AnimationTrack',AnimationController='AnimationTrack',KeyframeSequence='AnimationTrack',
Keyframe='AnimationTrack',Tool='Tool',HopperBin='Tool',Accessory='Accessory',Hat='Accessory',Shirt=
'Shirt',Pants='Pants',ShirtGraphic='TShirt',TShirt='TShirt',BodyColors='Configuration',
CharacterMesh='MeshPart',Decal='Texture',Texture='Texture',SurfaceGui='SurfaceGui',ScreenGui=
'ScreenGui',BillboardGui='ScreenGui',Frame='Frame',ScrollingFrame='Frame',TextLabel='TextLabel',
TextButton='TextButton',TextBox='TextLabel',ImageLabel='ImageLabel',ImageButton='ImageButton',
VideoFrame='ImageFrame',UICorner='Frame',UIStroke='Frame',UIPadding='Frame',UIListLayout=
'UIListLayout',UIGridLayout='UIListLayout',UIScale='Frame',UIAspectRatioConstraint='Frame',Sound=
'Sound',SoundGroup='Sound',Attachment='Attachment',Weld='Weld',WeldConstraint='Weld',Snap='Weld',
Motor6D='Motor6D',BallSocketConstraint='HingeConstraint',HingeConstraint='HingeConstraint',
RopeConstraint='HingeConstraint',SpringConstraint='HingeConstraint',RodConstraint='HingeConstraint'
,PrismaticConstraint='HingeConstraint',RemoteEvent='RemoteEvent',RemoteFunction='RemoteFunction',
UnreliableRemoteEvent='RemoteEvent',BindableEvent='BindableEvent',BindableFunction=
'BindableFunction',StringValue='StringValue',IntValue='NumberValue',NumberValue='NumberValue',
BoolValue='NumberValue',ObjectValue='NumberValue',CFrameValue='NumberValue',Vector3Value=
'NumberValue',Color3Value='NumberValue',BrickColorValue='NumberValue',RayValue='NumberValue',
ParticleEmitter='ParticleEffect',Beam='ParticleEffect',Trail='ParticleEffect',Sparkles=
'ParticleEffect',Fire='Fire',Smoke='Smoke',Explosion='Explosion',PointLight='Lighting',SpotLight=
'Lighting',SurfaceLight='Lighting',Atmosphere='Sky',Sky='Sky',Clouds='Sky',BloomEffect=
'ColorCorrectionEffect',BlurEffect='ColorCorrectionEffect',ColorCorrectionEffect=
'ColorCorrectionEffect',DepthOfFieldEffect='ColorCorrectionEffect',SunRaysEffect=
'ColorCorrectionEffect',BodyVelocity='BodyVelocity',BodyPosition='BodyVelocity',BodyGyro=
'BodyVelocity',BodyAngularVelocity='BodyVelocity',BodyForce='BodyVelocity',BodyThrust=
'BodyVelocity',AlignPosition='BodyVelocity',AlignOrientation='BodyVelocity',VectorForce=
'BodyVelocity',Torque='BodyVelocity',LineForce='BodyVelocity',Dialog='Chat',DialogChoice='Chat',
ClickDetector='ClickDetector',ProximityPrompt='ClickDetector',Highlight='Highlight',SelectionBox=
'Selection',BoxHandleAdornment='BoxHandleAdornment',ConeHandleAdornment='ConeHandleAdornment',
CylinderHandleAdornment='CylinderHandleAdornment',SphereHandleAdornment='SphereHandleAdornment',
LineHandleAdornment='LineHandleAdornment',ImageHandleAdornment='ImageHandleAdornment',TouchInterest
='TouchInterest',FlagStand='FlagStand',Flag='Flag'}local A={}local B=(getcustomasset and
getcustomasset or nil)and(writefile and writefile or nil)and(readfile and readfile or nil)and(
isfile and isfile or nil)and(makefolder and makefolder or nil)and(isfolder and isfolder or nil)
local function EnsureAssetFolders()if not B then return end if not isfolder(w)then makefolder(w)end
if not isfolder(x)then makefolder(x)end end local function DownloadAsset(C)if not B then return nil
end local D=`{x}/{C}.png`if isfile(D)then return D end local E,F=pcall(function()if request then
local E=request({Url=`{v}/{C}.png`,Method='GET'})if E and E.StatusCode==200 and E.Body then return
E.Body end return nil end end)if not E or#F==0 then return nil end local G=pcall(writefile,D,F)if
not G then return nil end return D end local function GetClassAssetId(C)if not B then return nil
end if type(C)~='string'or C==''then C='Instance'end if A[C]~=nil then return A[C]or nil end local
D=z[C]if not D or not y[D]then D='Unspecified'end EnsureAssetFolders()local E=DownloadAsset(D)if
not E then A[C]=false return nil end local F,G=pcall(getcustomasset,E)if F and G~=''then A[C]=G
return G end A[C]=false return nil end local function GetUIAssetId(C)if not B then return nil end
local D=`__UI_{C}`if A[D]~=nil then return A[D]or nil end EnsureAssetFolders()local E=
DownloadAsset(C)if not E then A[D]=false return nil end local F,G=pcall(getcustomasset,E)if F and
type(G)=='string'and G~=''then A[D]=G return G end A[D]=false return nil end local function 
PrefetchAssets()if not B then return end task.spawn(function()EnsureAssetFolders()local C={}for D,E
in z do if not C[E]and y[E]then C[E]=true pcall(DownloadAsset,E)end end pcall(DownloadAsset,
'CloseIcon')pcall(DownloadAsset,'FreezeIcon')pcall(DownloadAsset,'ConsoleIcon')pcall(DownloadAsset,
'SearchIcon')pcall(DownloadAsset,'SettingsIcon')pcall(DownloadAsset,'Unspecified')end)end
PrefetchAssets()local C={'Workspace','Players','Lighting','ReplicatedFirst','ReplicatedStorage',
'StarterGui','StarterPlayer','StarterPack','CoreGui'}local D={}for E,F in C do D[F]=E end local 
function SortServices(E)local F={}local G={}for H,I in E do if D[I.Name]then table.insert(F,I)else
table.insert(G,I)end end table.sort(F,function(H,I)return D[H.Name]<D[I.Name]end)table.sort(G,
function(H,I)return H.Name:lower()<I.Name:lower()end)local H={}for I,J in F do table.insert(H,J)end
for I,J in G do table.insert(H,J)end return H end local E={{Class='Instance',Properties={'Name',
'ClassName','Parent','Archivable'}},{Class='BasePart',Properties={'Anchored','CanCollide',
'CanTouch','CanQuery','CastShadow','Locked','Massless','Material','Color','Transparency',
'Reflectance','Position','Orientation','Size','CFrame','AssemblyLinearVelocity',
'AssemblyAngularVelocity','CollisionGroup','RootPriority'}},{Class='FormFactorPart',Properties={
'Shape'}},{Class='Part',Properties={'Shape'}},{Class='TrussPart',Properties={'Style'}},{Class=
'MeshPart',Properties={'MeshId','TextureID','DoubleSided'}},{Class='UnionOperation',Properties={
'UsePartColor'}},{Class='Seat',Properties={'Disabled','Occupant'}},{Class='VehicleSeat',Properties=
{'HeadsUpDisplay','MaxSpeed','Torque','TurnSpeed','Steer','Throttle'}},{Class='SpawnLocation',
Properties={'Enabled','Neutral','TeamColor','Duration','AllowTeamChangeOnTouch'}},{Class='Model',
Properties={'PrimaryPart','WorldPivot','ModelStreamingMode'}},{Class='Workspace',Properties={
'Gravity','FilteringEnabled','StreamingEnabled','FallenPartsDestroyHeight','AllowThirdPartySales'}}
,{Class='Lighting',Properties={'Ambient','OutdoorAmbient','Brightness','ClockTime','TimeOfDay',
'GeographicLatitude','FogColor','FogStart','FogEnd','GlobalShadows','ColorShift_Top',
'ColorShift_Bottom','EnvironmentDiffuseScale','EnvironmentSpecularScale','ExposureCompensation',
'ShadowSoftness','Technology'}},{Class='Players',Properties={'MaxPlayers','PreferredPlayers',
'NumPlayers','RespawnTime','CharacterAutoLoads','BubbleChat','ClassicChat','LocalPlayer'}},{Class=
'Player',Properties={'Character','UserId','DisplayName','Team','TeamColor','Neutral','AccountAge',
'MembershipType','FollowUserId','CharacterAppearanceId','AutoJumpEnabled','CanLoadCharacter',
'CameraMode','CameraMaxZoomDistance','CameraMinZoomDistance','DevCameraOcclusionMode',
'DevComputerCameraMode','DevComputerMovementMode','DevTouchCameraMode','DevTouchMovementMode',
'DevEnableMouseLock','HealthDisplayDistance','NameDisplayDistance'}},{Class='Hat',Properties={
'AttachmentForward','AttachmentPoint','AttachmentPos','AttachmentRight','AttachmentUp'}},{Class=
'HumanoidDescription',Properties={'BackAccessory','BodyTypeScale','ClimbAnimation','DepthScale',
'Face','FaceAccessory','FallAnimation','FrontAccessory','GraphicTShirt','HairAccessory',
'HatAccessory','Head','HeadColor','HeadScale','HeightScale','IdleAnimation','JumpAnimation',
'LeftArm','LeftArmColor','LeftLeg','LeftLegColor','MoodAnimation','NeckAccessory','Pants',
'ProportionScale','RightArm','RightArmColor','RightLeg','RightLegColor','RunAnimation','Shirt',
'ShouldersAccessory','SwimAnimation','Torso','TorsoColor','WaistAccessory','WalkAnimation',
'WidthScale'}},{Class='WrapLayer',Properties={'AutoSkin','BindOffset','Color','DebugMode','Enabled'
,'Order','Puffiness','ReferenceMeshId','ReferenceOrigin','ShrinkFactor'}},{Class='WrapTarget',
Properties={'CageMeshId','CageOrigin','ImportOrigin','Stiffness'}},{Class='SurfaceAppearance',
Properties={'AlphaMode','ColorMap','MetalnessMap','NormalMap','RoughnessMap'}},{Class='Humanoid',
Properties={'Health','MaxHealth','WalkSpeed','JumpPower','JumpHeight','HipHeight','AutoRotate',
'PlatformStand','Sit','Jump','MaxSlopeAngle','AutoJumpEnabled','DisplayName','RigType',
'HealthDisplayType','HealthDisplayDistance','NameDisplayDistance','DisplayDistanceType',
'BreakJointsOnDeath','RequiresNeck','UseJumpPower','EvaluateStateMachine'}},{Class='Sound',
Properties={'SoundId','Volume','Playing','Looped','PlaybackSpeed','TimePosition','MaxDistance',
'EmitterSize','RollOffMode','PlayOnRemove','TimeLength','IsPaused','IsPlaying','IsLoaded'}},{Class=
'SoundGroup',Properties={'Volume'}},{Class='EqualizerSoundEffect',Properties={'Enabled','HighGain',
'LowGain','MidGain','Priority'}},{Class='ReverbSoundEffect',Properties={'DecayTime','Density',
'Diffusion','DryLevel','Enabled','Priority','WetLevel'}},{Class='ChorusSoundEffect',Properties={
'Depth','Enabled','Mix','Priority','Rate'}},{Class='CompressorSoundEffect',Properties={'Attack',
'Enabled','GainMakeup','Priority','Ratio','Release','SideChain','Threshold'}},{Class=
'DistortionSoundEffect',Properties={'Enabled','Level','Priority'}},{Class='EchoSoundEffect',
Properties={'Delay','DryLevel','Enabled','Feedback','Priority','WetLevel'}},{Class=
'FlangeSoundEffect',Properties={'Depth','Enabled','Mix','Priority','Rate'}},{Class=
'PitchShiftSoundEffect',Properties={'Enabled','Octave','Priority'}},{Class='TremoloSoundEffect',
Properties={'Depth','Duty','Enabled','Frequency','Priority'}},{Class='Tool',Properties={'Grip',
'GripForward','GripPos','GripRight','GripUp','RequiresHandle','CanBeDropped','ToolTip','TextureId',
'Enabled','ManualActivationOnly'}},{Class='LayerCollector',Properties={'Enabled','ResetOnSpawn',
'ZIndexBehavior'}},{Class='GuiBase2d',Properties={'AbsolutePosition','AbsoluteRotation',
'AbsoluteSize'}},{Class='GuiButton',Properties={'AutoButtonColor','Modal','Selected','Style'}},{
Class='ViewportFrame',Properties={'Ambient','CurrentCamera','ImageColor3','ImageTransparency',
'LightColor','LightDirection'}},{Class='CanvasGroup',Properties={'GroupColor3','GroupTransparency'}
},{Class='VideoFrame',Properties={'Video','Volume','Playing','Looped','PlaybackSpeed',
'TimePosition','Resolution','IsLoaded'}},{Class='UIPageLayout',Properties={'Animated','Circular',
'CurrentPage','EasingDirection','EasingStyle','GamepadInputEnabled','Padding',
'ScrollWheelInputEnabled','TouchInputEnabled','TweenTime'}},{Class='UITableLayout',Properties={
'FillEmptySpaceColumns','FillEmptySpaceRows','MajorAxis','Padding'}},{Class='UITextSizeConstraint',
Properties={'MaxTextSize','MinTextSize'}},{Class='UIFlexItem',Properties={'FlexMode','GrowRatio',
'ItemLineAlignment','ShrinkRatio'}},{Class='RemoteEvent',Properties={}},{Class='RemoteFunction',
Properties={}},{Class='UnreliableRemoteEvent',Properties={}},{Class='BindableEvent',Properties={}},
{Class='BindableFunction',Properties={}},{Class='BallSocketConstraint',Properties={'LimitsEnabled',
'MaxFrictionTorque','Radius','Restitution','TwistLimitsEnabled','TwistLowerAngle','TwistUpperAngle'
,'UpperAngle'}},{Class='PrismaticConstraint',Properties={'ActuatorType','LimitsEnabled',
'LowerLimit','UpperLimit','Restitution','ServoMaxForce','Speed','TargetPosition','Velocity'}},{
Class='CylindricalConstraint',Properties={'ActuatorType','AngularActuatorType',
'AngularLimitsEnabled','AngularRestitution','AngularSpeed','AngularVelocity','InclinationAngle',
'LimitsEnabled','LowerAngle','LowerLimit','MotorMaxAngularAcceleration','MotorMaxForce',
'Restitution','ServoMaxForce','TargetAngle','TargetPosition','UpperAngle','UpperLimit'}},{Class=
'PlaneConstraint',Properties={}},{Class='NoCollisionConstraint',Properties={'Part0','Part1',
'Enabled'}},{Class='PathfindingModifier',Properties={'Label','PassThrough'}},{Class=
'PathfindingLink',Properties={'Attachment0','Attachment1','IsBidirectional','Label'}},{Class=
'Dialog',Properties={'BehaviorType','ConversationDistance','GoodbyeChoiceActive','GoodbyeDialog',
'InUse','InitialPrompt','Purpose','Tone','TriggerDistance','TriggerOffset'}},{Class='DialogChoice',
Properties={'GoodbyeChoiceActive','GoodbyeDialog','ResponseDialog','UserDialog'}},{Class=
'ForceField',Properties={'Visible'}},{Class='Decal',Properties={'Texture','Color3','Transparency',
'Face','ZIndex'}},{Class='Texture',Properties={'Texture','Color3','Transparency','Face',
'StudsPerTileU','StudsPerTileV','OffsetStudsU','OffsetStudsV'}},{Class='Animation',Properties={
'AnimationId'}},{Class='Animator',Properties={'RootMotion','RootMotionWeight','EvaluationThrottled'
}},{Class='AnimationController',Properties={}},{Class='AnimationTrack',Properties={'Animation',
'Length','TimePosition','Speed','Looped','Priority','IsPlaying','WeightCurrent','WeightTarget'}},{
Class='KeyframeSequence',Properties={'Loop','Priority','AuthoredHipHeight'}},{Class='Keyframe',
Properties={'Time'}},{Class='Pose',Properties={'CFrame','EasingDirection','EasingStyle','Weight'}},
{Class='Camera',Properties={'CFrame','Focus','FieldOfView','CameraType','CameraSubject',
'HeadLocked','HeadScale'}},{Class='Attachment',Properties={'CFrame','Position','Orientation',
'Visible','WorldCFrame','WorldPosition'}},{Class='ScreenGui',Properties={'Enabled','ResetOnSpawn',
'IgnoreGuiInset','ZIndexBehavior','DisplayOrder'}},{Class='GuiObject',Properties={'Active',
'Visible','BackgroundColor3','BackgroundTransparency','BorderColor3','BorderSizePixel','Position',
'Size','AnchorPoint','Rotation','ZIndex','ClipsDescendants','LayoutOrder'}},{Class='TextLabel',
Properties={'Text','TextColor3','Font','TextSize','TextScaled','TextWrapped','TextXAlignment',
'TextYAlignment','RichText','TextStrokeColor3','TextStrokeTransparency'}},{Class='TextButton',
Properties={'Text','TextColor3','Font','TextSize','TextScaled','TextWrapped','TextXAlignment',
'TextYAlignment','AutoButtonColor','Modal','RichText'}},{Class='TextBox',Properties={'Text',
'TextColor3','Font','TextSize','PlaceholderText','PlaceholderColor3','ClearTextOnFocus','MultiLine'
,'TextEditable'}},{Class='ImageLabel',Properties={'Image','ImageColor3','ImageTransparency',
'ScaleType','ImageRectOffset','ImageRectSize','ResampleMode'}},{Class='ImageButton',Properties={
'Image','ImageColor3','ImageTransparency','ScaleType','ImageRectOffset','ImageRectSize',
'AutoButtonColor','Modal'}},{Class='ValueBase',Properties={'Value'}},{Class='ParticleEmitter',
Properties={'Enabled','Rate','Lifetime','Speed','Size','Texture','Transparency','ZOffset',
'Rotation','RotSpeed','SpreadAngle','Acceleration','Drag','EmissionDirection','LightEmission',
'LightInfluence','VelocityInheritance','TimeScale'}},{Class='Light',Properties={'Brightness',
'Color','Enabled','Shadows'}},{Class='PointLight',Properties={'Range'}},{Class='SpotLight',
Properties={'Range','Angle','Face'}},{Class='SurfaceLight',Properties={'Range','Angle','Face'}},{
Class='BodyVelocity',Properties={'Velocity','MaxForce','P'}},{Class='BodyPosition',Properties={
'Position','MaxForce','P','D'}},{Class='BodyGyro',Properties={'CFrame','MaxTorque','P','D'}},{Class
='BodyAngularVelocity',Properties={'AngularVelocity','MaxTorque','P'}},{Class='ClickDetector',
Properties={'MaxActivationDistance','CursorIcon'}},{Class='ProximityPrompt',Properties={
'ActionText','ObjectText','HoldDuration','MaxActivationDistance','RequiresLineOfSight','Enabled',
'KeyboardKeyCode'}},{Class='Highlight',Properties={'Adornee','Enabled','FillColor',
'FillTransparency','OutlineColor','OutlineTransparency','DepthMode'}},{Class='Beam',Properties={
'Attachment0','Attachment1','Enabled','Color','Texture','TextureLength','TextureSpeed',
'TextureMode','Transparency','Width0','Width1','Segments','FaceCamera','LightEmission',
'LightInfluence','CurveSize0','CurveSize1','ZOffset'}},{Class='Trail',Properties={'Attachment0',
'Attachment1','Enabled','Color','Texture','TextureLength','TextureMode','Transparency','Lifetime',
'MinLength','MaxLength','FaceCamera','LightEmission','LightInfluence','WidthScale'}},{Class='Fire',
Properties={'Enabled','Heat','Size','Color','SecondaryColor'}},{Class='Smoke',Properties={'Enabled'
,'Color','Opacity','RiseVelocity','Size','TimeScale'}},{Class='Sparkles',Properties={'Enabled',
'SparkleColor','TimeScale'}},{Class='Explosion',Properties={'BlastPressure','BlastRadius',
'DestroyJointRadius','ExplosionType','Position','TimeScale','Visible'}},{Class='Atmosphere',
Properties={'Density','Offset','Color','Decay','Glare','Haze'}},{Class='Sky',Properties={'SkyboxBk'
,'SkyboxDn','SkyboxFt','SkyboxLf','SkyboxRt','SkyboxUp','StarCount','SunAngularSize',
'MoonAngularSize','SunTextureId','MoonTextureId','CelestialBodiesShown'}},{Class='Clouds',
Properties={'Cover','Density','Color','Enabled'}},{Class='BloomEffect',Properties={'Enabled',
'Intensity','Size','Threshold'}},{Class='BlurEffect',Properties={'Enabled','Size'}},{Class=
'DepthOfFieldEffect',Properties={'Enabled','FarIntensity','FocusDistance','InFocusRadius',
'NearIntensity'}},{Class='SunRaysEffect',Properties={'Enabled','Intensity','Spread'}},{Class=
'BillboardGui',Properties={'Adornee','AlwaysOnTop','Enabled','LightInfluence','MaxDistance','Size',
'SizeOffset','StudsOffset','StudsOffsetWorldSpace','ExtentsOffset','ExtentsOffsetWorldSpace',
'PlayerToHideFrom','DistanceLowerLimit','DistanceUpperLimit','DistanceStep'}},{Class='SurfaceGui',
Properties={'Adornee','Enabled','Active','AlwaysOnTop','Brightness','ClipsDescendants','Face',
'LightInfluence','PixelsPerStud','SizingMode','ToolPunchThroughDistance','ZOffset'}},{Class='Frame'
,Properties={'Style'}},{Class='ScrollingFrame',Properties={'AutomaticCanvasSize','CanvasPosition',
'CanvasSize','ScrollBarImageColor3','ScrollBarImageTransparency','ScrollBarThickness',
'ScrollingDirection','ScrollingEnabled','VerticalScrollBarInset','HorizontalScrollBarInset',
'BottomImage','MidImage','TopImage','ElasticBehavior','VerticalScrollBarPosition'}},{Class=
'VideoFrame',Properties={'Video','Volume','Playing','Looped','PlaybackSpeed','TimePosition',
'Resolution'}},{Class='UICorner',Properties={'CornerRadius'}},{Class='UIStroke',Properties={
'ApplyStrokeMode','Color','LineJoinMode','Thickness','Transparency','Enabled'}},{Class='UIPadding',
Properties={'PaddingBottom','PaddingLeft','PaddingRight','PaddingTop'}},{Class='UIListLayout',
Properties={'FillDirection','HorizontalAlignment','VerticalAlignment','Padding','SortOrder','Wraps'
,'ItemLineAlignment'}},{Class='UIGridLayout',Properties={'CellPadding','CellSize','FillDirection',
'FillDirectionMaxCells','HorizontalAlignment','VerticalAlignment','SortOrder','StartCorner'}},{
Class='UIScale',Properties={'Scale'}},{Class='UIAspectRatioConstraint',Properties={'AspectRatio',
'AspectType','DominantAxis'}},{Class='UIGradient',Properties={'Color','Enabled','Offset','Rotation'
,'Transparency'}},{Class='UISizeConstraint',Properties={'MaxSize','MinSize'}},{Class='Constraint',
Properties={'Attachment0','Attachment1','Color','Enabled','Visible'}},{Class='HingeConstraint',
Properties={'ActuatorType','AngularSpeed','AngularVelocity','TargetAngle','LimitsEnabled',
'LowerAngle','UpperAngle','Restitution','ServoMaxTorque','MotorMaxTorque','MotorMaxAcceleration',
'AngularResponsiveness','CurrentAngle'}},{Class='SpringConstraint',Properties={'Stiffness',
'Damping','FreeLength','MaxForce','MaxLength','MinLength','LimitsEnabled','Coils','Radius',
'Thickness'}},{Class='RopeConstraint',Properties={'Length','Restitution','Thickness','WinchEnabled'
,'WinchForce','WinchResponsiveness','WinchSpeed','WinchTarget'}},{Class='RodConstraint',Properties=
{'Length','Thickness','LimitsEnabled','LimitAngle0','LimitAngle1'}},{Class='AlignPosition',
Properties={'Attachment0','Attachment1','Mode','ApplyAtCenterOfMass','MaxForce','MaxVelocity',
'Position','Responsiveness','RigidityEnabled','ReactionForceEnabled'}},{Class='AlignOrientation',
Properties={'Attachment0','Attachment1','Mode','AlignType','CFrame','MaxAngularVelocity',
'MaxTorque','Responsiveness','PrimaryAxisOnly','ReactionTorqueEnabled','RigidityEnabled'}},{Class=
'VectorForce',Properties={'Attachment0','Attachment1','ApplyAtCenterOfMass','Force','RelativeTo'}},
{Class='Weld',Properties={'Part0','Part1','C0','C1'}},{Class='WeldConstraint',Properties={'Part0',
'Part1','Enabled'}},{Class='Motor6D',Properties={'Part0','Part1','C0','C1','Transform',
'DesiredAngle','CurrentAngle','MaxVelocity'}},{Class='Terrain',Properties={'WaterColor',
'WaterReflectance','WaterTransparency','WaterWaveSize','WaterWaveSpeed','Decoration',
'MaterialColors','MaxExtents'}},{Class='Team',Properties={'AutoAssignable','TeamColor','Score'}},{
Class='Accessory',Properties={'AccessoryType','AttachmentForward','AttachmentPoint','AttachmentPos'
,'AttachmentRight','AttachmentUp'}},{Class='Shirt',Properties={'ShirtTemplate'}},{Class='Pants',
Properties={'PantsTemplate'}},{Class='ShirtGraphic',Properties={'Graphic','Color3'}},{Class=
'BodyColors',Properties={'HeadColor3','TorsoColor3','LeftArmColor3','RightArmColor3',
'LeftLegColor3','RightLegColor3'}},{Class='SpecialMesh',Properties={'MeshType','MeshId','TextureId'
,'Scale','Offset','VertexColor'}},{Class='BlockMesh',Properties={'Scale','Offset'}},{Class=
'CylinderMesh',Properties={'Scale','Offset'}},{Class='FileMesh',Properties={'MeshId','TextureId',
'Scale','Offset'}},{Class='LuaSourceContainer',Properties={'Source','LinkedSource'}},{Class=
'Script',Properties={'Disabled','RunContext'}},{Class='LocalScript',Properties={'Disabled'}},{Class
='ModuleScript',Properties={}},{Class='ReplicatedStorage',Properties={}},{Class='ReplicatedFirst',
Properties={}},{Class='ServerStorage',Properties={}},{Class='ServerScriptService',Properties={}},{
Class='StarterGui',Properties={'ResetPlayerGuiOnSpawn','ScreenOrientation'}},{Class='StarterPack',
Properties={}},{Class='StarterPlayer',Properties={'AllowCustomAnimations','AutoJumpEnabled',
'CameraMaxZoomDistance','CameraMinZoomDistance','CameraMode','CharacterJumpHeight',
'CharacterJumpPower','CharacterMaxSlopeAngle','CharacterUseJumpPower','CharacterWalkSpeed',
'DevCameraOcclusionMode','DevComputerCameraMovementMode','DevComputerMovementMode',
'DevTouchCameraMovementMode','DevTouchMovementMode','EnableMouseLockOption','HealthDisplayDistance'
,'LoadCharacterAppearance','NameDisplayDistance'}},{Class='Teams',Properties={}},{Class=
'SoundService',Properties={'AmbientReverb','DistanceFactor','DopplerScale','RolloffScale',
'RespectFilteringEnabled'}},{Class='CollectionService',Properties={}},{Class='TweenService',
Properties={}},{Class='TextChatService',Properties={'ChatVersion','CreateDefaultCommands',
'CreateDefaultTextChannels'}},{Class='Folder',Properties={}},{Class='Configuration',Properties={}},
{Class='PackageLink',Properties={'PackageId','VersionNumber','AutoUpdate'}},{Class=
'CornerWedgePart',Properties={}},{Class='WedgePart',Properties={}},{Class='FlagStand',Properties={
'TeamColor'}},{Class='SkateboardPlatform',Properties={'Steer','Throttle'}}}o=function(F)local G={}
local H={}for I,J in E do local K=SafeGet(F,'ClassName')~=nil local L=false if K then local M,N=
pcall(function()return F:IsA(J.Class)end)L=M and N end if L then for M,N in J.Properties do if not
H[N]then H[N]=true table.insert(G,N)end end end end return G end local function CollectAttributes(F
)local G={}local H,I=pcall(function()return F:GetAttributes()end)if not H or type(I)~='table'then
return G end for J,K in I do table.insert(G,{Name=J,Value=K})end table.sort(G,function(J,K)return J
.Name:lower()<K.Name:lower()end)return G end local function CollectTags(F)local G,H=pcall(function(
)return d.CollectionService:GetTags(F)end)if not G or type(H)~='table'then return{}end table.sort(H
,function(I,J)return tostring(I):lower()<tostring(J):lower()end)return H end local function 
ResolveSelfForGlobal(F,G)if G.SelfFrom=='Parent'then local H,I=pcall(function()return F.Parent end)
if H and typeof(I)=='Instance'then return I end end return F end local function GetGlobalCallable(F
)local G pcall(function()G=getgenv and getgenv()end)if G then local H,I=pcall(function()return G[F]
end)if H and type(I)=='function'then return I end end local H,I=pcall(function()return _G[F]end)if
H and type(I)=='function'then return I end return nil end local function GetLocalCharacterRootPart(
)local F=d.Players or game:GetService('Players')local G=F.LocalPlayer local H=G and G.Character if
not H then return nil end return H:FindFirstChild('HumanoidRootPart')or H:FindFirstChild('Torso')or
H:FindFirstChild('UpperTorso')or H:FindFirstChildWhichIsA('BasePart')end local F local G local H=
false local function LoadSynSaveInstance()if F then return F end if H then return nil,G end H=true
local I={RepoURL=[[https://raw.githubusercontent.com/luau/UniversalSynSaveInstance/main/]],SSI=
'saveinstance'}local J,K=pcall(function()return game:HttpGet(I.RepoURL..I.SSI..'.luau',true)end)if
not J or type(K)~='string'or K==''then G=`HttpGet failed: {tostring(K)}`return nil,G end local L,M=
loadstring(K,I.SSI)if not L then G=`loadstring failed: {tostring(M)}`return nil,G end local N,O=
pcall(L)if not N or type(O)~='function'then G=`module returned non-function: {tostring(O)}`return
nil,G end F=O return F end local I={{Class='Instance',Methods={{'ClearAllChildren','void',{}},{
'Clone','Instance',{}},{'Destroy','void',{}},{'GetChildren','table',{}},{'GetDescendants','table',{
}},{'GetFullName','string',{}},{'getconnections','table',{{'signal','RBXScriptSignal',
'MouseButton1Click'}},'global',NoSelf=true},{'firesignal','void',{{'signal','RBXScriptSignal',
'MouseButton1Click'},{'args','Variadic',''}},'global',NoSelf=true},{'replicatesignal','void',{{
'signal','RBXScriptSignal','MouseButton1Click'},{'args','Variadic',''}},'global',NoSelf=true},{
'getproperties','table',{},'global',NoSelf=false},{'gethiddenproperties','table',{},'global'},{
'gethiddenproperty','any',{{'name','string'}},'global'},{'sethiddenproperty','void',{{'name',
'string'},{'value','any'}},'global'},{'getcallbackvalue','function',{{'name','string'}},'global'},{
'synsaveinstance','void',{{'FilePath','string','vex_dump.rbxm'},{'Mode','string','optimized'},{
'SafeMode','boolean','true'},{'KillAllScripts','boolean','true'},{'Decompile','boolean','true'},{
'DecompileTimeout','number','15'},{'SaveBytecode','boolean','false'},{'scriptcache','boolean',
'true'},{'NilInstances','boolean','false'},{'IgnoreDefaultProperties','boolean','true'},{
'IgnoreNotArchivable','boolean','true'},{'AlternativeWritefile','boolean','true'},{
'IgnoreSharedStrings','boolean','true'},{'BoostFPS','boolean','false'},{'ShutdownWhenDone',
'boolean','false'},{'AntiIdle','boolean','true'},{'IsModel','boolean','false'},{
'SavePlayerCharacters','boolean','false'},{'IsolatePlayers','boolean','false'},{
'IsolateLocalPlayer','boolean','false'}},'global',BuildOptions=true,Resolve=function()return
LoadSynSaveInstance()end,PostBuild=function(I,J)if typeof(J)=='Instance'and J~=game then I.Object=J
if I.Mode=='optimized'then I.Mode='full'end if I.IsModel==nil then I.IsModel=true end end return I
end}}},{Class='Model',Methods={{'BreakJoints','void',{}},{'GetExtentsSize','Vector3',{}},{
'GetPrimaryPartCFrame','CFrame',{}},{'MakeJoints','void',{}},{'MoveTo','void',{{'position',
'Vector3'}}},{'SetPrimaryPartCFrame','void',{{'cframe','CFrame'}}},{'TranslateBy','void',{{'delta',
'Vector3'}}},{'PivotTo','void',{{'cframe','CFrame'}}},{'GetPivot','CFrame',{}},{'GetBoundingBox',
'CFrame',{}},{'ScaleTo','void',{{'scale','number','1'}}},{'GetScale','number',{}}}},{Class=
'BasePart',Methods={{'BreakJoints','void',{}},{'MakeJoints','void',{}},{'GetMass','number',{}},{
'GetVelocityAtPosition','Vector3',{{'position','Vector3'}}},{'ApplyImpulse','void',{{'impulse',
'Vector3'}}},{'ApplyAngularImpulse','void',{{'impulse','Vector3'}}}}},{Class='Humanoid',Methods={{
'TakeDamage','void',{{'amount','number','10'}}},{'Move','void',{{'moveDirection','Vector3'},{
'relativeToCamera','boolean','false'}}},{'MoveTo','void',{{'location','Vector3'},{'part','BasePart'
}}},{'Jump','void',{}},{'ChangeState','void',{{'state','string','GettingUp'}}},{'GetState',
'EnumItem',{}},{'SetStateEnabled','void',{{'state','string','Dead'},{'enabled','boolean','true'}}},
{'GetStateEnabled','boolean',{{'state','string','Dead'}}},{'EquipTool','void',{{'tool','Instance'}}
},{'UnequipTools','void',{}},{'AddAccessory','void',{{'accessory','Instance'}}},{
'RemoveAccessories','void',{}},{'GetAccessories','table',{}},{'GetAccessoryHandleAttachmentPoint',
'CFrame',{{'accessory','Instance'},{'attachmentName','string','HatAttachment'}}},{
'ReplaceBodyPartR15','boolean',{{'bodyPart','string','Head'},{'part','BasePart'}}},{
'GetBodyPartR15','EnumItem',{{'part','BasePart'}}},{'GetLimb','EnumItem',{{'part','BasePart'}}},{
'BuildRigFromAttachments','void',{}},{'GetPlayingAnimationTracks','table',{}},{'LoadAnimation',
'AnimationTrack',{{'animation','Animation'}}},{'GetMoveVelocity','Vector3',{}},{
'GetAppliedDescription','Instance',{}},{'ApplyDescription','void',{{'humanoidDescription',
'Instance'}}},{'ApplyDescriptionReset','void',{{'humanoidDescription','Instance'}}},{'PlayEmote',
'boolean',{{'emoteName','string','wave'}}},{'PlayEmoteAndGetAnimTrackById','AnimationTrack',{{
'emoteId','number','0'}}}}},{Class='Player',Methods={{'Kick','void',{{'message','string',"''"}}},{
'LoadCharacter','void',{}},{'LoadCharacterBlocking','void',{}},{
'LoadCharacterWithHumanoidDescription','void',{{'humanoidDescription','Instance'}}},{'GetMouse',
'Mouse',{}},{'IsInGroup','boolean',{{'groupId','number','0'}}},{'GetRankInGroup','number',{{
'groupId','number','0'}}},{'GetRoleInGroup','string',{{'groupId','number','0'}}},{'IsFriendsWith',
'boolean',{{'userId','number','0'}}},{'GetFriendsOnline','table',{{'maxFriends','number','200'}}},{
'GetNetworkPing','number',{}},{'DistanceFromCharacter','number',{{'point','Vector3'}}},{
'ClearCharacterAppearance','void',{}},{'HasAppearanceLoaded','boolean',{}},{'GetJoinData','table',{
}},{'GetGameSessionID','string',{}},{'GetUnder13','boolean',{}},{'Move','void',{{'walkDirection',
'Vector3'},{'relativeToCamera','boolean','false'}}}}},{Class='RemoteEvent',Methods={{'FireServer',
'void',{{'args','Variadic',''}}}}},{Class='UnreliableRemoteEvent',Methods={{'FireServer','void',{{
'args','Variadic',''}}}}},{Class='RemoteFunction',Methods={{'InvokeServer','any',{{'args',
'Variadic',''}}}}},{Class='BindableEvent',Methods={{'Fire','void',{{'args','Variadic',''}}}}},{
Class='BindableFunction',Methods={{'Invoke','any',{{'args','Variadic',''}}}}},{Class='Sound',
Methods={{'Play','void',{}},{'Pause','void',{}},{'Resume','void',{}},{'Stop','void',{}},{
'GetWaveformAsync','table',{}}}},{Class='Tool',Methods={{'Activate','void',{}},{'Deactivate','void'
,{}}}},{Class='Camera',Methods={{'GetRenderCFrame','CFrame',{}},{'GetRoll','number',{}},{'SetRoll',
'void',{{'rollAngle','number','0'}}},{'ZoomTo','void',{{'distance','number','10'}}},{
'ScreenPointToRay','Ray',{{'x','number','0'},{'y','number','0'},{'depth','number','0'}}},{
'ViewportPointToRay','Ray',{{'x','number','0'},{'y','number','0'},{'depth','number','0'}}},{
'WorldToScreenPoint','Vector3',{{'worldPoint','Vector3'}}},{'WorldToViewportPoint','Vector3',{{
'worldPoint','Vector3'}}},{'GetPartsObscuringTarget','table',{{'castPoints','table'},{'ignoreList',
'table'}}}}},{Class='Workspace',Methods={{'Raycast','RaycastResult',{{'origin','Vector3'},{
'direction','Vector3'}}},{'Blockcast','RaycastResult',{{'cframe','CFrame'},{'size','Vector3'},{
'direction','Vector3'}}},{'Spherecast','RaycastResult',{{'origin','Vector3'},{'radius','number','1'
},{'direction','Vector3'}}},{'Shapecast','RaycastResult',{{'part','BasePart'},{'direction',
'Vector3'}}},{'GetPartBoundsInBox','table',{{'cframe','CFrame'},{'size','Vector3'}}},{
'GetPartBoundsInRadius','table',{{'position','Vector3'},{'radius','number','10'}}},{
'GetPartsInPart','table',{{'part','BasePart'}}},{'FindPartOnRay','BasePart',{{'ray','Ray'}}},{
'FindPartOnRayWithIgnoreList','BasePart',{{'ray','Ray'},{'ignoreList','table'}}},{
'FindPartOnRayWithWhitelist','BasePart',{{'ray','Ray'},{'whitelist','table'}}},{'IsAncestorOf',
'boolean',{{'descendant','Instance'}}},{'GetServerTimeNow','number',{}},{'GetRealPhysicsFPS',
'number',{}},{'PGSIsEnabled','boolean',{}}}},{Class='Lighting',Methods={{'GetMinutesAfterMidnight',
'number',{}},{'SetMinutesAfterMidnight','void',{{'minutes','number','720'}}},{'GetMoonDirection',
'Vector3',{}},{'GetSunDirection','Vector3',{}}}},{Class='Animator',Methods={{'LoadAnimation',
'AnimationTrack',{{'animation','Animation'}}},{'GetPlayingAnimationTracks','table',{}},{
'StepAnimations','void',{{'deltaTime','number','0.0166'}}}}},{Class='ClickDetector',Methods={{
'fireclickdetector','void',{{'distance','number','0'},{'event','string','MouseClick'}},'global'}}},
{Class='ProximityPrompt',Methods={{'fireproximityprompt','void',{{'amount','number','1'},{'skip',
'boolean','true'}},'global'}}},{Class='BasePart',Methods={{'firetouchinterest','void',{{'target',
'BasePart','character'},{'toggle','number','0'}},'global'}}},{Class='TouchTransmitter',Methods={{
'firetouchinterest','void',{{'target','BasePart','character'},{'toggle','number','0'}},'global',
SelfFrom='Parent'}}}}local function CollectMethods(J)local K={}local L={}for M,N in I do local O,P=
pcall(function()return J:IsA(N.Class)end)if O and P then for Q,R in N.Methods do local S=R[1]local
T=R[4]=='global'local U=type(R.Resolve)=='function'if T and not U and not GetGlobalCallable(S)then
continue end local V=T and`global:{S}`or S if not L[V]then L[V]=true table.insert(K,R)end end end
end return K end local J={'Accessory','AlignOrientation','AlignPosition','Animation',
'AnimationController','Animator','Atmosphere','BallSocketConstraint','Beam','BillboardGui',
'BindableEvent','BindableFunction','BlockMesh','BloomEffect','BlurEffect','BodyAngularVelocity',
'BodyColors','BodyForce','BodyGyro','BodyPosition','BodyThrust','BodyVelocity','BoolValue',
'BoxHandleAdornment','BrickColorValue','Camera','CFrameValue','CharacterMesh','ClickDetector',
'Clouds','Color3Value','ColorCorrectionEffect','ConeHandleAdornment','Configuration',
'CornerWedgePart','CylinderHandleAdornment','CylinderMesh','Decal','DepthOfFieldEffect','Dialog',
'DialogChoice','Explosion','FileMesh','Fire','Folder','Frame','Hat','Highlight','HingeConstraint',
'HopperBin','Humanoid','ImageButton','ImageHandleAdornment','ImageLabel','IntValue','LineForce',
'LineHandleAdornment','LocalScript','MeshPart','Model','Motor6D','NumberValue','ObjectValue',
'Pants','Part','ParticleEmitter','PointLight','PrismaticConstraint','ProximityPrompt','RayValue',
'RemoteEvent','RemoteFunction','RodConstraint','RopeConstraint','ScreenGui','Script',
'ScrollingFrame','Seat','SelectionBox','Shirt','ShirtGraphic','Sky','Smoke','Sound','SoundGroup',
'Sparkles','SpawnLocation','SpecialMesh','SphereHandleAdornment','SpotLight','SpringConstraint',
'StringValue','SunRaysEffect','SurfaceGui','SurfaceLight','Texture','Tool','Torque','Trail',
'TrussPart','UIAspectRatioConstraint','UICorner','UIGradient','UIGridLayout','UIListLayout',
'UIPadding','UIScale','UISizeConstraint','UIStroke','UnreliableRemoteEvent','Vector3Value',
'VectorForce','VehicleSeat','VideoFrame','WedgePart','Weld','WeldConstraint'}local K={Background=
Color3.fromRGB(15,15,17),Window=Color3.fromRGB(20,20,23),TitleBar=Color3.fromRGB(13,13,15),Border=
Color3.fromRGB(34,34,38),BorderSoft=Color3.fromRGB(26,26,30),Field=Color3.fromRGB(28,28,32),
FieldHover=Color3.fromRGB(36,36,42),Selected=Color3.fromRGB(56,36,38),SelectionBar=Color3.fromRGB(
232,55,55),Text=Color3.fromRGB(232,232,236),TextDim=Color3.fromRGB(150,150,160),TextFaded=Color3.
fromRGB(110,110,120),TextHeader=Color3.fromRGB(120,120,130),Accent=Color3.fromRGB(232,55,55),
ToggleOn=Color3.fromRGB(0,187,0),ToggleOff=Color3.fromRGB(45,45,50),Green=Color3.fromRGB(95,200,120
),Red=Color3.fromRGB(232,80,80),Yellow=Color3.fromRGB(220,180,90),Blue=Color3.fromRGB(110,165,240),
Purple=Color3.fromRGB(180,140,240),Pink=Color3.fromRGB(244,114,182),PropString=Color3.fromRGB(255,
198,109),PropNumber=Color3.fromRGB(130,170,255),PropInstance=Color3.fromRGB(130,170,255),PropEnum=
Color3.fromRGB(195,232,141),PropNil=Color3.fromRGB(140,140,145),PropDefault=Color3.fromRGB(220,220,
220)}local L=table.clone(K)local M={Window=0,TitleBar=0,Field=0,Background=0,ModalOverlay=0.5}local
N local O=false local P={}local Q={}local function BindTheme(R,S)P[R]=P[R]or{}local T T=function(U)
local V,W=pcall(S,U)if not V then return false end return W~=false end table.insert(P[R],T)S(K[R])
end local function BindTransparency(R,S)Q[R]=Q[R]or{}local T T=function(U)local V,W=pcall(S,U)if
not V then return false end return W~=false end table.insert(Q[R],T)S(M[R]or 0)end local function 
ClampTransparency(R)return math.clamp(tonumber(R)or 0,0,0.95)end local function SetUITransparency(R
,S)M[R]=ClampTransparency(S)local T=Q[R]if T then local U={}for V,W in T do if W(M[R])~=false then
U[#U+1]=W end end Q[R]=U end if N and not O then pcall(N)end end local function 
RefreshThemePresetButton()if s and s.ThemePresetButton and s.ThemePresetButton.Parent then s.
ThemePresetButton.Text=`{s.ThemePresetName or'Custom'}`end end local function SetThemePresetName(R)
if not s then return end s.ThemePresetName=R or'Custom'RefreshThemePresetButton()end local R=false
local function MarkThemeCustom()if R then return end if not s then return end if s.ThemePresetName
~='Custom'then s.ThemePresetName='Custom'RefreshThemePresetButton()end end local function 
SetThemeColor(S,T)K[S]=T local U=P[S]if U then local V={}for W,X in U do if X(T)~=false then V[#V+1
]=X end end P[S]=V end if not O then MarkThemeCustom()end if N and not O then pcall(N)end end local
S={{Name='Crimson (Default)',Colors={Background=Color3.fromRGB(15,15,17),Window=Color3.fromRGB(20,
20,23),TitleBar=Color3.fromRGB(13,13,15),Border=Color3.fromRGB(34,34,38),BorderSoft=Color3.fromRGB(
26,26,30),Field=Color3.fromRGB(28,28,32),FieldHover=Color3.fromRGB(36,36,42),Selected=Color3.
fromRGB(56,36,38),SelectionBar=Color3.fromRGB(232,55,55),Text=Color3.fromRGB(232,232,236),TextDim=
Color3.fromRGB(150,150,160),TextFaded=Color3.fromRGB(110,110,120),TextHeader=Color3.fromRGB(120,120
,130),Accent=Color3.fromRGB(232,55,55),PropString=Color3.fromRGB(255,170,130),PropNumber=Color3.
fromRGB(255,120,130),PropInstance=Color3.fromRGB(255,140,150),PropEnum=Color3.fromRGB(220,200,140),
PropNil=Color3.fromRGB(120,120,120),PropDefault=Color3.fromRGB(220,220,220)}},{Name='Studio',Colors
={Background=Color3.fromRGB(35,35,38),Window=Color3.fromRGB(46,46,50),TitleBar=Color3.fromRGB(53,53
,56),Border=Color3.fromRGB(70,70,74),BorderSoft=Color3.fromRGB(55,55,60),Field=Color3.fromRGB(46,46
,50),FieldHover=Color3.fromRGB(60,60,66),Selected=Color3.fromRGB(11,90,175),SelectionBar=Color3.
fromRGB(11,90,175),Text=Color3.fromRGB(220,220,220),TextDim=Color3.fromRGB(170,170,175),TextFaded=
Color3.fromRGB(120,120,130),TextHeader=Color3.fromRGB(150,150,160),Accent=Color3.fromRGB(54,145,255
),PropString=Color3.fromRGB(173,241,149),PropNumber=Color3.fromRGB(255,198,109),PropInstance=Color3
.fromRGB(150,200,255),PropEnum=Color3.fromRGB(195,232,141),PropNil=Color3.fromRGB(140,140,145),
PropDefault=Color3.fromRGB(220,220,220)}},{Name='Discord',Colors={Background=Color3.fromRGB(30,31,
34),Window=Color3.fromRGB(43,45,49),TitleBar=Color3.fromRGB(30,31,34),Border=Color3.fromRGB(56,58,
64),BorderSoft=Color3.fromRGB(40,42,46),Field=Color3.fromRGB(56,58,64),FieldHover=Color3.fromRGB(70
,73,80),Selected=Color3.fromRGB(64,78,132),SelectionBar=Color3.fromRGB(88,101,242),Text=Color3.
fromRGB(242,243,245),TextDim=Color3.fromRGB(181,186,193),TextFaded=Color3.fromRGB(128,132,142),
TextHeader=Color3.fromRGB(148,155,164),Accent=Color3.fromRGB(88,101,242),PropString=Color3.fromRGB(
255,211,132),PropNumber=Color3.fromRGB(150,175,255),PropInstance=Color3.fromRGB(120,195,255),
PropEnum=Color3.fromRGB(170,230,160),PropNil=Color3.fromRGB(128,132,142),PropDefault=Color3.
fromRGB(220,222,230)}},{Name='Ocean',Colors={Background=Color3.fromRGB(13,25,35),Window=Color3.
fromRGB(18,32,44),TitleBar=Color3.fromRGB(11,22,32),Border=Color3.fromRGB(34,52,68),BorderSoft=
Color3.fromRGB(24,40,54),Field=Color3.fromRGB(24,40,56),FieldHover=Color3.fromRGB(34,54,72),
Selected=Color3.fromRGB(34,70,96),SelectionBar=Color3.fromRGB(66,184,255),Text=Color3.fromRGB(220,
235,245),TextDim=Color3.fromRGB(140,170,190),TextFaded=Color3.fromRGB(95,125,145),TextHeader=Color3
.fromRGB(110,145,170),Accent=Color3.fromRGB(66,184,255),PropString=Color3.fromRGB(110,230,215),
PropNumber=Color3.fromRGB(120,200,255),PropInstance=Color3.fromRGB(170,220,255),PropEnum=Color3.
fromRGB(140,240,200),PropNil=Color3.fromRGB(95,125,145),PropDefault=Color3.fromRGB(220,235,245)}},{
Name='Forest',Colors={Background=Color3.fromRGB(16,24,18),Window=Color3.fromRGB(22,32,24),TitleBar=
Color3.fromRGB(14,22,16),Border=Color3.fromRGB(40,56,42),BorderSoft=Color3.fromRGB(28,42,30),Field=
Color3.fromRGB(28,42,30),FieldHover=Color3.fromRGB(38,56,40),Selected=Color3.fromRGB(44,78,50),
SelectionBar=Color3.fromRGB(110,200,120),Text=Color3.fromRGB(225,240,225),TextDim=Color3.fromRGB(
150,180,155),TextFaded=Color3.fromRGB(100,130,105),TextHeader=Color3.fromRGB(120,150,125),Accent=
Color3.fromRGB(110,200,120),PropString=Color3.fromRGB(230,200,110),PropNumber=Color3.fromRGB(160,
220,170),PropInstance=Color3.fromRGB(180,230,150),PropEnum=Color3.fromRGB(210,230,130),PropNil=
Color3.fromRGB(100,130,105),PropDefault=Color3.fromRGB(225,240,225)}},{Name='Midnight',Colors={
Background=Color3.fromRGB(10,10,16),Window=Color3.fromRGB(16,16,26),TitleBar=Color3.fromRGB(8,8,14)
,Border=Color3.fromRGB(36,32,56),BorderSoft=Color3.fromRGB(22,22,36),Field=Color3.fromRGB(24,24,38)
,FieldHover=Color3.fromRGB(34,32,52),Selected=Color3.fromRGB(58,42,96),SelectionBar=Color3.fromRGB(
160,110,255),Text=Color3.fromRGB(232,230,245),TextDim=Color3.fromRGB(160,155,185),TextFaded=Color3.
fromRGB(110,105,135),TextHeader=Color3.fromRGB(130,125,160),Accent=Color3.fromRGB(160,110,255),
PropString=Color3.fromRGB(255,170,220),PropNumber=Color3.fromRGB(180,150,255),PropInstance=Color3.
fromRGB(200,170,255),PropEnum=Color3.fromRGB(150,220,230),PropNil=Color3.fromRGB(110,105,135),
PropDefault=Color3.fromRGB(232,230,245)}},{Name='Eye Cancer',Colors={Background=Color3.fromRGB(245,
246,248),Window=Color3.fromRGB(252,252,254),TitleBar=Color3.fromRGB(232,234,238),Border=Color3.
fromRGB(210,214,220),BorderSoft=Color3.fromRGB(225,228,234),Field=Color3.fromRGB(238,240,244),
FieldHover=Color3.fromRGB(225,228,234),Selected=Color3.fromRGB(210,224,248),SelectionBar=Color3.
fromRGB(60,110,220),Text=Color3.fromRGB(28,30,36),TextDim=Color3.fromRGB(80,88,100),TextFaded=
Color3.fromRGB(140,148,160),TextHeader=Color3.fromRGB(110,118,132),Accent=Color3.fromRGB(60,110,220
),PropString=Color3.fromRGB(180,90,30),PropNumber=Color3.fromRGB(40,90,200),PropInstance=Color3.
fromRGB(50,110,180),PropEnum=Color3.fromRGB(40,140,90),PropNil=Color3.fromRGB(140,148,160),
PropDefault=Color3.fromRGB(28,30,36)}},{Name='DEX++',Colors={Background=Color3.fromRGB(24,25,24),
Window=Color3.fromRGB(35,36,34),TitleBar=Color3.fromRGB(43,44,41),Border=Color3.fromRGB(73,76,72),
BorderSoft=Color3.fromRGB(50,52,49),Field=Color3.fromRGB(30,32,31),FieldHover=Color3.fromRGB(48,51,
49),Selected=Color3.fromRGB(0,82,150),SelectionBar=Color3.fromRGB(0,120,215),Text=Color3.fromRGB(
225,225,220),TextDim=Color3.fromRGB(172,174,168),TextFaded=Color3.fromRGB(115,118,112),TextHeader=
Color3.fromRGB(160,165,156),Accent=Color3.fromRGB(38,169,245),PropString=Color3.fromRGB(145,220,135
),PropNumber=Color3.fromRGB(255,174,78),PropInstance=Color3.fromRGB(95,185,255),PropEnum=Color3.
fromRGB(210,210,135),PropNil=Color3.fromRGB(130,130,125),PropDefault=Color3.fromRGB(220,220,215)}},
{Name='Obsidian Blue',Colors={Background=Color3.fromRGB(8,12,18),Window=Color3.fromRGB(13,19,28),
TitleBar=Color3.fromRGB(7,11,17),Border=Color3.fromRGB(27,42,60),BorderSoft=Color3.fromRGB(18,30,44
),Field=Color3.fromRGB(18,27,39),FieldHover=Color3.fromRGB(26,40,57),Selected=Color3.fromRGB(24,58,
94),SelectionBar=Color3.fromRGB(65,156,255),Text=Color3.fromRGB(225,236,245),TextDim=Color3.
fromRGB(145,165,185),TextFaded=Color3.fromRGB(85,105,125),TextHeader=Color3.fromRGB(115,145,175),
Accent=Color3.fromRGB(65,156,255),PropString=Color3.fromRGB(120,220,190),PropNumber=Color3.fromRGB(
120,175,255),PropInstance=Color3.fromRGB(100,200,255),PropEnum=Color3.fromRGB(190,220,140),PropNil=
Color3.fromRGB(90,105,120),PropDefault=Color3.fromRGB(225,236,245)}},{Name='Rose Noir',Colors={
Background=Color3.fromRGB(17,10,14),Window=Color3.fromRGB(27,16,23),TitleBar=Color3.fromRGB(15,8,13
),Border=Color3.fromRGB(58,32,48),BorderSoft=Color3.fromRGB(38,22,32),Field=Color3.fromRGB(35,20,30
),FieldHover=Color3.fromRGB(50,28,42),Selected=Color3.fromRGB(84,36,62),SelectionBar=Color3.
fromRGB(255,95,160),Text=Color3.fromRGB(245,225,236),TextDim=Color3.fromRGB(190,145,170),TextFaded=
Color3.fromRGB(135,90,115),TextHeader=Color3.fromRGB(170,115,145),Accent=Color3.fromRGB(255,95,160)
,PropString=Color3.fromRGB(255,175,130),PropNumber=Color3.fromRGB(255,125,160),PropInstance=Color3.
fromRGB(255,150,200),PropEnum=Color3.fromRGB(225,190,135),PropNil=Color3.fromRGB(135,90,115),
PropDefault=Color3.fromRGB(245,225,236)}},{Name='Amethyst',Colors={Background=Color3.fromRGB(13,10,
22),Window=Color3.fromRGB(22,17,36),TitleBar=Color3.fromRGB(11,8,20),Border=Color3.fromRGB(48,38,76
),BorderSoft=Color3.fromRGB(32,25,52),Field=Color3.fromRGB(30,24,48),FieldHover=Color3.fromRGB(43,
34,68),Selected=Color3.fromRGB(68,45,115),SelectionBar=Color3.fromRGB(170,120,255),Text=Color3.
fromRGB(235,230,250),TextDim=Color3.fromRGB(170,155,200),TextFaded=Color3.fromRGB(115,100,145),
TextHeader=Color3.fromRGB(145,125,180),Accent=Color3.fromRGB(170,120,255),PropString=Color3.
fromRGB(255,185,230),PropNumber=Color3.fromRGB(190,160,255),PropInstance=Color3.fromRGB(205,175,255
),PropEnum=Color3.fromRGB(150,225,235),PropNil=Color3.fromRGB(115,100,145),PropDefault=Color3.
fromRGB(235,230,250)}},{Name='Cyber Lime',Colors={Background=Color3.fromRGB(5,12,9),Window=Color3.
fromRGB(10,20,15),TitleBar=Color3.fromRGB(4,10,7),Border=Color3.fromRGB(28,62,42),BorderSoft=Color3
.fromRGB(18,38,27),Field=Color3.fromRGB(14,30,22),FieldHover=Color3.fromRGB(22,48,34),Selected=
Color3.fromRGB(35,80,48),SelectionBar=Color3.fromRGB(110,255,120),Text=Color3.fromRGB(220,255,225),
TextDim=Color3.fromRGB(145,195,150),TextFaded=Color3.fromRGB(85,125,90),TextHeader=Color3.fromRGB(
120,170,125),Accent=Color3.fromRGB(110,255,120),PropString=Color3.fromRGB(215,255,120),PropNumber=
Color3.fromRGB(120,240,160),PropInstance=Color3.fromRGB(130,255,210),PropEnum=Color3.fromRGB(255,
225,120),PropNil=Color3.fromRGB(85,125,90),PropDefault=Color3.fromRGB(220,255,225)}},{Name=
'Nord Frost',Colors={Background=Color3.fromRGB(36,41,51),Window=Color3.fromRGB(46,52,64),TitleBar=
Color3.fromRGB(40,45,56),Border=Color3.fromRGB(76,86,106),BorderSoft=Color3.fromRGB(59,66,82),Field
=Color3.fromRGB(59,66,82),FieldHover=Color3.fromRGB(67,76,94),Selected=Color3.fromRGB(67,94,116),
SelectionBar=Color3.fromRGB(136,192,208),Text=Color3.fromRGB(236,239,244),TextDim=Color3.fromRGB(
216,222,233),TextFaded=Color3.fromRGB(129,161,193),TextHeader=Color3.fromRGB(143,188,187),Accent=
Color3.fromRGB(136,192,208),PropString=Color3.fromRGB(163,190,140),PropNumber=Color3.fromRGB(180,
142,173),PropInstance=Color3.fromRGB(129,161,193),PropEnum=Color3.fromRGB(235,203,139),PropNil=
Color3.fromRGB(129,161,193),PropDefault=Color3.fromRGB(236,239,244)}},{Name='Gruvbox Dark',Colors={
Background=Color3.fromRGB(29,32,33),Window=Color3.fromRGB(40,40,40),TitleBar=Color3.fromRGB(35,35,
35),Border=Color3.fromRGB(80,73,69),BorderSoft=Color3.fromRGB(60,56,54),Field=Color3.fromRGB(50,48,
47),FieldHover=Color3.fromRGB(60,56,54),Selected=Color3.fromRGB(69,64,51),SelectionBar=Color3.
fromRGB(250,189,47),Text=Color3.fromRGB(235,219,178),TextDim=Color3.fromRGB(189,174,147),TextFaded=
Color3.fromRGB(146,131,116),TextHeader=Color3.fromRGB(168,153,132),Accent=Color3.fromRGB(250,189,47
),PropString=Color3.fromRGB(184,187,38),PropNumber=Color3.fromRGB(211,134,155),PropInstance=Color3.
fromRGB(131,165,152),PropEnum=Color3.fromRGB(250,189,47),PropNil=Color3.fromRGB(146,131,116),
PropDefault=Color3.fromRGB(235,219,178)}},{Name='Tokyo Night',Colors={Background=Color3.fromRGB(22,
22,30),Window=Color3.fromRGB(31,35,53),TitleBar=Color3.fromRGB(26,27,38),Border=Color3.fromRGB(65,
72,104),BorderSoft=Color3.fromRGB(41,46,66),Field=Color3.fromRGB(36,40,59),FieldHover=Color3.
fromRGB(45,51,74),Selected=Color3.fromRGB(41,66,111),SelectionBar=Color3.fromRGB(122,162,247),Text=
Color3.fromRGB(192,202,245),TextDim=Color3.fromRGB(169,177,214),TextFaded=Color3.fromRGB(86,95,137)
,TextHeader=Color3.fromRGB(125,135,190),Accent=Color3.fromRGB(122,162,247),PropString=Color3.
fromRGB(158,206,106),PropNumber=Color3.fromRGB(255,158,100),PropInstance=Color3.fromRGB(125,207,255
),PropEnum=Color3.fromRGB(224,175,104),PropNil=Color3.fromRGB(86,95,137),PropDefault=Color3.
fromRGB(192,202,245)}},{Name='Dracula',Colors={Background=Color3.fromRGB(33,34,44),Window=Color3.
fromRGB(40,42,54),TitleBar=Color3.fromRGB(30,31,40),Border=Color3.fromRGB(68,71,90),BorderSoft=
Color3.fromRGB(52,55,70),Field=Color3.fromRGB(48,50,64),FieldHover=Color3.fromRGB(59,62,78),
Selected=Color3.fromRGB(68,54,95),SelectionBar=Color3.fromRGB(189,147,249),Text=Color3.fromRGB(248,
248,242),TextDim=Color3.fromRGB(190,190,185),TextFaded=Color3.fromRGB(120,120,130),TextHeader=
Color3.fromRGB(160,160,170),Accent=Color3.fromRGB(189,147,249),PropString=Color3.fromRGB(80,250,123
),PropNumber=Color3.fromRGB(255,184,108),PropInstance=Color3.fromRGB(139,233,253),PropEnum=Color3.
fromRGB(241,250,140),PropNil=Color3.fromRGB(120,120,130),PropDefault=Color3.fromRGB(248,248,242)}},
{Name='Solarized Dark',Colors={Background=Color3.fromRGB(0,33,41),Window=Color3.fromRGB(0,43,54),
TitleBar=Color3.fromRGB(0,29,36),Border=Color3.fromRGB(7,54,66),BorderSoft=Color3.fromRGB(3,45,56),
Field=Color3.fromRGB(7,54,66),FieldHover=Color3.fromRGB(12,66,80),Selected=Color3.fromRGB(18,78,92)
,SelectionBar=Color3.fromRGB(38,139,210),Text=Color3.fromRGB(238,232,213),TextDim=Color3.fromRGB(
147,161,161),TextFaded=Color3.fromRGB(101,123,131),TextHeader=Color3.fromRGB(131,148,150),Accent=
Color3.fromRGB(38,139,210),PropString=Color3.fromRGB(133,153,0),PropNumber=Color3.fromRGB(203,75,22
),PropInstance=Color3.fromRGB(42,161,152),PropEnum=Color3.fromRGB(181,137,0),PropNil=Color3.
fromRGB(101,123,131),PropDefault=Color3.fromRGB(238,232,213)}},{Name='Catppuccin Mocha',Colors={
Background=Color3.fromRGB(17,17,27),Window=Color3.fromRGB(30,30,46),TitleBar=Color3.fromRGB(24,24,
37),Border=Color3.fromRGB(69,71,90),BorderSoft=Color3.fromRGB(49,50,68),Field=Color3.fromRGB(41,42,
58),FieldHover=Color3.fromRGB(49,50,68),Selected=Color3.fromRGB(58,53,88),SelectionBar=Color3.
fromRGB(203,166,247),Text=Color3.fromRGB(205,214,244),TextDim=Color3.fromRGB(186,194,222),TextFaded
=Color3.fromRGB(127,132,156),TextHeader=Color3.fromRGB(166,173,200),Accent=Color3.fromRGB(203,166,
247),PropString=Color3.fromRGB(166,227,161),PropNumber=Color3.fromRGB(250,179,135),PropInstance=
Color3.fromRGB(137,220,235),PropEnum=Color3.fromRGB(249,226,175),PropNil=Color3.fromRGB(127,132,156
),PropDefault=Color3.fromRGB(205,214,244)}},{Name='Monokai',Colors={Background=Color3.fromRGB(25,26
,24),Window=Color3.fromRGB(39,40,34),TitleBar=Color3.fromRGB(31,32,28),Border=Color3.fromRGB(73,72,
62),BorderSoft=Color3.fromRGB(55,55,48),Field=Color3.fromRGB(48,49,43),FieldHover=Color3.fromRGB(60
,61,54),Selected=Color3.fromRGB(73,64,42),SelectionBar=Color3.fromRGB(253,151,31),Text=Color3.
fromRGB(248,248,242),TextDim=Color3.fromRGB(190,190,180),TextFaded=Color3.fromRGB(117,113,94),
TextHeader=Color3.fromRGB(160,155,135),Accent=Color3.fromRGB(253,151,31),PropString=Color3.fromRGB(
230,219,116),PropNumber=Color3.fromRGB(174,129,255),PropInstance=Color3.fromRGB(102,217,239),
PropEnum=Color3.fromRGB(166,226,46),PropNil=Color3.fromRGB(117,113,94),PropDefault=Color3.fromRGB(
248,248,242)}},{Name='Cherry Blossom',Colors={Background=Color3.fromRGB(24,15,20),Window=Color3.
fromRGB(36,24,31),TitleBar=Color3.fromRGB(28,18,24),Border=Color3.fromRGB(80,50,64),BorderSoft=
Color3.fromRGB(55,35,45),Field=Color3.fromRGB(45,30,39),FieldHover=Color3.fromRGB(62,40,52),
Selected=Color3.fromRGB(90,50,68),SelectionBar=Color3.fromRGB(255,155,190),Text=Color3.fromRGB(255,
235,242),TextDim=Color3.fromRGB(210,165,185),TextFaded=Color3.fromRGB(145,100,120),TextHeader=
Color3.fromRGB(185,130,155),Accent=Color3.fromRGB(255,155,190),PropString=Color3.fromRGB(255,210,
145),PropNumber=Color3.fromRGB(255,145,170),PropInstance=Color3.fromRGB(190,190,255),PropEnum=
Color3.fromRGB(190,235,170),PropNil=Color3.fromRGB(145,100,120),PropDefault=Color3.fromRGB(255,235,
242)}},{Name='Mint Slate',Colors={Background=Color3.fromRGB(13,22,22),Window=Color3.fromRGB(20,34,
34),TitleBar=Color3.fromRGB(12,26,26),Border=Color3.fromRGB(38,70,66),BorderSoft=Color3.fromRGB(28,
50,48),Field=Color3.fromRGB(25,45,44),FieldHover=Color3.fromRGB(35,62,60),Selected=Color3.fromRGB(
38,82,75),SelectionBar=Color3.fromRGB(95,230,190),Text=Color3.fromRGB(225,245,240),TextDim=Color3.
fromRGB(150,190,180),TextFaded=Color3.fromRGB(95,130,125),TextHeader=Color3.fromRGB(125,165,155),
Accent=Color3.fromRGB(95,230,190),PropString=Color3.fromRGB(150,245,180),PropNumber=Color3.fromRGB(
130,210,255),PropInstance=Color3.fromRGB(130,245,235),PropEnum=Color3.fromRGB(220,230,150),PropNil=
Color3.fromRGB(95,130,125),PropDefault=Color3.fromRGB(225,245,240)}},{Name='Amber Terminal',Colors=
{Background=Color3.fromRGB(12,9,3),Window=Color3.fromRGB(22,17,7),TitleBar=Color3.fromRGB(15,11,4),
Border=Color3.fromRGB(65,45,14),BorderSoft=Color3.fromRGB(38,28,10),Field=Color3.fromRGB(30,22,8),
FieldHover=Color3.fromRGB(46,33,11),Selected=Color3.fromRGB(80,52,14),SelectionBar=Color3.fromRGB(
255,176,50),Text=Color3.fromRGB(255,230,180),TextDim=Color3.fromRGB(210,165,95),TextFaded=Color3.
fromRGB(135,95,45),TextHeader=Color3.fromRGB(180,125,60),Accent=Color3.fromRGB(255,176,50),
PropString=Color3.fromRGB(255,210,95),PropNumber=Color3.fromRGB(255,145,70),PropInstance=Color3.
fromRGB(255,190,110),PropEnum=Color3.fromRGB(220,220,120),PropNil=Color3.fromRGB(135,95,45),
PropDefault=Color3.fromRGB(255,230,180)}},{Name='Royal Navy',Colors={Background=Color3.fromRGB(7,10
,24),Window=Color3.fromRGB(13,18,40),TitleBar=Color3.fromRGB(8,12,30),Border=Color3.fromRGB(35,45,
82),BorderSoft=Color3.fromRGB(22,30,58),Field=Color3.fromRGB(19,27,52),FieldHover=Color3.fromRGB(28
,39,72),Selected=Color3.fromRGB(38,58,105),SelectionBar=Color3.fromRGB(90,145,255),Text=Color3.
fromRGB(230,235,255),TextDim=Color3.fromRGB(160,175,215),TextFaded=Color3.fromRGB(95,110,150),
TextHeader=Color3.fromRGB(125,145,190),Accent=Color3.fromRGB(90,145,255),PropString=Color3.fromRGB(
140,220,180),PropNumber=Color3.fromRGB(170,170,255),PropInstance=Color3.fromRGB(110,200,255),
PropEnum=Color3.fromRGB(240,210,130),PropNil=Color3.fromRGB(95,110,150),PropDefault=Color3.fromRGB(
230,235,255)}},{Name='Graphite',Colors={Background=Color3.fromRGB(12,12,13),Window=Color3.fromRGB(
22,22,24),TitleBar=Color3.fromRGB(16,16,18),Border=Color3.fromRGB(48,48,52),BorderSoft=Color3.
fromRGB(32,32,36),Field=Color3.fromRGB(30,30,34),FieldHover=Color3.fromRGB(42,42,47),Selected=
Color3.fromRGB(55,55,62),SelectionBar=Color3.fromRGB(170,170,180),Text=Color3.fromRGB(235,235,238),
TextDim=Color3.fromRGB(165,165,172),TextFaded=Color3.fromRGB(105,105,112),TextHeader=Color3.
fromRGB(135,135,145),Accent=Color3.fromRGB(170,170,180),PropString=Color3.fromRGB(210,210,160),
PropNumber=Color3.fromRGB(160,190,230),PropInstance=Color3.fromRGB(160,210,230),PropEnum=Color3.
fromRGB(190,220,170),PropNil=Color3.fromRGB(105,105,112),PropDefault=Color3.fromRGB(235,235,238)}},
{Name='Blood Moon',Colors={Background=Color3.fromRGB(16,5,7),Window=Color3.fromRGB(28,9,12),
TitleBar=Color3.fromRGB(20,6,8),Border=Color3.fromRGB(70,24,28),BorderSoft=Color3.fromRGB(44,14,17)
,Field=Color3.fromRGB(36,12,15),FieldHover=Color3.fromRGB(54,18,22),Selected=Color3.fromRGB(85,25,
32),SelectionBar=Color3.fromRGB(255,65,75),Text=Color3.fromRGB(255,225,225),TextDim=Color3.fromRGB(
205,140,145),TextFaded=Color3.fromRGB(135,75,80),TextHeader=Color3.fromRGB(175,100,105),Accent=
Color3.fromRGB(255,65,75),PropString=Color3.fromRGB(255,170,120),PropNumber=Color3.fromRGB(255,115,
125),PropInstance=Color3.fromRGB(255,145,155),PropEnum=Color3.fromRGB(230,195,115),PropNil=Color3.
fromRGB(135,75,80),PropDefault=Color3.fromRGB(255,225,225)}},{Name='Glass Steel',Colors={Background
=Color3.fromRGB(18,22,26),Window=Color3.fromRGB(28,34,40),TitleBar=Color3.fromRGB(22,27,32),Border=
Color3.fromRGB(58,70,82),BorderSoft=Color3.fromRGB(40,48,56),Field=Color3.fromRGB(34,42,50),
FieldHover=Color3.fromRGB(45,55,65),Selected=Color3.fromRGB(48,68,84),SelectionBar=Color3.fromRGB(
135,200,235),Text=Color3.fromRGB(230,240,245),TextDim=Color3.fromRGB(160,180,190),TextFaded=Color3.
fromRGB(100,120,130),TextHeader=Color3.fromRGB(130,155,168),Accent=Color3.fromRGB(135,200,235),
PropString=Color3.fromRGB(170,230,200),PropNumber=Color3.fromRGB(150,190,240),PropInstance=Color3.
fromRGB(135,215,245),PropEnum=Color3.fromRGB(220,220,160),PropNil=Color3.fromRGB(100,120,130),
PropDefault=Color3.fromRGB(230,240,245)}},{Name='Synthwave',Colors={Background=Color3.fromRGB(20,8,
35),Window=Color3.fromRGB(32,14,52),TitleBar=Color3.fromRGB(24,9,42),Border=Color3.fromRGB(75,35,
100),BorderSoft=Color3.fromRGB(48,22,70),Field=Color3.fromRGB(42,18,62),FieldHover=Color3.fromRGB(
60,26,86),Selected=Color3.fromRGB(82,42,112),SelectionBar=Color3.fromRGB(255,80,220),Text=Color3.
fromRGB(245,230,255),TextDim=Color3.fromRGB(200,150,220),TextFaded=Color3.fromRGB(135,90,160),
TextHeader=Color3.fromRGB(180,115,205),Accent=Color3.fromRGB(255,80,220),PropString=Color3.fromRGB(
255,220,95),PropNumber=Color3.fromRGB(255,120,190),PropInstance=Color3.fromRGB(80,235,255),PropEnum
=Color3.fromRGB(140,255,170),PropNil=Color3.fromRGB(135,90,160),PropDefault=Color3.fromRGB(245,230,
255)}},{Name='Vapor Ice',Colors={Background=Color3.fromRGB(12,18,28),Window=Color3.fromRGB(22,31,46
),TitleBar=Color3.fromRGB(16,24,36),Border=Color3.fromRGB(45,68,92),BorderSoft=Color3.fromRGB(32,48
,68),Field=Color3.fromRGB(28,42,62),FieldHover=Color3.fromRGB(38,58,82),Selected=Color3.fromRGB(48,
70,98),SelectionBar=Color3.fromRGB(110,230,255),Text=Color3.fromRGB(230,245,255),TextDim=Color3.
fromRGB(165,200,215),TextFaded=Color3.fromRGB(100,130,150),TextHeader=Color3.fromRGB(135,170,190),
Accent=Color3.fromRGB(110,230,255),PropString=Color3.fromRGB(185,255,220),PropNumber=Color3.
fromRGB(160,185,255),PropInstance=Color3.fromRGB(130,235,255),PropEnum=Color3.fromRGB(255,205,250),
PropNil=Color3.fromRGB(100,130,150),PropDefault=Color3.fromRGB(230,245,255)}},{Name='Pumpkin',
Colors={Background=Color3.fromRGB(18,10,5),Window=Color3.fromRGB(30,18,9),TitleBar=Color3.fromRGB(
22,13,6),Border=Color3.fromRGB(75,42,18),BorderSoft=Color3.fromRGB(48,28,13),Field=Color3.fromRGB(
40,24,12),FieldHover=Color3.fromRGB(58,34,15),Selected=Color3.fromRGB(88,48,16),SelectionBar=Color3
.fromRGB(255,125,35),Text=Color3.fromRGB(255,235,215),TextDim=Color3.fromRGB(220,165,120),TextFaded
=Color3.fromRGB(145,95,60),TextHeader=Color3.fromRGB(190,125,80),Accent=Color3.fromRGB(255,125,35),
PropString=Color3.fromRGB(255,205,110),PropNumber=Color3.fromRGB(255,145,80),PropInstance=Color3.
fromRGB(255,185,125),PropEnum=Color3.fromRGB(180,230,130),PropNil=Color3.fromRGB(145,95,60),
PropDefault=Color3.fromRGB(255,235,215)}},{Name='Aqua Matrix',Colors={Background=Color3.fromRGB(3,
13,15),Window=Color3.fromRGB(8,25,28),TitleBar=Color3.fromRGB(4,18,20),Border=Color3.fromRGB(20,70,
76),BorderSoft=Color3.fromRGB(14,45,50),Field=Color3.fromRGB(12,36,40),FieldHover=Color3.fromRGB(18
,55,60),Selected=Color3.fromRGB(24,82,88),SelectionBar=Color3.fromRGB(70,255,230),Text=Color3.
fromRGB(220,255,250),TextDim=Color3.fromRGB(140,215,205),TextFaded=Color3.fromRGB(75,140,135),
TextHeader=Color3.fromRGB(105,180,170),Accent=Color3.fromRGB(70,255,230),PropString=Color3.fromRGB(
130,255,170),PropNumber=Color3.fromRGB(95,205,255),PropInstance=Color3.fromRGB(75,245,255),PropEnum
=Color3.fromRGB(220,255,140),PropNil=Color3.fromRGB(75,140,135),PropDefault=Color3.fromRGB(220,255,
250)}},{Name='Deep Space',Colors={Background=Color3.fromRGB(6,6,14),Window=Color3.fromRGB(11,11,22)
,TitleBar=Color3.fromRGB(4,4,11),Border=Color3.fromRGB(28,28,52),BorderSoft=Color3.fromRGB(16,16,32
),Field=Color3.fromRGB(14,14,28),FieldHover=Color3.fromRGB(22,22,42),Selected=Color3.fromRGB(34,28,
78),SelectionBar=Color3.fromRGB(120,90,255),Text=Color3.fromRGB(225,225,245),TextDim=Color3.
fromRGB(155,155,190),TextFaded=Color3.fromRGB(95,95,130),TextHeader=Color3.fromRGB(130,130,170),
Accent=Color3.fromRGB(120,90,255),PropString=Color3.fromRGB(190,150,255),PropNumber=Color3.fromRGB(
140,170,255),PropInstance=Color3.fromRGB(170,200,255),PropEnum=Color3.fromRGB(220,180,255),PropNil=
Color3.fromRGB(95,95,130),PropDefault=Color3.fromRGB(225,225,245)}},{Name='Galaxy',Colors={
Background=Color3.fromRGB(10,8,30),Window=Color3.fromRGB(18,14,46),TitleBar=Color3.fromRGB(8,6,24),
Border=Color3.fromRGB(58,42,110),BorderSoft=Color3.fromRGB(32,24,70),Field=Color3.fromRGB(26,20,60)
,FieldHover=Color3.fromRGB(40,30,88),Selected=Color3.fromRGB(72,38,130),SelectionBar=Color3.
fromRGB(220,130,255),Text=Color3.fromRGB(238,230,255),TextDim=Color3.fromRGB(190,170,230),TextFaded
=Color3.fromRGB(120,105,165),TextHeader=Color3.fromRGB(165,140,210),Accent=Color3.fromRGB(220,130,
255),PropString=Color3.fromRGB(255,175,220),PropNumber=Color3.fromRGB(155,180,255),PropInstance=
Color3.fromRGB(180,220,255),PropEnum=Color3.fromRGB(255,220,150),PropNil=Color3.fromRGB(120,105,165
),PropDefault=Color3.fromRGB(238,230,255)}},{Name='Nebula',Colors={Background=Color3.fromRGB(14,10,
24),Window=Color3.fromRGB(26,18,42),TitleBar=Color3.fromRGB(12,8,22),Border=Color3.fromRGB(82,40,95
),BorderSoft=Color3.fromRGB(46,24,56),Field=Color3.fromRGB(38,22,50),FieldHover=Color3.fromRGB(55,
32,72),Selected=Color3.fromRGB(120,45,110),SelectionBar=Color3.fromRGB(255,105,200),Text=Color3.
fromRGB(248,232,255),TextDim=Color3.fromRGB(200,160,215),TextFaded=Color3.fromRGB(140,100,155),
TextHeader=Color3.fromRGB(180,130,200),Accent=Color3.fromRGB(255,105,200),PropString=Color3.
fromRGB(255,180,230),PropNumber=Color3.fromRGB(180,140,255),PropInstance=Color3.fromRGB(140,200,255
),PropEnum=Color3.fromRGB(255,200,140),PropNil=Color3.fromRGB(140,100,155),PropDefault=Color3.
fromRGB(248,232,255)}},{Name='Pitch Black',Colors={Background=Color3.fromRGB(0,0,0),Window=Color3.
fromRGB(8,8,8),TitleBar=Color3.fromRGB(0,0,0),Border=Color3.fromRGB(30,30,30),BorderSoft=Color3.
fromRGB(18,18,18),Field=Color3.fromRGB(14,14,14),FieldHover=Color3.fromRGB(24,24,24),Selected=
Color3.fromRGB(40,40,40),SelectionBar=Color3.fromRGB(220,220,220),Text=Color3.fromRGB(240,240,240),
TextDim=Color3.fromRGB(160,160,160),TextFaded=Color3.fromRGB(95,95,95),TextHeader=Color3.fromRGB(
130,130,130),Accent=Color3.fromRGB(220,220,220),PropString=Color3.fromRGB(220,220,180),PropNumber=
Color3.fromRGB(180,200,240),PropInstance=Color3.fromRGB(170,220,240),PropEnum=Color3.fromRGB(200,
230,180),PropNil=Color3.fromRGB(95,95,95),PropDefault=Color3.fromRGB(240,240,240)}},{Name='Aurora',
Colors={Background=Color3.fromRGB(8,16,26),Window=Color3.fromRGB(14,26,40),TitleBar=Color3.fromRGB(
6,14,24),Border=Color3.fromRGB(40,80,90),BorderSoft=Color3.fromRGB(22,44,56),Field=Color3.fromRGB(
20,38,52),FieldHover=Color3.fromRGB(30,56,72),Selected=Color3.fromRGB(38,92,110),SelectionBar=
Color3.fromRGB(120,255,200),Text=Color3.fromRGB(225,250,240),TextDim=Color3.fromRGB(150,200,195),
TextFaded=Color3.fromRGB(90,135,140),TextHeader=Color3.fromRGB(120,175,175),Accent=Color3.fromRGB(
120,255,200),PropString=Color3.fromRGB(180,255,200),PropNumber=Color3.fromRGB(150,200,255),
PropInstance=Color3.fromRGB(180,230,255),PropEnum=Color3.fromRGB(255,220,170),PropNil=Color3.
fromRGB(90,135,140),PropDefault=Color3.fromRGB(225,250,240)}},{Name='Lava',Colors={Background=
Color3.fromRGB(14,6,4),Window=Color3.fromRGB(26,10,6),TitleBar=Color3.fromRGB(18,7,4),Border=Color3
.fromRGB(90,30,12),BorderSoft=Color3.fromRGB(50,18,10),Field=Color3.fromRGB(40,14,8),FieldHover=
Color3.fromRGB(60,22,12),Selected=Color3.fromRGB(110,38,16),SelectionBar=Color3.fromRGB(255,110,30)
,Text=Color3.fromRGB(255,230,210),TextDim=Color3.fromRGB(220,160,120),TextFaded=Color3.fromRGB(140,
90,60),TextHeader=Color3.fromRGB(190,120,80),Accent=Color3.fromRGB(255,110,30),PropString=Color3.
fromRGB(255,200,90),PropNumber=Color3.fromRGB(255,130,70),PropInstance=Color3.fromRGB(255,170,110),
PropEnum=Color3.fromRGB(255,220,100),PropNil=Color3.fromRGB(140,90,60),PropDefault=Color3.fromRGB(
255,230,210)}},{Name='Cyberpunk',Colors={Background=Color3.fromRGB(8,4,20),Window=Color3.fromRGB(16
,8,36),TitleBar=Color3.fromRGB(6,2,16),Border=Color3.fromRGB(255,30,130),BorderSoft=Color3.fromRGB(
40,16,70),Field=Color3.fromRGB(24,12,50),FieldHover=Color3.fromRGB(40,20,80),Selected=Color3.
fromRGB(80,20,90),SelectionBar=Color3.fromRGB(0,255,240),Text=Color3.fromRGB(240,240,255),TextDim=
Color3.fromRGB(200,140,230),TextFaded=Color3.fromRGB(120,80,150),TextHeader=Color3.fromRGB(255,60,
180),Accent=Color3.fromRGB(0,255,240),PropString=Color3.fromRGB(255,240,90),PropNumber=Color3.
fromRGB(255,80,200),PropInstance=Color3.fromRGB(0,230,255),PropEnum=Color3.fromRGB(150,255,130),
PropNil=Color3.fromRGB(120,80,150),PropDefault=Color3.fromRGB(240,240,255)}},{Name='Carbon',Colors=
{Background=Color3.fromRGB(18,18,20),Window=Color3.fromRGB(26,26,30),TitleBar=Color3.fromRGB(14,14,
16),Border=Color3.fromRGB(60,60,66),BorderSoft=Color3.fromRGB(38,38,42),Field=Color3.fromRGB(32,32,
36),FieldHover=Color3.fromRGB(46,46,52),Selected=Color3.fromRGB(62,62,72),SelectionBar=Color3.
fromRGB(255,90,60),Text=Color3.fromRGB(230,230,232),TextDim=Color3.fromRGB(165,165,170),TextFaded=
Color3.fromRGB(110,110,115),TextHeader=Color3.fromRGB(140,140,145),Accent=Color3.fromRGB(255,90,60)
,PropString=Color3.fromRGB(255,180,130),PropNumber=Color3.fromRGB(170,200,240),PropInstance=Color3.
fromRGB(160,220,240),PropEnum=Color3.fromRGB(200,230,160),PropNil=Color3.fromRGB(110,110,115),
PropDefault=Color3.fromRGB(230,230,232)}},{Name='Toxic',Colors={Background=Color3.fromRGB(10,14,6),
Window=Color3.fromRGB(18,24,10),TitleBar=Color3.fromRGB(8,12,5),Border=Color3.fromRGB(70,100,20),
BorderSoft=Color3.fromRGB(36,50,14),Field=Color3.fromRGB(28,38,12),FieldHover=Color3.fromRGB(44,60,
18),Selected=Color3.fromRGB(70,100,24),SelectionBar=Color3.fromRGB(190,255,40),Text=Color3.fromRGB(
235,255,210),TextDim=Color3.fromRGB(180,210,130),TextFaded=Color3.fromRGB(110,140,70),TextHeader=
Color3.fromRGB(150,185,95),Accent=Color3.fromRGB(190,255,40),PropString=Color3.fromRGB(220,255,110)
,PropNumber=Color3.fromRGB(160,220,90),PropInstance=Color3.fromRGB(180,240,120),PropEnum=Color3.
fromRGB(240,255,140),PropNil=Color3.fromRGB(110,140,70),PropDefault=Color3.fromRGB(235,255,210)}},{
Name='Void',Colors={Background=Color3.fromRGB(4,4,8),Window=Color3.fromRGB(10,10,16),TitleBar=
Color3.fromRGB(2,2,6),Border=Color3.fromRGB(40,30,80),BorderSoft=Color3.fromRGB(20,16,40),Field=
Color3.fromRGB(14,12,26),FieldHover=Color3.fromRGB(26,22,50),Selected=Color3.fromRGB(48,30,100),
SelectionBar=Color3.fromRGB(140,80,255),Text=Color3.fromRGB(220,215,240),TextDim=Color3.fromRGB(150
,140,185),TextFaded=Color3.fromRGB(90,80,125),TextHeader=Color3.fromRGB(125,110,165),Accent=Color3.
fromRGB(140,80,255),PropString=Color3.fromRGB(210,160,255),PropNumber=Color3.fromRGB(150,130,240),
PropInstance=Color3.fromRGB(180,160,255),PropEnum=Color3.fromRGB(180,200,255),PropNil=Color3.
fromRGB(90,80,125),PropDefault=Color3.fromRGB(220,215,240)}}}table.sort(S,function(T,U)return T.
Name<U.Name end)local function GetDefaultPresetName()return S[1]and S[1].Name or'Custom'end local 
function ApplyPreset(T)R=true O=true for U,V in T.Colors do SetThemeColor(U,V)end O=false R=false
SetThemePresetName(T.Name)if N then pcall(N)end end local T local U local function ApplyFPSCap(V)
local W,X pcall(function()local Y=getgenv and getgenv()or nil if Y then W=Y.setfpscap X=Y.getfpscap
end end)if type(W)~='function'then return false,'setfpscap not available'end if T==nil then if
type(X)=='function'then local Y,Z=pcall(X)if Y and type(Z)=='number'and Z>0 and Z~=math.huge then T
=Z end end T=T or 60 end if V then local Y,Z=pcall(W,math.huge)if Y then U=true end return Y,Z else
if U then local Y,Z=pcall(W,T)if Y then U=false end return Y,Z end return true end end local 
function BeautifyJson(V,W)W=W or'    'local X={}local Y=0 local Z=false local _=false local aa=#V
local function Newline()X[#X+1]='\n'X[#X+1]=string.rep(W,Y)end for ab=1,aa do local ac=V:sub(ab,ab)
if Z then X[#X+1]=ac if _ then _=false elseif ac=='\\'then _=true elseif ac=='"'then Z=false end
else if ac=='"'then Z=true X[#X+1]=ac elseif ac=='{'or ac=='['then X[#X+1]=ac local ad=V:sub(ab+1,
ab+1)if ad=='}'or ad==']'then else Y+=1 Newline()end elseif ac=='}'or ac==']'then local ad=V:sub(ab
-1,ab-1)if ad~='{'and ad~='['then Y-=1 Newline()end X[#X+1]=ac elseif ac==','then X[#X+1]=ac
Newline()elseif ac==':'then X[#X+1]=': 'elseif ac~=' 'and ac~='\t'and ac~='\n'and ac~='\r'then X[#X
+1]=ac end end end return table.concat(X)end local aa={Bold=Enum.Font.GothamBold,SemiBold=Enum.Font
.GothamSemibold,Medium=Enum.Font.GothamMedium,Regular=Enum.Font.Gotham,Mono=Enum.Font.RobotoMono,
Code=Enum.Font.Code,Heading=Enum.Font.Ubuntu}local ab={}for ac,ad in aa do ab[ac]=ad end local ac=
TweenInfo.new(0.12,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)local ad=TweenInfo.new(0.25,Enum.
EasingStyle.Quint,Enum.EasingDirection.Out)local V={}function V:CreateInstance(W,X)local Y=Instance
.new(W)for Z,_ in X do Y[Z]=_ end return Y end function V:AddStroke(W,X,Y,Z)local _=self:
CreateInstance('UIStroke',{Color=K.Border,Thickness=Y or 1,Transparency=Z or 0,ApplyStrokeMode=Enum
.ApplyStrokeMode.Border,Parent=W})if type(X)=='string'then local ae=X _.Color=K[ae]or K.Border
BindTheme(ae,function(af)if _ and _.Parent then _.Color=af end end)else _.Color=X or K.Border end
return _ end function V:AddPadding(ae,af,W,X,Y)return self:CreateInstance('UIPadding',{PaddingTop=
UDim.new(0,af or 0),PaddingRight=UDim.new(0,W or af or 0),PaddingBottom=UDim.new(0,X or af or 0),
PaddingLeft=UDim.new(0,Y or W or af or 0),Parent=ae})end function V:AddListLayout(ae,af,W)return
self:CreateInstance('UIListLayout',{FillDirection=W or Enum.FillDirection.Vertical,Padding=UDim.
new(0,af or 4),SortOrder=Enum.SortOrder.LayoutOrder,Parent=ae})end function V:Tween(ae,af,W)d.
TweenService:Create(ae,W or ac,af):Play()end function V:CreateScreenGui()local ae=self:
CreateInstance('ScreenGui',{Name='VexExplorer',ResetOnSpawn=false,ZIndexBehavior=Enum.
ZIndexBehavior.Sibling,IgnoreGuiInset=true})local af=pcall(function()ae.Parent=gethui()end)if not
af then ae.Parent=d.CoreGui end self.MainGui=ae return ae end function V:CreateWindow(ae)local af=
ae.Parent local W=ae.Title or'Window'local X=ae.Brand local Y=ae.Size or UDim2.fromOffset(380,480)
local Z=ae.Position or UDim2.new(0.5,-Y.X.Offset/2,0.5,-Y.Y.Offset/2)local _=self:CreateInstance(
'Frame',{Size=Y,Position=Z,BackgroundTransparency=1,BorderSizePixel=0,ClipsDescendants=true,Parent=
af})local ag=self:AddStroke(_,'Border',1)local ah=X and 36 or 30 local ai=self:CreateInstance(
'Frame',{Size=UDim2.new(1,0,0,ah),BackgroundColor3=K.TitleBar,BackgroundTransparency=M.TitleBar,
BorderSizePixel=0,Parent=_})BindTheme('TitleBar',function(aj)ai.BackgroundColor3=aj end)
BindTransparency('TitleBar',function(aj)ai.BackgroundTransparency=aj end)local aj=self:
CreateInstance('TextLabel',{Size=UDim2.new(1,-240,1,0),Position=UDim2.new(0,12,0,0),
BackgroundTransparency=1,Font=aa.Bold,Text=X and''or W:upper(),TextColor3=K.Text,TextSize=12,
TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,Visible=not X,
ZIndex=4,Parent=ai})BindTheme('Text',function(ak)aj.TextColor3=ak end)if X then local ak=self:
CreateInstance('Frame',{Size=UDim2.new(0,260,1,0),Position=UDim2.new(0,12,0,0),
BackgroundTransparency=1,ZIndex=4,Parent=ai})local al=self:AddListLayout(ak,6,Enum.FillDirection.
Horizontal)al.VerticalAlignment=Enum.VerticalAlignment.Center local am=self:CreateInstance(
'TextLabel',{AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.new(0,0,0,18),BackgroundTransparency=1,
Font=aa.Bold,Text=`VEX [{s:FetchVersion()}]`,TextColor3=K.Text,TextSize=13,LayoutOrder=1,ZIndex=4,
Parent=ak})BindTheme('Text',function(an)if am and am.Parent then am.TextColor3=an end end)local an=
self:CreateInstance('TextLabel',{Size=UDim2.new(0,8,0,18),BackgroundTransparency=1,Font=aa.Bold,
Text='-',TextColor3=K.TextFaded,TextSize=13,LayoutOrder=2,ZIndex=4,Parent=ak})BindTheme('TextFaded'
,function(ao)if an and an.Parent then an.TextColor3=ao end end)local ao=self:CreateInstance(
'TextLabel',{AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.new(0,0,0,18),BackgroundTransparency=1,
Font=aa.Bold,Text='Explorer',TextColor3=K.Accent,TextSize=13,LayoutOrder=3,ZIndex=4,Parent=ak})
BindTheme('Accent',function(ap)if ao and ao.Parent then ao.TextColor3=ap end end)local ap=self:
CreateInstance('TextLabel',{AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.new(0,0,0,18),
BackgroundTransparency=1,Font=aa.Medium,Text='By Vez',TextColor3=K.TextFaded,TextSize=11,
LayoutOrder=4,ZIndex=4,Parent=ak})BindTheme('TextFaded',function(aq)if ap and ap.Parent then ap.
TextColor3=aq end end)end local ak=self:CreateInstance('Frame',{Size=UDim2.new(0,0,0,22),
AutomaticSize=Enum.AutomaticSize.X,Position=UDim2.new(1,-8,0.5,-11),AnchorPoint=Vector2.new(1,0),
BackgroundTransparency=1,ZIndex=4,Parent=ai})local al=self:AddListLayout(ak,6,Enum.FillDirection.
Horizontal)al.HorizontalAlignment=Enum.HorizontalAlignment.Right al.VerticalAlignment=Enum.
VerticalAlignment.Center local am=self:CreateInstance('Frame',{Size=UDim2.new(1,0,1,-ah),Position=
UDim2.new(0,0,0,ah),BackgroundColor3=K.Window,BackgroundTransparency=M.Window,BorderSizePixel=0,
Parent=_})BindTheme('Window',function(an)am.BackgroundColor3=an end)BindTransparency('Window',
function(an)am.BackgroundTransparency=an end)local an=false local ao local ap,aq local ar,as,at
Track(ai.InputBegan:Connect(function(au)if ao then return end if au.UserInputType==Enum.
UserInputType.MouseButton1 or au.UserInputType==Enum.UserInputType.Touch then an=true ap=au.
Position aq=_.Position end end))Track(d.UserInputService.InputChanged:Connect(function(au)if ao
then return end if not an then return end if au.UserInputType~=Enum.UserInputType.MouseMovement and
au.UserInputType~=Enum.UserInputType.Touch then return end local av=au.Position-ap _.Position=UDim2
.new(aq.X.Scale,aq.X.Offset+av.X,aq.Y.Scale,aq.Y.Offset+av.Y)end))Track(d.UserInputService.
InputEnded:Connect(function(au)if au.UserInputType~=Enum.UserInputType.MouseButton1 and au.
UserInputType~=Enum.UserInputType.Touch then return end if not an then return end an=false local av
=workspace.CurrentCamera if not av then return end local aw=av.ViewportSize local ax=_.AbsoluteSize
.X local ay=_.AbsoluteSize.Y local az=_.AbsolutePosition.X local aA=_.AbsolutePosition.Y local aB=
40 local aC=az local aD=aA local aE=false if az<=aB then aC=0 aE=true elseif az+ax>=aw.X-aB then aC
=aw.X-ax aE=true end local aF=0 pcall(function()local aG=d.GuiService:GetGuiInset()aF=aG.Y end)if
aA<=aB+aF then aD=-aF aE=true elseif aA+ay>=aw.Y-aB then aD=aw.Y-ay aE=true end if not aE and _.
Parent then for aG,aH in _.Parent:GetChildren()do if aH~=_ and aH:IsA('Frame')and aH.Visible then
local aI=aH.AbsolutePosition.X local aJ=aH.AbsolutePosition.Y local aK=aH.AbsoluteSize.X local aL=
aH.AbsoluteSize.Y local aM=aH.Position local aN=aH.Size local aO=aB+20 if math.abs(aC-aI)<=80 and
math.abs(aK-ax)<=80 then if math.abs(aA-(aJ+aL))<=aO then aC=aI _.Size=UDim2.fromOffset(aK,ay)ax=aK
local aP=aJ+aL local aQ=aw.Y-aP if ay>aQ then local aR=ay-aQ local aS=math.max(200,aL-aR)aH.Size=
UDim2.new(aN.X.Scale,aN.X.Offset,aN.Y.Scale,aN.Y.Offset-(aL-aS))aP=aJ+aS end aD=aP ay=_.
AbsoluteSize.Y break elseif math.abs((aA+ay)-aJ)<=aO then aC=aI _.Size=UDim2.fromOffset(aK,ay)ax=aK
local aP=aJ-ay if aP<0 then local aQ=-aP local aR=math.max(200,aL-aQ)aH.Position=UDim2.new(aM.X.
Scale,aM.X.Offset,aM.Y.Scale,aM.Y.Offset+(aL-aR))aH.Size=UDim2.new(aN.X.Scale,aN.X.Offset,aN.Y.
Scale,aN.Y.Offset-(aL-aR))aP=0 end aD=aP ay=_.AbsoluteSize.Y break end end end end end if aD+ay>aw.
Y then local aG=math.max(200,aw.Y-aD)_.Size=UDim2.fromOffset(_.AbsoluteSize.X,aG)end if aC~=az or
aD~=aA then local aG=aC-az local aH=aD-aA local aI=_.Position V:Tween(_,{Position=UDim2.new(aI.X.
Scale,aI.X.Offset+aG,aI.Y.Scale,aI.Y.Offset+aH)},ad)end end))local function MakeEdge(au)local av=
self:CreateInstance('Frame',{BackgroundTransparency=1,ZIndex=200,Active=true,Parent=_})if au==
'Right'then av.Size=UDim2.new(0,6,1,-32)av.Position=UDim2.new(1,-6,0,16)elseif au=='Left'then av.
Size=UDim2.new(0,6,1,-32)av.Position=UDim2.new(0,0,0,16)elseif au=='Bottom'then av.Size=UDim2.new(1
,-16,0,6)av.Position=UDim2.new(0,8,1,-6)elseif au=='Top'then av.Size=UDim2.new(1,-120,0,6)av.
Position=UDim2.new(0,60,0,0)elseif au=='BottomRight'then av.Size=UDim2.new(0,14,0,14)av.Position=
UDim2.new(1,-14,1,-14)elseif au=='BottomLeft'then av.Size=UDim2.new(0,14,0,14)av.Position=UDim2.
new(0,0,1,-14)elseif au=='TopRight'then av.Size=UDim2.new(0,12,0,12)av.Position=UDim2.new(1,-12,0,0
)elseif au=='TopLeft'then av.Size=UDim2.new(0,12,0,12)av.Position=UDim2.new(0,0,0,0)end return av
end local au=MakeEdge('Right')local av=MakeEdge('Left')local aw=MakeEdge('Bottom')local ax=
MakeEdge('Top')local ay=MakeEdge('BottomRight')local az=MakeEdge('BottomLeft')local aA=MakeEdge(
'TopRight')local aB=MakeEdge('TopLeft')local function HookEdge(aC,aD)Track(aC.InputBegan:Connect(
function(aE)if an then return end if aE.UserInputType==Enum.UserInputType.MouseButton1 or aE.
UserInputType==Enum.UserInputType.Touch then ao=aD ar=aE.Position as=_.AbsoluteSize at=_.Position
end end))end HookEdge(au,'R')HookEdge(av,'L')HookEdge(aw,'B')HookEdge(ax,'T')HookEdge(ay,'BR')
HookEdge(az,'BL')HookEdge(aA,'TR')HookEdge(aB,'TL')Track(d.UserInputService.InputChanged:Connect(
function(aC)if not ao then return end if aC.UserInputType~=Enum.UserInputType.MouseMovement and aC.
UserInputType~=Enum.UserInputType.Touch then return end local aD=aC.Position-ar local aE=280 local
aF=200 local aG=as.X local aH=as.Y local aI=0 local aJ=0 local aK=ao=='R'or ao=='BR'or ao=='TR'
local aL=ao=='L'or ao=='BL'or ao=='TL'local aM=ao=='B'or ao=='BR'or ao=='BL'local aN=ao=='T'or ao==
'TR'or ao=='TL'if aK then aG=math.max(aE,as.X+aD.X)elseif aL then local aO=as.X-aE local aP=math.
min(aD.X,aO)aG=as.X-aP aI=aP end if aM then aH=math.max(aF,as.Y+aD.Y)elseif aN then local aO=as.Y-
aF local aP=math.min(aD.Y,aO)aH=as.Y-aP aJ=aP end _.Size=UDim2.fromOffset(aG,aH)_.Position=UDim2.
new(at.X.Scale,at.X.Offset+aI,at.Y.Scale,at.Y.Offset+aJ)end))Track(d.UserInputService.InputEnded:
Connect(function(aC)if aC.UserInputType==Enum.UserInputType.MouseButton1 or aC.UserInputType==Enum.
UserInputType.Touch then ao=nil end end))local aC={Frame=_,TitleBar=ai,Body=am,TitleLabel=aj,
ButtonRow=ak}function aC:SetVisible(aD)_.Visible=aD end function aC:SetTitle(aD)aj.Text=(aD or''):
upper()end function aC:AddTitleButton(aD,aE,aF,aG,aH,aI,aJ)local aK=aH and GetUIAssetId(aH)or nil
local aL=aJ or 14 local aM=aL/2 local aN=V:CreateInstance('TextButton',{Size=UDim2.new(0,aE,0,22),
BackgroundColor3=aF and K.Accent or K.Border,BackgroundTransparency=1,BorderSizePixel=0,
AutoButtonColor=false,Font=aa.Bold,Text=aK and''or aD,TextColor3=aF and Color3.fromRGB(245,245,245)
or K.TextDim,TextSize=10,LayoutOrder=#ak:GetChildren(),ZIndex=4,Parent=ak})local aO=V:AddStroke(aN,
aF and'Accent'or'Border',1)local aP if aK then aP=V:CreateInstance('ImageLabel',{Size=UDim2.
fromOffset(aL,aL),Position=UDim2.new(0.5,-aM,0.5,-aM),BackgroundTransparency=1,Image=aK,ImageColor3
=aF and K.Text or K.TextDim,ImageTransparency=0,ScaleType=Enum.ScaleType.Fit,ZIndex=5,Parent=aN})
end local aQ=false local function GetButtonTransparency()local aR=M.TitleBar or 0 if aQ then if aF
then return math.clamp(aR*0.55,0,0.9)end return math.clamp(aR*0.65,0,0.92)end if aF then return
math.clamp(math.max(0.85,aR),0,0.96)end return math.clamp(aR+0.12,0,1)end local function 
GetButtonColor()if aQ then return aF and K.Accent or K.Selected end return aF and K.Accent or K.
Border end local function GetTextColor()if aQ and aF then return K.Red or K.Accent end if aQ then
return K.Text end return K.TextDim end local function ApplyVisual(aR)local aS=
GetButtonTransparency()local aT=GetButtonColor()local aU=GetTextColor()if aR then V:Tween(aN,{
BackgroundColor3=aT,BackgroundTransparency=aS,TextColor3=aU})if aP then V:Tween(aP,{ImageColor3=aU}
)end else aN.BackgroundColor3=aT aN.BackgroundTransparency=aS aN.TextColor3=aU if aP then if aR
then V:Tween(aP,{ImageColor3=aU})else aP.ImageColor3=aU end end end if aO then aO.Color=aF and K.
Accent or K.Border aO.Transparency=math.clamp(aS+0.1,0,1)end end BindTransparency('TitleBar',
function()if aN and aN.Parent then ApplyVisual(false)end end)if aF then BindTheme('Accent',function
()if aN and aN.Parent then ApplyVisual(false)end end)BindTheme('Text',function()if aN and aN.Parent
then ApplyVisual(false)end end)BindTheme('TextDim',function()if aN and aN.Parent then ApplyVisual(
false)end end)BindTheme('Red',function()if aN and aN.Parent then ApplyVisual(false)end end)else
BindTheme('Border',function()if aN and aN.Parent then ApplyVisual(false)end end)BindTheme('TextDim'
,function()if aN and aN.Parent then ApplyVisual(false)end end)BindTheme('Text',function()if aN and
aN.Parent then ApplyVisual(false)end end)BindTheme('Selected',function()if aN and aN.Parent then
ApplyVisual(false)end end)end Track(aN.MouseEnter:Connect(function()aQ=true ApplyVisual(true)end))
Track(aN.MouseLeave:Connect(function()aQ=false ApplyVisual(true)end))if aG then Track(aN.
MouseButton1Click:Connect(aG))end ApplyVisual(false)return aN end return aC end function V:
CreateClassIcon(ae,af)local ag=GetClassAssetId(ae)if ag then return self:CreateInstance(
'ImageLabel',{Size=UDim2.new(0,16,0,16),BackgroundTransparency=1,Image=ag,ScaleType=Enum.ScaleType.
Fit,ImageColor3=Color3.fromRGB(255,255,255),Parent=af})end return self:CreateInstance('TextLabel',{
Size=UDim2.new(0,16,0,16),BackgroundTransparency=1,Font=aa.Mono,Text='?',TextColor3=K.TextDim,
TextSize=11,Parent=af})end function V:CreateTooltip(ae,af)local ag=self:CreateInstance('Frame',{
Size=UDim2.new(0,0,0,22),AutomaticSize=Enum.AutomaticSize.X,BackgroundColor3=K.TitleBar,
BorderSizePixel=0,Visible=false,ZIndex=200,Parent=self.MainGui})self:AddStroke(ag,'Border',1)self:
AddPadding(ag,4,8,4,8)BindTheme('TitleBar',function(ah)ag.BackgroundColor3=ah end)local ah=self:
CreateInstance('TextLabel',{AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.new(0,0,1,0),
BackgroundTransparency=1,Font=aa.Medium,Text=af,TextColor3=K.Text,TextSize=11,ZIndex=201,Parent=ag}
)BindTheme('Text',function(ai)ah.TextColor3=ai end)Track(ae.MouseEnter:Connect(function()ag.Visible
=true local ai=ae.AbsolutePosition local aj=ae.AbsoluteSize ag.Position=UDim2.fromOffset(ai.X+aj.X/
2-40,ai.Y+aj.Y+6)end))Track(ae.MouseLeave:Connect(function()ag.Visible=false end))return ag end
function V:ApplyClassIcon(ae,af)if not ae then return end local ag=af and GetClassAssetId(af)if ag
then ae.Image=ag ae.ImageTransparency=0 else ae.Image=''ae.ImageTransparency=1 end end local 
function IsLuaIdentifier(ae)if type(ae)~='string'or#ae==0 then return false end if ae:match(
'^[%a_][%w_]*$')==nil then return false end local af={['and']=true,['break']=true,['do']=true,[
'else']=true,['elseif']=true,['end']=true,['false']=true,['for']=true,['function']=true,['goto']=
true,['if']=true,['in']=true,['local']=true,['nil']=true,['not']=true,['or']=true,['repeat']=true,[
'return']=true,['then']=true,['true']=true,['until']=true,['while']=true,['continue']=true}return
not af[ae]end local function FormatSegment(ae,af)if IsLuaIdentifier(ae)then return af and ae or`.{
ae}`end return`[{string.format('%q',ae)}]`end local function IsScriptViewable(ae)if not ae then
return false end local af=ae.ClassName if af=='LocalScript'or af=='ModuleScript'then return true
end if af=='Script'then local ag,ah=pcall(function()return ae.RunContext end)return ag and ah==Enum
.RunContext.Client end return false end local ae={Camera=1,Terrain=2,Folder=10,Model=11,
Configuration=12,Script=30,LocalScript=31,ModuleScript=32,RemoteEvent=40,RemoteFunction=41,
BindableEvent=42,BindableFunction=43,UnreliableRemoteEvent=44,Part=60,MeshPart=61,UnionOperation=62
,WedgePart=63,Humanoid=80}local function SortExplorerChildren(af)table.sort(af,function(ag,ah)local
ai=ag.ClassName local aj=ah.ClassName local ak=ae[ai]or 999 local al=ae[aj]or 999 if ak~=al then
return ak<al end local am=ag.Name:lower()local an=ah.Name:lower()if am~=an then return am<an end
return ai<aj end)return af end local af={}af.__index=af s=setmetatable({LocalPlayer=e,ScreenGui=nil
,ExplorerWindow=nil,PropertiesWindow=nil,SelectedInstance=nil,SelectedSet={},SelectedOrder={},
SelectionAnchor=nil,SearchQuery='',PropertyFilter='',ToggleKey=Enum.KeyCode.RightAlt,WindowVisible=
true,UnlimitedFPS=false,AutoRefreshProperties=true,RefreshDelay=0,PropertyConnections={},
PropertyRows={},Clipboard=nil,CtrlHeld=false,ShiftHeld=false,ReparentMode=false,ReparentSources={},
Tasks={},AllServicesHidden=false,NilFilterClass='',ActiveClassFilters={},HiddenServices={},
HideNilContainer=false,FilterClassOptions={'Folder','Model','Configuration','Part','MeshPart',
'UnionOperation','WedgePart','BasePart','Script','LocalScript','ModuleScript','RemoteEvent',
'RemoteFunction','BindableEvent','BindableFunction','UnreliableRemoteEvent','Humanoid',
'HumanoidDescription','Animation','AnimationTrack','Sound','SoundGroup','Frame','ScrollingFrame',
'ScreenGui','SurfaceGui','BillboardGui','TextLabel','TextButton','TextBox','ImageLabel',
'ImageButton','UIListLayout','UIGridLayout','UICorner','UIStroke','UIPadding','Tool','Accessory',
'Hat','Shirt','Pants','StringValue','NumberValue','BoolValue','IntValue','ObjectValue',
'CFrameValue','ClickDetector','ProximityPrompt','ParticleEmitter','Decal','Texture','Beam','Trail',
'Attachment','Motor6D','Weld','WeldConstraint','Player'},ConfigFolder='Vex',ConfigPath=
'Vex/Vex.lua',Version=nil,ConfigLoaded=false,ScriptViewerWindows={},NilRowHeight=22,NilRowGap=1,
NilBufferRows=4,MatchSet={},SubtreeMatchSet={},_FilterRowRefreshers={},PropertyFilters={},
PropertyFilterTemplate=nil,ExpandedInstances=setmetatable({},{__mode='k'}),SelectionHighlights=
setmetatable({},{__mode='k'}),DragOperation=nil,_JustDragged=false,UseLuaExpertDecompiler=false,
ViewedObject=nil,ViewConnection=nil,ViewSavedCFrame=nil,ViewSavedCameraType=nil,ThemePresetName=
'Crimson (Default)',ThemePresetButton=nil,ClickPartToSelect=false,_ClickPartConnection=nil,
_QuickDropdown=nil,SearchIndex={},SearchIndexByInstance=setmetatable({},{__mode='k'}),
SearchIndexBuilt=false,_SearchIndexHooked=false,_LastIndexedQuery=nil,_LastIndexedResults=nil,
_FilterChangedSinceLastSearch=false,MatchByClassName=false,MatchByProperty=false,FlatSearchResults=
false,_FlatResultsContainer=nil,_FlatResultsPool=nil,_FlatResultsItems=nil,_FlatRowHeight=22,
_FlatRowGap=0,_FlatBufferRows=6,_VTreeRows=nil,_VTreeRowsByInstance=nil,_VTreeFilteredRows=nil,
_VTreeFilterActive=false,_VTreeExpanded=nil,_VTreeContainer=nil,_VTreePool=nil,_VTreeRowHeight=22,
_VTreeRowGap=0,_VTreeBufferRows=4,_VTreeIndent=16,_VTreeScrollConn=nil,_VTreeRebuildScheduled=false
,_VTreeFilteredPageSize=150,_NilWalkCache=nil,_NilWalkCacheTime=0,_NilWalkCacheTTL=math.huge,
_NilRefreshDebounceToken=0,PinnedPaths={}},af)local function RebindFont(ag,ah)if ag==ah then return
end local ai=s.ScreenGui if not ai then return end for aj,ak in ai:GetDescendants()do if ak:IsA(
'TextLabel')or ak:IsA('TextButton')or ak:IsA('TextBox')then if ak.Font==ag then pcall(function()ak.
Font=ah end)end end end end function s:SpawnTask(ag,ah)Handle(function()if self.Tasks[ag]then
pcall(task.cancel,self.Tasks[ag])self.Tasks[ag]=nil end self.Tasks[ag]=task.spawn(ah)end,`Task Spawn ({
ag})`)end function s:ResetTasks()for ag,ah in self.Tasks do pcall(task.cancel,ah)self.Tasks[ag]=nil
end end local function ResolveInstanceText(ag)ag=tostring(ag or'')local ah=ag:lower()if ah==''or ah
=='character'or ah=='char'or ah=='hrp'or ah=='me'then return GetLocalCharacterRootPart()end if ah==
'selected'then return s.SelectedInstance end return nil end function s:GetInstancePath(ag)if not ag
or typeof(ag)~='Instance'then return''end local ah=self.LocalPlayer or d.Players.LocalPlayer local 
function IsGame(ai)return ai==game end local function IsWorkspace(ai)if ai==workspace then return
true end local aj,ak=pcall(function()return ai:IsA('Workspace')end)return aj and ak==true end local 
function IsLocalPlayer(ai)if ai==ah then return true end if not ah then return false end local aj,
ak=pcall(function()return ai:IsA('Player')end)if not aj or not ak then return false end local al,am
=pcall(function()return ai.UserId end)local an,ao=pcall(function()return ah.UserId end)if not al or
not an then return false end return am==ao and am~=0 end if IsGame(ag)then return'game'end if
IsLocalPlayer(ag)then return`game:GetService("Players").LocalPlayer`end local ai={}local aj=ag
local ak while aj and not IsGame(aj)do if IsLocalPlayer(aj)then ak=`game:GetService("Players").LocalPlayer`
break end local al,am=pcall(function()return aj.Name end)if not al or type(am)~='string'then return
''end local an,ao=pcall(function()return aj.Parent end)if not an then return''end if ao and IsGame(
ao)then local ap,aq=pcall(function()return aj.ClassName end)if ap and type(aq)=='string'then local
ar,as=pcall(function()return game:GetService(aq)end)if ar and as then local at=as==aj if not at
then local au,av=pcall(function()return as.Name end)at=au and av==am end if at then ak=`game:GetService("{
aq}")`break end end end end table.insert(ai,1,am)aj=ao end if not ak then ak='game'end local al=ak
for am,an in ai do al..=FormatSegment(an,false)end return al end function s:FullPath()local ag=self
.SelectedInstance if not ag then return end local ah=self:GetInstancePath(ag)if ah==''then return
end return ah end function s:FormatValue(ag)if ag==nil then return'nil'end local ah=typeof(ag)if ah
=='boolean'then return tostring(ag)end if ah=='number'then if ag==math.floor(ag)then return
tostring(math.floor(ag))end return string.format('%.5g',ag)end if ah=='string'then return ag end if
ah=='Vector3'then return string.format('%.4g, %.4g, %.4g',ag.X,ag.Y,ag.Z)end if ah=='Vector2'then
return string.format('%.4g, %.4g',ag.X,ag.Y)end if ah=='CFrame'then local ai=ag.Position return
string.format('%.4g, %.4g, %.4g',ai.X,ai.Y,ai.Z)end if ah=='Color3'then return string.format(
'%d, %d, %d',math.floor(ag.R*255),math.floor(ag.G*255),math.floor(ag.B*255))end if ah=='BrickColor'
then return ag.Name end if ah=='UDim2'then return string.format('{%.3g,%d},{%.3g,%d}',ag.X.Scale,ag
.X.Offset,ag.Y.Scale,ag.Y.Offset)end if ah=='UDim'then return string.format('%.3g, %d',ag.Scale,ag.
Offset)end if ah=='EnumItem'then return ag.Name end if ah=='Instance'then return`{ag.ClassName}({ag
.Name})`end return tostring(ag)end function s:GetValueColor(ag)if ag==nil then return K.PropNil end
local ah=typeof(ag)if ah=='boolean'then return ag and K.Green or K.Red end if ah=='number'then
return K.PropNumber end if ah=='string'then return K.PropString end if ah=='EnumItem'then return K.
PropEnum end if ah=='Instance'then return K.PropInstance end if ah=='Vector3'or ah=='Vector2'or ah
=='Vector3int16'or ah=='Vector2int16'or ah=='CFrame'or ah=='UDim'or ah=='UDim2'or ah=='NumberRange'
or ah=='NumberSequence'or ah=='Rect'or ah=='Region3'then return K.PropNumber end if ah=='Color3'or
ah=='BrickColor'or ah=='ColorSequence'then return K.PropString end return K.PropDefault end
function s:IsEditableValue(ag)local ah=typeof(ag)return ah=='string'or ah=='number'or ah=='Vector3'
or ah=='Vector2'or ah=='UDim2'or ah=='UDim'or ah=='CFrame'end function s:ParseEditValue(ag,ah)local
ai=typeof(ah)if ai=='string'then return ag end if ai=='number'then return tonumber(ag)end if ai==
'boolean'then local aj=ag:lower()if aj=='true'or aj=='1'then return true end if aj=='false'or aj==
'0'then return false end return nil end if ai=='Vector3'then local aj,ak,al=ag:match(
'([%-%d%.]+)[,%s]+([%-%d%.]+)[,%s]+([%-%d%.]+)')if aj then return Vector3.new(tonumber(aj),
tonumber(ak),tonumber(al))end end if ai=='Vector2'then local aj,ak=ag:match(
'([%-%d%.]+)[,%s]+([%-%d%.]+)')if aj then return Vector2.new(tonumber(aj),tonumber(ak))end end if
ai=='CFrame'then local aj={}for ak in ag:gmatch('[%-%d%.]+')do table.insert(aj,tonumber(ak))end if#
aj==12 then return CFrame.new(table.unpack(aj))end if#aj==6 then return CFrame.new(aj[1],aj[2],aj[3
])*CFrame.Angles(math.rad(aj[4]),math.rad(aj[5]),math.rad(aj[6]))end if#aj==3 then local ak=ah-ah.
Position return ak+Vector3.new(aj[1],aj[2],aj[3])end return nil end if ai=='UDim2'then local aj,ak,
al,am=ag:match([[{?([%-%d%.]+)[,%s]+([%-%d]+)}?[,%s}]+{?([%-%d%.]+)[,%s]+([%-%d]+)}?]])if aj then
return UDim2.new(tonumber(aj),tonumber(ak),tonumber(al),tonumber(am))end end if ai=='UDim'then
local aj,ak=ag:match('([%-%d%.]+)[,%s]+([%-%d]+)')if aj then return UDim.new(tonumber(aj),tonumber(
ak))end end return nil end function s:ApplyToSelection(ag,ah)for ai,aj in self.SelectedOrder do
SafeSet(aj,ag,ah)end end function s:HandleDoubleClick(ag)if not ag or not ag.Instance then return
end if ag.IsNilContainer then return end if IsScriptViewable(ag.Instance)then self:
OpenScriptViewer(ag.Instance,not self.UseLuaExpertDecompiler)return end self:BeginRename(ag)end
function s:BeginRename(ag)if not ag or not ag.Label or not ag.Label.Parent then return end local ah
=ag.Label local ai=ag.Instance.Name ah.Visible=false local aj=V:CreateInstance('TextBox',{Size=ah.
Size,Position=ah.Position,BackgroundColor3=K.Field,BackgroundTransparency=0.15,BorderSizePixel=0,
Font=ah.Font,Text=ai,TextColor3=K.Text,TextSize=ah.TextSize,TextXAlignment=Enum.TextXAlignment.Left
,ClearTextOnFocus=false,ZIndex=(ah.ZIndex or 1)+1,Parent=ah.Parent})V:AddStroke(aj,K.Accent,1)task.
defer(function()if aj.Parent then aj:CaptureFocus()aj.SelectionStart=1 aj.CursorPosition=#ai+1 end
end)local ak=false local function Finish(al)if ak then return end ak=true if al then local am=aj.
Text if am~=''and am~=ai then pcall(function()ag.Instance.Name=am end)end end if aj.Parent then aj:
Destroy()end if ah.Parent then ah.Visible=true end end aj.FocusLost:Connect(function(al)Finish(al)
end)end function s:UpdateSelectionHighlights()self.SelectionHighlights=self.SelectionHighlights or
setmetatable({},{__mode='k'})for ag,ah in self.SelectionHighlights do if not self.SelectedSet[ag]
then pcall(function()ah:Destroy()end)self.SelectionHighlights[ag]=nil end end for ag in self.
SelectedSet do if not self.SelectionHighlights[ag]then local ah=false pcall(function()ah=ag:IsA(
'BasePart')or ag:IsA('Model')end)if ah then local ai,aj=pcall(function()local ai=Instance.new(
'Highlight')ai.Name='VexSelectionHighlight'ai.FillTransparency=1 ai.FillColor=K.Accent ai.
OutlineColor=K.Accent ai.OutlineTransparency=0 ai.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop ai.
Adornee=ag ai.Parent=self.ScreenGui return ai end)if ai and aj then self.SelectionHighlights[ag]=aj
end end end end end function s:JumpToInstance(ag)if typeof(ag)~='Instance'then return end if self.
SearchQuery~=''then self._SearchTextToken=(self._SearchTextToken or 0)+1 self.
_SuppressSearchBoxChanged=true if self.SearchBox then self.SearchBox.Text=''end self.
_SuppressSearchBoxChanged=false self._LastAppliedSearchQuery=''if self.
ClearSearchStateWithoutRebuild then self:ClearSearchStateWithoutRebuild()end end local ah=
ClonerefInstance(ag)if self._VTreeRevealInstance then self:_VTreeRevealInstance(ah,{Select=true,
Scroll=true,Expand=true})self.SelectionAnchor=ah return end self:SetSelection({ah})self.
SelectionAnchor=ah end function s:JumpToCharacter(ag)if not ag then return end local ah,ai=pcall(
function()return ag.Character end)if not ah or not ai then if self.ShowErrorNotification then
pcall(function()self:ShowErrorNotification(`{ag.Name} has no Character`)end)end return end self:
JumpToInstance(ClonerefInstance(ai))end function s:JumpToPlayer(ag)local ah,ai=pcall(function()
return d.Players[ag.Name]end)if not ah or not ai then if self.ShowErrorNotification then pcall(
function()self:ShowErrorNotification(`{ai.Name} no longer exists`)end)end return end self:
JumpToInstance(ClonerefInstance(ai))end function s:ToggleAllServicesHidden()self.AllServicesHidden=
not self.AllServicesHidden if self.AllServicesHidden then for ag,ah in WeakGetChildren(game)do self
.HiddenServices[ah.Name]=true end else self.HiddenServices={}end self:SaveConfig()if self.
_FilterRowRefreshers then for ag,ah in self._FilterRowRefreshers do pcall(ah)end end self:
RebuildExplorer()end function s:_FlatAllocateRow(ag)local ah=V:CreateInstance('TextButton',{Size=
UDim2.new(1,0,0,self._FlatRowHeight),Position=UDim2.new(0,0,0,0),BackgroundColor3=K.Field,
BackgroundTransparency=1,BorderSizePixel=0,AutoButtonColor=false,Text='',Visible=false,Parent=ag})
local ai=V:CreateInstance('ImageLabel',{Size=UDim2.new(0,16,0,16),Position=UDim2.new(0,6,0.5,-8),
BackgroundTransparency=1,Image='',ScaleType=Enum.ScaleType.Fit,Parent=ah})local aj=V:
CreateInstance('TextLabel',{Size=UDim2.new(0.55,-28,1,0),Position=UDim2.new(0,28,0,0),
BackgroundTransparency=1,Font=aa.Medium,RichText=true,Text='',TextColor3=K.Text,TextSize=12,
TextXAlignment=Enum.TextXAlignment.Left,TextTruncate=Enum.TextTruncate.AtEnd,Parent=ah})local ak=V:
CreateInstance('TextLabel',{Size=UDim2.new(0.45,-8,1,0),Position=UDim2.new(0.55,0,0,0),
BackgroundTransparency=1,Font=aa.Medium,Text='',TextColor3=K.TextFaded,TextSize=11,TextXAlignment=
Enum.TextXAlignment.Right,TextTruncate=Enum.TextTruncate.AtEnd,Parent=ah})local al={Row=ah,Icon=ai,
Label=aj,Path=ak,Item=nil,IconClassName=nil}ah.MouseEnter:Connect(function()if al.Item and not self
.SelectedSet[al.Item]then ah.BackgroundTransparency=0.85 end end)ah.MouseLeave:Connect(function()if
al.Item and not self.SelectedSet[al.Item]then ah.BackgroundTransparency=1 end end)ah.
MouseButton1Click:Connect(function()local am=al.Item if not am then return end if self.CtrlHeld
then local an={}for ao,ap in self.SelectedOrder do table.insert(an,ap)end if self.SelectedSet[am]
then for ao,ap in an do if ap==am then table.remove(an,ao)break end end else table.insert(an,am)end
self:SetSelection(an)else self:SetSelection({am})end self:_FlatRefreshVisibleSelection()end)ah.
MouseButton2Click:Connect(function()local am=al.Item if not am then return end if not self.
SelectedSet[am]then self:SetSelection({am})self.SelectionAnchor=am end local an=self.LocalPlayer:
GetMouse()self:OpenContextMenu(an.X,an.Y)self:_FlatRefreshVisibleSelection()end)ah.TouchLongPress:
Connect(function()local am=al.Item if not am then return end if not self.SelectedSet[am]then self:
SetSelection({am})self.SelectionAnchor=am end local an=self.LocalPlayer:GetMouse()self:
OpenContextMenu(an.X,an.Y)self:_FlatRefreshVisibleSelection()end)return al end function s:
_FlatBuildPath(ag)local ah={}local ai=ag.Parent local aj=0 while ai and ai~=game and aj<6 do ah[#ah
+1]=ai.Name ai=ai.Parent aj+=1 end if ai==nil and ag.Parent~=nil then ah[#ah+1]='[nil]'end local ak
={}for al=#ah,1,-1 do ak[#ak+1]=ah[al]end return table.concat(ak,' \u{203a} ')end function s:
_FlatBindRow(ag,ah,ai)ag.Item=ah ag.Row.Position=UDim2.new(0,0,0,ai)ag.Row.Visible=true local aj,ak
=pcall(function()return ah.ClassName end)if not aj or type(ak)~='string'then ak='Instance'end if ag
.IconClassName~=ak then local al=V:CreateClassIcon(ak,ag.Row)al.Size=UDim2.new(0,16,0,16)al.
Position=UDim2.new(0,6,0.5,-8)if ag.Icon and ag.Icon~=al then ag.Icon:Destroy()end ag.Icon=al ag.
IconClassName=ak end local al,am=pcall(function()return ah.Name end)local an=(al and am)or'?'local
ao,ap=self:_BuildHighlightedName(an,self.SearchQuery)ag.Label.Text=ao ag.Path.Text=self:
_FlatBuildPath(ah)if self.SelectedSet[ah]then ag.Row.BackgroundColor3=K.Selected ag.Row.
BackgroundTransparency=0.4 else ag.Row.BackgroundColor3=K.Field ag.Row.BackgroundTransparency=1 end
end function s:_FlatHideRow(ag)ag.Item=nil ag.Row.Visible=false end function s:_FlatEnsureContainer
()local ag=self.ExplorerColumn and self.ExplorerColumn.Content if not ag then return nil end if
self._FlatResultsContainer and self._FlatResultsContainer.Parent then return self.
_FlatResultsContainer end local ah=V:CreateInstance('Frame',{Size=UDim2.new(1,0,0,0),
BackgroundTransparency=1,BorderSizePixel=0,Visible=false,ZIndex=100,Parent=ag})self.
_FlatResultsContainer=ah self._FlatResultsPool={}return ah end function s:_FlatRebuildVisible()
local ag=self._FlatResultsContainer if not ag or not ag.Visible then return end local ah=self.
ExplorerColumn and self.ExplorerColumn.Content if not ah then return end local ai=self.
_FlatResultsItems or{}local aj=self._FlatRowHeight+self._FlatRowGap local ak=ag.AbsolutePosition.Y
local al=ah.AbsolutePosition.Y local am=ah.AbsoluteSize.Y local an=am<=0 or(ak==0 and al==0)local
ao,ap if an then ao=1 ap=math.min(#ai,30)else local aq=al-ak ao=math.max(1,math.floor(aq/aj)+1-self
._FlatBufferRows)ap=math.min(#ai,ao+math.ceil(am/aj)+self._FlatBufferRows*2)end local aq=math.max(0
,ap-ao+1)local ar=self._FlatResultsPool while#ar<aq do ar[#ar+1]=self:_FlatAllocateRow(ag)end for
as=1,aq do local at=ar[as]local au=ao+as-1 local av=ai[au]if av then self:_FlatBindRow(at,av,(au-1)
*aj)else self:_FlatHideRow(at)end end for as=aq+1,#ar do self:_FlatHideRow(ar[as])end end function
s:_FlatApplyResults(ag)local ah=self:_FlatEnsureContainer()if not ah then return end local ai=table
.create(#ag)for aj=1,#ag do local ak=ag[aj]if ak and ak.Instance and ak.Instance.Parent~=nil then
ai[#ai+1]=ak.Instance end end self._FlatResultsItems=ai local aj=self._FlatRowHeight+self.
_FlatRowGap ah.Size=UDim2.new(1,0,0,math.max(0,#ai*aj))ah.Visible=true self:_FlatRebuildVisible()
task.defer(function()if ah and ah.Parent then self:_FlatRebuildVisible()end end)end function s:
_FlatHideContainer()if self._FlatResultsContainer then self._FlatResultsContainer.Visible=false end
self._FlatResultsItems=nil end function s:_FlatIsActive()return self.FlatSearchResults==true and
self.SearchQuery~=''end function s:_FlatHookScroll()if self._FlatScrollConn then return end local
ag=self.ExplorerColumn and self.ExplorerColumn.Content if not ag then return end self.
_FlatScrollConn=ag:GetPropertyChangedSignal('CanvasPosition'):Connect(function()if self:
_FlatIsActive()then self:_FlatRebuildVisible()end end)end function s:_FlatRefreshVisibleSelection()
if not self._FlatResultsPool then return end for ag,ah in self._FlatResultsPool do if ah.Item and
ah.Row.Visible then if self.SelectedSet[ah.Item]then ah.Row.BackgroundColor3=K.Selected ah.Row.
BackgroundTransparency=0.4 else ah.Row.BackgroundColor3=K.Field ah.Row.BackgroundTransparency=1 end
end end end function s:SetNilFilterClass(ag,ah)self.NilFilterClass=ag or''self._SyncingClassFilter=
true if self.FiltersClassFilterBox and self.FiltersClassFilterBox~=ah and self.
FiltersClassFilterBox.Text~=ag then self.FiltersClassFilterBox.Text=ag end if self.
SettingsClassFilterBox and self.SettingsClassFilterBox~=ah and self.SettingsClassFilterBox.Text~=ag
then self.SettingsClassFilterBox.Text=ag end self._SyncingClassFilter=false end function s:
_CheckFreezeSearchMatch(ag)if self.ExplorerFrozen then return end local ah=self.FreezeSearchTerm if
not ah or ah==''then return end local ai,aj=pcall(function()return ag.Name end)if not ai or type(aj
)~='string'then return end if aj:lower():find(ah:lower(),1,true)then self:SetExplorerFrozen(true,`matched "{
aj}"`)end end function s:RebuildExplorer()Handle(function()if self.ExplorerColumn and self.
ExplorerColumn.Clear then self.ExplorerColumn:Clear()end if typeof(self.HiddenServices)~='table'
then self.HiddenServices={}end self:_VTreeActivate()if not self._RootServiceHooksInstalled then
self._RootServiceHooksInstalled=true Track(game.ChildAdded:Connect(function(ag)if typeof(ag)~=
'Instance'then return end if self.HiddenServices[ag.Name]then return end if self.ExplorerFrozen
then self.FrozenPendingAdds[ClonerefInstance(ag)]=true return end self:_VTreeScheduleRebuild()end))
Track(game.ChildRemoved:Connect(function(ag)if typeof(ag)~='Instance'then return end if self.
ExplorerFrozen then self.FrozenPendingRemoves[ClonerefInstance(ag)]=true return end self:
_VTreeScheduleRebuild()end))end if not self.SearchIndexBuilt then task.spawn(function()self:
BuildSearchIndex()end)end end,'Function Explorer.RebuildExplorer')end function s:_VTreeMakeRowData(
ag,ah,ai)return{Instance=ag,Depth=ah,Expanded=false,HasChildren=false,IsNilContainer=ai==true,
RawName='',ClassName='',MatchState='none'}end function s:_VTreeRefreshRowMeta(ag)if ag.
IsNilContainer then local ah=0 local ai,aj=pcall(function()return self:_CollectNilInstances()end)if
ai and type(aj)=='table'then ah=#aj end ag.RawName=`Nil Instances ({ah})`ag.ClassName='Folder'ag.
HasChildren=ah>0 return end local ah=ag.Instance if not ah then return end local ai,aj=pcall(
function()return ah.Name end)ag.RawName=(ai and aj)or'?'local ak,al=pcall(function()return ah.
ClassName end)ag.ClassName=(ak and al)or'Instance'local am,an=pcall(function()local am=
WeakGetChildren(ah)return am and am[1]or nil end)ag.HasChildren=am and an~=nil end function s:
_VTreeBuildRoots()self._VTreeRows={}self._VTreeRowsByInstance={}self._VTreeExpanded=self.
_VTreeExpanded or{}local ag={}for ah,ai in WeakGetChildren(game)do if not self.HiddenServices[ai.
Name]and not self.AllServicesHidden then ag[#ag+1]=ai elseif self.AllServicesHidden and self.
HiddenServices[ai.Name]==false then ag[#ag+1]=ai end end ag=SortServices(ag)for ah,ai in ag do
local aj=self:_VTreeMakeRowData(ai,0,false)self:_VTreeRefreshRowMeta(aj)self._VTreeRows[#self.
_VTreeRows+1]=aj self._VTreeRowsByInstance[ai]=#self._VTreeRows end if not self.HideNilContainer
then local ah=self:_VTreeMakeRowData(nil,0,true)self:_VTreeRefreshRowMeta(ah)self._VTreeRows[#self.
_VTreeRows+1]=ah end end function s:_VTreeEnsureContainer()local ag=self.ExplorerColumn and self.
ExplorerColumn.Content if not ag then return nil end if self._VTreeContainer and self.
_VTreeContainer.Parent then return self._VTreeContainer end local ah=V:CreateInstance('Frame',{Size
=UDim2.new(1,0,0,0),BackgroundTransparency=1,BorderSizePixel=0,Visible=false,ZIndex=50,Parent=ag})
self._VTreeContainer=ah self._VTreePool={}return ah end function s:_VTreeBeginRename(ag,ah)if not
ag or not ah or not ah.Instance then return end if ah.IsNilContainer then return end local ai=ah.
Instance local aj=ag.Label if not aj or not aj.Parent then return end local ak,al=pcall(function()
return ai.Name end)if not ak or type(al)~='string'then al=ah.RawName or''end aj.Visible=false local
am=V:CreateInstance('TextBox',{Size=aj.Size,Position=aj.Position,BackgroundColor3=K.Field,
BackgroundTransparency=0.15,BorderSizePixel=0,Font=aj.Font,Text=al,TextColor3=K.Text,TextSize=aj.
TextSize,TextXAlignment=Enum.TextXAlignment.Left,ClearTextOnFocus=false,ZIndex=(aj.ZIndex or 1)+1,
Parent=aj.Parent})V:AddStroke(am,K.Accent,1)task.defer(function()if am.Parent then am:CaptureFocus(
)am.SelectionStart=1 am.CursorPosition=#al+1 end end)local an=false local function Finish(ao)if an
then return end an=true if ao then local ap=am.Text if ap~=''and ap~=al then pcall(function()ai.
Name=ap end)end end if am.Parent then am:Destroy()end if aj and aj.Parent then aj.Visible=true end
end am.FocusLost:Connect(function(ao)Finish(ao)end)end function s:_VTreeAllocateRow(ag)local ah=V:
CreateInstance('TextButton',{Size=UDim2.new(1,0,0,self._VTreeRowHeight),Position=UDim2.new(0,0,0,0)
,BackgroundColor3=K.Field,BackgroundTransparency=1,BorderSizePixel=0,AutoButtonColor=false,Text='',
Visible=false,ZIndex=51,Parent=ag})local ai=V:CreateInstance('Frame',{Size=UDim2.new(0,2,1,0),
Position=UDim2.new(0,0,0,0),BackgroundColor3=K.Accent,BorderSizePixel=0,Visible=false,ZIndex=53,
Parent=ah})BindTheme('Accent',function(aj)ai.BackgroundColor3=aj end)local aj=V:CreateInstance(
'TextLabel',{Size=UDim2.new(0,14,0,14),Position=UDim2.new(0,0,0.5,-7),BackgroundTransparency=1,Font
=aa.Bold,Text='+',TextColor3=K.TextDim,TextSize=16,TextXAlignment=Enum.TextXAlignment.Center,
Visible=false,ZIndex=52,Parent=ah})local ak=V:CreateInstance('TextButton',{Size=UDim2.new(0,18,1,0)
,Position=UDim2.new(0,-2,0,0),BackgroundTransparency=1,Text='',AutoButtonColor=false,ZIndex=53,
Parent=ah})local al=V:CreateInstance('ImageLabel',{Size=UDim2.new(0,16,0,16),Position=UDim2.new(0,
18,0.5,-8),BackgroundTransparency=1,Image='',ScaleType=Enum.ScaleType.Fit,ZIndex=52,Parent=ah})
local am=V:CreateInstance('TextLabel',{Size=UDim2.new(1,-40,1,0),Position=UDim2.new(0,38,0,0),
BackgroundTransparency=1,Font=aa.Medium,RichText=true,Text='',TextColor3=K.Text,TextSize=12,
TextXAlignment=Enum.TextXAlignment.Left,TextTruncate=Enum.TextTruncate.AtEnd,ZIndex=52,Parent=ah})
local an={Row=ah,AccentStrip=ai,Arrow=aj,ArrowHit=ak,Icon=al,Label=am,IconClassName=nil,Bound=nil}
ah.MouseEnter:Connect(function()local ao=an.Bound if ao and ao.Instance and not self.SelectedSet[ao
.Instance]then ah.BackgroundTransparency=0.85 end end)ah.MouseLeave:Connect(function()local ao=an.
Bound if ao and ao.Instance and not self.SelectedSet[ao.Instance]then ah.BackgroundTransparency=1
end end)ak.MouseButton1Click:Connect(function()local ao=an.Bound if not ao or not ao.HasChildren
then return end if ao.Expanded then self:_VTreeCollapse(ao)else self:_VTreeExpand(ao)end end)local
ao=0 ah.MouseButton1Click:Connect(function()local ap=an.Bound if not ap then return end if ap.
IsNilContainer then return end local aq=ap.Instance if not aq then return end if self._JustDragged
or self.JustDragged then return end if self.ReparentMode then self:CommitReparent(aq)return end
local ar=os.clock()if ar-ao<0.35 then ao=0 local as=false local at=ap.ClassName if at==
'LocalScript'or at=='ModuleScript'then as=true elseif at=='Script'then local au,av=pcall(function()
return aq.RunContext end)if au and av==Enum.RunContext.Client then as=true end end if as then self:
OpenScriptViewer(aq,true)else self:_VTreeBeginRename(an,ap)end return end ao=ar if self.ShiftHeld
and self.SelectionAnchor then local as=self:_VTreeActiveRows()local at,au for av=1,#as do local aw=
as[av].Instance if aw==self.SelectionAnchor then at=av end if aw==aq then au=av end if at and au
then break end end if at and au then if at>au then at,au=au,at end local av={}for aw=at,au do local
ax=as[aw].Instance if ax then table.insert(av,ax)end end self:SetSelection(av)else self:
SetSelection({aq})self.SelectionAnchor=aq end elseif self.CtrlHeld then local as={}for at,au in
self.SelectedOrder do table.insert(as,au)end if self.SelectedSet[aq]then for at,au in as do if au==
aq then table.remove(as,at)break end end else table.insert(as,aq)end self:SetSelection(as)else self
:SetSelection({aq})self.SelectionAnchor=aq end self:_VTreeRefreshVisibleSelection()end)ah.
InputBegan:Connect(function(ap)if ap.UserInputType==Enum.UserInputType.MouseButton1 or ap.
UserInputType==Enum.UserInputType.Touch then local aq=an.Bound if not aq or not aq.Instance or aq.
IsNilContainer then return end self.DragOperation={StartX=ap.Position.X,StartY=ap.Position.Y,
HasStarted=false,Source=aq.Instance,SourceName=SafeGet(aq.Instance,'Name')or'?'}elseif ap.
UserInputType==Enum.UserInputType.MouseButton3 then local aq=an.Bound if aq and aq.Instance then
self:ToggleViewObject(aq.Instance)end end end)ah.MouseButton2Click:Connect(function()local ap=an.
Bound if not ap or not ap.Instance then return end if not self.SelectedSet[ap.Instance]then self:
SetSelection({ap.Instance})self.SelectionAnchor=ap.Instance end local aq=self.LocalPlayer:GetMouse(
)self:OpenContextMenu(aq.X,aq.Y)self:_VTreeRefreshVisibleSelection()end)ah.TouchLongPress:Connect(
function()local ap=an.Bound if not ap or not ap.Instance then return end if not self.SelectedSet[ap
.Instance]then self:SetSelection({ap.Instance})self.SelectionAnchor=ap.Instance end local aq=self.
LocalPlayer:GetMouse()self:OpenContextMenu(aq.X,aq.Y)self:_VTreeRefreshVisibleSelection()end)return
an end function s:_VTreeBindRow(ag,ah,ai)ag.Bound=ah local aj=ag.Row if ah.IsTruncationNotice then
aj.Position=UDim2.new(0,0,0,ai)aj.Visible=true aj.BackgroundTransparency=1 ag.AccentStrip.Visible=
false ag.Arrow.Visible=false ag.ArrowHit.Visible=false V:ApplyClassIcon(ag.Icon,nil)ag.Icon.
ImageTransparency=1 ag.IconClassName=nil ag.Label.Position=UDim2.new(0,12,0,0)ag.Label.Size=UDim2.
new(1,-16,1,0)ag.Label.Font=aa.Medium ag.Label.Text=self:_EscapeRichText(ah.RawName)ag.Label.
TextColor3=K.TextFaded return end if ah.Instance and not ah.IsNilContainer then local ak,al=pcall(
function()return ah.Instance.Name end)if ak and al and al~=ah.RawName then if self.
_VTreeHighlightCache then self._VTreeHighlightCache[ah.RawName]=nil end ah.RawName=al end self:
_VTreeEnsureInstanceHooks(ah.Instance)end aj.Position=UDim2.new(0,0,0,ai)aj.Visible=true local ak=
ah.Depth*self._VTreeIndent+4 if ah.HasChildren and not self._VTreeFilterActive then ag.Arrow.
Visible=true ag.Arrow.Text=ah.Expanded and'-'or'+'ag.Arrow.Position=UDim2.new(0,ak,0.5,-7)ag.
ArrowHit.Position=UDim2.new(0,ak-2,0,0)ag.ArrowHit.Visible=true else ag.Arrow.Visible=false ag.
ArrowHit.Visible=false end local al=ah.ClassName if ag.IconClassName~=al then V:ApplyClassIcon(ag.
Icon,al)ag.IconClassName=al end ag.Icon.Position=UDim2.new(0,ak+16,0.5,-8)ag.Label.Position=UDim2.
new(0,ak+36,0,0)ag.Label.Size=UDim2.new(1,-(ak+40),1,0)ag.Label.Font=ah.Depth==0 and aa.SemiBold or
aa.Medium local am=self.SearchQuery or''local an=(not ah.IsNilContainer)and ah.Instance and self.
MatchSet and self.MatchSet[ah.Instance]==true if am~=''and an then local ao=self.
_VTreeHighlightCache if not ao then ao={}self._VTreeHighlightCache=ao end local ap=ao[ah.RawName]if
not ap then ap=self:_BuildHighlightedName(ah.RawName,am)ao[ah.RawName]=ap end ag.Label.Text=ap else
ag.Label.Text=self:_EscapeRichText(ah.RawName)end if am~=''then if ah.IsNilContainer then ag.Label.
TextColor3=K.Accent elseif an then ag.Label.TextColor3=K.Accent elseif self.SubtreeMatchSet and
self.SubtreeMatchSet[ah.Instance]then ag.Label.TextColor3=K.TextDim else ag.Label.TextColor3=K.
TextFaded end else ag.Label.TextColor3=K.Text end local ao=ah.Instance and self.SelectedSet[ah.
Instance]if ao then aj.BackgroundColor3=K.Selected aj.BackgroundTransparency=0.55 ag.AccentStrip.
Visible=true else aj.BackgroundColor3=K.Field aj.BackgroundTransparency=1 ag.AccentStrip.Visible=
false end end function s:_VTreeHideRow(ag)ag.Bound=nil ag.Row.Visible=false end function s:
_VTreeRefreshVisibleSelection()if not self._VTreePool then return end for ag,ah in self._VTreePool
do local ai=ah.Bound if ai and ah.Row.Visible then local aj=ai.Instance if aj and self.SelectedSet[
aj]then ah.Row.BackgroundColor3=K.Selected ah.Row.BackgroundTransparency=0.55 ah.AccentStrip.
Visible=true else ah.Row.BackgroundColor3=K.Field ah.Row.BackgroundTransparency=1 ah.AccentStrip.
Visible=false end end end end function s:_VTreeRebuildVisible()self._VTreeRebuildScheduled=false
local ag=self._VTreeContainer if not ag or not ag.Visible then return end local ah=self.
ExplorerColumn and self.ExplorerColumn.Content if not ah then return end local ai=self:
_VTreeActiveRows()local aj=self._VTreeRowHeight+self._VTreeRowGap local ak=ag.AbsolutePosition.Y
local al=ah.AbsolutePosition.Y local am=ah.AbsoluteSize.Y local an=am<=0 or(ak==0 and al==0)local
ao,ap if an then ao=1 ap=math.min(#ai,40)else local aq=al-ak ao=math.max(1,math.floor(aq/aj)+1-self
._VTreeBufferRows)ap=math.min(#ai,ao+math.ceil(am/aj)+self._VTreeBufferRows*2)end if self.
_VTreeLastFirstIndex==ao and self._VTreeLastLastIndex==ap and self._VTreeLastRowCount==#ai then
return end self._VTreeLastFirstIndex=ao self._VTreeLastLastIndex=ap self._VTreeLastRowCount=#ai
local aq=math.max(0,ap-ao+1)local ar=self._VTreePool while#ar<aq do ar[#ar+1]=self:
_VTreeAllocateRow(ag)end for as=1,aq do local at=ar[as]local au=ao+as-1 local av=ai[au]if av then
self:_VTreeBindRow(at,av,(au-1)*aj)else self:_VTreeHideRow(at)end end for as=aq+1,#ar do self:
_VTreeHideRow(ar[as])end end function s:_VTreeInvalidateVisibleCache()self._VTreeLastFirstIndex=nil
self._VTreeLastLastIndex=nil self._VTreeLastRowCount=nil end function s:_VTreeEnsureInstanceHooks(
ag)if not ag then return end self._VTreeNameConns=self._VTreeNameConns or setmetatable({},{__mode=
'k'})if not self._VTreeNameConns[ag]then local ah,ai=pcall(function()return ag:
GetPropertyChangedSignal('Name')end)if ah and ai then self._VTreeNameConns[ag]=Track(ai:Connect(
function()local aj,ak=pcall(function()return ag.Name end)if aj then self:_VTreeUpdateInstanceName(
ag,ak or'?')end end))end end self:_VTreeHookAncestryFor(ag)end function s:_VTreeUpdateCanvasSize()
local ag=self._VTreeContainer if not ag then return end local ah=self:_VTreeActiveRows()local ai=
self._VTreeRowHeight+self._VTreeRowGap ag.Size=UDim2.new(1,0,0,math.max(0,#ah*ai))end function s:
_VTreeActiveRows()if self._VTreeFilterActive and self._VTreeFilteredRows then return self.
_VTreeFilteredRows end return self._VTreeRows or{}end function s:_VTreeScheduleRebuild()if self.
_VTreeRebuildScheduled then return end self._VTreeRebuildScheduled=true local ag ag=d.RunService.
PreRender:Connect(function()ag:Disconnect()self._VTreeRebuildScheduled=false self:
_VTreeRebuildVisible()end)end function s:_VTreeHookScroll()if self._VTreeScrollConn then return end
local ag=self.ExplorerColumn and self.ExplorerColumn.Content if not ag then return end self.
_VTreeScrollConn=ag:GetPropertyChangedSignal('CanvasPosition'):Connect(function()self:
_VTreeScheduleRebuild()if self._VTreeFilterActive and self._VTreeFilteredResume and not self.
_VTreeFilteredExhausted then local ah=ag.CanvasPosition.Y local ai=ah+ag.AbsoluteSize.Y local aj=ag
.AbsoluteCanvasSize.Y if aj-ai<ag.AbsoluteSize.Y*1.5 then if not self._VTreeStreamScheduled then
self._VTreeStreamScheduled=true task.defer(function()self._VTreeStreamScheduled=false if self.
_VTreeFilteredResume then self._VTreeFilteredResume()end end)end end end if self._VTreeNilResume
and not self._VTreeNilExhausted then local ah=ag.CanvasPosition.Y local ai=ah+ag.AbsoluteSize.Y
local aj=ag.AbsoluteCanvasSize.Y if aj-ai<ag.AbsoluteSize.Y*1.5 then if not self.
_VTreeNilStreamScheduled then self._VTreeNilStreamScheduled=true task.defer(function()self.
_VTreeNilStreamScheduled=false if self._VTreeNilResume then self._VTreeNilResume()end end)end end
end end)end function s:_VTreeExpand(ag)if not ag or ag.Expanded then return end if not ag.
HasChildren then return end ag.Expanded=true if ag.IsNilContainer then self:_VTreeStartNilStream(ag
)return end local ah=ag.Instance if not ah then return end self._VTreeExpanded[ah]=true local ai=
self._VTreeRowsByInstance[ah]if not ai then return end local aj=self:_VTreeGetSortedChildren(ah)if#
aj==0 then ag.HasChildren=false self:_VTreeUpdateCanvasSize()self:_VTreeScheduleRebuild()return end
local ak=ai+1 local al=self._VTreeRows local am=#aj local an=#al for ao=an,ak,-1 do al[ao+am]=al[ao
]end for ao,ap in aj do local aq=self:_VTreeMakeRowData(ap,ag.Depth+1,false)self:
_VTreeRefreshRowMeta(aq)al[ak+ao-1]=aq self._VTreeRowsByInstance[ap]=ak+ao-1 if self._VTreeExpanded
[ap]and aq.HasChildren then task.defer(function()if aq.Instance and aq.Instance.Parent then aq.
Expanded=false self:_VTreeExpand(aq)end end)end end self:_VTreeReindexRows(ak+am)if self.
_VTreeFilterActive and not self._VTreeSuppressFilterRebuild then self:_VTreeBuildFiltered()end self
:_VTreeUpdateCanvasSize()self:_VTreeInvalidateVisibleCache()self:_VTreeScheduleRebuild()end
function s:_VTreeCollapse(ag)if not ag or not ag.Expanded then return end ag.Expanded=false if ag.
IsNilContainer then self._VTreeNilStreamToken=(self._VTreeNilStreamToken or 0)+1 self.
_VTreeNilResume=nil self._VTreeNilExhausted=false local ah for ai,aj in self._VTreeRows do if aj==
ag then ah=ai break end end if not ah then self:_VTreeUpdateCanvasSize()self:_VTreeScheduleRebuild(
)return end local ai=self._VTreeRows local aj=ah+1 local ak=ah local al=ag.Depth for am=ah+1,#ai do
if ai[am].Depth>al then ak=am else break end end if ak>=aj then for am=aj,ak do local an=ai[am]if
an.Instance then self._VTreeRowsByInstance[an.Instance]=nil end end local am=ak-aj+1 local an=#ai
for ao=ak+1,an do ai[ao-am]=ai[ao]end for ao=an,an-am+1,-1 do ai[ao]=nil end self:
_VTreeReindexRows(aj)end self:_VTreeUpdateCanvasSize()self:_VTreeInvalidateVisibleCache()self:
_VTreeScheduleRebuild()return end local ah=ag.Instance if not ah then return end self.
_VTreeExpanded[ah]=nil local ai=self._VTreeRowsByInstance[ah]if not ai then return end local aj=
self._VTreeRows local ak=ag.Depth local al=ai+1 local am=ai for an=ai+1,#aj do if aj[an].Depth>ak
then am=an else break end end if am>=al then for an=al,am do local ao=aj[an]if ao.Instance then
self._VTreeRowsByInstance[ao.Instance]=nil end end local an=am-al+1 local ao=#aj for ap=am+1,ao do
aj[ap-an]=aj[ap]end for ap=ao,ao-an+1,-1 do aj[ap]=nil end self:_VTreeReindexRows(al)end if self.
_VTreeFilterActive and not self._VTreeSuppressFilterRebuild then self:_VTreeBuildFiltered()end self
:_VTreeUpdateCanvasSize()self:_VTreeInvalidateVisibleCache()self:_VTreeScheduleRebuild()end
function s:_VTreeRevealInstance(ag,ah)if not ag then return end ah=ah or{}local ai={}local aj,ak=
pcall(function()return ag.Parent end)if aj then ak=ak end while ak and ak~=game do table.insert(ai,
1,ak)local al,am=pcall(function()return ak.Parent end)if not al then break end ak=am end self.
_VTreeSuppressFilterRebuild=true for al,am in ai do local an=self._VTreeRowsByInstance[am]or self:
_VTreeResolveRowIndex(am)if an then local ao=self._VTreeRows[an]if ao and ao.HasChildren and not ao
.Expanded then self:_VTreeExpand(ao)end end end self._VTreeSuppressFilterRebuild=false self:
_VTreeUpdateCanvasSize()if ah.Select then self:SetSelection({ag})self.SelectionAnchor=ag end local
al=self._VTreeRowsByInstance[ag]or self:_VTreeResolveRowIndex(ag)if not al then self:
_VTreeScheduleRebuild()return end local am=self.ExplorerColumn and self.ExplorerColumn.Content if
am then local an=self._VTreeRowHeight or 22 local ao=(al-1)*an local ap=am.AbsoluteSize.Y local aq=
am.CanvasPosition.Y local ar=aq+ap if ao<aq or ao+an>ar then local as=math.max(0,ao-math.floor(ap/2
)+an)am.CanvasPosition=Vector2.new(am.CanvasPosition.X,as)end end if ah.Select then self:
SetSelection({ag})self.SelectionAnchor=ag end self:_VTreeInvalidateVisibleCache()self:
_VTreeScheduleRebuild()end function s:_VTreeFindChildInsertIndex(ag,ah)local ai=self.
_VTreeRowsByInstance[ag]if not ai then return nil end local aj=self._VTreeRows local ak=aj[ai].
Depth local al=ak+1 local am=ah.ClassName local an=ae[am]or 999 local ao=(ah.Name or''):lower()
local ap=ai+1 for aq=ai+1,#aj do local ar=aj[aq]if ar.Depth<=ak then return aq end if ar.Depth==al
then local as=ar.ClassName if not as and ar.Instance then local at,au=pcall(function()return ar.
Instance.ClassName end)if at then as=au end end local at=ae[as or'']or 999 local au=(ar.RawName or
''):lower()local av if an~=at then av=an<at elseif ao~=au then av=ao<au else av=(am or'')<(as or'')
end if av then return aq end ap=aq+1 end end return ap end function s:_VTreeInsertChildRow(ag,ah)if
not ag or not ah then return end if self._VTreeRowsByInstance[ah]then return end local ai=self.
_VTreeRowsByInstance[ag]if not ai then return end local aj=self._VTreeRows[ai]if not aj then return
end if not aj.HasChildren then aj.HasChildren=true end if not aj.Expanded then self:
_VTreeScheduleRebuild()return end local ak=self:_VTreeFindChildInsertIndex(ag,ah)if not ak then
return end local al=self._VTreeRows local am=self:_VTreeMakeRowData(ah,aj.Depth+1,false)self:
_VTreeRefreshRowMeta(am)local an=#al for ao=an,ak,-1 do al[ao+1]=al[ao]end al[ak]=am self:
_VTreeReindexRows(ak)if self._VTreeFilterActive then self:_VTreeBuildFiltered()end self:
_VTreeUpdateCanvasSize()self:_VTreeStabiliseScrollAroundInsert(ak,1)self:
_VTreeInvalidateVisibleCache()self:_VTreeScheduleRebuild()end function s:_VTreeRemoveInstanceRow(ag
)if not ag then return end local ah=self._VTreeRows if not ah then return end local ai=self.
_VTreeRowsByInstance[ag]or self:_VTreeResolveRowIndex(ag)if not ai then local aj,ak=pcall(function(
)return ag.Parent end)if not aj or not ak then return end local al=self._VTreeRowsByInstance[ak]or
self:_VTreeResolveRowIndex(ak)if not al then return end local am=ah[al]if not am then return end
local an=false local ao=am.Depth for ap=al+1,#ah do local aq=ah[ap]if aq.Depth<=ao then break end
if aq.Depth==ao+1 then an=true break end end if not an then local ap,aq=pcall(function()return
WeakGetChildren(ak)end)local ar=false if ap and aq then for as,at in aq do if at~=ag then ar=true
break end end end if am.HasChildren~=ar then am.HasChildren=ar if not ar then am.Expanded=false if
self._VTreeExpanded then self._VTreeExpanded[ak]=nil end end self:_VTreeInvalidateVisibleCache()
self:_VTreeScheduleRebuild()end end return end local aj=ah[ai]local ak=aj.Depth local al=ai for am=
ai+1,#ah do if ah[am].Depth>ak then al=am else break end end for am=ai,al do local an=ah[am]if an.
Instance then self._VTreeRowsByInstance[an.Instance]=nil self._VTreeExpanded[an.Instance]=nil end
end local am=al-ai+1 local an=#ah for ao=al+1,an do ah[ao-am]=ah[ao]end for ao=an,an-am+1,-1 do ah[
ao]=nil end self:_VTreeReindexRows(ai)local ao local ap,aq=pcall(function()return ag.Parent end)if
ap then ao=aq end if ao then local ar=self._VTreeRowsByInstance[ao]if ar then local as=ah[ar]if as
then local at=false local au=as.Depth for av=ar+1,#ah do local aw=ah[av]if aw.Depth<=au then break
end if aw.Depth==au+1 then at=true break end end if as.HasChildren~=at then as.HasChildren=at if
not at then as.Expanded=false self._VTreeExpanded[ao]=nil end end end end end self:
_VTreeUpdateCanvasSize()self:_VTreeStabiliseScrollAroundRemove(ai,am)self:
_VTreeInvalidateVisibleCache()self:_VTreeScheduleRebuild()end function s:_VTreeUpdateInstanceName(
ag,ah)local ai=self._VTreeRowsByInstance[ag]if not ai then return end local aj=self._VTreeRows[ai]
if not aj then return end aj.RawName=ah if self._VTreeFilterActive then self:_VTreeBuildFiltered()
self:_VTreeUpdateCanvasSize()end self:_VTreeInvalidateVisibleCache()self:_VTreeScheduleRebuild()end
function s:_VTreeHookAncestryFor(ag)self._VTreeAncestryConns=self._VTreeAncestryConns or
setmetatable({},{__mode='k'})if self._VTreeAncestryConns[ag]then return end local ah,ai=pcall(
function()return ag.AncestryChanged end)if not ah or not ai then return end self.
_VTreeAncestryConns[ag]=Track(ai:Connect(function(aj,ak)task.defer(function()local al=self.
_VTreeRowsByInstance[ag]if not al then return end local am,an=pcall(function()return ag.Parent end)
if not am then return end if not an then self:_VTreeRemoveInstanceRow(ag)return end self:
_VTreeRemoveInstanceRow(ag)local ao=self._VTreeRowsByInstance[an]or self:_VTreeResolveRowIndex(an)
if ao then local ap=self._VTreeRows[ao].Instance self:_VTreeInsertChildRow(ap or an,ag)end end)end)
)end function s:_VTreeHookGameSignals()if self._VTreeGameSignalsHooked then return end self.
_VTreeGameSignalsHooked=true self._VTreeAddedConn=Track(game.DescendantAdded:Connect(function(ag)
task.defer(function()local ah,ai=pcall(function()return ag.Parent end)if not ah or not ai then
return end if ai==game then if self._VTreeRowsByInstance[ag]then return end local aj=1 local ak=
self._VTreeRows local al=(ag.Name or''):lower()for am=1,#ak do local an=ak[am]if an.Depth==0 and
not an.IsNilContainer then if(an.RawName or''):lower()>al then aj=am break end aj=am+1 end end
local am=self:_VTreeMakeRowData(ag,0,false)self:_VTreeRefreshRowMeta(am)local an=#ak for ao=an,aj,-
1 do ak[ao+1]=ak[ao]end ak[aj]=am self:_VTreeReindexRows(aj)self:_VTreeStabiliseScrollAroundInsert(
aj,1)self:_VTreeUpdateCanvasSize()self:_VTreeInvalidateVisibleCache()self:_VTreeScheduleRebuild()
return end if self._VTreeRowsByInstance[ag]then return end local aj=self._VTreeRowsByInstance[ai]or
self:_VTreeResolveRowIndex(ai)if aj then local ak=self._VTreeRows[aj].Instance self:
_VTreeInsertChildRow(ak or ai,ag)end end)end))self._VTreeRemovingConn=Track(game.DescendantRemoving
:Connect(function(ag)self:_VTreeRemoveInstanceRow(ag)if self._VTreeNameConns and self.
_VTreeNameConns[ag]then pcall(function()self._VTreeNameConns[ag]:Disconnect()end)self.
_VTreeNameConns[ag]=nil end if self._VTreeAncestryConns and self._VTreeAncestryConns[ag]then pcall(
function()self._VTreeAncestryConns[ag]:Disconnect()end)self._VTreeAncestryConns[ag]=nil end end))
end function s:_VTreeResolveRowIndex(ag)local ah=self._VTreeRowsByInstance[ag]if ah then return ah
end local ai,aj=pcall(function()return ag.Name end)if not ai or not aj then return nil end local ak
={aj}local al local am,an=pcall(function()return ag.Parent end)al=am and an or nil local ao=0 while
al and al~=game and ao<64 do local ap,aq=pcall(function()return al.Name end)if not ap or not aq
then return nil end ak[#ak+1]=aq local ar,as=pcall(function()return al.Parent end)al=ar and as or
nil ao+=1 end if al~=game then return nil end local ap local aq=-1 for ar=#ak,1,-1 do local as=ak[
ar]local at=aq+1 if not ap then for au=1,#self._VTreeRows do local av=self._VTreeRows[au]if av.
Depth==0 and not av.IsNilContainer and av.RawName==as then ap=au aq=0 break end end if not ap then
return nil end else local au for av=ap+1,#self._VTreeRows do local aw=self._VTreeRows[av]if aw.
Depth<=aq then break end if aw.Depth==at and aw.RawName==as then au=av break end end if not au then
return nil end ap=au aq=at end end return ap end function s:_VTreeActivate()if self.ExplorerColumn
and self.ExplorerColumn.Clear then self.ExplorerColumn:Clear()end self:_VTreeBuildRoots()local ag=
self:_VTreeEnsureContainer()if not ag then return end ag.Visible=true self:_VTreeHookScroll()self:
_VTreeHookGameSignals()self:_VTreeUpdateCanvasSize()self:_VTreeRebuildVisible()end function s:
_VTreeDeactivate()if self._VTreeContainer then self._VTreeContainer.Visible=false end end function
s:_VTreeReindexRows(ag)ag=ag or 1 local ah=self._VTreeRows local ai=self._VTreeRowsByInstance for
aj=ag,#ah do local ak=ah[aj]if ak.Instance then ai[ak.Instance]=aj end end end function s:
_VTreeGetSortedChildren(ag)if not ag then return{}end local ah=WeakGetChildren(ag)if not ah then
return{}end local ai={}for aj,ak in ah do if ak~=self.ScreenGui then ai[#ai+1]=ak end end if ag==
game then return SortServices(ai)end return SortExplorerChildren(ai)end function s:
_VTreeBuildFiltered()local ag=self.SearchQuery or''self._VTreeFilterBuildToken=(self.
_VTreeFilterBuildToken or 0)+1 local ah=self._VTreeFilterBuildToken self._VTreeFilteredResume=nil
self._VTreeFilteredExhausted=false if ag==''then self._VTreeFilterActive=false self.
_VTreeFilteredRows=nil return end local ai=self.MatchSet if not ai then self._VTreeFilterActive=
true self._VTreeFilteredRows={}return end self._VTreeFilterActive=true self._VTreeFilteredRows={}
self:_VTreeInvalidateVisibleCache()local aj={}local ak={}local al={}local am={}local function 
AddChild(an,ao)local ap=ak[an]if not ap then ap={}ak[an]=ap end for aq,ar in ap do if ar==ao then
return end end ap[#ap+1]=ao end for an in ai do if an then local ao=an local ap local aq=0 while ao
and ao~=game and aq<64 do local ar=aj[ao]aj[ao]=true if ap then AddChild(ao,ap)end if ar then break
end ap=ao local as,at=pcall(function()return ao.Parent end)ao=as and at or nil aq+=1 end if ao==
game and ap then al[ap]=true elseif ap then am[ap]=true end end end local an={}for ao in al do an[#
an+1]=ao end an=SortServices(an)local ao={}for ap in am do ao[#ao+1]=ap end if#ao>0 then table.
sort(ao,function(ap,aq)local ar=(ap.Name or''):lower()local as=(aq.Name or''):lower()if ar==as then
return tostring(ap)<tostring(aq)end return ar<as end)end for ap,aq in ak do table.sort(aq,function(
ar,as)local at=(ar.Name or''):lower()local au=(as.Name or''):lower()if at==au then return tostring(
ar)<tostring(as)end return at<au end)end local ap=self._VTreeFilteredRows local aq=self.
_VTreeFilteredPageSize or 150 local function MakeRow(ar,as,at)local au,av=pcall(function()return ar
.Name end)local aw,ax=pcall(function()return ar.ClassName end)return{Instance=ar,Depth=as,Expanded=
true,HasChildren=at,IsNilContainer=false,RawName=(au and av)or'?',ClassName=(aw and ax)or'Instance'
}end local ar=coroutine.create(function()local ar=0 local as=aq local at at=function(au,av)local aw
=ak[au]local ax=aw~=nil and#aw>0 ap[#ap+1]=MakeRow(au,av,ax)ar+=1 if ar>=as then coroutine.yield()
as=ar+aq end if aw then for ay,az in aw do at(az,av+1)end end end for au,av in an do at(av,0)end if
#ao>0 then ap[#ap+1]={Instance=nil,Depth=0,Expanded=true,HasChildren=true,IsNilContainer=true,
RawName=`Nil Instances ({#ao})`,ClassName='Folder'}ar+=1 if ar>=as then coroutine.yield()as=ar+aq
end for au,av in ao do at(av,1)end end end)local as=self local function Resume()if ah~=as.
_VTreeFilterBuildToken then return end if coroutine.status(ar)=='dead'then as.
_VTreeFilteredExhausted=true as._VTreeFilteredResume=nil as:_VTreeUpdateCanvasSize()as:
_VTreeScheduleRebuild()return end coroutine.resume(ar)if coroutine.status(ar)=='dead'then as.
_VTreeFilteredExhausted=true as._VTreeFilteredResume=nil end as:_VTreeUpdateCanvasSize()as:
_VTreeScheduleRebuild()end self._VTreeFilteredResume=Resume Resume()end function s:
_VTreeApplyFilter()local ag=self.SearchQuery or''local ah=self._VTreeLastQuery or''if ah==''and ag
~=''then self:_VTreeSaveScroll()end self._VTreeLastQuery=ag if ah~=ag then self.
_VTreeHighlightCache={}end if ag==''then self._VTreeFilterActive=false self._VTreeFilteredRows=nil
self._VTreeFilteredResume=nil self._VTreeFilteredExhausted=false if self.FlatSearchResults then
self:_FlatHideContainer()end if self._VTreeContainer then self._VTreeContainer.Visible=true end
self:_VTreeUpdateCanvasSize()self:_VTreeInvalidateVisibleCache()self:_VTreeRebuildVisible()if ah~=
''then self:_VTreeRestoreScroll()end return end if self.FlatSearchResults then self.
_VTreeFilterActive=false self._VTreeFilteredRows=nil if self._VTreeContainer then self.
_VTreeContainer.Visible=false end return end if self._VTreeContainer then self._VTreeContainer.
Visible=true end self:_VTreeBuildFiltered()self:_VTreeUpdateCanvasSize()self:_VTreeRebuildVisible()
end function s:_VTreeSaveScroll()local ag=self.ExplorerColumn and self.ExplorerColumn.Content if
not ag then return end self._VTreeSavedScrollY=ag.CanvasPosition.Y end function s:
_VTreeRestoreScroll()local ag=self.ExplorerColumn and self.ExplorerColumn.Content if not ag then
return end if not self._VTreeSavedScrollY then return end local ah=self._VTreeSavedScrollY self.
_VTreeSavedScrollY=nil task.defer(function()if not ag or not ag.Parent then return end local ai=
math.max(0,ag.AbsoluteCanvasSize.Y-ag.AbsoluteSize.Y)ag.CanvasPosition=Vector2.new(0,math.clamp(ah,
0,ai))end)end function s:_VTreeStabiliseScrollAroundInsert(ag,ah)local ai=self.ExplorerColumn and
self.ExplorerColumn.Content if not ai then return end local aj=self._VTreeRowHeight+(self.
_VTreeRowGap or 0)local ak=ai.CanvasPosition.Y local al=math.floor(ak/aj)+1 if ag<al then task.
defer(function()if not ai or not ai.Parent then return end local am=math.max(0,ai.
AbsoluteCanvasSize.Y-ai.AbsoluteSize.Y)ai.CanvasPosition=Vector2.new(0,math.clamp(ak+aj*ah,0,am))
end)end end function s:_VTreeStabiliseScrollAroundRemove(ag,ah)local ai=self.ExplorerColumn and
self.ExplorerColumn.Content if not ai then return end local aj=self._VTreeRowHeight+(self.
_VTreeRowGap or 0)local ak=ai.CanvasPosition.Y local al=math.floor(ak/aj)+1 if ag<al then task.
defer(function()if not ai or not ai.Parent then return end local am=math.max(0,ak-aj*ah)local an=
math.max(0,ai.AbsoluteCanvasSize.Y-ai.AbsoluteSize.Y)ai.CanvasPosition=Vector2.new(0,math.clamp(am,
0,an))end)end end function s:_CollectNilInstances()local ag={}local ah={}local ai=getnilinstances
if type(ai)~='function'then return ag end local aj,ak=pcall(ai)if not aj or type(ak)~='table'then
return ag end local al=(self.NilFilterClass or''):lower()if al==''then al=nil end for am,an in ak
do if typeof(an)~='Instance'or ah[an]or an==game then continue end local ao,ap=pcall(function()
return an.Parent end)if not ao or ap~=nil then continue end if an:IsA('ServiceProvider')or an:IsA(
'Workspace')or an:IsA('Players')or an:IsA('Lighting')or an:IsA('StarterGui')or an:IsA('StarterPack'
)or an:IsA('StarterPlayer')or an:IsA('ReplicatedStorage')or an:IsA('ReplicatedFirst')or an:IsA(
'ServerStorage')or an:IsA('ServerScriptService')or an:IsA('CoreGui')or an:IsA('Teams')or an:IsA(
'Player')then continue end local aq=false local ar,as=pcall(function()return an:IsDescendantOf(game
)end)if ar and as then aq=true end if aq then continue end if al then local at,au=pcall(function()
return an.ClassName end)if not at or not au then continue end if not string.find(au:lower(),al,1,
true)then continue end end ah[an]=true ag[#ag+1]=an end table.sort(ag,function(am,an)local ao=(am.
Name or''):lower()local ap=(an.Name or''):lower()if ao==ap then return tostring(am)<tostring(an)end
return ao<ap end)return ag end function s:_VTreeStartNilStream(ag)self._VTreeNilStreamToken=(self.
_VTreeNilStreamToken or 0)+1 local ah=self._VTreeNilStreamToken local ai=self:_CollectNilInstances(
)local aj=self._VTreeFilteredPageSize or 150 local ak=1 local al=self local function 
FindContainerIdx()for am,an in al._VTreeRows do if an==ag then return am end end return nil end
local function EmitPage()if ah~=al._VTreeNilStreamToken then return end if not ag.Expanded then
return end local am=FindContainerIdx()if not am then return end local an=al._VTreeRows local ao=ag.
Depth local ap=am+1 for aq=am+1,#an do if an[aq].Depth>ao then ap=aq+1 else break end end local aq=
math.min(ak+aj-1,#ai)local ar=aq-ak+1 if ar<=0 then al._VTreeNilResume=nil al._VTreeNilExhausted=
true return end local as=#an for at=as,ap,-1 do an[at+ar]=an[at]end for at=0,ar-1 do local au=ai[ak
+at]local av=al:_VTreeMakeRowData(au,ao+1,false)al:_VTreeRefreshRowMeta(av)an[ap+at]=av al.
_VTreeRowsByInstance[au]=ap+at end ak=aq+1 al:_VTreeReindexRows(ap+ar)al:_VTreeUpdateCanvasSize()al
:_VTreeInvalidateVisibleCache()al:_VTreeScheduleRebuild()if ak>#ai then al._VTreeNilResume=nil al.
_VTreeNilExhausted=true end end self._VTreeNilResume=EmitPage self._VTreeNilExhausted=false
EmitPage()end function s:ToggleMatchByClassName()self.MatchByClassName=not self.MatchByClassName
self._FilterChangedSinceLastSearch=true self:SaveConfig()if self.SearchQuery~=''then self:
RefreshAllSearchFilters()end end function s:ToggleMatchByProperty()self.MatchByProperty=not self.
MatchByProperty self._FilterChangedSinceLastSearch=true self:SaveConfig()if self.SearchQuery~=''
then self:RefreshAllSearchFilters()end end function s:ToggleClassFilter(ag)if self.
ActiveClassFilters[ag]then self.ActiveClassFilters[ag]=nil else self.ActiveClassFilters[ag]=true
end self._FilterChangedSinceLastSearch=true self:SaveConfig()if self.SearchQuery~=''then self:
RefreshAllSearchFilters()end end function s:ToggleServiceFilter(ag)if self.HiddenServices[ag]then
self.HiddenServices[ag]=nil self.AllServicesHidden=false else self.HiddenServices[ag]=true end self
:SaveConfig()self:RebuildExplorer()end function s:ToggleNilContainerFilter()self.HideNilContainer=
not self.HideNilContainer self:SaveConfig()self:RebuildExplorer()end function s:_EscapeRichText(ag)
ag=ag:gsub('&','&amp;')ag=ag:gsub('<','&lt;')ag=ag:gsub('>','&gt;')ag=ag:gsub('"','&quot;')ag=ag:
gsub("'",'&apos;')return ag end local ag={'>=','<=','==','=','>','<','~'}function s:
_ParsePropertyQuery(ah)for ai,aj in ag do local ak=string.find(ah,aj,1,true)if ak then local al=
string.sub(ah,1,ak-1):gsub('^%s+',''):gsub('%s+$','')local am=string.sub(ah,ak+#aj):gsub('^%s+','')
:gsub('%s+$','')if al==''then return nil end return{Property=al,Operator=aj,RawValue=am,
LowerRawValue=am:lower(),NumericValue=tonumber(am),BooleanValue=(am:lower()=='true')and true or(am:
lower()=='false')and false or nil}end end return nil end function s:_CompareValues(ah,ai)local aj=
ai.Operator local ak=typeof(ah)if aj=='~'then if ak=='string'then return string.find(ah:lower(),ai.
LowerRawValue,1,true)~=nil end return string.find(tostring(ah):lower(),ai.LowerRawValue,1,true)~=
nil end if aj=='='or aj=='=='then if ak=='boolean'and ai.BooleanValue~=nil then return ah==ai.
BooleanValue end if ak=='number'and ai.NumericValue~=nil then return ah==ai.NumericValue end if ak
=='string'then return ah:lower()==ai.LowerRawValue end if ak=='EnumItem'then return ah.Name:lower()
==ai.LowerRawValue end return tostring(ah):lower()==ai.LowerRawValue end if ai.NumericValue==nil
then return false end local al if ak=='number'then al=ah elseif ak=='boolean'then al=ah and 1 or 0
else return false end if aj=='>'then return al>ai.NumericValue end if aj=='<'then return al<ai.
NumericValue end if aj=='>='then return al>=ai.NumericValue end if aj=='<='then return al<=ai.
NumericValue end return false end function s:_EntryMatchesPropertyQuery(ah,ai)local aj=ah.Instance
if not aj or aj.Parent==nil then return false end local ak=ai.Property if ak:lower()=='classname'
then if ai.Operator=='~'then return string.find(ah.ClassName:lower(),ai.LowerRawValue,1,true)~=nil
end return ah.ClassName:lower()==ai.LowerRawValue end if ak:lower()=='name'then if ai.Operator=='~'
then return string.find(ah.LowerName,ai.LowerRawValue,1,true)~=nil end return ah.LowerName==ai.
LowerRawValue end local al,am=pcall(function()return aj[ak]end)if not al then return false end
return self:_CompareValues(am,ai)end function s:_EntryMatchesQuery(ah,ai,aj)if aj then return self:
_EntryMatchesPropertyQuery(ah,aj)end local ak=string.find(ah.LowerName,ai,1,true)~=nil if ak then
return true end if self.MatchByClassName then local al=string.find(ah.ClassName:lower(),ai,1,true)
~=nil if al then return true end end return false end function s:_BuildHighlightedName(ah,ai)if not
ai or ai==''then return self:_EscapeRichText(ah),false end local aj=ah:lower()local ak=ai:lower()
local al,am=string.find(aj,ak,1,true)if not al then return self:_EscapeRichText(ah),false end local
an=self:_EscapeRichText(ah:sub(1,al-1))local ao=self:_EscapeRichText(ah:sub(al,am))local ap=self:
_EscapeRichText(ah:sub(am+1))local aq=K.Accent local ar=string.format('#%02X%02X%02X',math.floor(aq
.R*255+0.5),math.floor(aq.G*255+0.5),math.floor(aq.B*255+0.5))return`{an}<font color="{ar}"><b>{ao}</b></font>{
ap}`,true end function s:BuildSearchIndex()if self.SearchIndexBuilt then return end self.
SearchIndex={}self.SearchIndexByInstance=setmetatable({},{__mode='k'})local ah=WeakGetDescendants(
game)for ai=1,#ah do local aj=ah[ai]if typeof(aj)~='Instance'then continue end local ak,al=pcall(
function()return aj.Name end)local am,an=pcall(function()return aj.ClassName end)if not ak or not
am or type(al)~='string'then continue end local ao={Instance=aj,LowerName=al:lower(),ClassName=an}
local ap=#self.SearchIndex+1 self.SearchIndex[ap]=ao self.SearchIndexByInstance[aj]=ap if ai%5000==
0 then task.wait()if h then return end end end self.SearchIndexBuilt=true self:
HookSearchIndexEvents()end function s:_AddToSearchIndex(ah)if typeof(ah)~='Instance'or self.
SearchIndexByInstance[ah]then return end local ai,aj=pcall(function()return ah.Name end)local ak,al
=pcall(function()return ah.ClassName end)if not ai or not ak or type(aj)~='string'then return end
local am={Instance=ah,LowerName=aj:lower(),ClassName=al}local an=#self.SearchIndex+1 self.
SearchIndex[an]=am self.SearchIndexByInstance[ah]=an end function s:_RemoveFromSearchIndex(ah)if
typeof(ah)~='Instance'then return end local ai=self.SearchIndexByInstance[ah]if not ai then return
end local aj=#self.SearchIndex if ai~=aj then local ak=self.SearchIndex[aj]self.SearchIndex[ai]=ak
if ak and ak.Instance then self.SearchIndexByInstance[ak.Instance]=ai end end self.SearchIndex[aj]=
nil self.SearchIndexByInstance[ah]=nil end function s:_UpdateSearchIndexName(ah,ai)if typeof(ah)~=
'Instance'or type(ai)~='string'then return end local aj=self.SearchIndexByInstance[ah]if not aj
then return end local ak=self.SearchIndex[aj]if ak then ak.LowerName=ai:lower()end end function s:
HookSearchIndexEvents()if self._SearchIndexHooked then return end self._SearchIndexHooked=true
Track(game.DescendantAdded:Connect(function(ah)if typeof(ah)~='Instance'then return end local ai=
ClonerefInstance(ah)self:_AddToSearchIndex(ai)end))Track(game.DescendantRemoving:Connect(function(
ah)if typeof(ah)~='Instance'then return end local ai=ClonerefInstance(ah)self:
_RemoveFromSearchIndex(ai)end))end function s:_MarkAncestorsForSearch(ah)local ai=ClonerefInstance(
ah)while ai and ai~=game do self.SubtreeMatchSet[ai]=true ai=ClonerefInstance(ai.Parent)end end
function s:RunIndexedSearch(ah,ai)if not self.SearchIndexBuilt then self:BuildSearchIndex()end if
ai~=self.SearchToken or h then return end local aj=ah:lower()local ak=self.ActiveClassFilters or{}
local al=next(ak)~=nil local am if self.MatchByProperty then am=self:_ParsePropertyQuery(ah)end
local an local ao=self._LastIndexedQuery local ap=self._LastIndexedResults local aq=self.
_LastIndexedWasProperty local ar=false local as=am~=nil if ao and ap and#ao>0 and not as and not aq
and string.find(aj,ao,1,true)==1 and not self._FilterChangedSinceLastSearch then an=ap ar=true else
an=self.SearchIndex end local at={}local au=#an local av=0 for aw=1,au do local ax=an[aw]if ax and
ax.Instance and(ax.Instance.Parent~=nil or self.SearchIncludesNil)then local ay=self:
_EntryMatchesQuery(ax,aj,am)local az=(not al)or ak[ax.ClassName]if ay and az then self.MatchSet[ax.
Instance]=true self:_MarkAncestorsForSearch(ax.Instance)at[#at+1]=ax end end av+=1 if av%8000==0
then task.wait()if ai~=self.SearchToken or h then return end end end if self.SearchIncludesNil then
local aw=self:_CollectNilInstances()local ax={}local ay={}for az,aA in aw do ay[#ay+1]=aA end local
az=0 while#ay>0 do local aA=table.remove(ay)if not ax[aA]then ax[aA]=true local aB,aC=pcall(
function()return aA.Name end)local aD,aE=pcall(function()return aA.ClassName end)if aB and aD and
type(aC)=='string'then local aF={Instance=aA,LowerName=aC:lower(),ClassName=aE}local aG=self:
_EntryMatchesQuery(aF,aj,am)local aH=(not al)or ak[aE]if aG and aH then self.MatchSet[aA]=true self
:_MarkAncestorsForSearch(aA)at[#at+1]=aF end end local aF,aG=pcall(function()return
WeakGetChildren(aA)end)if aF and aG then for aH,aI in aG do if not ax[aI]then ay[#ay+1]=aI end end
end end az+=1 if az%4000==0 then task.wait()if ai~=self.SearchToken or h then return end end end
end self._LastIndexedQuery=aj self._LastIndexedResults=at self._LastIndexedWasProperty=as self.
_FilterChangedSinceLastSearch=false if self.FlatSearchResults then self:_FlatHookScroll()self:
_FlatApplyResults(at)else self:_FlatHideContainer()end self:_VTreeApplyFilter()end function s:
RefreshAllSearchFilters()local ah=self.SearchQuery or''self.SearchToken=(self.SearchToken or 0)+1
local ai=self.SearchToken self.MatchSet={}self.SubtreeMatchSet={}if ah==''then self.
_LastIndexedQuery=nil self._LastIndexedResults=nil self:_FlatHideContainer()self:_VTreeApplyFilter(
)return end task.spawn(function()self:RunIndexedSearch(ah,ai)end)end function s:
ClearSearchAndJumpTo()local ah=self.SelectedInstance if typeof(ah)~='Instance'then return end self.
_SearchTextToken=(self._SearchTextToken or 0)+1 self._SuppressSearchBoxChanged=true if self.
SearchBox then self.SearchBox.Text=''end self._SuppressSearchBoxChanged=false self.
_LastAppliedSearchQuery=''self.SearchQuery=''self:ClearSearchStateWithoutRebuild()self.
_VTreeFilterActive=false self._VTreeFilteredRows=nil self._VTreeLastQuery=''self._VTreeSavedScrollY
=nil local ai={}local aj=ah local ak=0 while aj and aj~=game and ak<64 do ai[#ai+1]=aj local al,am=
pcall(function()return aj.Parent end)aj=al and am or nil ak+=1 end if aj~=game then self:
_VTreeUpdateCanvasSize()self:_VTreeRebuildVisible()return end for al=#ai,2,-1 do local am=ai[al]
local an=self._VTreeRowsByInstance[am]or self:_VTreeResolveRowIndex(am)if not an then break end
local ao=self._VTreeRows[an]if ao and ao.HasChildren and not ao.Expanded then self:_VTreeExpand(ao)
end end self:_VTreeUpdateCanvasSize()self:_VTreeRebuildVisible()task.defer(function()if h then
return end local al=self._VTreeRowsByInstance[ah]or self:_VTreeResolveRowIndex(ah)if not al then
return end self:SetSelection({ah})self.SelectionAnchor=ah local am=self.ExplorerColumn and self.
ExplorerColumn.Content if am then local an=self._VTreeRowHeight+(self._VTreeRowGap or 0)local ao=(
al-1)*an local ap=ao-am.AbsoluteSize.Y/2+an local aq=math.max(0,am.AbsoluteCanvasSize.Y-am.
AbsoluteSize.Y)am.CanvasPosition=Vector2.new(0,math.clamp(ap,0,aq))end self:
_VTreeRefreshVisibleSelection()end)return end function s:ClearSearchStateWithoutRebuild()self.
SearchQuery=''self.MatchSet={}self.SubtreeMatchSet={}self.SearchToken=(self.SearchToken or 0)+1
self._RefreshDebounceToken=(self._RefreshDebounceToken or 0)+1 self._SearchTextToken=(self.
_SearchTextToken or 0)+1 self._LastAppliedSearchQuery=''self._VTreeFilterActive=false self.
_VTreeFilteredRows=nil self._VTreeFilteredResume=nil self._VTreeFilteredExhausted=false self.
_VTreeFilterBuildToken=(self._VTreeFilterBuildToken or 0)+1 if self._VTreeHighlightCache then self.
_VTreeHighlightCache={}end if self._VTreeInvalidateVisibleCache then self:
_VTreeInvalidateVisibleCache()end if self._VTreeUpdateCanvasSize then self:_VTreeUpdateCanvasSize()
end if self._VTreeScheduleRebuild then self:_VTreeScheduleRebuild()end end function s:
HandleSearchSubmit()local ah=self.SearchQuery if ah==''then return end local ai=os.clock()if self.
_LastSearchSubmitQuery==ah and self._LastSearchSubmitTime and ai-self._LastSearchSubmitTime<0.4
then return end self._LastSearchSubmitQuery=ah self._LastSearchSubmitTime=ai return end function s:
CollectVisibleFlatOrder()local ah={}local ai={}local function IsRowVisible(aj)if not aj.Row or not
aj.Row.Visible then return false end local ak=aj.Row.Parent if ak and not ak.Visible then return
false end return true end local function Traverse(aj)if not aj or not IsRowVisible(aj)then return
end table.insert(ah,aj.Instance)ai[aj.Instance]=#ah if aj.Expanded then for ak,al in aj.Children do
Traverse(al)end end end for aj,ak in self.RootNodes do Traverse(ak)end return ah,ai end function s:
RangeSelect(ah,ai)local aj=self._VTreeFilterActive and self._VTreeFilteredRows or self._VTreeRows
if not aj then self:SetSelection({ai})self.SelectionAnchor=ai return end local ak,al for am,an in
aj do if an.Instance==ah then ak=am end if an.Instance==ai then al=am end if ak and al then break
end end if not ak or not al then self:SetSelection({ai})self.SelectionAnchor=ai return end local am
=math.min(ak,al)local an=math.max(ak,al)local ao={}for ap=am,an do local aq=aj[ap]if aq and aq.
Instance then table.insert(ao,aq.Instance)end end self:SetSelection(ao)self.SelectedInstance=ai
self:OnSelectionChanged()end function s:SetSelection(ah)local ai={}for aj in self.SelectedSet do ai
[aj]=true end self.SelectedSet={}self.SelectedOrder={}for aj,ak in ah do if not self.SelectedSet[ak
]then self.SelectedSet[ak]=true table.insert(self.SelectedOrder,ak)end end self.SelectedInstance=
self.SelectedOrder[#self.SelectedOrder]self:OnSelectionChanged()self:_VTreeRefreshVisibleSelection(
)end function s:ToggleInSelection(ah)if self.SelectedSet[ah]then self.SelectedSet[ah]=nil for ai,aj
in self.SelectedOrder do if aj==ah then table.remove(self.SelectedOrder,ai)break end end if self.
SelectedInstance==ah then self.SelectedInstance=self.SelectedOrder[#self.SelectedOrder]end else
self.SelectedSet[ah]=true table.insert(self.SelectedOrder,ah)self.SelectedInstance=ah end self:
OnSelectionChanged()end function s:GetSelectionList()return{table.unpack(self.SelectedOrder)}end
function s:OnSelectionChanged()local ah=0 if self.SelectedOrder then for ai in self.SelectedOrder
do ah+=1 end end if self.SelectedInstance then self:RenderProperties(self.SelectedInstance)self:
UpdateSelectionHighlights()if self.PropertiesTitleLabel then if ah>1 then self.PropertiesTitleLabel
.Text=`{self.SelectedInstance.ClassName}  -  {self.SelectedInstance.Name}  ({ah} selected)`else
self.PropertiesTitleLabel.Text=`{self.SelectedInstance.ClassName}  -  {self.SelectedInstance.Name}`
end end else self:ClearPropertyConnections()self.PropertyRows={}self:ClearPropertiesContent()if
self.PropertiesTitleLabel then self.PropertiesTitleLabel.Text='(no selection)'end self:
AddPropertiesLabel('Select an instance.')end end function s:ClearPropertiesContent()if not self.
PropertiesContent then return end for ah,ai in WeakGetChildren(self.PropertiesContent)do if ai:IsA(
'GuiObject')then ai:Destroy()end end end function s:AddPropertiesLabel(ah)local ai=V:
CreateInstance('TextLabel',{Size=UDim2.new(1,0,0,24),BackgroundTransparency=1,Font=aa.Medium,Text=
ah,TextColor3=K.TextDim,TextSize=12,TextXAlignment=Enum.TextXAlignment.Left,Parent=self.
PropertiesContent})BindTheme('TextDim',function(aj)if ai and ai.Parent then ai.TextColor3=aj end
end)return ai end function s:ClearPropertyConnections()for ah,ai in self.PropertyConnections do
pcall(function()ai:Disconnect()end)end self.PropertyConnections={}end function s:CreatePropertyRow(
ah)return V:CreateInstance('Frame',{Size=UDim2.new(1,0,0,24),BackgroundColor3=K.Field,
BackgroundTransparency=1,BorderSizePixel=0,Parent=ah or self.PropertiesContent})end function s:
CreatePropertyLabel(ah,ai)return V:CreateInstance('TextLabel',{Size=UDim2.new(0.42,-8,1,0),Position
=UDim2.new(0,8,0,0),BackgroundTransparency=1,Font=aa.Medium,Text=ai,TextColor3=K.TextDim,TextSize=
12,TextXAlignment=Enum.TextXAlignment.Left,TextTruncate=Enum.TextTruncate.AtEnd,Parent=ah})end
function s:AttachPropertyCopyHandler(ah,ai,aj,ak)if not ah or not ah.Parent or typeof(ai)~=
'Instance'then return end ak=ak or aj local al=V:CreateInstance('Frame',{Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,BorderSizePixel=0,ZIndex=199,Parent=ah})al.InputBegan:Connect(function(am)
if am.UserInputType~=Enum.UserInputType.MouseButton2 then return end local an,ao=pcall(function()
return ai[aj]end)if not an then self:Notify(`Couldn't read {ak}`)return end local ap=BuildLuaPath(
ai)local aq=`{ap}.{ak} = {SerializeValue(ao)}`pcall(setclipboard,aq)self:Notify(`Copied property "{
ak}"`)end)return al end function s:CreateTextRow(ah,ai,aj,ak,al)local am=self:CreatePropertyRow(al)
self:CreatePropertyLabel(am,ai)local an=V:CreateInstance(ak and'TextBox'or'TextLabel',{Size=UDim2.
new(0.58,-8,1,0),Position=UDim2.new(0.42,0,0,0),BackgroundTransparency=1,Font=aa.Mono,Text=self:
FormatValue(aj),TextColor3=self:GetValueColor(aj),TextSize=12,TextXAlignment=Enum.TextXAlignment.
Right,ClipsDescendants=true,Parent=am})local ao={Editing=false,Input=an,Update=function(ao)an.Text=
self:FormatValue(ao)an.TextColor3=self:GetValueColor(ao)end}if ak then an.ClearTextOnFocus=false an
.Focused:Connect(function()ao.Editing=true end)an.FocusLost:Connect(function(ap)ao.Editing=false if
ap then local aq=SafeGet(ah,ai)if aq==nil then return end local ar=self:ParseEditValue(an.Text,aq)
if ar==nil then an.Text=self:FormatValue(aq)return end self:ApplyToSelection(ai,ar)else local aq=
SafeGet(ah,ai)if aq~=nil then an.Text=self:FormatValue(aq)end end end)ao.Update=function(ap)if ao.
Editing then return end an.Text=self:FormatValue(ap)an.TextColor3=self:GetValueColor(ap)end end
self.PropertyRows[ai]=ao self:AttachPropertyCopyHandler(am,ah,ai)end function s:CreateBooleanRow(ah
,ai,aj,ak)local al=self:CreatePropertyRow(ak)self:CreatePropertyLabel(al,ai)local am=V:
CreateInstance('TextButton',{Size=UDim2.new(0,56,0,18),Position=UDim2.new(1,-64,0.5,-9),
BackgroundColor3=aj and K.Accent or K.ToggleOff,BorderSizePixel=0,AutoButtonColor=false,Font=aa.
SemiBold,Text=aj and'true'or'false',TextColor3=Color3.fromRGB(255,255,255),TextSize=11,Parent=al})V
:AddStroke(am,'Border',1)local function ApplyVisual(an)am.BackgroundColor3=an and K.Accent or K.
ToggleOff am.Text=an and'true'or'false'end am.MouseButton1Click:Connect(function()local an=SafeGet(
ah,ai)if an==nil then return end local ao=not an self:ApplyToSelection(ai,ao)ApplyVisual(ao)end)
self.PropertyRows[ai]={Update=function(an)ApplyVisual(an==true)end}self:AttachPropertyCopyHandler(
al,ah,ai)end function s:CreateBooleanAttributeRow(ah,ai,aj,ak)local al=self:CreatePropertyRow(ak)
self:CreatePropertyLabel(al,ai)local am=V:CreateInstance('TextButton',{Size=UDim2.new(0,56,0,18),
Position=UDim2.new(1,-64,0.5,-9),BackgroundColor3=aj and K.Accent or K.ToggleOff,BorderSizePixel=0,
AutoButtonColor=false,Font=aa.SemiBold,Text=aj and'true'or'false',TextColor3=Color3.fromRGB(255,255
,255),TextSize=11,Parent=al})V:AddStroke(am,'Border',1)local function ApplyVisual(an)local ao=an==
true am.BackgroundColor3=ao and K.Accent or K.ToggleOff am.Text=ao and'true'or'false'end am.
MouseButton1Click:Connect(function()local an=false pcall(function()an=ah:GetAttribute(ai)==true end
)local ao=not an for ap,aq in self:GetSelectionList()do pcall(function()aq:SetAttribute(ai,ao)end)
end ApplyVisual(ao)end)self.PropertyRows[`@{ai}`]={Update=function(an)ApplyVisual(an==true)end}
return al end function V:BindThemeColor(ah,ai,aj)if not ah or not ai or not aj then return end ah[
ai]=K[aj]or ah[ai]BindTheme(aj,function(ak)if ah and ah.Parent then ah[ai]=ak end end)end function
s:CreateColorRow(ah,ai,aj,ak)local al=self:CreatePropertyRow(ak)self:CreatePropertyLabel(al,ai)
local am=V:CreateInstance('Frame',{Size=UDim2.new(0.58,-8,1,0),Position=UDim2.new(0.42,0,0,0),
BackgroundTransparency=1,Parent=al})local an=V:CreateInstance('TextLabel',{Size=UDim2.new(1,-52,1,0
),BackgroundTransparency=1,Font=aa.Mono,Text=self:FormatValue(aj),TextColor3=K.PropString,TextSize=
12,TextXAlignment=Enum.TextXAlignment.Right,Parent=am})local ao=V:CreateInstance('TextButton',{Size
=UDim2.new(0,44,0,18),Position=UDim2.new(1,-44,0.5,-9),BackgroundColor3=(typeof(aj)=='BrickColor')
and aj.Color or aj,BorderSizePixel=0,AutoButtonColor=false,Text='',Parent=am})V:AddStroke(ao,
'Border',1)ao.MouseButton1Click:Connect(function()local ap=SafeGet(ah,ai)if ap==nil then return end
local aq=(typeof(ap)=='BrickColor')and ap.Color or ap self:OpenColorPicker(aq,function(ar)local as=
(typeof(aj)=='BrickColor')and BrickColor.new(ar)or ar self:ApplyToSelection(ai,as)end)end)self.
PropertyRows[ai]={Update=function(ap)an.Text=self:FormatValue(ap)ao.BackgroundColor3=(typeof(ap)==
'BrickColor')and ap.Color or ap end}self:AttachPropertyCopyHandler(al,ah,ai)end function s:
CreateEnumRow(ah,ai,aj,ak)local al=self:CreatePropertyRow(ak)self:CreatePropertyLabel(al,ai)local
am=aj.EnumType local an=tostring(am):gsub('Enum%.','')local ao=V:CreateInstance('TextButton',{Size=
UDim2.new(0.58,-12,0,20),Position=UDim2.new(0.42,4,0.5,-10),BackgroundColor3=K.Field,
BorderSizePixel=0,AutoButtonColor=false,Font=aa.Mono,Text=`{aj.Name}`,TextColor3=K.PropEnum,
TextSize=11,TextXAlignment=Enum.TextXAlignment.Left,Parent=al})V:AddStroke(ao,'Border',1)V:
AddPadding(ao,0,8,0,8)ao.MouseButton1Click:Connect(function()local ap=d.UserInputService:
GetFocusedTextBox()if ap then pcall(function()ap:ReleaseFocus()end)end local aq=am:GetEnumItems()
self:OpenListModal(an:upper(),aq,function(ar)return ar.Name end,function(ar)self:ApplyToSelection(
ai,ar)self:CloseModal()end,true)end)self.PropertyRows[ai]={Update=function(ap)if typeof(ap)==
'EnumItem'then ao.Text=`{ap.Name}`end end}self:AttachPropertyCopyHandler(al,ah,ai)end function s:
RefreshPropertyValues()if not self.SelectedInstance then return end local ah=d.UserInputService:
GetFocusedTextBox()local ai=self.SelectedInstance for aj,ak in self.PropertyRows do if not(ak.Input
and ak.Input==ah)then local al,am=pcall(function()return ai[aj]end)if al and ak.Update then pcall(
ak.Update,am)end end end end function s:CreatePropertyCategoryHeader(ah,ai)local aj=V:
CreateInstance('Frame',{Size=UDim2.new(1,0,0,22),BackgroundTransparency=1,Parent=ah})V:
CreateInstance('TextLabel',{Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,Font=aa.Bold,Text=ai:
upper(),TextColor3=K.TextHeader,TextSize=10,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=
Enum.TextYAlignment.Bottom,Parent=aj})return aj end function s:GetPropertyCategoryFor(ah,ai)for aj,
ak in E do local al,am=pcall(function()return ai:IsA(ak.Class)end)if al and am then for an,ao in ak
.Properties do if ao==ah then return ak.Class end end end end return'Other'end function s:
RenderAttributesSection(ah,ai,aj)local ak=CollectAttributes(ah)if#ak==0 then return aj end local al
=aj V:CreateInstance('TextLabel',{Size=UDim2.new(1,0,0,18),BackgroundTransparency=1,Font=aa.Bold,
Text='ATTRIBUTES',TextColor3=K.TextHeader,TextSize=11,TextXAlignment=Enum.TextXAlignment.Left,
LayoutOrder=al,Parent=ai})al+=1 for am,an in ak do local ao=function(ao)pcall(function()ah:
SetAttribute(an.Name,ao)end)end self:CreatePropertyRow(ai,al,an.Name,an.Value,typeof(an.Value),ao,
true)al+=1 end return al end function s:RenderTagsSection(ah,ai,aj)local ak=CollectTags(ah)if#ak==0
then return aj end local al=aj V:CreateInstance('TextLabel',{Size=UDim2.new(1,0,0,18),
BackgroundTransparency=1,Font=aa.Bold,Text='TAGS',TextColor3=K.TextHeader,TextSize=11,
TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=al,Parent=ai})al+=1 for am,an in ak do local ao
=V:CreateInstance('Frame',{Size=UDim2.new(1,0,0,22),BackgroundTransparency=1,LayoutOrder=al,Parent=
ai})V:CreateInstance('TextLabel',{Size=UDim2.new(1,-52,1,0),BackgroundTransparency=1,Font=aa.Mono,
Text=tostring(an),TextColor3=K.PropString,TextSize=12,TextXAlignment=Enum.TextXAlignment.Left,
Parent=ao})local ap=V:CreateInstance('TextButton',{Size=UDim2.new(0,48,0,18),Position=UDim2.new(1,-
48,0.5,-9),BackgroundColor3=K.Field,BorderSizePixel=0,AutoButtonColor=false,Font=aa.SemiBold,Text=
'Remove',TextColor3=K.Text,TextSize=10,Parent=ao})V:AddStroke(ap,'Border',1)ap.MouseButton1Click:
Connect(function()pcall(function()d.CollectionService:RemoveTag(ah,an)end)if self.SelectedInstance
==ah then self:RenderProperties(ah)end end)al+=1 end return al end function s:RenderProperties(ah)
Handle(function()self:ClearPropertyConnections()self.PropertyRows={}self:ClearPropertiesContent()if
self.PropertiesTitleLabel then if#self.SelectedOrder>1 then self.PropertiesTitleLabel.Text=`{ah.
ClassName}  -  {ah.Name}   ({#self.SelectedOrder} selected)`else self.PropertiesTitleLabel.Text=`{
ah.ClassName}  -  {ah.Name}`end end local ai=o(ah)local aj=(self.PropertyFilter or''):lower()local
ak={}local al={}for am,an in ai do if aj~=''and not an:lower():find(aj,1,true)then continue end
local ao=self:GetPropertyCategoryFor(an,ah)if not ak[ao]then ak[ao]={}table.insert(al,ao)end table.
insert(ak[ao],an)end local function AddSpacer(am)V:CreateInstance('Frame',{Size=UDim2.new(1,0,0,am)
,BackgroundTransparency=1,Parent=self.PropertiesContent})end local function AddDivider()local am=V:
CreateInstance('Frame',{Size=UDim2.new(1,0,0,1),BackgroundColor3=K.BorderSoft,BorderSizePixel=0,
Parent=self.PropertiesContent})BindTheme('BorderSoft',function(an)am.BackgroundColor3=an end)end
for am,an in al do self:CreatePropertyCategoryHeader(self.PropertiesContent,an)AddSpacer(4)local ao
=V:CreateInstance('Frame',{Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,
BackgroundTransparency=1,Parent=self.PropertiesContent})V:AddListLayout(ao,1,Enum.FillDirection.
Vertical)for ap,aq in ak[an]do local ar,as=pcall(function()return ah[aq]end)if not ar then continue
end local at=n[aq]==true or aq=='Parent'local au=typeof(as)if au=='boolean'and not at then self:
CreateBooleanRow(ah,aq,as,ao)elseif(au=='Color3'or au=='BrickColor')and not at then self:
CreateColorRow(ah,aq,as,ao)elseif au=='EnumItem'and not at then self:CreateEnumRow(ah,aq,as,ao)else
local av=not at and self:IsEditableValue(as)self:CreateTextRow(ah,aq,as,av,ao)end local av,aw=
pcall(function()if typeof(ah)~='Instance'then return nil end local av=ah:GetPropertyChangedSignal(
aq)if not av then return nil end return av:Connect(function()local aw,ax=pcall(function()return ah[
aq]end)local ay=self.PropertyRows[aq]if aw and ay and ay.Update then ay.Update(ax)end end)end)if av
and aw then table.insert(self.PropertyConnections,aw)end end AddSpacer(6)AddDivider()AddSpacer(4)
end local am=CollectAttributes(ah)if aj~=''then local an={}for ao,ap in am do if ap.Name:lower():
find(aj,1,true)then table.insert(an,ap)end end am=an end if#am>0 or aj==''then self:
CreatePropertyCategoryHeader(self.PropertiesContent,'Attributes')AddSpacer(4)local an=V:
CreateInstance('Frame',{Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,
BackgroundTransparency=1,Parent=self.PropertiesContent})V:AddListLayout(an,1,Enum.FillDirection.
Vertical)if#am==0 then V:CreateInstance('TextLabel',{Size=UDim2.new(1,0,0,22),
BackgroundTransparency=1,Font=aa.Medium,Text=`  (no attributes)`,TextColor3=K.TextFaded,TextSize=12
,TextXAlignment=Enum.TextXAlignment.Left,Parent=an})else for ao,ap in am do local aq=ap.Name local
ar=ap.Value local as=typeof(ar)local at=as=='string'and ar:lower()or nil local au=as=='boolean'or
at=='true'or at=='false'local av=ar==true or at=='true'if au then local aw=self:CreatePropertyRow(
an)self:CreatePropertyLabel(aw,aq)for ax,ay in aw:GetChildren()do if ay:IsA('TextLabel')and ay.Text
==aq then ay.TextColor3=K.PropEnum end end local ax=V:CreateInstance('TextButton',{Size=UDim2.new(0
,56,0,18),Position=UDim2.new(1,-64,0.5,-9),BackgroundColor3=av and K.Accent or K.Field,
BorderSizePixel=0,AutoButtonColor=false,Font=aa.SemiBold,Text=av and'true'or'false',TextColor3=K.
Text,TextSize=11,ZIndex=203,Parent=aw})V:AddStroke(ax,av and K.Accent or'Border',1)local function 
ApplyAttributeToggleVisual(ay)local az=typeof(ay)local aA=az=='string'and ay:lower()or nil local aB
=ay==true or aA=='true'ax.BackgroundColor3=aB and K.Accent or K.Field ax.Text=aB and'true'or'false'
local aC=ax:FindFirstChildOfClass('UIStroke')if aC then aC.Color=aB and K.Accent or K.Border end
end ax.MouseButton1Click:Connect(function()local ay=ah:GetAttribute(aq)local az=typeof(ay)local aA=
az=='string'and ay:lower()or nil local aB=ay==true or aA=='true'local aC=not aB for aD,aE in self:
GetSelectionList()do pcall(function()aE:SetAttribute(aq,aC)end)end ApplyAttributeToggleVisual(aC)
end)self.PropertyRows[`@{aq}`]={Update=function(ay)ApplyAttributeToggleVisual(ay)end}elseif as==
'Color3'or as=='BrickColor'then self:CreateColorRow(ah,`@{aq}`,ar,an)else local aw=self:
IsEditableValue(ar)self:CreateTextRow(ah,`@{aq}`,ar,aw,an)end local aw=an:GetChildren()[#an:
GetChildren()]if aw then for ax,ay in aw:GetChildren()do if ay:IsA('TextLabel')and ay.Text==`@{aq}`
then ay.Text=aq ay.TextColor3=K.PropEnum end end local ax=V:CreateInstance('Frame',{Size=UDim2.new(
1,0,1,0),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=199,Parent=aw})ax.InputBegan:Connect(
function(ay)if ay.UserInputType~=Enum.UserInputType.MouseButton2 then return end local az=ah:
GetAttribute(aq)local aA=BuildLuaPath(ah)local aB=`{aA}:SetAttribute("{aq}", {SerializeValue(az)})`
pcall(setclipboard,aB)self:Notify(`Copied attribute "{aq}"`)end)end local ax,ay=pcall(function()
return ah:GetAttributeChangedSignal(aq):Connect(function()local ax=ah:GetAttribute(aq)local ay=self
.PropertyRows[`@{aq}`]if ay and ay.Update then pcall(ay.Update,ax)end end)end)if ax and ay then
table.insert(self.PropertyConnections,ay)end end end AddSpacer(4)local ao=V:CreateInstance('Frame',
{Size=UDim2.new(1,0,0,26),BackgroundTransparency=1,Parent=self.PropertiesContent})local ap=V:
AddListLayout(ao,4,Enum.FillDirection.Horizontal)ap.FillDirection=Enum.FillDirection.Horizontal
local function CreateAttributeButton(aq,ar)local as=V:CreateInstance('TextButton',{Size=UDim2.new(
0.25,-3,1,0),BackgroundColor3=K.Field,BorderSizePixel=0,AutoButtonColor=false,Font=aa.SemiBold,Text
=aq,TextColor3=K.Text,TextSize=11,Parent=ao})V:AddStroke(as,'Border',1)as.MouseButton1Click:
Connect(ar)return as end CreateAttributeButton('Add',function()self:OpenAttributeModal(
'Add Attribute',nil,nil)end)CreateAttributeButton('Edit',function()self:OpenEditAttributeModal()end
)CreateAttributeButton('Remove',function()self:OpenRemoveAttributeModal()end)CreateAttributeButton(
'Copy',function()local aq,ar=pcall(function()return ah:GetAttributes()end)if not aq or type(ar)~=
'table'then self:Notify('No attributes')return end local as={}for at in ar do table.insert(as,at)
end table.sort(as)if#as==0 then self:Notify('No attributes')return end local at=BuildLuaPath(ah)
local au={}for av,aw in as do table.insert(au,`{at}:SetAttribute("{aw}", {SerializeValue(ar[aw])})`
)end pcall(setclipboard,table.concat(au,'\n'))self:Notify(`Copied {#as} attribute(s)`)end)
AddSpacer(6)AddDivider()AddSpacer(4)end local an=CollectTags(ah)self:CreatePropertyCategoryHeader(
self.PropertiesContent,'Tags')AddSpacer(4)local ao=V:CreateInstance('Frame',{Size=UDim2.new(1,0,0,0
),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,Parent=self.PropertiesContent})V:
AddListLayout(ao,1,Enum.FillDirection.Vertical)if#an==0 then V:CreateInstance('TextLabel',{Size=
UDim2.new(1,0,0,22),BackgroundTransparency=1,Font=aa.Medium,Text=`  (no tags)`,TextColor3=K.
TextFaded,TextSize=12,TextXAlignment=Enum.TextXAlignment.Left,Parent=ao})else for ap,aq in an do
local ar=tostring(aq)local as=self:CreatePropertyRow(ao)V:CreateInstance('TextLabel',{Size=UDim2.
new(1,-16,1,0),Position=UDim2.new(0,8,0,0),BackgroundTransparency=1,Font=aa.Mono,Text=ar,TextColor3
=K.PropString,TextSize=12,TextXAlignment=Enum.TextXAlignment.Left,TextTruncate=Enum.TextTruncate.
AtEnd,Parent=as})local at=V:CreateInstance('Frame',{Size=UDim2.new(1,0,1,0),BackgroundTransparency=
1,BorderSizePixel=0,ZIndex=199,Parent=as})at.InputBegan:Connect(function(au)if au.UserInputType~=
Enum.UserInputType.MouseButton2 then return end local av=BuildLuaPath(ah)local aw=`game:GetService("CollectionService"):AddTag({
av}, "{ar}")`pcall(setclipboard,aw)self:Notify(`Copied tag "{ar}"`)end)end end AddSpacer(4)local ap
=V:CreateInstance('Frame',{Size=UDim2.new(1,0,0,26),BackgroundTransparency=1,Parent=self.
PropertiesContent})V:AddListLayout(ap,6,Enum.FillDirection.Horizontal)local function 
CreateTagButton(aq,ar)local as=V:CreateInstance('TextButton',{Size=UDim2.new(0.3333333333333333,-3,
1,0),BackgroundColor3=K.Field,BorderSizePixel=0,AutoButtonColor=false,Font=aa.SemiBold,Text=aq,
TextColor3=K.Text,TextSize=11,Parent=ap})V:AddStroke(as,'Border',1)as.MouseButton1Click:Connect(ar)
return as end CreateTagButton('Add Tag',function()self:OpenAddTagModal()end)CreateTagButton(
'Remove Tag',function()self:OpenRemoveTagModal()end)CreateTagButton('Copy Tags',function()local aq,
ar=pcall(function()return d.CollectionService:GetTags(ah)end)if not aq or type(ar)~='table'or#ar==0
then self:Notify('No tags')return end local as=BuildLuaPath(ah)local at={`local CollectionService = game:GetService("CollectionService")`
}for au,av in ar do table.insert(at,`CollectionService:AddTag({as}, "{av}")`)end pcall(setclipboard
,table.concat(at,'\n'))self:Notify(`Copied {#ar} tag(s)`)end)AddSpacer(6)AddDivider()AddSpacer(4)if
#ai==0 and#am==0 and#an==0 then self:AddPropertiesLabel('No registered properties for this class.')
end end,'Function Explorer.RenderProperties')end function s:CloseModal()if self.ModalWindow then
self.ModalWindow:Destroy()self.ModalWindow=nil end if self.ModalBlocker then self.ModalBlocker:
Destroy()self.ModalBlocker=nil end end function s:CreateModalWindow(ah,ai,aj,ak)ak=ak or{}if not ak
.KeepExisting then self:CloseModal()end local al if not ak.Floating then al=V:CreateInstance(
'TextButton',{Size=UDim2.fromScale(1,1),BackgroundColor3=Color3.fromRGB(0,0,0),
BackgroundTransparency=M.ModalOverlay,BorderSizePixel=0,AutoButtonColor=false,Text='',Modal=true,
ZIndex=200,Parent=self.ScreenGui})BindTransparency('ModalOverlay',function(am)if al and al.Parent
then al.BackgroundTransparency=am end end)end local am=V:CreateInstance('Frame',{Size=UDim2.
fromOffset(ai,aj),Position=UDim2.new(0.5,-ai/2,0.5,-aj/2),BackgroundTransparency=1,BorderSizePixel=
0,ClipsDescendants=true,ZIndex=201,Parent=self.ScreenGui})if ak.Position then am.Position=ak.
Position end local an=V:AddStroke(am,'Border',1)BindTheme('Window',function(ao)am.BackgroundColor3=
ao end)BindTheme('Border',function(ao)an.Color=ao end)local ao=V:CreateInstance('Frame',{Size=UDim2
.new(1,0,0,32),BackgroundColor3=K.TitleBar,BackgroundTransparency=M.TitleBar,BorderSizePixel=0,
ZIndex=202,Parent=am})BindTransparency('TitleBar',function(ap)if ao and ao.Parent then ao.
BackgroundTransparency=ap end end)BindTheme('TitleBar',function(ap)ao.BackgroundColor3=ap end)local
ap=V:CreateInstance('Frame',{Size=UDim2.new(1,0,1,-32),Position=UDim2.new(0,0,0,32),
BackgroundColor3=K.Window,BackgroundTransparency=M.Window,BorderSizePixel=0,ZIndex=201,Parent=am})
BindTheme('Window',function(aq)ap.BackgroundColor3=aq end)BindTransparency('Window',function(aq)ap.
BackgroundTransparency=aq end)V:CreateInstance('Frame',{Size=UDim2.new(1,0,0,1),Position=UDim2.new(
0,0,1,-1),BackgroundColor3=K.Border,BorderSizePixel=0,ZIndex=204,Parent=ao})V:CreateInstance(
'TextLabel',{Size=UDim2.new(1,-80,1,0),Position=UDim2.new(0,12,0,0),BackgroundTransparency=1,Font=
aa.Bold,Text=ah:upper(),TextColor3=K.Text,TextSize=11,TextXAlignment=Enum.TextXAlignment.Left,
ZIndex=203,Parent=ao})local aq=GetUIAssetId('CloseIcon')local ar=V:CreateInstance('TextButton',{
Size=UDim2.new(0,24,0,20),Position=UDim2.new(1,-32,0.5,-10),BackgroundColor3=K.Border,
BackgroundTransparency=1,BorderSizePixel=0,AutoButtonColor=false,Font=aa.Bold,Text=aq and''or'x',
TextColor3=K.TextDim,TextSize=10,ZIndex=203,Parent=ao})V:AddStroke(ar,'Border',1)local as if aq
then as=V:CreateInstance('ImageLabel',{Size=UDim2.fromOffset(12,12),Position=UDim2.new(0.5,-6,0.5,-
6),BackgroundTransparency=1,Image=aq,ImageColor3=K.TextDim,ScaleType=Enum.ScaleType.Fit,ZIndex=204,
Parent=ar})end ar.MouseButton1Click:Connect(function()if ak.Floating then am:Destroy()else self:
CloseModal()end end)local at=false local function ApplyCloseButtonVisual(au)local av=M.TitleBar or
0 local aw if at then aw=math.clamp(av*0.55,0,0.9)else aw=math.clamp(av+0.05,0,0.96)end local ax=at
and K.Selected or K.Border local ay=at and K.Text or K.TextDim if au then V:Tween(ar,{
BackgroundColor3=ax,BackgroundTransparency=aw,TextColor3=ay})else ar.BackgroundColor3=ax ar.
BackgroundTransparency=aw ar.TextColor3=ay end if as then if au then V:Tween(as,{ImageColor3=ay})
else as.ImageColor3=ay end end end BindTransparency('TitleBar',function()if ar and ar.Parent then
ApplyCloseButtonVisual(false)end end)ar.MouseEnter:Connect(function()at=true
ApplyCloseButtonVisual(true)end)ar.MouseLeave:Connect(function()at=false ApplyCloseButtonVisual(
true)end)ApplyCloseButtonVisual(false)local au=V:CreateInstance('Frame',{Size=UDim2.new(1,-20,1,-44
),Position=UDim2.new(0,10,0,38),BackgroundTransparency=1,ZIndex=202,Parent=am})local av,aw local ax
=false ao.InputBegan:Connect(function(ay)if ay.UserInputType==Enum.UserInputType.MouseButton1 or ay
.UserInputType==Enum.UserInputType.Touch then ax=true av=ay.Position aw=am.Position end end)Track(d
.UserInputService.InputChanged:Connect(function(ay)if not ax or not am.Parent then return end if ay
.UserInputType~=Enum.UserInputType.MouseMovement then return end local az=ay.Position-av am.
Position=UDim2.new(aw.X.Scale,aw.X.Offset+az.X,aw.Y.Scale,aw.Y.Offset+az.Y)end))Track(d.
UserInputService.InputEnded:Connect(function(ay)if ay.UserInputType==Enum.UserInputType.
MouseButton1 or ay.UserInputType==Enum.UserInputType.Touch then ax=false end end))if not ak.
Floating then self.ModalWindow=am self.ModalBlocker=al end if ak.Resizable then local ay=ak.
MinWidth or 320 local az=ak.MinHeight or 240 local aA=6 local function BringToFront()end local 
function MakeEdge(aB,aC,aD,aE)local aF=V:CreateInstance('Frame',{Position=aB,Size=aC,
BackgroundTransparency=1,ZIndex=210,Active=true,Parent=am})local aG=false local aH,aI,aJ aF.
InputBegan:Connect(function(aK)if aK.UserInputType==Enum.UserInputType.MouseButton1 or aK.
UserInputType==Enum.UserInputType.Touch then aG=true aH=aK.Position aI=am.AbsoluteSize aJ=am.
Position end end)Track(d.UserInputService.InputChanged:Connect(function(aK)if not aG or not am.
Parent then return end if aK.UserInputType~=Enum.UserInputType.MouseMovement and aK.UserInputType~=
Enum.UserInputType.Touch then return end local aL=aK.Position-aH local aM=aI.X local aN=aI.Y local
aO=aJ.X.Offset local aP=aJ.Y.Offset if aD==1 then aM=math.max(ay,aI.X+aL.X)elseif aD==-1 then local
aQ=math.max(ay,aI.X-aL.X)aO=aJ.X.Offset+(aI.X-aQ)aM=aQ end if aE==1 then aN=math.max(az,aI.Y+aL.Y)
elseif aE==-1 then local aQ=math.max(az,aI.Y-aL.Y)aP=aJ.Y.Offset+(aI.Y-aQ)aN=aQ end am.Size=UDim2.
fromOffset(aM,aN)am.Position=UDim2.new(aJ.X.Scale,aO,aJ.Y.Scale,aP)end))Track(d.UserInputService.
InputEnded:Connect(function(aK)if aK.UserInputType==Enum.UserInputType.MouseButton1 or aK.
UserInputType==Enum.UserInputType.Touch then aG=false end end))end MakeEdge(UDim2.new(1,-aA,0,aA),
UDim2.new(0,aA,1,-aA*2),1,0)MakeEdge(UDim2.new(0,0,0,aA),UDim2.new(0,aA,1,-aA*2),-1,0)MakeEdge(
UDim2.new(0,aA,1,-aA),UDim2.new(1,-aA*2,0,aA),0,1)MakeEdge(UDim2.new(0,aA,0,0),UDim2.new(1,-aA*2,0,
aA),0,-1)MakeEdge(UDim2.new(1,-aA,1,-aA),UDim2.fromOffset(aA,aA),1,1)MakeEdge(UDim2.new(0,0,1,-aA),
UDim2.fromOffset(aA,aA),-1,1)MakeEdge(UDim2.new(1,-aA,0,0),UDim2.fromOffset(aA,aA),1,-1)MakeEdge(
UDim2.new(0,0,0,0),UDim2.fromOffset(aA,aA),-1,-1)end return am,au end function s:OpenColorPicker(ah
,ai,aj)aj=aj or{}local ak=ah or Color3.fromRGB(255,255,255)local al=ai or function()end local am=
320 local an=420 local ao if aj.Floating and aj.AnchorWindow and aj.AnchorWindow.Parent then local
ap=workspace.CurrentCamera local aq=ap and ap.ViewportSize or Vector2.new(1366,768)local ar=aj.
AnchorWindow.AbsolutePosition local as=aj.AnchorWindow.AbsoluteSize local at=ar.X+as.X+8 local au=
ar.Y if at+am>aq.X then at=ar.X-am-8 end if au+an>aq.Y then au=math.max(0,aq.Y-an)end at=math.max(0
,at)au=math.max(0,au)ao=UDim2.fromOffset(at,au)end local ap,aq=self:CreateModalWindow(
'Color Picker',am,an,{KeepExisting=aj.Floating==true,Floating=aj.Floating==true,Position=ao})V:
AddListLayout(aq,8,Enum.FillDirection.Vertical)local ar={}local function PConn(as,at)local au=as:
Connect(at)table.insert(ar,au)Track(au)return au end ap.AncestryChanged:Connect(function(as,at)if
at==nil then for au,av in ar do pcall(function()av:Disconnect()end)end table.clear(ar)end end)local
as,at,au=Color3.toHSV(ak)local av=math.floor(ak.R*255+0.5)local aw=math.floor(ak.G*255+0.5)local ax
=math.floor(ak.B*255+0.5)local ay=false local az=V:CreateInstance('Frame',{Size=UDim2.new(1,0,0,36)
,BackgroundColor3=ak,BorderSizePixel=0,LayoutOrder=1,ZIndex=202,Parent=aq})V:AddStroke(az,'Border',
1)local aA=V:CreateInstance('ImageButton',{Size=UDim2.new(1,0,0,140),BackgroundColor3=Color3.
fromHSV(as,1,1),BorderSizePixel=0,AutoButtonColor=false,Image='',LayoutOrder=2,ZIndex=202,Parent=aq
})local aB=V:CreateInstance('Frame',{Size=UDim2.fromScale(1,1),BackgroundColor3=Color3.new(1,1,1),
BorderSizePixel=0,ZIndex=203,Parent=aA})V:CreateInstance('UIGradient',{Color=ColorSequence.new(
Color3.new(1,1,1)),Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(1,1)}),Parent=aB})local aC=V:CreateInstance('Frame',{Size=UDim2.
fromScale(1,1),BackgroundColor3=Color3.new(0,0,0),BorderSizePixel=0,ZIndex=204,Parent=aA})V:
CreateInstance('UIGradient',{Color=ColorSequence.new(Color3.new(0,0,0)),Transparency=NumberSequence
.new({NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(1,0)}),Rotation=90,Parent=aC})
local aD=V:CreateInstance('Frame',{Size=UDim2.fromOffset(10,10),Position=UDim2.fromScale(at,1-au),
AnchorPoint=Vector2.new(0.5,0.5),BackgroundTransparency=1,ZIndex=205,Parent=aA})V:AddStroke(aD,
Color3.new(1,1,1),2)local aE=V:CreateInstance('ImageButton',{Size=UDim2.new(1,0,0,18),
BackgroundColor3=Color3.new(1,1,1),BorderSizePixel=0,AutoButtonColor=false,Image='',LayoutOrder=3,
ZIndex=202,Parent=aq})V:CreateInstance('UIGradient',{Color=ColorSequence.new({ColorSequenceKeypoint
.new(0,Color3.fromHSV(0,1,1)),ColorSequenceKeypoint.new(0.16666666666666666,Color3.fromHSV(
0.16666666666666666,1,1)),ColorSequenceKeypoint.new(0.3333333333333333,Color3.fromHSV(
0.3333333333333333,1,1)),ColorSequenceKeypoint.new(0.5,Color3.fromHSV(0.5,1,1)),
ColorSequenceKeypoint.new(0.6666666666666666,Color3.fromHSV(0.6666666666666666,1,1)),
ColorSequenceKeypoint.new(0.8333333333333334,Color3.fromHSV(0.8333333333333334,1,1)),
ColorSequenceKeypoint.new(1,Color3.fromHSV(0.999,1,1))}),Parent=aE})local aF=V:CreateInstance(
'Frame',{Size=UDim2.new(0,4,1,4),Position=UDim2.new(as,0,0,-2),AnchorPoint=Vector2.new(0.5,0),
BackgroundColor3=Color3.new(1,1,1),BorderSizePixel=0,ZIndex=203,Parent=aE})V:AddStroke(aF,Color3.
fromRGB(0,0,0),1)local function CommitColor()local aG=Color3.fromHSV(as,at,au)av=math.floor(aG.R*
255+0.5)aw=math.floor(aG.G*255+0.5)ax=math.floor(aG.B*255+0.5)az.BackgroundColor3=aG aA.
BackgroundColor3=Color3.fromHSV(as,1,1)aD.Position=UDim2.fromScale(at,1-au)aF.Position=UDim2.new(as
,0,0,-2)al(aG)end local function FromRGB()as,at,au=Color3.toHSV(Color3.fromRGB(av,aw,ax))
CommitColor()end local aG=false local function UpdateSV(aH,aI)local aJ=math.clamp((aH-aA.
AbsolutePosition.X)/aA.AbsoluteSize.X,0,1)local aK=math.clamp((aI-aA.AbsolutePosition.Y)/aA.
AbsoluteSize.Y,0,1)at=aJ au=1-aK CommitColor()end aA.InputBegan:Connect(function(aH)if aH.
UserInputType==Enum.UserInputType.MouseButton1 or aH.UserInputType==Enum.UserInputType.Touch then
aG=true UpdateSV(aH.Position.X,aH.Position.Y)end end)PConn(d.UserInputService.InputChanged,function
(aH)if aG and(aH.UserInputType==Enum.UserInputType.MouseMovement or aH.UserInputType==Enum.
UserInputType.Touch)then UpdateSV(aH.Position.X,aH.Position.Y)end end)PConn(d.UserInputService.
InputEnded,function(aH)if aH.UserInputType==Enum.UserInputType.MouseButton1 or aH.UserInputType==
Enum.UserInputType.Touch then aG=false end end)local aH=false local function UpdateHue(aI)local aJ=
math.clamp((aI-aE.AbsolutePosition.X)/aE.AbsoluteSize.X,0,0.999)as=aJ CommitColor()end aE.
InputBegan:Connect(function(aI)if aI.UserInputType==Enum.UserInputType.MouseButton1 or aI.
UserInputType==Enum.UserInputType.Touch then aH=true UpdateHue(aI.Position.X)end end)PConn(d.
UserInputService.InputChanged,function(aI)if aH and(aI.UserInputType==Enum.UserInputType.
MouseMovement or aI.UserInputType==Enum.UserInputType.Touch)then UpdateHue(aI.Position.X)end end)
PConn(d.UserInputService.InputEnded,function(aI)if aI.UserInputType==Enum.UserInputType.
MouseButton1 or aI.UserInputType==Enum.UserInputType.Touch then aH=false end end)local function 
CreateChannelSlider(aI,aJ,aK,aL,aM)local aN=V:CreateInstance('Frame',{Size=UDim2.new(1,0,0,32),
BackgroundTransparency=1,LayoutOrder=aM,ZIndex=202,Parent=aq})V:CreateInstance('TextLabel',{Size=
UDim2.new(0,14,0,14),BackgroundTransparency=1,Font=aa.Bold,Text=aI,TextColor3=aJ,TextSize=11,
TextXAlignment=Enum.TextXAlignment.Left,ZIndex=203,Parent=aN})local aO=V:CreateInstance('TextLabel'
,{Size=UDim2.new(0,32,0,14),Position=UDim2.new(1,-32,0,0),BackgroundTransparency=1,Font=aa.Mono,
Text=tostring(aK()),TextColor3=K.Text,TextSize=11,TextXAlignment=Enum.TextXAlignment.Right,ZIndex=
203,Parent=aN})local aP=V:CreateInstance('Frame',{Size=UDim2.new(1,0,0,6),Position=UDim2.new(0,0,0,
20),BackgroundColor3=K.Field,BorderSizePixel=0,ZIndex=203,Parent=aN})local aQ=V:CreateInstance(
'Frame',{Size=UDim2.new(aK()/255,0,1,0),BackgroundColor3=aJ,BorderSizePixel=0,ZIndex=204,Parent=aP}
)local aR=V:CreateInstance('TextButton',{Size=UDim2.new(1,0,0,22),Position=UDim2.new(0,0,0,12),
BackgroundTransparency=1,AutoButtonColor=false,Text='',ZIndex=204,Parent=aN})local aS=false local 
function Up(aT)local aU=math.clamp((aT-aP.AbsolutePosition.X)/aP.AbsoluteSize.X,0,1)local W=math.
floor(aU*255+0.5)aQ.Size=UDim2.new(aU,0,1,0)aO.Text=tostring(W)aL(W)FromRGB()end aR.InputBegan:
Connect(function(aT)if aT.UserInputType==Enum.UserInputType.MouseButton1 or aT.UserInputType==Enum.
UserInputType.Touch then aS=true Up(aT.Position.X)end end)PConn(d.UserInputService.InputChanged,
function(aT)if aS and(aT.UserInputType==Enum.UserInputType.MouseMovement or aT.UserInputType==Enum.
UserInputType.Touch)then Up(aT.Position.X)end end)PConn(d.UserInputService.InputEnded,function(aT)
if aT.UserInputType==Enum.UserInputType.MouseButton1 or aT.UserInputType==Enum.UserInputType.Touch
then aS=false end end)return function()aQ.Size=UDim2.new(aK()/255,0,1,0)aO.Text=tostring(aK())end
end CreateChannelSlider('R',K.Red,function()return av end,function(aI)av=aI end,4)
CreateChannelSlider('G',K.Green,function()return aw end,function(aI)aw=aI end,5)
CreateChannelSlider('B',K.Blue,function()return ax end,function(aI)ax=aI end,6)end function s:
OpenListModal(ah,ai,aj,ak,al,am,an,ao)ao=ao or{}local ap=ao.Width or 360 local aq=ao.Height or 440
local ar if ao.Floating and ao.AnchorWindow and ao.AnchorWindow.Parent then local as=workspace.
CurrentCamera local at=as and as.ViewportSize or Vector2.new(1366,768)local au=ao.AnchorWindow.
AbsolutePosition local av=ao.AnchorWindow.AbsoluteSize local aw=au.X+av.X+8 local ax=au.Y if aw+ap>
at.X then aw=au.X-ap-8 end if ax+aq>at.Y then ax=math.max(0,at.Y-aq)end aw=math.max(0,aw)ax=math.
max(0,ax)ar=UDim2.fromOffset(aw,ax)end local as,at=self:CreateModalWindow(ah,ap,aq,{KeepExisting=ao
.Floating==true,Floating=ao.Floating==true,Position=ar})local au=V:AddListLayout(at,6,Enum.
FillDirection.Vertical)local av=''local aw if al then aw=V:CreateInstance('TextBox',{Size=UDim2.
new(1,0,0,26),BackgroundColor3=K.Field,BorderSizePixel=0,Font=aa.Mono,PlaceholderText='Search...',
PlaceholderColor3=K.TextFaded,Text='',TextColor3=K.Text,TextSize=11,TextXAlignment=Enum.
TextXAlignment.Left,ClearTextOnFocus=false,LayoutOrder=1,ZIndex=202,Parent=at})V:AddStroke(aw,
'Border',1)V:AddPadding(aw,0,8,0,8)BindTheme('Field',function(ax)if aw and aw.Parent then aw.
BackgroundColor3=ax end end)BindTheme('Text',function(ax)if aw and aw.Parent then aw.TextColor3=ax
end end)BindTheme('TextFaded',function(ax)if aw and aw.Parent then aw.PlaceholderColor3=ax end end)
end local ax=V:CreateInstance('ScrollingFrame',{Size=UDim2.new(1,0,1,al and-34 or 0),
BackgroundTransparency=1,BorderSizePixel=0,ScrollBarThickness=4,ScrollBarImageColor3=K.Border,
CanvasSize=UDim2.new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,ScrollingDirection=Enum.
ScrollingDirection.Y,LayoutOrder=2,ZIndex=202,Parent=at})V:BindThemeColor(ax,'ScrollBarImageColor3'
,'Border')local ay=V:AddListLayout(ax,2,Enum.FillDirection.Vertical)local az=am or 24 local aA=az>=
36 local function Render()for aB,aC in ax:GetChildren()do if aC:IsA('GuiObject')then aC:Destroy()
end end local aB=av:lower()for aC,aD in ai do local aE=aj(aD)if aB==''or aE:lower():find(aB,1,true)
then local aF=an and an(aD)local aG=aF and 26 or 8 local aH=V:CreateInstance('TextButton',{Size=
UDim2.new(1,0,0,az),BackgroundColor3=K.Field,BackgroundTransparency=0.5,BorderSizePixel=0,
AutoButtonColor=false,Font=aa.Mono,Text=aE,TextColor3=K.Text,TextSize=11,TextXAlignment=Enum.
TextXAlignment.Left,TextYAlignment=aA and Enum.TextYAlignment.Top or Enum.TextYAlignment.Center,
TextWrapped=aA,ClipsDescendants=true,ZIndex=203,Parent=ax})V:AddPadding(aH,aA and 4 or 0,8,aA and 4
or 0,aG)if aF then local aI=GetClassAssetId(aF)if aI then V:CreateInstance('ImageLabel',{Size=UDim2
.new(0,14,0,14),Position=UDim2.new(0,6-aG,0.5,-7),BackgroundTransparency=1,Image=aI,ScaleType=Enum.
ScaleType.Fit,Active=false,ZIndex=204,Parent=aH})end end aH.MouseEnter:Connect(function()V:Tween(aH
,{BackgroundTransparency=0})end)aH.MouseLeave:Connect(function()V:Tween(aH,{BackgroundTransparency=
0.5})end)aH.MouseButton1Click:Connect(function()if ao.Floating then if as and as.Parent then as:
Destroy()end else self:CloseModal()end ak(aD)end)end end end if aw then aw:
GetPropertyChangedSignal('Text'):Connect(function()av=aw.Text Render()end)end Render()end function
s:CopySelection()local ah=self:GetSelectionList()if#ah==0 then return end local ai={}for aj,ak in
ah do local al,am=pcall(function()return ak:Clone()end)if al and am then table.insert(ai,am)end end
self.Clipboard=ai end function s:PasteIntoSelection()if not self.Clipboard or#self.Clipboard==0
then return end local ah=self:GetSelectionList()if#ah==0 then return end for ai,aj in ah do for ak,
al in self.Clipboard do pcall(function()local am=al:Clone()am.Parent=aj end)end end end function s:
DestroySelection()local ah=self:GetSelectionList()if#ah==0 then return end local ai for aj,ak in ah
do local al=ak.Parent if al and al~=game then ai=al break end end for aj,ak in ah do pcall(function
()ak:Destroy()end)end if ai then self:SetSelection({ai})end end function s:DuplicateSelection()
local ah=self:GetSelectionList()local ai=0 for aj,ak in ah do local al=pcall(function()local al=ak:
Clone()al.Parent=ak.Parent end)if al then ai+=1 end end return ai end function s:
SelectChildrenOfSelection()local ah={}if self.SelectedOrder and#self.SelectedOrder>0 then for ai,aj
in self.SelectedOrder do if typeof(aj)=='Instance'then table.insert(ah,aj)end end elseif typeof(
self.SelectedInstance)=='Instance'then table.insert(ah,self.SelectedInstance)end if#ah==0 then
return end for ai,aj in ah do local ak=self._VTreeRowsByInstance[aj]or self:_VTreeResolveRowIndex(
aj)if ak then local al=self._VTreeRows[ak]if al and al.HasChildren and not al.Expanded then self:
_VTreeExpand(al)end end end local ai={}local aj=setmetatable({},{__mode='k'})for ak,al in ah do
local am,an=pcall(function()return WeakGetChildren(al)end)if am and type(an)=='table'then
SortExplorerChildren(an)for ao,ap in an do if typeof(ap)=='Instance'and not aj[ap]then aj[ap]=true
table.insert(ai,ap)end end end end if#ai==0 then self:Notify('Selected instance has no children')
return end self:SetSelection(ai)end function s:SetAnchorOnSelection(ah)local ai=self:
GetSelectionList()local aj=0 for ak,al in ai do pcall(function()if al:IsA('BasePart')then al.
Anchored=ah aj+=1 end for am,an in WeakGetDescendants(al)do if an:IsA('BasePart')then an.Anchored=
ah aj+=1 end end end)end return aj end function s:TeleportSelfTo(ah)if not ah then return false,
'no instance'end local ai if ah:IsA('Model')then pcall(function()ai=ah:GetModelCFrame()end)if not
ai then pcall(function()ai=ah.WorldPivot end)end elseif ah:IsA('BasePart')then ai=ah.CFrame elseif
ah:IsA('Attachment')then ai=ah.WorldCFrame elseif ah:IsA('Tool')then ai=ah.WorldPivot end if not ai
then return false,'no position'end local aj=self.LocalPlayer.Character local ak=aj and(aj:
FindFirstChild('HumanoidRootPart')or aj.PrimaryPart)if not ak then return false,
'no HumanoidRootPart/PrimaryPart'end ak.CFrame=ai+Vector3.new(0,3,0)return true end function s:
GetViewTarget(ah)if typeof(ah)~='Instance'then return nil end if ah:IsA('Model')then local ai,aj,ak
=pcall(function()local ai,aj=ah:GetBoundingBox()return ai,aj end)if ai and aj then return aj,ak end
local al,am=pcall(function()return ah:GetPivot()end)if al and am then return am,Vector3.new(8,8,8)
end elseif ah:IsA('BasePart')then return ah.CFrame,ah.Size end return nil end function s:
StartViewObject(ah)self:StopViewObject()if not self:GetViewTarget(ah)then self:Notify(
'Cannot view this instance')return end local ai=workspace.CurrentCamera if not ai then return end
self.ViewSavedCFrame=ai.CFrame self.ViewSavedCameraType=ai.CameraType ai.CameraType=Enum.CameraType
.Scriptable self.ViewedObject=ah self.ViewConnection=Track(d.RunService.PreRender:Connect(function(
)local aj=self.ViewedObject if not aj or not ai.Parent then return end local ak,al=self:
GetViewTarget(aj)if not ak then self:StopViewObject()return end local am=math.max(al.X,al.Y,al.Z,4)
local an=am*2.6 ai.CFrame=CFrame.lookAt(ak.Position+Vector3.new(an*0.7,an*0.45,an*0.7),ak.Position)
end))self:Notify(`Viewing {ah.Name} (middle-click to reset)`)end function s:StopViewObject()if self
.ViewConnection then pcall(function()self.ViewConnection:Disconnect()end)self.ViewConnection=nil
end local ah=workspace.CurrentCamera if ah and self.ViewSavedCameraType then pcall(function()ah.
CameraType=self.ViewSavedCameraType if self.ViewSavedCFrame then ah.CFrame=self.ViewSavedCFrame end
end)end self.ViewedObject=nil self.ViewSavedCFrame=nil self.ViewSavedCameraType=nil end function s:
ToggleViewObject(ah)if self.ViewedObject==ah then self:StopViewObject()else self:StartViewObject(ah
)end end function s:UpdateReparentIndicator()if not self.ReparentIndicator then return end if self.
ReparentMode then self.ReparentIndicator.Visible=true self.ReparentIndicator.Text=`REPARENT: click target ({
#self.ReparentSources})`else self.ReparentIndicator.Visible=false end end function s:BeginReparent(
)local ah=self:GetSelectionList()if#ah==0 then return end self.ReparentSources=ah self.ReparentMode
=true self:UpdateReparentIndicator()end function s:CommitReparent(ah)if not self.ReparentMode then
return end for ai,aj in self.ReparentSources do if aj~=ah and not ah:IsDescendantOf(aj)then
SafeSet(aj,'Parent',ah)end end self:Notify(`Reparented {#self.ReparentSources} into {ah.Name}`)self
.ReparentMode=false self.ReparentSources={}self:UpdateReparentIndicator()end function s:
CancelReparent()self.ReparentMode=false self.ReparentSources={}self:UpdateReparentIndicator()end
function s:OpenInsertObject()local ah=self:GetSelectionList()if#ah==0 then self:Notify(
'Select a parent first')return end self:OpenListModal('Insert Object',J,function(ai)return ai end,
function(ai)if self._InsertingObject then return end self._InsertingObject=true local aj=0 local ak
for al,am in ah do local an local ao=pcall(function()an=Instance.new(ai)an.Parent=am end)if ao and
an then aj+=1 ak=an end end if ak then self:_VTreeRevealInstance(ak,{Select=true})end self:Notify(`Inserted {
ai} into {aj} target(s)`)self:CloseModal()self._InsertingObject=false end,true,24,function(ai)
return ai end)end local ah={'string','number','boolean','Vector3','Vector2','Color3','BrickColor',
'UDim','UDim2','CFrame','NumberRange'}function s:ParseAttributeValue(ai,aj)local ak=aj or''if ai==
'string'then return ak end if ai=='number'then return tonumber(ak)end if ai=='boolean'then local al
=ak:lower()if al=='true'or al=='1'then return true end if al=='false'or al=='0'or al==''then return
false end return nil end if ai=='Vector3'then local al,am,an=ak:match(
'([%-%d%.]+)[,%s]+([%-%d%.]+)[,%s]+([%-%d%.]+)')if al then return Vector3.new(tonumber(al),
tonumber(am),tonumber(an))end elseif ai=='Vector2'then local al,am=ak:match(
'([%-%d%.]+)[,%s]+([%-%d%.]+)')if al then return Vector2.new(tonumber(al),tonumber(am))end elseif
ai=='Color3'then local al,am,an=ak:match('([%-%d%.]+)[,%s]+([%-%d%.]+)[,%s]+([%-%d%.]+)')if al then
local ao=tonumber(al)local ap=tonumber(am)local aq=tonumber(an)if ao>1 or ap>1 or aq>1 then return
Color3.fromRGB(math.clamp(ao,0,255),math.clamp(ap,0,255),math.clamp(aq,0,255))end return Color3.
new(ao,ap,aq)end elseif ai=='BrickColor'then local al,am=pcall(BrickColor.new,ak)if al then return
am end elseif ai=='UDim'then local al,am=ak:match('([%-%d%.]+)[,%s]+([%-%d]+)')if al then return
UDim.new(tonumber(al),tonumber(am))end elseif ai=='UDim2'then local al,am,an,ao=ak:match(
[[{?([%-%d%.]+)[,%s]+([%-%d]+)}?[,%s}]+{?([%-%d%.]+)[,%s]+([%-%d]+)}?]])if al then return UDim2.
new(tonumber(al),tonumber(am),tonumber(an),tonumber(ao))end elseif ai=='CFrame'then local al={}for
am in ak:gmatch('[%-%d%.]+')do table.insert(al,tonumber(am))end if#al==12 then return CFrame.new(
table.unpack(al))end if#al==3 then return CFrame.new(al[1],al[2],al[3])end elseif ai=='NumberRange'
then local al,am=ak:match('([%-%d%.]+)[,%s]+([%-%d%.]+)')if al then return NumberRange.new(
tonumber(al),tonumber(am))end end return nil end function s:OpenAttributeModal(ai,aj,ak)local al=
self.SelectedInstance if not al then return end local am,an=self:CreateModalWindow(ai or'Attribute'
,320,175)V:AddListLayout(an,8,Enum.FillDirection.Vertical)local function MakeFieldRow(ao,ap)local
aq=V:CreateInstance('Frame',{Size=UDim2.new(1,0,0,26),BackgroundTransparency=1,LayoutOrder=ap,
ZIndex=202,Parent=an})V:CreateInstance('TextLabel',{Size=UDim2.new(0,50,1,0),BackgroundTransparency
=1,Font=aa.Medium,Text=ao,TextColor3=K.TextDim,TextSize=12,TextXAlignment=Enum.TextXAlignment.Left,
ZIndex=203,Parent=aq})return aq end local ao=MakeFieldRow('Name',1)local ap=V:CreateInstance(
'TextBox',{Size=UDim2.new(1,-56,1,0),Position=UDim2.new(0,56,0,0),BackgroundColor3=K.Field,
BorderSizePixel=0,Font=aa.Mono,PlaceholderText='Attribute name',PlaceholderColor3=K.TextFaded,Text=
aj or'',TextColor3=K.Text,TextSize=12,TextXAlignment=Enum.TextXAlignment.Left,ClearTextOnFocus=
false,ZIndex=203,Parent=ao})V:AddStroke(ap,'Border',1)V:AddPadding(ap,0,6,0,6)local aq=
MakeFieldRow('Type',2)local ar='string'if ak~=nil then local as=typeof(ak)for at,au in ah do if au
==as then ar=au break end end end local as=V:CreateInstance('TextButton',{Size=UDim2.new(1,-56,1,0)
,Position=UDim2.new(0,56,0,0),BackgroundColor3=K.Field,BorderSizePixel=0,AutoButtonColor=false,Font
=aa.Mono,Text=`{ar}`,TextColor3=K.PropEnum,TextSize=12,TextXAlignment=Enum.TextXAlignment.Left,
ZIndex=203,Parent=aq})V:AddStroke(as,'Border',1)V:AddPadding(as,0,8,0,8)local at=V:CreateInstance(
'Frame',{Size=UDim2.fromScale(1,1),Position=UDim2.fromOffset(0,0),BackgroundTransparency=1,
ClipsDescendants=false,ZIndex=999,Parent=self.ScreenGui})local au=V:CreateInstance('Frame',{Size=
UDim2.fromOffset(180,#ah*22),Position=UDim2.fromOffset(0,0),BackgroundColor3=K.Window,
BorderSizePixel=0,Visible=false,ClipsDescendants=true,Active=true,ZIndex=1000,Parent=at})V:
AddStroke(au,'Border',1)V:CreateInstance('UIListLayout',{FillDirection=Enum.FillDirection.Vertical,
SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,0),Parent=au})local av local aw aw=function
()if not as or not as.Parent or not au or not au.Parent or not at or not at.Parent then return end
local ax=as.AbsolutePosition local ay=as.AbsoluteSize local az=at.AbsolutePosition au.Position=
UDim2.fromOffset(ax.X-az.X,ax.Y-az.Y+ay.Y+2)au.Size=UDim2.fromOffset(ay.X,#ah*22)end local function 
StartDropdownFollow()if av then av:Disconnect()av=nil end av=d.RunService.PreRender:Connect(
function()if au and au.Parent and au.Visible then aw()end end)end local function StopDropdownFollow
()if av then av:Disconnect()av=nil end end for ax,ay in ah do local az=V:CreateInstance(
'TextButton',{Size=UDim2.new(1,0,0,22),BackgroundColor3=K.Field,BackgroundTransparency=1,
BorderSizePixel=0,AutoButtonColor=false,Font=aa.Mono,Text='  '..ay,TextColor3=K.Text,TextSize=11,
TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=ax,ZIndex=1001,Parent=au})az.MouseEnter:
Connect(function()az.BackgroundTransparency=0.4 end)az.MouseLeave:Connect(function()az.
BackgroundTransparency=1 end)az.MouseButton1Click:Connect(function()ar=ay as.Text=`{ay}`au.Visible=
false StopDropdownFollow()end)end as.MouseButton1Click:Connect(function()au.Visible=not au.Visible
if au.Visible then aw()StartDropdownFollow()else StopDropdownFollow()end end)local ax=MakeFieldRow(
'Value',3)local ay=V:CreateInstance('TextBox',{Size=UDim2.new(1,-56,1,0),Position=UDim2.new(0,56,0,
0),BackgroundColor3=K.Field,BorderSizePixel=0,Font=aa.Mono,Text=ak~=nil and tostring(ak)or'',
PlaceholderText='Value',PlaceholderColor3=K.TextFaded,TextColor3=K.Text,TextSize=12,TextXAlignment=
Enum.TextXAlignment.Left,ClearTextOnFocus=false,ZIndex=203,Parent=ax})V:AddStroke(ay,'Border',1)V:
AddPadding(ay,0,6,0,6)local az=V:CreateInstance('Frame',{Size=UDim2.new(1,0,0,30),
BackgroundTransparency=1,LayoutOrder=5,ZIndex=202,Parent=an})local aA=V:AddListLayout(az,8,Enum.
FillDirection.Horizontal)aA.HorizontalAlignment=Enum.HorizontalAlignment.Right local function 
MakeBtn(aB,aC)local aD=V:CreateInstance('TextButton',{Size=UDim2.fromOffset(90,28),BackgroundColor3
=aC and K.Accent or K.Field,BackgroundTransparency=aC and 0.85 or 0,BorderSizePixel=0,
AutoButtonColor=false,Font=aa.SemiBold,Text=aB,TextColor3=aC and K.Accent or K.Text,TextSize=12,
ZIndex=203,Parent=az})V:AddStroke(aD,aC and K.Accent or'Border',1)return aD end local aB=false
local function CleanupAttributeDropdown()if aB then return end aB=true StopDropdownFollow()if au
and au.Parent then au:Destroy()end if at and at.Parent then at:Destroy()end end local function 
CloseAttributeModal()CleanupAttributeDropdown()self:CloseModal()end am.Destroying:Connect(function(
)CleanupAttributeDropdown()end)am.AncestryChanged:Connect(function(aC,aD)if aD==nil then
CleanupAttributeDropdown()end end)am:GetPropertyChangedSignal('Visible'):Connect(function()if am.
Visible==false then CleanupAttributeDropdown()end end)local aC=MakeBtn('Save',true)local aD=
MakeBtn('Cancel',false)aD.MouseButton1Click:Connect(function()CloseAttributeModal()end)aC.
MouseButton1Click:Connect(function()local aE=(ap.Text or''):gsub('^%s+',''):gsub('%s+$','')if aE==
''then self:Notify('Name required')return end local aF=self:ParseAttributeValue(ar,ay.Text)if aF==
nil and ar~='string'then if ar=='boolean'then aF=false else self:Notify(`Invalid {ar} value`)return
end end for aG,aH in self:GetSelectionList()do pcall(function()if aj and aj~=aE then aH:
SetAttribute(aj,nil)end aH:SetAttribute(aE,aF)end)end CloseAttributeModal()if self.SelectedInstance
then self:RenderProperties(self.SelectedInstance)end end)end function s:OpenRemoveAttributeModal()
local ai=self.SelectedInstance if not ai then return end local aj=CollectAttributes(ai)if#aj==0
then self:Notify('No attributes')return end self:OpenListModal('Remove Attribute',aj,function(ak)
return`{ak.Name}  ({typeof(ak.Value)})`end,function(ak)for al,am in self:GetSelectionList()do
pcall(function()am:SetAttribute(ak.Name,nil)end)end self:CloseModal()if self.SelectedInstance then
self:RenderProperties(self.SelectedInstance)end end,true)end function s:OpenEditAttributeModal()
local ai=self.SelectedInstance if not ai then return end local aj=CollectAttributes(ai)if#aj==0
then self:Notify('No attributes')return end self:OpenListModal('Edit Attribute',aj,function(ak)
return`{ak.Name}  ({typeof(ak.Value)})`end,function(ak)self:OpenAttributeModal(`Edit Attribute {ak.
Name}`,ak.Name,ak.Value)end,true)end function s:OpenAddTagModal()local ai=self.SelectedInstance if
not ai then return end local aj,ak=self:CreateModalWindow('Add Tag',280,105)V:AddListLayout(ak,8,
Enum.FillDirection.Vertical)local al=V:CreateInstance('TextBox',{Size=UDim2.new(1,0,0,26),
BackgroundColor3=K.Field,BorderSizePixel=0,Font=aa.Mono,PlaceholderText='Tag name',
PlaceholderColor3=K.TextFaded,Text='',TextColor3=K.Text,TextSize=12,TextXAlignment=Enum.
TextXAlignment.Left,ClearTextOnFocus=false,LayoutOrder=1,ZIndex=202,Parent=ak})V:AddStroke(al,
'Border',1)V:AddPadding(al,0,8,0,8)local am=V:CreateInstance('Frame',{Size=UDim2.new(1,0,0,28),
BackgroundTransparency=1,LayoutOrder=2,ZIndex=202,Parent=ak})local an=V:AddListLayout(am,8,Enum.
FillDirection.Horizontal)an.HorizontalAlignment=Enum.HorizontalAlignment.Right local function 
MakeBtn(ao,ap)local aq=V:CreateInstance('TextButton',{Size=UDim2.fromOffset(80,28),BackgroundColor3
=ap and K.Accent or K.Field,BackgroundTransparency=ap and 0.85 or 0,BorderSizePixel=0,
AutoButtonColor=false,Font=aa.SemiBold,Text=ao,TextColor3=ap and K.Accent or K.Text,TextSize=12,
ZIndex=203,Parent=am})V:AddStroke(aq,ap and K.Accent or'Border',1)return aq end local ao=MakeBtn(
'Save',true)local ap=MakeBtn('Cancel',false)ap.MouseButton1Click:Connect(function()self:CloseModal(
)end)ao.MouseButton1Click:Connect(function()local aq=(al.Text or''):gsub('^%s+',''):gsub('%s+$','')
if aq==''then return end for ar,as in self:GetSelectionList()do pcall(function()d.CollectionService
:AddTag(as,aq)end)end self:CloseModal()if self.SelectedInstance then self:RenderProperties(self.
SelectedInstance)end end)end function s:OpenRemoveTagModal()local ai=self.SelectedInstance if not
ai then return end local aj=CollectTags(ai)if#aj==0 then self:Notify('No tags')return end self:
OpenListModal('Remove Tag',aj,function(ak)return tostring(ak)end,function(ak)for al,am in self:
GetSelectionList()do pcall(function()d.CollectionService:RemoveTag(am,ak)end)end self:CloseModal()
if self.SelectedInstance then self:RenderProperties(self.SelectedInstance)end end,true)end function
s:Open3DPreview(ai)if typeof(ai)~='Instance'then return end local aj pcall(function()ai.Archivable=
true aj=ai:Clone()end)if not aj then self:Notify('Cannot clone instance')return end local ak=V:
CreateWindow({Parent=self.ScreenGui,Title=`3D Preview - {ai.Name}`,Size=UDim2.fromOffset(380,380),
Position=UDim2.fromOffset(140,140)})ak.Frame.ZIndex=70 ak:AddTitleButton('X',26,true,function()ak.
Frame:Destroy()end,'CloseIcon')local al=ak.Body local am={}local function PConn(an,ao)local ap=an:
Connect(ao)table.insert(am,ap)Track(ap)return ap end local an=V:CreateInstance('Frame',{Size=UDim2.
new(1,-16,1,-16),Position=UDim2.new(0,8,0,8),BackgroundColor3=K.Background,BorderSizePixel=0,
ClipsDescendants=true,Parent=al})local ao=V:CreateInstance('ViewportFrame',{Size=UDim2.fromScale(1,
1),BackgroundColor3=Color3.fromRGB(0,0,0),BackgroundTransparency=0,BorderSizePixel=0,Ambient=Color3
.fromRGB(140,140,140),LightColor=Color3.fromRGB(255,255,255),LightDirection=Vector3.new(-1,-1,-1),
Parent=an})local ap=b('Camera')ao.CurrentCamera=ap ap.Parent=ao local aq=b('WorldModel')aq.Parent=
ao local function AnchorAllParts(ar)if ar:IsA('BasePart')then ar.Anchored=true end for as,at in ar:
GetChildren()do AnchorAllParts(at)end end pcall(AnchorAllParts,aj)aj.Parent=aq local ar local as if
aj:IsA('Model')then local at,au,av=pcall(function()local at,au=aj:GetBoundingBox()return at,au end)
if at then ar=au.Position as=av end elseif aj:IsA('BasePart')then ar=aj.Position as=aj.Size end ar=
ar or Vector3.new()as=as or Vector3.new(4,4,4)local at=math.max(as.X,as.Y,as.Z,2)local au=at*1.4
local av=0 local aw=math.rad(15)local ax=true local function UpdateCamera()local ay=math.cos(aw)
local az=au*ay*math.sin(av)local aA=au*math.sin(aw)local aB=au*ay*math.cos(av)ap.CFrame=CFrame.
lookAt(ar+Vector3.new(az,aA,aB),ar)end UpdateCamera()local ay=Track(d.RunService.PreRender:Connect(
function(ay)if ax then av+=ay*0.5 UpdateCamera()end end))ak.Frame.AncestryChanged:Connect(function(
az,aA)if not aA then pcall(function()ay:Disconnect()end)for aB,aC in am do pcall(function()aC:
Disconnect()end)end table.clear(am)end end)local az=false local aA,aB an.InputBegan:Connect(
function(aC)if aC.UserInputType==Enum.UserInputType.MouseButton1 or aC.UserInputType==Enum.
UserInputType.Touch then az=true aA,aB=aC.Position.X,aC.Position.Y end end)PConn(d.UserInputService
.InputChanged,function(aC)if not az or not ak.Frame.Parent then return end if aC.UserInputType~=
Enum.UserInputType.MouseMovement and aC.UserInputType~=Enum.UserInputType.Touch then return end
local aD=aC.Position.X-aA local aE=aC.Position.Y-aB aA,aB=aC.Position.X,aC.Position.Y av-=aD*0.01
aw=math.clamp(aw+aE*0.01,-math.rad(85),math.rad(85))UpdateCamera()end)PConn(d.UserInputService.
InputEnded,function(aC)if aC.UserInputType==Enum.UserInputType.MouseButton1 or aC.UserInputType==
Enum.UserInputType.Touch then az=false end end)end function s:OpenCallFunction()local ai=self.
SelectedInstance if not ai then return end local aj=CollectMethods(ai)if#aj==0 then self:Notify(
'No callable methods registered')return end self:OpenListModal('Call Function',aj,function(ak)local
al={}for am,an in ak[3]do table.insert(al,`{an[2]} {an[1]}`)end return`{ak[2]} {ak[1]}({table.
concat(al,', ')})`end,function(ak)self:OpenMethodCaller(ak)end,true,38)end function s:
OpenMethodCaller(ai)local aj=self.SelectedInstance if not aj then return end local function 
FormatResultForDisplay(ak,al,am)al=al or 0 am=am or{}local an=typeof(ak)if ak==nil then return'nil'
end if an=='string'then return string.format('%q',ak)end if an=='Instance'then return`{ak.ClassName
}({ak:GetFullName()})`end if an=='EnumItem'or an=='number'or an=='boolean'then return tostring(ak)
end if an~='table'then return tostring(ak)end if am[ak]then return'<cycle>'end am[ak]=true if al>=5
then am[ak]=nil return'{...}'end local ao=0 for ap in ak do ao+=1 end if ao==0 then am[ak]=nil
return'{}'end local ap=string.rep('    ',al+1)local aq=string.rep('    ',al)local ar={}local as=0
local at=500 local au=true for av in ak do if type(av)~='number'then au=false break end end if au
then for av,aw in ak do as+=1 if as>at then ar[#ar+1]=`{ap}... ({ao-at} more)`break end ar[#ar+1]=`{
ap}{FormatResultForDisplay(aw,al+1,am)},`end else for av,aw in ak do as+=1 if as>at then ar[#ar+1]=
`{ap}... ({ao-at} more)`break end local ax if type(av)=='string'and av:match('^[%a_][%w_]*$')then
ax=av else ax=`[{FormatResultForDisplay(av,al+1,am)}]`end ar[#ar+1]=`{ap}{ax} = {
FormatResultForDisplay(aw,al+1,am)},`end end am[ak]=nil return`\{\n{table.concat(ar,'\n')}\n{aq}}`
end local ak,al=self:CreateModalWindow(`Call: {ai[1]}`,360,420)V:AddListLayout(al,6,Enum.
FillDirection.Vertical)V:CreateInstance('TextLabel',{Size=UDim2.new(1,0,0,18),
BackgroundTransparency=1,Font=aa.Mono,Text=`{ai[2]} {ai[1]}(...)`,TextColor3=K.Accent,TextSize=11,
TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=1,ZIndex=202,Parent=al})local am=#ai[3]local an
=am>6 local ao=an and 2 or 1 local ap=42 local aq=44 local ar=240 local as if an then local at=math
.ceil(am/ao)as=at*ap+(at-1)*6 else as=am*aq end as=math.max(0,as)local at=math.min(ar,as)local au=V
:CreateInstance('ScrollingFrame',{Size=UDim2.new(1,0,0,at),BackgroundTransparency=1,BorderSizePixel
=0,ScrollBarThickness=4,ScrollBarImageColor3=K.Border,CanvasSize=UDim2.new(0,0,0,0),
AutomaticCanvasSize=Enum.AutomaticSize.Y,ScrollingDirection=Enum.ScrollingDirection.Y,
ScrollBarImageTransparency=at>=as and 1 or 0,LayoutOrder=2,Visible=am>0,ZIndex=202,Parent=al})if an
then V:CreateInstance('UIGridLayout',{CellSize=UDim2.new(0.5,-3,0,42),CellPadding=UDim2.new(0,6,0,6
),SortOrder=Enum.SortOrder.LayoutOrder,FillDirectionMaxCells=ao,Parent=au})else V:CreateInstance(
'UIListLayout',{FillDirection=Enum.FillDirection.Vertical,Padding=UDim.new(0,6),SortOrder=Enum.
SortOrder.LayoutOrder,Parent=au})end local av={}for aw,ax in ai[3]do local ay=ax[1]local az=ax[2]
local aA=ax[3]or''local aB=V:CreateInstance('Frame',{Size=an and UDim2.fromOffset(0,0)or UDim2.new(
1,0,0,38),BackgroundTransparency=1,LayoutOrder=aw,ZIndex=202,Parent=au})V:CreateInstance(
'TextLabel',{Size=UDim2.new(1,0,0,14),BackgroundTransparency=1,Font=aa.Medium,Text=`{ay} : {az}`,
TextColor3=K.TextDim,TextSize=11,TextXAlignment=Enum.TextXAlignment.Left,TextTruncate=Enum.
TextTruncate.AtEnd,ZIndex=203,Parent=aB})local aC=V:CreateInstance('TextBox',{Size=UDim2.new(1,0,0,
22),Position=UDim2.new(0,0,0,16),BackgroundColor3=K.Field,BorderSizePixel=0,Font=aa.Mono,Text=aA,
TextColor3=K.Text,TextSize=11,TextXAlignment=Enum.TextXAlignment.Left,ClearTextOnFocus=false,
PlaceholderText=az,PlaceholderColor3=K.TextFaded,ZIndex=203,Parent=aB})V:AddStroke(aC,'Border',1)V:
AddPadding(aC,0,8,0,8)table.insert(av,{Box=aC,Type=az})end local function ParseArg(aw,ax)if ax==''
then return nil end if aw=='string'then return(ax:gsub('^[\'"]',''):gsub('[\'"]$',''))end if aw==
'number'then return tonumber(ax)end if aw=='boolean'then local ay=ax:lower()if ay=='true'or ay=='1'
then return true end if ay=='false'or ay=='0'then return false end return nil end if aw=='BasePart'
or aw=='Instance'then return ResolveInstanceText(ax)end if aw=='RBXScriptSignal'then local ay,az=
pcall(function()return aj[ax]end)if not ay then return nil,`Couldn't read Object.{ax}: {az}`end
local aA=typeof(az)if aA=='RBXScriptSignal'then return az end if aA=='userdata'and type(rawget(
getmetatable(az)or{},'__index'))~='nil'then return az end return nil,`Object.{ax} is {aA}, not RBXScriptSignal`
end if aw=='Vector3'then local ay,az,aA=ax:match('([%-%d%.]+)[,%s]+([%-%d%.]+)[,%s]+([%-%d%.]+)')if
ay then return Vector3.new(tonumber(ay),tonumber(az),tonumber(aA))end end if aw=='CFrame'then local
ay={}for az in ax:gmatch('[%-%d%.]+')do table.insert(ay,tonumber(az))end if#ay==12 then return
CFrame.new(table.unpack(ay))end if#ay==3 then return CFrame.new(ay[1],ay[2],ay[3])end end return ax
end local function ParseVariadic(aw)local ax={}if aw==''then return ax end local ay={}for az in aw:
gmatch('[^,]+')do ay[#ay+1]=(az:gsub('^%s+',''):gsub('%s+$',''))end for az,aA in ay do local aB=aA:
lower()local aC=tonumber(aA)if aB=='true'then ax[az]=true elseif aB=='false'then ax[az]=false
elseif aB=='nil'then ax[az]=nil elseif aC~=nil then ax[az]=aC elseif aA:match('^[\'"].*[\'"]$')then
ax[az]=aA:sub(2,-2)else local aD=ResolveInstanceText(aA)ax[az]=aD or aA end end return ax end local
aw=V:CreateInstance('ScrollingFrame',{Size=UDim2.new(1,0,0,40),BackgroundColor3=K.Field,
BorderSizePixel=0,ScrollBarThickness=4,ScrollBarImageColor3=K.Border,CanvasSize=UDim2.new(0,0,0,0),
AutomaticCanvasSize=Enum.AutomaticSize.Y,ScrollingDirection=Enum.ScrollingDirection.XY,LayoutOrder=
90,ZIndex=202,Parent=al})V:AddPadding(aw,6,8,6,8)local ax=V:CreateInstance('TextLabel',{Size=UDim2.
new(1,-8,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,Font=aa.Mono,Text=
'(no result)',TextColor3=K.TextDim,TextSize=11,TextXAlignment=Enum.TextXAlignment.Left,
TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,ZIndex=203,Parent=aw})V:AddPadding(ax,6,8,6
,8)local ay=V:CreateInstance('TextButton',{Size=UDim2.new(1,0,0,28),BackgroundColor3=K.Accent,
BackgroundTransparency=0.85,BorderSizePixel=0,AutoButtonColor=false,Font=aa.SemiBold,Text='Call',
TextColor3=K.Accent,TextSize=12,LayoutOrder=91,ZIndex=202,Parent=al})V:AddStroke(ay,K.Accent,1)
local az local aA=false ay.MouseButton1Click:Connect(function()local aB={}local aC=0 for aD,aE in
av do if aE.Type=='Variadic'then for aF,aG in ParseVariadic(aE.Box.Text)do aC+=1 aB[aC]=aG end else
local aF,aG=ParseArg(aE.Type,aE.Box.Text)if aG then ax.Text=`ERROR: {aG}`ax.TextColor3=K.Red return
end aC+=1 aB[aC]=aF end end local aD,aE=pcall(function()if type(ai.Resolve)=='function'then local
aD,aE=ai.Resolve()if not aD then error(aE or`Resolver failed for {ai[1]}`)end if ai.BuildOptions
then local aF={}for aG,aH in ai[3]do aF[aH[1] ]=aB[aG]end if type(ai.PostBuild)=='function'then aF=
ai.PostBuild(aF,aj)or aF end return aD(aF)end if ai.NoSelf then return aD(table.unpack(aB,1,#aB))
end local aF=ResolveSelfForGlobal(aj,ai)return aD(aF,table.unpack(aB,1,#aB))end if ai[4]=='global'
then local aD=GetGlobalCallable(ai[1])if not aD then error(`Global function not available: {ai[1]}`
)end if ai.BuildOptions then local aE={}for aF,aG in ai[3]do aE[aG[1] ]=aB[aF]end if type(ai.
PostBuild)=='function'then aE=ai.PostBuild(aE,aj)or aE end return aD(aE)end if ai.NoSelf then
return aD(table.unpack(aB,1,#aB))end local aE=ResolveSelfForGlobal(aj,ai)return aD(aE,table.unpack(
aB,1,#aB))end return aj[ai[1] ](aj,table.unpack(aB,1,#aB))end)az=aE aA=not aD if aD then if ai[1]==
'getconnections'and type(aE)=='table'then self:ShowConnectionsResult(aE)ax.Text=`OK: {#aE} connection(s)`
elseif type(aE)=='table'then local aF=0 for aG in aE do aF+=1 end ax.Text=`OK ({aF} entries):\n{
FormatResultForDisplay(aE)}`else ax.Text=`OK: {FormatResultForDisplay(aE)}`end ax.TextColor3=K.
Green else ax.Text=`ERROR: {tostring(aE)}`ax.TextColor3=K.Red end end)local aB=V:CreateInstance(
'TextButton',{Size=UDim2.new(1,0,0,24),BackgroundColor3=K.Field,BackgroundTransparency=0.3,
BorderSizePixel=0,AutoButtonColor=false,Font=aa.SemiBold,Text='Copy Output',TextColor3=K.Text,
TextSize=11,LayoutOrder=92,ZIndex=202,Parent=al})V:AddStroke(aB,'Border',1)local function 
SerializeOutput(aC)if aC==nil then return'nil'end local aD=typeof(aC)if aD=='string'then return
string.format('%q',aC)end if aD=='number'or aD=='boolean'then return tostring(aC)end if aD==
'Instance'then local aE,aF=pcall(function()return BuildLuaPath(aC)end)return aE and aF or aC:
GetFullName()end if aD=='table'then local aE={'{'}local aF=0 for aG,aH in aC do aF+=1 local aI=(
type(aG)=='string'and aG:match('^[%a_][%w_]*$'))and aG or`[{type(aG)=='string'and string.format(
'%q',aG)or tostring(aG)}]`aE[#aE+1]=`    {aI} = {SerializeOutput(aH)};`end if aF==0 then return'{}'
end aE[#aE+1]='}'return table.concat(aE,'\n')end local aE,aF=pcall(function()return self:
FormatValue(aC)end)if aE and type(aF)=='string'then return aF end return tostring(aC)end aB.
MouseButton1Click:Connect(function()if az==nil and not aA then aB.Text='Nothing to copy'task.delay(
1.2,function()if aB and aB.Parent then aB.Text='Copy Output'end end)return end local aC if aA then
aC=`-- ERROR: {tostring(az)}`else aC=SerializeOutput(az)end local aD=pcall(setclipboard,aC)aB.Text=
aD and'Copied!'or'Failed'task.delay(1.2,function()if aB and aB.Parent then aB.Text='Copy Output'end
end)end)end function s:ShowConnectionsResult(ai)if type(ai)~='table'or#ai==0 then self:Notify(
'No connections found')return end local aj,ak=self:CreateModalWindow(`Connections ({#ai})`,540,math
.min(560,80+#ai*68))local al=V:CreateInstance('ScrollingFrame',{Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,BorderSizePixel=0,ScrollBarThickness=4,ScrollBarImageColor3=K.Border,
CanvasSize=UDim2.new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,ZIndex=202,Parent=ak})V:
AddListLayout(al,4,Enum.FillDirection.Vertical)local function SafeRead(am,an)local ao,ap=pcall(
function()return am[an]end)if ao then return ap end return nil end local function FormatFunction(am
)if type(am)~='function'then return'<function unavailable>'end local an,ao=pcall(debug.info,am,
'sln')if an and type(ao)=='string'and ao~=''then return ao end local ap=pcall(debug.info,am,'s')if
ap then local aq=debug.info(am,'s')local ar=debug.info(am,'l')local as=debug.info(am,'n')return`{aq
or'?'}:{ar or'?'} {as and`({as})`or''}`end return tostring(am)end for am,an in ai do local ao=V:
CreateInstance('Frame',{Size=UDim2.new(1,0,0,64),BackgroundColor3=K.Field,BackgroundTransparency=
0.4,BorderSizePixel=0,LayoutOrder=am,ZIndex=202,Parent=al})V:AddStroke(ao,'Border',1)V:AddPadding(
ao,6,8,6,8)local ap=SafeRead(an,'Enabled')local aq=SafeRead(an,'ForeignState')local ar=SafeRead(an,
'LuaConnection')local as=SafeRead(an,'Function')local at=V:CreateInstance('TextLabel',{Size=UDim2.
new(1,0,0,14),BackgroundTransparency=1,Font=aa.Mono,Text=`[{am}]  Enabled={tostring(ap)}   Foreign={
tostring(aq)}   Lua={tostring(ar)}`,TextColor3=K.Text,TextSize=11,TextXAlignment=Enum.
TextXAlignment.Left,ZIndex=203,Parent=ao})local au=V:CreateInstance('TextLabel',{Size=UDim2.new(1,0
,0,14),Position=UDim2.new(0,0,0,16),BackgroundTransparency=1,Font=aa.Mono,Text=FormatFunction(as),
TextColor3=K.TextDim,TextSize=10,TextXAlignment=Enum.TextXAlignment.Left,TextTruncate=Enum.
TextTruncate.AtEnd,ZIndex=203,Parent=ao})local function RefreshEnabled()local av=SafeRead(an,
'Enabled')at.Text=`[{am}]  Enabled={tostring(av)}   Foreign={tostring(aq)}   Lua={tostring(ar)}`end
local av=V:CreateInstance('Frame',{Size=UDim2.new(1,0,0,18),Position=UDim2.new(0,0,1,-20),
BackgroundTransparency=1,ZIndex=203,Parent=ao})V:CreateInstance('UIListLayout',{FillDirection=Enum.
FillDirection.Horizontal,Padding=UDim.new(0,4),SortOrder=Enum.SortOrder.LayoutOrder,
VerticalAlignment=Enum.VerticalAlignment.Center,Parent=av})local aw=0 local function MakeBtn(ax,ay,
az)aw+=1 local aA=V:CreateInstance('TextButton',{Size=UDim2.new(0,ay,1,0),BackgroundColor3=K.Field,
BorderSizePixel=0,AutoButtonColor=false,Font=aa.SemiBold,Text=ax,TextColor3=K.Text,TextSize=10,
LayoutOrder=aw,ZIndex=203,Parent=av})V:AddStroke(aA,'Border',1)aA.MouseButton1Click:Connect(az)aA.
MouseEnter:Connect(function()V:Tween(aA,{BackgroundTransparency=0.2})end)aA.MouseLeave:Connect(
function()V:Tween(aA,{BackgroundTransparency=0})end)return aA end MakeBtn('Fire',48,function()local
ax,ay=pcall(function()an:Fire()end)if not ax then self:Notify(`Fire failed: {ay}`)end end)MakeBtn(
'Defer',52,function()local ax,ay=pcall(function()an:Defer()end)if not ax then self:Notify(`Defer failed: {
ay}`)end end)MakeBtn('Disable',60,function()local ax,ay=pcall(function()an:Disable()end)if ax then
RefreshEnabled()else self:Notify(`Disable failed: {ay}`)end end)MakeBtn('Enable',56,function()local
ax,ay=pcall(function()an:Enable()end)if ax then RefreshEnabled()else self:Notify(`Enable failed: {
ay}`)end end)MakeBtn('Disconnect',78,function()local ax,ay=pcall(function()an:Disconnect()end)if ax
then ao.BackgroundTransparency=0.8 at.TextColor3=K.TextFaded au.TextColor3=K.TextFaded self:Notify(
`Disconnected connection [{am}]`)else self:Notify(`Disconnect failed: {ay}`)end end)MakeBtn(
'Copy Function Info',120,function()local ax=FormatFunction(as)local ay=pcall(setclipboard,ax)self:
Notify(ay and'Copied function info'or'Copy failed')end)end end function s:OpenCallRemote()local ai=
self.SelectedInstance if not ai then return end local aj=ai.ClassName local ak if aj=='RemoteEvent'
or aj=='UnreliableRemoteEvent'then ak='FireServer'elseif aj=='RemoteFunction'then ak='InvokeServer'
elseif aj=='BindableEvent'then ak='Fire'elseif aj=='BindableFunction'then ak='Invoke'else self:
Notify('Selection is not a remote/bindable')return end local al,am=self:CreateModalWindow(`Call Remote :{
ak}`,380,360)V:AddListLayout(am,6,Enum.FillDirection.Vertical)V:CreateInstance('TextLabel',{Size=
UDim2.new(1,0,0,18),BackgroundTransparency=1,Font=aa.Mono,Text=`:{ak}(...)`,TextColor3=K.Accent,
TextSize=11,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=1,ZIndex=202,Parent=am})V:
CreateInstance('TextLabel',{Size=UDim2.new(1,0,0,28),BackgroundTransparency=1,Font=aa.Medium,Text=`Args (one per line: "hello", 42, true):`
,TextColor3=K.TextDim,TextSize=11,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,
TextYAlignment=Enum.TextYAlignment.Top,LayoutOrder=2,ZIndex=202,Parent=am})local an=V:
CreateInstance('TextBox',{Size=UDim2.new(1,0,0,130),BackgroundColor3=K.Field,BorderSizePixel=0,Font
=aa.Mono,Text='',TextColor3=K.Text,TextSize=11,TextXAlignment=Enum.TextXAlignment.Left,
TextYAlignment=Enum.TextYAlignment.Top,ClearTextOnFocus=false,MultiLine=true,PlaceholderText=
'(empty for no args)',PlaceholderColor3=K.TextFaded,LayoutOrder=3,ZIndex=202,Parent=am})V:
AddStroke(an,'Border',1)V:AddPadding(an,6,8,6,8)local ao=V:CreateInstance('TextLabel',{Size=UDim2.
new(1,0,0,50),BackgroundColor3=K.Field,BorderSizePixel=0,Font=aa.Mono,Text='(no result)',TextColor3
=K.TextDim,TextSize=11,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,TextYAlignment=Enum
.TextYAlignment.Top,LayoutOrder=4,ZIndex=202,Parent=am})V:AddPadding(ao,6,8,6,8)local ap=V:
CreateInstance('TextButton',{Size=UDim2.new(1,0,0,28),BackgroundColor3=K.Accent,
BackgroundTransparency=0.85,BorderSizePixel=0,AutoButtonColor=false,Font=aa.SemiBold,Text=ak,
TextColor3=K.Accent,TextSize=12,LayoutOrder=5,ZIndex=202,Parent=am})V:AddStroke(ap,K.Accent,1)ap.
MouseButton1Click:Connect(function()local aq={}for ar in an.Text:gmatch('[^\r\n]+')do local as=ar:
gsub('^%s+',''):gsub('%s+$','')if as~=''then local at=tonumber(as)if at then table.insert(aq,at)
elseif as=='true'then table.insert(aq,true)elseif as=='false'then table.insert(aq,false)elseif as==
'nil'then table.insert(aq,nil)else table.insert(aq,(as:gsub('^[\'"]',''):gsub('[\'"]$','')))end end
end local ar,as=pcall(function()return ai[ak](ai,table.unpack(aq,1,#aq))end)if ar then ao.Text=`OK: {
self:FormatValue(as)}`ao.TextColor3=K.Green else ao.Text=`ERROR: {tostring(as)}`ao.TextColor3=K.Red
end end)end local ai={Keyword='rgb(255, 105, 117)',Builtin='rgb(130, 170, 255)',Number=
'rgb(255, 198, 109)',String='rgb(195, 232, 141)',Comment='rgb(99, 121, 134)',Function=
'rgb(255, 215, 100)',Operator='rgb(220, 220, 220)',Default='rgb(230, 230, 230)',Global=
'rgb(130, 170, 255)',Member='rgb(130, 200, 255)',Type='rgb(130, 200, 255)'}local aj={['and']=true,[
'break']=true,['continue']=true,['do']=true,['else']=true,['elseif']=true,['end']=true,['false']=
true,['for']=true,['function']=true,['if']=true,['in']=true,['local']=true,['nil']=true,['not']=
true,['or']=true,['repeat']=true,['return']=true,['then']=true,['true']=true,['until']=true,[
'while']=true,['export']=true,['type']=true,['typeof']=true}local ak={['self']=true,['_G']=true,[
'_ENV']=true,['assert']=true,['error']=true,['getfenv']=true,['getmetatable']=true,['ipairs']=true,
['next']=true,['pairs']=true,['pcall']=true,['print']=true,['rawequal']=true,['rawget']=true,[
'rawlen']=true,['rawset']=true,['select']=true,['setfenv']=true,['setmetatable']=true,['tonumber']=
true,['tostring']=true,['type']=true,['unpack']=true,['xpcall']=true,['require']=true,['string']=
true,['table']=true,['math']=true,['os']=true,['coroutine']=true,['bit32']=true,['buffer']=true,[
'debug']=true,['utf8']=true,['task']=true}local al={['game']=true,['workspace']=true,['script']=
true,['plugin']=true,['shared']=true,['Enum']=true,['Instance']=true,['CFrame']=true,['Vector3']=
true,['Vector2']=true,['UDim']=true,['UDim2']=true,['Color3']=true,['BrickColor']=true,['Ray']=true
,['Region3']=true,['TweenInfo']=true,['NumberRange']=true,['NumberSequence']=true,[
'NumberSequenceKeypoint']=true,['ColorSequence']=true,['ColorSequenceKeypoint']=true,['Rect']=true,
['Faces']=true,['Axes']=true,['PhysicalProperties']=true,['Random']=true,['Vector3int16']=true,[
'Vector2int16']=true,['Region3int16']=true,['DateTime']=true,['RaycastParams']=true,[
'OverlapParams']=true}local function EscapeXml(am)return(am:gsub('&','&amp;'):gsub('<','&lt;'):
gsub('>','&gt;'):gsub('"','&quot;'))end local function Wrap(am,an)if an==''then return''end return`<font color="{
am}">{EscapeXml(an)}</font>`end local function HighlightLuau(am)local an={}local ao=1 local ap=#am
local function Emit(aq,ar)an[#an+1]=Wrap(aq,ar)end while ao<=ap do local aq=am:sub(ao,ao)local ar=
am:sub(ao,ao+1)if ar=='--'then local as=ao+2 local at=am:match('^(%[=*%[)',as)if at then local au=#
at-2 local av='%]'..string.rep('=',au)..'%]'local aw,ax=am:find(av,as+#at)local ay=ax or ap Emit(ai
.Comment,am:sub(ao,ay))ao=ay+1 else local au=am:find('\n',ao,true)or(ap+1)Emit(ai.Comment,am:sub(ao
,au-1))ao=au end elseif aq=='['and am:match('^%[=*%[',ao)then local as=am:match('^(%[=*%[)',ao)
local at=#as-2 local au='%]'..string.rep('=',at)..'%]'local av,aw=am:find(au,ao+#as)local ax=aw or
ap Emit(ai.String,am:sub(ao,ax))ao=ax+1 elseif aq=='"'or aq=="'"then local as=aq local at=ao local
au=ao+1 while au<=ap do local av=am:sub(au,au)if av=='\\'then au+=2 elseif av==as then au+=1 break
elseif av=='\n'then break else au+=1 end end Emit(ai.String,am:sub(at,au-1))ao=au elseif aq=='`'
then local as=ao local at=ao+1 while at<=ap do local au=am:sub(at,at)if au=='\\'then at+=2 elseif
au=='`'then at+=1 break else at+=1 end end Emit(ai.String,am:sub(as,at-1))ao=at elseif aq:match(
'%d')or(aq=='.'and am:sub(ao+1,ao+1):match('%d'))then local as=ao local at local au=am:sub(ao,ao+1)
if au=='0x'or au=='0X'then at=am:find('[^%w]',ao+2)or(ap+1)else at=am:find('[^%d%.eE_]',ao)or(ap+1)
if am:sub(at-1,at-1):match('[eE]')then local av=am:sub(at,at)if av=='+'or av=='-'then at=am:find(
'[^%d_]',at+1)or(ap+1)end end end Emit(ai.Number,am:sub(as,at-1))ao=at elseif aq:match('[%a_]')then
local as=am:find('[^%w_]',ao)or(ap+1)local at=am:sub(ao,as-1)local au=am:sub(as,as)local av=ao>1
and am:sub(ao-1,ao-1)or''local aw=as while aw<=ap and am:sub(aw,aw):match('[ \t]')do aw+=1 end
local ax if aj[at]then ax=ai.Keyword elseif ak[at]then ax=ai.Builtin elseif al[at]then ax=ai.Global
elseif av==':'or av=='.'then ax=au=='('and ai.Function or ai.Member elseif au=='('then ax=ai.
Function elseif(av==':'or av==',')and at:sub(1,1):match('%u')then ax=ai.Type else ax=ai.Default end
Emit(ax,at)ao=as elseif aq=='\n'or aq=='\t'or aq==' 'or aq=='\r'then local as=am:find('[^ \t\r\n]',
ao)or(ap+1)an[#an+1]=EscapeXml(am:sub(ao,as-1))ao=as else local as=ao+1 while as<=ap and am:sub(as,
as):match('[%+%-%*/%%%^=~<>#%(%)%{%}%[%]:;,%.]')do as+=1 end Emit(ai.Operator,am:sub(ao,as-1))ao=as
end end return table.concat(an)end function s:DumpScriptFunctions(am)local an=GetGlobalCallable(
'getscriptclosure')local ao=GetGlobalCallable('getgc')local ap=debug and debug.info local aq=debug
and debug.getconstants local ar=debug and debug.getupvalues local as=debug and debug.getprotos if
not(ap and(aq or ar))then return nil end local at={}local au={}local function VisitFunction(av)if
type(av)~='function'or at[av]then return end at[av]=true table.insert(au,av)if as then local aw,ax=
pcall(as,av)if aw and type(ax)=='table'then for ay,az in ax do VisitFunction(az)end end end end if
an then local av,aw=pcall(an,am)if av and type(aw)=='function'then VisitFunction(aw)end end if ao
then local av,aw=pcall(ao,true)if av and type(aw)=='table'then for ax,ay in aw do if type(ay)==
'function'and not at[ay]then local az=false if ar then local aA,aB=pcall(ar,ay)if aA and type(aB)==
'table'then for aC,aD in aB do if aD==am then az=true break end end end end if az then
VisitFunction(ay)end end end end end if#au==0 then return string.format(
[[-- No functions could be enumerated for %s
-- Your executor may not support getscriptclosure / debug APIs.]]
,am:GetFullName())end local av={}local function Push(aw)table.insert(av,aw)end local function 
FormatValue(aw)local ax=typeof(aw)if ax=='string'then return string.format('%q',aw)end if ax==
'number'or ax=='boolean'or ax=='nil'then return tostring(aw)end if ax=='Instance'then return string
.format('<%s> %s',aw.ClassName,aw:GetFullName())end if ax=='function'then local ay='?'local az='?'
local aA=''pcall(function()ay=debug.info(aw,'s')or'?'az=debug.info(aw,'l')or'?'aA=debug.info(aw,'n'
)or''end)return string.format('<function %s @ %s:%s>',aA~=''and aA or'?',ay,az)end if ax=='table'
then return string.format('<table %s>',tostring(aw))end return string.format('<%s> %s',ax,tostring(
aw))end Push(string.format('-- Function dump for %s',am:GetFullName()))Push(string.format(
'-- Functions found: %d',#au))Push(string.rep('-',72))for aw,ax in au do local ay='?'local az='?'
local aA=''pcall(function()ay=debug.info(ax,'s')or'?'az=debug.info(ax,'l')or'?'aA=debug.info(ax,'n'
)or''end)Push('')Push(string.format('[%d] %s @ %s:%s',aw,aA~=''and aA or'(anonymous)',ay,az))if aq
then local aB,aC=pcall(aq,ax)if aB and type(aC)=='table'then if next(aC)==nil then Push(
'  Constants: (none)')else Push('  Constants:')for aD,aE in aC do Push(string.format(
'    [%s] = %s',tostring(aD),FormatValue(aE)))end end else Push(string.format(
'  Constants: <unavailable> (%s)',tostring(aC)))end end if ar then local aB,aC=pcall(ar,ax)if aB
and type(aC)=='table'then if next(aC)==nil then Push('  Upvalues: (none)')else Push('  Upvalues:')
for aD,aE in aC do Push(string.format('    [%s] = %s',tostring(aD),FormatValue(aE)))end end else
Push(string.format('  Upvalues: <unavailable> (%s)',tostring(aC)))end end end return table.concat(
av,'\n')end function s:CollectScriptFunctions(am)local an=GetGlobalCallable('getscriptclosure')
local ao=debug and debug.getprotos local ap=debug and debug.getupvalues local aq=GetGlobalCallable(
'getgc')local ar={}local as={}local function Visit(at)if type(at)~='function'or ar[at]then return
end ar[at]=true as[#as+1]=at if ao then local au,av=pcall(ao,at)if au and type(av)=='table'then for
aw,ax in av do Visit(ax)end end end end local at=false if an then local au,av=pcall(an,am)if au and
type(av)=='function'then Visit(av)at=true end end if not at and aq then local au,av=pcall(aq,true)
if au and type(av)=='table'then for aw,ax in av do if type(ax)=='function'and not ar[ax]and ap then
local ay,az=pcall(ap,ax)if ay and type(az)=='table'then for aA,aB in az do if aB==am then Visit(ax)
break end end end end end end end return as end function s:OpenConstantUpvalueSearch(am)local an=
debug and debug.getconstants local ao=debug and debug.getupvalues local ap=debug and debug.info if
not(ap and(an or ao))then self:Notify('Search: executor missing debug.getconstants / getupvalues')
return end local aq=self:CollectScriptFunctions(am)if#aq==0 then self:Notify(
'Search: no functions could be enumerated')return end local ar,as=self:CreateModalWindow(`Search: {
am.Name}`,560,460)local at=V:CreateInstance('Frame',{Size=UDim2.new(1,0,0,26),Position=UDim2.new(0,
0,0,0),BackgroundTransparency=1,ZIndex=202,Parent=as})local au=V:CreateInstance('TextBox',{Size=
UDim2.new(1,-128,1,0),BackgroundColor3=K.Field,BorderSizePixel=0,Font=aa.Mono,Text='',
PlaceholderText='Search constants & upvalues\u{2026}',PlaceholderColor3=K.TextFaded,TextColor3=K.
Text,TextSize=12,TextXAlignment=Enum.TextXAlignment.Left,ClearTextOnFocus=false,ZIndex=203,Parent=
at})V:AddStroke(au,'Border',1)V:AddPadding(au,0,8,0,8)local function MakeFilterToggle(av,aw,ax,ay)
local az=ay~=false local aA=V:CreateInstance('TextButton',{Size=UDim2.new(0,aw,1,0),Position=UDim2.
new(1,-ax,0,0),BackgroundColor3=az and K.Accent or K.Field,BackgroundTransparency=az and 0 or 0.3,
BorderSizePixel=0,AutoButtonColor=false,Font=aa.SemiBold,Text=av,TextColor3=K.Text,TextSize=11,
ZIndex=203,Parent=at})V:AddStroke(aA,'Border',1)return aA,function()return az end,function(aB)az=aB
aA.BackgroundColor3=az and K.Accent or K.Field aA.BackgroundTransparency=az and 0 or 0.3 end end
local av,aw,ax=MakeFilterToggle('Const',56,122,true)local ay,az,aA=MakeFilterToggle('Upval',56,60,
true)av.MouseButton1Click:Connect(function()ax(not aw())end)ay.MouseButton1Click:Connect(function()
aA(not az())end)local aB=V:CreateInstance('TextLabel',{Size=UDim2.new(1,0,0,16),Position=UDim2.new(
0,0,0,32),BackgroundTransparency=1,Font=aa.Medium,Text='',TextColor3=K.TextDim,TextSize=11,
TextXAlignment=Enum.TextXAlignment.Left,ZIndex=202,Parent=as})local aC=V:CreateInstance(
'ScrollingFrame',{Size=UDim2.new(1,0,1,-54),Position=UDim2.new(0,0,0,54),BackgroundColor3=K.
Background,BackgroundTransparency=0.4,BorderSizePixel=0,ScrollBarThickness=4,ScrollBarImageColor3=K
.Border,CanvasSize=UDim2.new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,ScrollingDirection=
Enum.ScrollingDirection.Y,ZIndex=202,Parent=as})V:AddStroke(aC,'BorderSoft',1)V:CreateInstance(
'UIListLayout',{FillDirection=Enum.FillDirection.Vertical,Padding=UDim.new(0,2),SortOrder=Enum.
SortOrder.LayoutOrder,Parent=aC})V:AddPadding(aC,4,6,4,6)local function FormatValue(aD)local aE=
typeof(aD)if aE=='string'then return string.format('%q',aD)end if aE=='number'or aE=='boolean'or aE
=='nil'then return tostring(aD)end if aE=='Instance'then return`<{aD.ClassName}> {aD:GetFullName()}`
end if aE=='function'then local aF,aG='?','?'pcall(function()aF=debug.info(aD,'s')or'?'aG=debug.
info(aD,'l')or'?'end)return`<function @ {aF}:{aG}>`end if aE=='table'then return`<table {tostring(
aD)}>`end return`<{aE}> {tostring(aD)}`end local function ValueMatches(aD,aE)local aF=FormatValue(
aD):lower()return aF:find(aE,1,true)~=nil end local function ClearResults()for aD,aE in aC:
GetChildren()do if aE:IsA('Frame')then aE:Destroy()end end end local aD=0 local function 
AddResultRow(aE,aF,aG,aH,aI)aD+=1 local aJ=V:CreateInstance('Frame',{Size=UDim2.new(1,0,0,36),
BackgroundColor3=K.Field,BackgroundTransparency=0.5,BorderSizePixel=0,LayoutOrder=aD,ZIndex=203,
Parent=aC})V:AddStroke(aJ,'BorderSoft',1)V:CreateInstance('TextLabel',{Size=UDim2.new(1,-12,0,14),
Position=UDim2.new(0,6,0,3),BackgroundTransparency=1,Font=aa.SemiBold,Text=`[{aE}] [{aH}]  \194\183  fn #{
aF}  {aG}`,TextColor3=K.PropEnum,TextSize=11,TextXAlignment=Enum.TextXAlignment.Left,TextTruncate=
Enum.TextTruncate.AtEnd,ZIndex=204,Parent=aJ})local aK=V:CreateInstance('TextLabel',{Size=UDim2.
new(1,-12,0,16),Position=UDim2.new(0,6,0,17),BackgroundTransparency=1,Font=aa.Mono,Text=
FormatValue(aI),TextColor3=K.Text,TextSize=11,TextXAlignment=Enum.TextXAlignment.Left,TextTruncate=
Enum.TextTruncate.AtEnd,ZIndex=204,Parent=aJ})local aL=V:CreateInstance('Frame',{Size=UDim2.new(1,0
,1,0),BackgroundTransparency=1,ZIndex=205,Parent=aJ})aL.InputBegan:Connect(function(aM)if aM.
UserInputType==Enum.UserInputType.MouseButton2 then pcall(setclipboard,aK.Text)self:Notify(
'Copied value')end end)end local function RunSearch()ClearResults()aD=0 local aE=au.Text:lower()if
aE==''then aB.Text=[[Type to search constants & upvalues. Right-click a result to copy its value.]]
return end local aF=0 local aG=0 local aH=aw()local aI=az()for aJ,aK in aq do aG+=1 local aL,aM,aN=
'?','?',''pcall(function()aL=debug.info(aK,'s')or'?'aM=debug.info(aK,'l')or'?'aN=debug.info(aK,'n')
or''end)local aO=`{aN~=''and aN or'(anon)'} @ {aL}:{aM}`if aH and an then local aP,aQ=pcall(an,aK)
if aP and type(aQ)=='table'then for aR,aS in aQ do if ValueMatches(aS,aE)then AddResultRow('CONST',
aJ,aO,aR,aS)aF+=1 if aF>=500 then break end end end end end if aF>=500 then break end if aI and ao
then local aP,aQ=pcall(ao,aK)if aP and type(aQ)=='table'then for aR,aS in aQ do if ValueMatches(aS,
aE)then AddResultRow('UPVAL',aJ,aO,aR,aS)aF+=1 if aF>=500 then break end end end end end if aF>=500
then break end end aB.Text=aF>=500 and`Showing first 500 matches across {aG} function(s) (refine query for more)`
or`{aF} match(es) across {aG} function(s)`end local aE=0 au:GetPropertyChangedSignal('Text'):
Connect(function()aE+=1 local aF=aE task.delay(0.15,function()if aF==aE then RunSearch()end end)end
)av.MouseButton1Click:Connect(RunSearch)ay.MouseButton1Click:Connect(RunSearch)RunSearch()au:
CaptureFocus()end function s:OpenScriptViewer(am,an)if not am then return end self.
ScriptViewerWindows=self.ScriptViewerWindows or{}for ao,ap in self.ScriptViewerWindows do if ap.
ScriptObject==am and ap.Window.Parent then ap.Window.ZIndex=60 return end end local ao local ap=an
and t or decompile if ap then local aq,ar=pcall(ap,am)if aq and type(ar)=='string'and ar~=''then ao
=ar end end if not ao then ao=`-- Failed to decompile {am.ClassName} "{am.Name}"\n-- Your executor probably does not support decompile.`
end local aq=#self.ScriptViewerWindows local ar=(aq%6)*24 local as=(aq%6)*24 local at=V:
CreateInstance('Frame',{Size=UDim2.fromOffset(720,480),Position=UDim2.new(0.5,-360+ar,0.5,-240+as),
BackgroundColor3=K.Window,BackgroundTransparency=M.Window or 0,BorderSizePixel=0,ClipsDescendants=
true,ZIndex=50,Parent=self.ScreenGui})BindTheme('Window',function(au)at.BackgroundColor3=au end)
local au=V:AddStroke(at,'Border',1)BindTheme('Border',function(av)au.Color=av end)V:CreateInstance(
'TextButton',{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,BorderSizePixel=0,AutoButtonColor=
false,Text='',Modal=false,ZIndex=50,Parent=at})if BindTransparency then BindTransparency('Window',
function(av)at.BackgroundTransparency=av end)end local av={Window=at,ScriptObject=am}table.insert(
self.ScriptViewerWindows,av)local aw=V:CreateInstance('Frame',{Size=UDim2.new(1,0,0,32),
BackgroundColor3=K.TitleBar,BorderSizePixel=0,ZIndex=51,Parent=at})BindTheme('TitleBar',function(ax
)aw.BackgroundColor3=ax end)V:CreateInstance('Frame',{Size=UDim2.new(1,0,0,1),Position=UDim2.new(0,
0,1,-1),BackgroundColor3=K.Border,BorderSizePixel=0,ZIndex=53,Parent=aw})V:CreateInstance(
'TextLabel',{Size=UDim2.new(1,-500,1,0),Position=UDim2.new(0,12,0,0),BackgroundTransparency=1,Font=
aa.Bold,Text=`SCRIPT VIEW  -  ({am.ClassName}) {am.Parent} -> {am.Name}`,TextColor3=K.Text,TextSize
=11,TextXAlignment=Enum.TextXAlignment.Left,TextTruncate=Enum.TextTruncate.AtEnd,ZIndex=52,Parent=
aw})local ax=V:CreateInstance('Frame',{Size=UDim2.new(0,0,0,20),AutomaticSize=Enum.AutomaticSize.X,
Position=UDim2.new(1,-8,0.5,-10),AnchorPoint=Vector2.new(1,0),BackgroundTransparency=1,ZIndex=52,
Parent=aw})V:CreateInstance('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,Padding=
UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder,VerticalAlignment=Enum.VerticalAlignment.Center,
Parent=ax})local ay=0 local function MakeStripButton(az,aA,aB)ay+=1 local aC=V:CreateInstance(
'TextButton',{Size=UDim2.fromOffset(aA,20),BackgroundColor3=K.Field,BackgroundTransparency=0.3,
BorderSizePixel=0,AutoButtonColor=false,Font=aa.SemiBold,Text=az,TextColor3=K.Text,TextSize=11,
LayoutOrder=ay,ZIndex=52,Parent=ax})V:AddStroke(aC,'Border',1)aC.MouseButton1Click:Connect(aB)
return aC end local function SafeFileBase()local az=am:GetFullName()local aA=az:gsub('[^%w%-_%.]',
'_')return aA end local function FlashButton(az,aA,aB,aC)local aD=az.Text az.Text=aC and aA or aB
task.delay(1.2,function()if az and az.Parent then az.Text=aD end end)end local az az=
MakeStripButton('Copy',60,function()local aA=pcall(setclipboard,ao)FlashButton(az,'Copied!',
'Failed',aA)end)local aA aA=MakeStripButton('Dump Script',86,function()local aB=`vex_dumps/{
SafeFileBase()}.luau`local aC=false if writefile and isfolder and makefolder then aC=pcall(function
()if not isfolder('vex_dumps')then makefolder('vex_dumps')end writefile(aB,ao)end)end local aD=
pcall(setclipboard,ao)FlashButton(aA,aC and'Saved!'or(aD and'Copied!'or'Failed'),'Failed',aC or aD)
self:Notify(aC and`Dumped script -> {aB}`or'Script dump failed (file)')end)local aB aB=
MakeStripButton('Dump Functions',108,function()local aC=self:DumpScriptFunctions(am)if not aC then
FlashButton(aB,'-','Unavailable',false)self:Notify(
'Dump functions: executor missing required globals')return end local aD=`vex_dumps/{SafeFileBase()}.functions.txt`
local aE=false if writefile and isfolder and makefolder then aE=pcall(function()if not isfolder(
'vex_dumps')then makefolder('vex_dumps')end writefile(aD,aC)end)end local aF=pcall(setclipboard,aC)
FlashButton(aB,aE and'Saved!'or(aF and'Copied!'or'Failed'),'Failed',aE or aF)self:Notify(aE and`Dumped functions -> {
aD}`or'Functions dump failed (file)')end)local aC aC=MakeStripButton('Dump Bytecode',102,function()
local aD=GetGlobalCallable('getscriptbytecode')if not aD then FlashButton(aC,'-','Unavailable',
false)self:Notify('Dump bytecode: executor missing getscriptbytecode')return end local aE,aF=pcall(
aD,am)if not aE or type(aF)~='string'or aF==''then FlashButton(aC,'-','Failed',false)self:Notify(`Bytecode dump failed: {
tostring(aF)}`)return end local aG=`vex_dumps/{SafeFileBase()}.bytecode.bin`local aH=false if
writefile and isfolder and makefolder then aH=pcall(function()if not isfolder('vex_dumps')then
makefolder('vex_dumps')end writefile(aG,aF)end)end local aI=false local aJ=math.min(#aF,4096)local
aK={}for aL=1,aJ do aK[aL]=string.format('%02X',string.byte(aF,aL))end local aL=table.concat(aK,' '
)if#aF>aJ then aL..=`\n-- truncated, full length: {#aF} bytes`end aI=pcall(setclipboard,aL)
FlashButton(aC,aH and'Saved!'or(aI and'Copied hex'or'Failed'),'Failed',aH or aI)self:Notify(aH and`Dumped bytecode ({
#aF} bytes) -> {aG}`or'Bytecode dump failed (file)')end)local aD aD=MakeStripButton('Search',64,
function()self:OpenConstantUpvalueSearch(am)end)local aE=GetUIAssetId('CloseIcon')local aF=V:
CreateInstance('TextButton',{Size=UDim2.fromOffset(28,20),BackgroundColor3=K.Accent,
BackgroundTransparency=0.85,BorderSizePixel=0,AutoButtonColor=false,Font=aa.Bold,Text=aE and''or'x'
,TextColor3=K.Accent,TextSize=10,LayoutOrder=999,ZIndex=52,Parent=ax})local aG=V:AddStroke(aF,K.
Accent,1)local aH if aE then aH=V:CreateInstance('ImageLabel',{Size=UDim2.fromOffset(12,12),
Position=UDim2.new(0.5,-6,0.5,-6),BackgroundTransparency=1,Image=aE,ImageColor3=K.Accent,ScaleType=
Enum.ScaleType.Fit,ZIndex=53,Parent=aF})end BindTheme('Accent',function(aI)aF.BackgroundColor3=aI
aF.TextColor3=aI aG.Color=aI if aH then aH.ImageColor3=aI end end)aF.MouseButton1Click:Connect(
function()for aI,aJ in self.ScriptViewerWindows do if aJ==av then table.remove(self.
ScriptViewerWindows,aI)break end end at:Destroy()end)local aI=V:CreateInstance('Frame',{Size=UDim2.
new(1,-16,1,-42),Position=UDim2.new(0,8,0,36),BackgroundColor3=K.Background,BorderSizePixel=0,
ClipsDescendants=true,ZIndex=51,Parent=at})V:AddStroke(aI,K.BorderSoft,1)BindTheme('Background',
function(aJ)aI.BackgroundColor3=aJ end)local aJ=V:CreateInstance('ScrollingFrame',{Size=UDim2.new(1
,0,1,0),BackgroundTransparency=1,BorderSizePixel=0,ScrollBarThickness=6,ScrollBarImageColor3=K.
Border,CanvasSize=UDim2.new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.XY,ScrollingDirection=
Enum.ScrollingDirection.XY,HorizontalScrollBarInset=Enum.ScrollBarInset.ScrollBar,
VerticalScrollBarInset=Enum.ScrollBarInset.ScrollBar,ZIndex=51,Parent=aI})local aK={}for aL in(`{ao
}\n`):gmatch('([^\n]*)\n')do aK[#aK+1]=aL end local aL=#aK local aM=#tostring(math.max(1,aL))local
aN=8+aM*7+8 local aO=V:CreateInstance('Frame',{Size=UDim2.fromOffset(aN,0),AutomaticSize=Enum.
AutomaticSize.Y,BackgroundColor3=K.TitleBar,BackgroundTransparency=0.5,BorderSizePixel=0,ZIndex=52,
Parent=aJ})V:CreateInstance('UIListLayout',{SortOrder=Enum.SortOrder.LayoutOrder,Parent=aO})V:
AddPadding(aO,6,8,6,0)local aP=V:CreateInstance('Frame',{Size=UDim2.fromOffset(0,0),AutomaticSize=
Enum.AutomaticSize.XY,Position=UDim2.fromOffset(aN+6,0),BackgroundTransparency=1,ZIndex=52,Parent=
aJ})V:CreateInstance('UIListLayout',{SortOrder=Enum.SortOrder.LayoutOrder,HorizontalAlignment=Enum.
HorizontalAlignment.Left,Parent=aP})V:AddPadding(aP,6,8,6,4)local aQ=200 local aR=180000 local aS=0
local function MakeCodeLabel(aT)aS+=1 return V:CreateInstance('TextLabel',{Size=UDim2.fromOffset(0,
0),AutomaticSize=Enum.AutomaticSize.XY,BackgroundTransparency=1,Font=aa.Code,Text=aT,TextColor3=K.
Text,TextSize=13,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,
TextWrapped=false,RichText=true,ZIndex=52,LayoutOrder=aS,Parent=aP})end local function 
MakeGutterLabel(aT,aU)local W={}for X=aT,aU do W[#W+1]=tostring(X)end return V:CreateInstance(
'TextLabel',{Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
Font=aa.Code,Text=table.concat(W,'\n'),TextColor3=K.TextFaded,TextSize=13,TextXAlignment=Enum.
TextXAlignment.Right,TextYAlignment=Enum.TextYAlignment.Top,LayoutOrder=aS,ZIndex=52,Parent=aO})end
local function HighlightSafe(aT)local aU,W=pcall(HighlightLuau,aT)if not aU or type(W)~='string'
then return EscapeXml(aT)end return W end local aT=1 while aT<=aL do local aU=math.min(aL,aT+aQ-1)
local W=table.concat(aK,'\n',aT,aU)local X=HighlightSafe(W)while#X>aR and aU>aT do aU=aT+math.max(1
,math.floor((aU-aT)/2))W=table.concat(aK,'\n',aT,aU)X=HighlightSafe(W)end if#X>aR then X=`{X:sub(1,
aR)}...`end MakeGutterLabel(aT,aU)MakeCodeLabel(X)aT=aU+1 end local function BringToFront()local aU
=50 for W,X in self.ScriptViewerWindows do if X.Window and X.Window.Parent and X~=av then X.Window.
ZIndex=50 if X.Window.ZIndex>aU then aU=X.Window.ZIndex end end end at.ZIndex=aU+5 at.Parent=at.
Parent end at.InputBegan:Connect(function(aU)if aU.UserInputType==Enum.UserInputType.MouseButton1
or aU.UserInputType==Enum.UserInputType.Touch then BringToFront()end end)local aU=false local W,X
aw.InputBegan:Connect(function(Y)if Y.UserInputType==Enum.UserInputType.MouseButton1 or Y.
UserInputType==Enum.UserInputType.Touch then aU=true W=Y.Position X=at.Position BringToFront()end
end)Track(d.UserInputService.InputChanged:Connect(function(Y)if not aU or not at.Parent then return
end if Y.UserInputType~=Enum.UserInputType.MouseMovement and Y.UserInputType~=Enum.UserInputType.
Touch then return end local Z=Y.Position-W at.Position=UDim2.new(X.X.Scale,X.X.Offset+Z.X,X.Y.Scale
,X.Y.Offset+Z.Y)end))Track(d.UserInputService.InputEnded:Connect(function(Y)if Y.UserInputType==
Enum.UserInputType.MouseButton1 or Y.UserInputType==Enum.UserInputType.Touch then aU=false end end)
)local Y,Z=360,220 local _=6 local function MakeEdge(aV,aW,aX,aY)local aZ=V:CreateInstance('Frame',
{Position=aV,Size=aW,BackgroundTransparency=1,ZIndex=60,Active=true,Parent=at})local a_=false local
a0,a1,a2 aZ.InputBegan:Connect(function(a3)if a3.UserInputType==Enum.UserInputType.MouseButton1 or
a3.UserInputType==Enum.UserInputType.Touch then a_=true a0=a3.Position a1=at.AbsoluteSize a2=at.
Position BringToFront()end end)Track(d.UserInputService.InputChanged:Connect(function(a3)if not a_
or not at.Parent then return end if a3.UserInputType~=Enum.UserInputType.MouseMovement and a3.
UserInputType~=Enum.UserInputType.Touch then return end local a4=a3.Position-a0 local a5=a1.X local
a6=a1.Y local a7=a2.X.Offset local a8=a2.Y.Offset if aX==1 then a5=math.max(Y,a1.X+a4.X)elseif aX==
-1 then local a9=math.max(Y,a1.X-a4.X)a7=a2.X.Offset+(a1.X-a9)a5=a9 end if aY==1 then a6=math.max(Z
,a1.Y+a4.Y)elseif aY==-1 then local a9=math.max(Z,a1.Y-a4.Y)a8=a2.Y.Offset+(a1.Y-a9)a6=a9 end at.
Size=UDim2.fromOffset(a5,a6)at.Position=UDim2.new(a2.X.Scale,a7,a2.Y.Scale,a8)end))Track(d.
UserInputService.InputEnded:Connect(function(a3)if a3.UserInputType==Enum.UserInputType.
MouseButton1 or a3.UserInputType==Enum.UserInputType.Touch then a_=false end end))end MakeEdge(
UDim2.new(1,-_,0,_),UDim2.new(0,_,1,-_*2),1,0)MakeEdge(UDim2.new(0,0,0,_),UDim2.new(0,_,1,-_*2),-1,
0)MakeEdge(UDim2.new(0,_,1,-_),UDim2.new(1,-_*2,0,_),0,1)MakeEdge(UDim2.new(0,_,0,0),UDim2.new(1,-_
*2,0,_),0,-1)MakeEdge(UDim2.new(1,-_,1,-_),UDim2.fromOffset(_,_),1,1)MakeEdge(UDim2.new(0,0,1,-_),
UDim2.fromOffset(_,_),-1,1)MakeEdge(UDim2.new(1,-_,0,0),UDim2.fromOffset(_,_),1,-1)MakeEdge(UDim2.
new(0,0,0,0),UDim2.fromOffset(_,_),-1,-1)end function s:ToggleConsole()local am=self.ConsoleWindow
if am and am.Parent then am:Destroy()self.ConsoleWindow=nil if self.ConsoleConnection then pcall(
function()self.ConsoleConnection:Disconnect()end)self.ConsoleConnection=nil end return end self:
OpenConsole()end local am=2000 local an=500 function s:_EnsureConsoleLog()if self._ConsoleLogReady
then return end self._ConsoleLogReady=true self.ConsoleLog=self.ConsoleLog or{}self.
_ConsoleClearedAt=self._ConsoleClearedAt or 0 self._ConsoleSubscribers=self._ConsoleSubscribers or{
}local function Push(ao,ap)local aq={Text=tostring(ao),Type=ap,Time=os.clock()}table.insert(self.
ConsoleLog,aq)if#self.ConsoleLog>am then for ar=1,an do table.remove(self.ConsoleLog,1)end end for
ar in self._ConsoleSubscribers do pcall(ar,aq)end end self._ConsolePush=Push local ao=GetService(
'LogService')pcall(function()for ap,aq in ao:GetLogHistory()do Push(aq.message,aq.messageType)end
end)Track(ao.MessageOut:Connect(function(ap,aq)Push(ap,aq)end))end function s:OpenConsole()self:
_EnsureConsoleLog()local ao=V:CreateWindow({Parent=self.ScreenGui,Title='Console',Size=UDim2.
fromOffset(620,400),Position=UDim2.fromOffset(80,80)})self.ConsoleWindow=ao.Frame ao:
AddTitleButton('X',26,true,function()self:ToggleConsole()end,'CloseIcon')local ap=ao.Body local aq=
true local ar=12 local as=self._ConsoleFilters or{[Enum.MessageType.MessageOutput]=true,[Enum.
MessageType.MessageInfo]=true,[Enum.MessageType.MessageWarning]=true,[Enum.MessageType.MessageError
]=true}self._ConsoleFilters=as local at={}local au local av=V:CreateInstance('Frame',{Size=UDim2.
new(1,-16,0,26),Position=UDim2.new(0,8,0,6),BackgroundTransparency=1,Parent=ap})local aw=V:
AddListLayout(av,6,Enum.FillDirection.Horizontal)aw.VerticalAlignment=Enum.VerticalAlignment.Center
local function CreateTopBarButton(ax,ay)local az=V:CreateInstance('TextButton',{Size=UDim2.new(0,0,
1,0),AutomaticSize=Enum.AutomaticSize.X,BackgroundColor3=K.Field,BorderSizePixel=0,AutoButtonColor=
false,Font=aa.SemiBold,Text=ax,TextColor3=K.TextDim,TextSize=12,Parent=av})V:AddStroke(az,'Border',
1)V:AddPadding(az,0,8,0,8)az.MouseButton1Click:Connect(ay)return az end local ax local function 
UpdateAutoScrollButton()ax.Text=aq and'Auto-Scroll: ON'or'Auto-Scroll: OFF'ax.TextColor3=aq and K.
Green or K.TextDim end ax=CreateTopBarButton('Auto-Scroll: ON',function()aq=not aq
UpdateAutoScrollButton()end)UpdateAutoScrollButton()local function ColorForType(ay)if ay==Enum.
MessageType.MessageError then return K.Red end if ay==Enum.MessageType.MessageWarning then return K
.Yellow end if ay==Enum.MessageType.MessageInfo then return K.Blue end return K.Text end local 
function EntryVisible(ay)return as[ay.Type]==true end local function RefreshVisibility()for ay,az
in at do if az.Parent then az.Visible=EntryVisible(ay)end end end local ay={}local function 
MakeFilterButton(az,aA)local aB=CreateTopBarButton(az,function()as[aA]=not as[aA]ay[aA].TextColor3=
as[aA]and ColorForType(aA)or K.TextFaded RefreshVisibility()end)aB.TextColor3=as[aA]and
ColorForType(aA)or K.TextFaded ay[aA]=aB end MakeFilterButton('Out',Enum.MessageType.MessageOutput)
MakeFilterButton('Info',Enum.MessageType.MessageInfo)MakeFilterButton('Warn',Enum.MessageType.
MessageWarning)MakeFilterButton('Err',Enum.MessageType.MessageError)local az=V:CreateInstance(
'TextLabel',{Size=UDim2.new(0,60,1,0),BackgroundTransparency=1,Font=aa.Mono,Text=`Size: {ar}`,
TextColor3=K.TextDim,TextSize=12,Parent=av})local function ApplyConsoleTextSize()for aA,aB in at do
if aB.Parent then aB.TextSize=ar end end az.Text=`Size: {ar}`end CreateTopBarButton('-',function()
ar=math.max(8,ar-1)ApplyConsoleTextSize()end)CreateTopBarButton('+',function()ar=math.min(24,ar+1)
ApplyConsoleTextSize()end)CreateTopBarButton('Clear',function()table.clear(self.ConsoleLog)self.
_ConsoleClearedAt=os.clock()for aA,aB in at do if aB.Parent then aB:Destroy()end end table.clear(at
)end)local aA=V:CreateInstance('ScrollingFrame',{Size=UDim2.new(1,-16,1,-78),Position=UDim2.new(0,8
,0,38),BackgroundColor3=K.Background,BorderSizePixel=0,ScrollBarThickness=4,ScrollBarImageColor3=K.
Border,CanvasSize=UDim2.new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,ScrollingDirection=
Enum.ScrollingDirection.Y,Parent=ap})V:AddPadding(aA,4,6,4,6)V:AddListLayout(aA,1,Enum.
FillDirection.Vertical)local function RenderEntry(aB)local aC=V:CreateInstance('TextLabel',{Size=
UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,Font=aa.Mono,Text=aB
.Text,TextColor3=ColorForType(aB.Type),TextSize=ar,TextXAlignment=Enum.TextXAlignment.Left,
TextWrapped=true,Visible=EntryVisible(aB),Parent=aA})at[aB]=aC if aq and aC.Visible then task.
defer(function()if aA.Parent then aA.CanvasPosition=Vector2.new(0,aA.AbsoluteCanvasSize.Y)end end)
end end for aB,aC in self.ConsoleLog do if aC.Time>=(self._ConsoleClearedAt or 0)then RenderEntry(
aC)end end au=function(aB)if aA.Parent then RenderEntry(aB)end end self._ConsoleSubscribers[au]=
true ao.Frame.AncestryChanged:Connect(function(aB,aC)if aC==nil then self._ConsoleSubscribers[au]=
nil end end)local aB=V:CreateInstance('Frame',{Size=UDim2.new(1,-16,0,28),Position=UDim2.new(0,8,1,
-36),BackgroundTransparency=1,Parent=ap})local aC=V:AddListLayout(aB,6,Enum.FillDirection.
Horizontal)aC.VerticalAlignment=Enum.VerticalAlignment.Center local aD=V:CreateInstance('TextBox',{
Size=UDim2.new(1,-76,1,0),BackgroundColor3=K.Field,BorderSizePixel=0,Font=aa.Mono,PlaceholderText=
'Run code (loadstring)...',PlaceholderColor3=K.TextFaded,Text='',TextColor3=K.Text,TextSize=12,
TextXAlignment=Enum.TextXAlignment.Left,ClearTextOnFocus=false,Parent=aB})V:AddStroke(aD,'Border',1
)V:AddPadding(aD,0,8,0,8)local aE=V:CreateInstance('TextButton',{Size=UDim2.fromOffset(70,28),
BackgroundColor3=K.Accent,BackgroundTransparency=0.85,BorderSizePixel=0,AutoButtonColor=false,Font=
aa.SemiBold,Text='Run',TextColor3=K.Accent,TextSize=12,Parent=aB})V:AddStroke(aE,K.Accent,1)local 
function PushSynthetic(aF,aG)self._ConsolePush(aF,aG or Enum.MessageType.MessageOutput)end local 
function FormatArgument(aF)local aG=typeof(aF)if aG=='string'then return aF end if aG=='Instance'
then return`{aF.ClassName}({aF:GetFullName()})`end if aG=='table'then local aH,aI=pcall(function()
return d.HttpService:JSONEncode(aF)end)if aH then return aI end return tostring(aF)end return
tostring(aF)end local function FormatArguments(...)local aF=select('#',...)if aF==0 then return''
end local aG={}for aH=1,aF do aG[aH]=FormatArgument(select(aH,...))end return table.concat(aG,'  ')
end local function ExecuteCommand()local aF=aD.Text if aF==''then return end PushSynthetic(`> {aF}`
,Enum.MessageType.MessageInfo)local function CapturedPrint(...)PushSynthetic(FormatArguments(...),
Enum.MessageType.MessageOutput)end local function CapturedWarn(...)PushSynthetic(FormatArguments(
...),Enum.MessageType.MessageWarning)end local function CapturedError(aG,aH)PushSynthetic(`error: {
tostring(aG)}`,Enum.MessageType.MessageError)error(aG,(aH or 1)+1)end local aG=loadstring local 
function CapturedLoadstring(aH,aI)if type(aH)~='string'then return nil,
'loadstring: source must be a string'end local aJ='local print, warn, error, loadstring = ...\n'..
aH local aK,aL=aG(aJ,aI or'VexConsoleChunk')if not aK then return nil,aL end return function(...)
return aK(CapturedPrint,CapturedWarn,CapturedError,CapturedLoadstring,...)end end local aH=aF:sub(1
,1)=='='local aI=aH and('return '..aF:sub(2))or aF local aJ,aK=CapturedLoadstring(aI,'VexConsole')
if not aJ then PushSynthetic(`compile: {aK}`,Enum.MessageType.MessageError)return end local aL=
table.pack(pcall(aJ))if not aL[1]then PushSynthetic(`runtime: {tostring(aL[2])}`,Enum.MessageType.
MessageError)return end if aH and aL.n>1 then local aM={}for aN=2,aL.n do aM[#aM+1]=FormatArgument(
aL[aN])end PushSynthetic(table.concat(aM,'  '),Enum.MessageType.MessageOutput)end aD.Text=''end aE.
MouseButton1Click:Connect(ExecuteCommand)aD.FocusLost:Connect(function(aF)if aF then
ExecuteCommand()end end)end function s:SetThemePresetName(ao)self.ThemePresetName=ao or
GetDefaultPresetName()if self.ThemePresetButton and self.ThemePresetButton.Parent then self.
ThemePresetButton.Text=`{self.ThemePresetName}`end end function s:OpenSettings()local ao,ap=self:
CreateModalWindow('Settings',460,540)self.SettingsWindow=ao local aq=V:CreateInstance(
'ScrollingFrame',{Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,BorderSizePixel=0,
ScrollBarThickness=3,ScrollBarImageColor3=K.Border,CanvasSize=UDim2.new(0,0,0,0),
AutomaticCanvasSize=Enum.AutomaticSize.Y,ZIndex=202,Parent=ap})V:BindThemeColor(aq,
'ScrollBarImageColor3','Border')V:AddPadding(aq,8,16,8,12)V:AddListLayout(aq,6,Enum.FillDirection.
Vertical)local function CreateRow(ar)return V:CreateInstance('Frame',{Size=UDim2.new(1,0,0,30),
BackgroundTransparency=1,LayoutOrder=ar,ZIndex=202,Parent=aq})end local function CreateHeader(ar,as
)V:CreateInstance('TextLabel',{Size=UDim2.new(1,0,0,18),BackgroundTransparency=1,Font=aa.Bold,Text=
ar:upper(),TextColor3=K.TextHeader,TextSize=11,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=
as,ZIndex=202,Parent=aq})end local function CreateToggle(ar,as,at,au)local av=CreateRow(at)V:
CreateInstance('TextLabel',{Size=UDim2.new(1,-42,1,0),BackgroundTransparency=1,Font=aa.Medium,Text=
ar,TextColor3=K.Text,TextSize=12,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=203,Parent=av})
local aw=V:CreateInstance('TextButton',{Size=UDim2.new(0,32,0,16),Position=UDim2.new(1,-32,0.5,-8),
BackgroundColor3=as and K.Accent or K.ToggleOff,BorderSizePixel=0,AutoButtonColor=false,Text='',
ZIndex=203,Parent=av})V:AddStroke(aw,'Border',1)local ax=V:CreateInstance('Frame',{Size=UDim2.new(0
,12,0,12),Position=as and UDim2.new(1,-14,0.5,-6)or UDim2.new(0,2,0.5,-6),BackgroundColor3=Color3.
fromRGB(255,255,255),BorderSizePixel=0,ZIndex=204,Parent=aw})local ay=as aw.MouseButton1Click:
Connect(function()ay=not ay V:Tween(aw,{BackgroundColor3=ay and K.Accent or K.ToggleOff})V:Tween(ax
,{Position=ay and UDim2.new(1,-14,0.5,-6)or UDim2.new(0,2,0.5,-6)})au(ay)end)end local function 
CreateSlider(ar,as,at,au,av,aw,ax,ay)local function FormatSliderValue(az)if ay then return ay(az)
end return string.format('%.1fs',az)end local az=V:CreateInstance('Frame',{Size=UDim2.new(1,0,0,36)
,BackgroundTransparency=1,LayoutOrder=aw,ZIndex=202,Parent=aq})V:CreateInstance('TextLabel',{Size=
UDim2.new(1,-56,0,14),BackgroundTransparency=1,Font=aa.Medium,Text=ar,TextColor3=K.Text,TextSize=12
,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=203,Parent=az})local aA=V:CreateInstance(
'TextLabel',{Size=UDim2.new(0,52,0,14),Position=UDim2.new(1,-52,0,0),BackgroundTransparency=1,Font=
aa.Mono,Text=FormatSliderValue(av),TextColor3=K.Accent,TextSize=11,TextXAlignment=Enum.
TextXAlignment.Right,ZIndex=203,Parent=az})local aB=V:CreateInstance('Frame',{Size=UDim2.new(1,0,0,
6),Position=UDim2.new(0,0,0,22),BackgroundColor3=K.Field,BorderSizePixel=0,ZIndex=203,Parent=az})
local aC=(av-as)/(at-as)local aD=V:CreateInstance('Frame',{Size=UDim2.new(aC,0,1,0),
BackgroundColor3=K.Accent,BorderSizePixel=0,ZIndex=204,Parent=aB})local aE=V:CreateInstance(
'TextButton',{Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,AutoButtonColor=false,Text='',ZIndex
=205,Parent=aB})local aF=false local function Update(aG)local aH=math.clamp((aG-aB.AbsolutePosition
.X)/aB.AbsoluteSize.X,0,1)local aI=as+aH*(at-as)local aJ=math.floor(aI/au+0.5)*au aJ=math.clamp(aJ,
as,at)local aK=(aJ-as)/(at-as)aD.Size=UDim2.new(aK,0,1,0)aA.Text=FormatSliderValue(aJ)ax(aJ)end aE.
InputBegan:Connect(function(aG)if aG.UserInputType==Enum.UserInputType.MouseButton1 or aG.
UserInputType==Enum.UserInputType.Touch then aF=true Update(aG.Position.X)end end)d.
UserInputService.InputChanged:Connect(function(aG)if aF and(aG.UserInputType==Enum.UserInputType.
MouseMovement or aG.UserInputType==Enum.UserInputType.Touch)then Update(aG.Position.X)end end)d.
UserInputService.InputEnded:Connect(function(aG)if aG.UserInputType==Enum.UserInputType.
MouseButton1 or aG.UserInputType==Enum.UserInputType.Touch then aF=false end end)end local function 
CreateColorRow(ar,as,at)local au=CreateRow(at)V:CreateInstance('TextLabel',{Size=UDim2.new(1,-56,1,
0),BackgroundTransparency=1,Font=aa.Medium,Text=ar,TextColor3=K.Text,TextSize=12,TextXAlignment=
Enum.TextXAlignment.Left,ZIndex=203,Parent=au})local av=V:CreateInstance('TextButton',{Size=UDim2.
new(0,44,0,18),Position=UDim2.new(1,-44,0.5,-9),BackgroundColor3=K[as],BorderSizePixel=0,
AutoButtonColor=false,Text='',ZIndex=203,Parent=au})V:AddStroke(av,'Border',1)BindTheme(as,function
(aw)av.BackgroundColor3=aw end)av.MouseButton1Click:Connect(function()self:OpenColorPicker(K[as],
function(aw)SetThemeColor(as,aw)if self.SelectedInstance then self:RenderProperties(self.
SelectedInstance)end end,{Floating=true,AnchorWindow=self.SettingsWindow})end)end CreateHeader(
'Behavior',1)local ar=CreateRow(2)V:CreateInstance('TextLabel',{Size=UDim2.new(1,-100,1,0),
BackgroundTransparency=1,Font=aa.Medium,Text='Toggle Keybind',TextColor3=K.Text,TextSize=12,
TextXAlignment=Enum.TextXAlignment.Left,ZIndex=203,Parent=ar})local as=V:CreateInstance(
'TextButton',{Size=UDim2.new(0,94,0,22),Position=UDim2.new(1,-94,0.5,-11),BackgroundColor3=K.Field,
BorderSizePixel=0,AutoButtonColor=false,Font=aa.Mono,Text=self.ToggleKey.Name,TextColor3=K.Text,
TextSize=11,ZIndex=203,Parent=ar})V:AddStroke(as,'Border',1)local at=false as.MouseButton1Click:
Connect(function()at=true as.Text='[ press a key... ]'as.TextColor3=K.Accent end)Track(d.
UserInputService.InputBegan:Connect(function(au,av)if not at or av then return end if au.
UserInputType~=Enum.UserInputType.Keyboard then return end if au.KeyCode==Enum.KeyCode.Unknown then
return end at=false as.Text=au.KeyCode.Name as.TextColor3=K.Text task.defer(function()self.
ToggleKey=au.KeyCode self:SaveConfig()task.wait()end)end))CreateToggle('Auto-Refresh Properties',
self.AutoRefreshProperties,3,function(au)self.AutoRefreshProperties=au self:SaveConfig()end)
CreateSlider('Refresh Delay',0,3,0.1,self.RefreshDelay,4,function(au)self.RefreshDelay=au self:
SaveConfig()end)CreateToggle('Use lua.expert decompiler',self.UseLuaExpertDecompiler,4.5,function(
au)self.UseLuaExpertDecompiler=au self:SaveConfig()end)CreateHeader('Performance',4.7)CreateToggle(
'Unlimited FPS',self.UnlimitedFPS,4.8,function(au)local av,aw=ApplyFPSCap(au)if not av then self:
Notify(`Couldn't change FPS cap: {aw}`)return end self.UnlimitedFPS=au self:SaveConfig()end)
CreateHeader('Theme Preset',5)local au=CreateRow(6)V:CreateInstance('TextLabel',{Size=UDim2.new(0,
60,1,0),BackgroundTransparency=1,Font=aa.Medium,Text='Preset',TextColor3=K.Text,TextSize=12,
TextXAlignment=Enum.TextXAlignment.Left,ZIndex=203,Parent=au})local av=V:CreateInstance(
'TextButton',{Size=UDim2.new(1,-60,0,22),Position=UDim2.new(0,60,0.5,-11),BackgroundColor3=K.Field,
BorderSizePixel=0,AutoButtonColor=false,Font=aa.Mono,Text=`{self.ThemePresetName or S[1].Name}`,
TextColor3=K.Accent,TextSize=11,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=203,Parent=au})self.
ThemePresetButton=av V:AddStroke(av,'Border',1)V:AddPadding(av,0,8,0,8)av.MouseButton1Click:
Connect(function()self:OpenListModal('UI Presets',S,function(aw)return aw.Name end,function(aw)
ApplyPreset(aw)self:CloseModal()self:OpenSettings()self.ThemePresetName=aw.Name if self.
ThemePresetButton and self.ThemePresetButton.Parent then self.ThemePresetButton.Text=`{aw.Name}`end
av.Text=`{aw.Name}`if self.SaveConfig then self:SaveConfig()end if self.SelectedInstance then self:
RenderProperties(self.SelectedInstance)end end,false,nil,nil,{Floating=true,AnchorWindow=self.
SettingsWindow,Width=320,Height=360})end)CreateHeader('UI Transparency',7)local function Percent(aw
)return`{math.floor(aw*100+0.5)}%`end CreateSlider('Window Transparency',0,0.85,0.05,M.Window,8,
function(aw)SetUITransparency('Window',aw)self:SaveConfig()end,Percent)CreateSlider(
'Title Bar Transparency',0,0.85,0.05,M.TitleBar,8.1,function(aw)SetUITransparency('TitleBar',aw)
self:SaveConfig()end,Percent)CreateSlider('Field Transparency',0,0.85,0.05,M.Field,8.2,function(aw)
SetUITransparency('Field',aw)self:SaveConfig()end,Percent)CreateSlider('Background Transparency',0,
0.85,0.05,M.Background,8.3,function(aw)SetUITransparency('Background',aw)self:SaveConfig()end,
Percent)CreateSlider('Modal Overlay',0,0.95,0.05,M.ModalOverlay,8.4,function(aw)SetUITransparency(
'ModalOverlay',aw)self:SaveConfig()end,Percent)local aw={{Header='Surfaces',BaseOrder=10,Rows={{
'Main Background','Background'},{'Window Background','Window'},{'Title Bar Background','TitleBar'},
{'Input / Button Background','Field'},{'Input / Button Hover','FieldHover'}}},{Header=
'Borders & Selection',BaseOrder=11,Rows={{'Border (Strong)','Border'},{'Border (Subtle)',
'BorderSoft'},{'Selected Row Background','Selected'},{'Selected Row Accent Bar','SelectionBar'}}},{
Header='Text',BaseOrder=12,Rows={{'Text (Primary)','Text'},{'Text (Dim)','TextDim'},{
'Text (Faded / Placeholder)','TextFaded'},{'Text (Section Header)','TextHeader'}}},{Header=
'Accents & Status',BaseOrder=13,Rows={{'Accent (Highlights)','Accent'},{'Toggle: On','ToggleOn'},{
'Toggle: Off','ToggleOff'},{'Status: Success','Green'},{'Status: Error','Red'},{'Status: Warning',
'Yellow'},{'Status: Info','Blue'}}},{Header='Property Value Colors',BaseOrder=14,Rows={{
'Property: String','PropString'},{'Property: Number','PropNumber'},{'Property: Instance',
'PropInstance'},{'Property: Enum','PropEnum'},{'Property: Nil','PropNil'},{'Property: Default',
'PropDefault'}}}}for ax,ay in aw do local az=ay.BaseOrder*10 CreateHeader(ay.Header,az)for aA,aB in
ay.Rows do CreateColorRow(aB[1],aB[2],az+aA*0.1)end end local ax=CreateRow(150)local ay=V:
CreateInstance('TextButton',{Size=UDim2.new(1,0,0,24),BackgroundColor3=K.Field,BorderSizePixel=0,
AutoButtonColor=false,Font=aa.Medium,Text='Reset Colors to Default',TextColor3=K.TextDim,TextSize=
12,ZIndex=203,Parent=ax})V:AddStroke(ay,'Border',1)ay.MouseEnter:Connect(function()V:Tween(ay,{
TextColor3=K.Text})end)ay.MouseLeave:Connect(function()V:Tween(ay,{TextColor3=K.TextDim})end)ay.
MouseButton1Click:Connect(function()local az if self.ThemePresetName then for aA,aB in S do if aB.
Name==self.ThemePresetName then az=aB break end end end if az then ApplyPreset(az)else O=true for
aA,aB in L do if K[aA]~=aB then SetThemeColor(aA,aB)end end O=false end if self.SaveConfig then
self:SaveConfig()end if self.SelectedInstance then self:RenderProperties(self.SelectedInstance)end
self:CloseModal()self:OpenSettings()end)CreateHeader('Fonts',30)local az={{Key='Bold',Label='Bold'}
,{Key='SemiBold',Label='Semi-Bold'},{Key='Medium',Label='Medium'},{Key='Regular',Label='Regular'},{
Key='Mono',Label='Mono'},{Key='Code',Label='Code'},{Key='Heading',Label='Heading'}}local aA={}for
aB,aC in Enum.Font:GetEnumItems()do if aC~=Enum.Font.Unknown then aA[#aA+1]=aC end end table.sort(
aA,function(aB,aC)return aB.Name<aC.Name end)local function CreateFontRow(aB,aC,aD)local aE=
CreateRow(aD)V:CreateInstance('TextLabel',{Size=UDim2.new(0.4,0,1,0),BackgroundTransparency=1,Font=
aa.Medium,Text=aC,TextColor3=K.Text,TextSize=12,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=203,
Parent=aE})local aF=V:CreateInstance('TextButton',{Size=UDim2.new(0.6,-4,0,22),Position=UDim2.new(
0.4,4,0.5,-11),BackgroundColor3=K.Field,BorderSizePixel=0,AutoButtonColor=false,Font=aa[aB],Text=aa
[aB].Name,TextColor3=K.Accent,TextSize=11,ZIndex=203,Parent=aE})V:AddStroke(aF,'Border',1)V:
AddPadding(aF,0,8,0,8)aF.MouseButton1Click:Connect(function()self:OpenListModal('Select Font',aA,
function(aG)return aG.Name end,function(aG)local aH=aa[aB]aa[aB]=aG RebindFont(aH,aG)aF.Text=aG.
Name aF.Font=aG self:CloseModal()if self.SaveConfig then self:SaveConfig()end end,true,nil,function
(aG)return aG.Name end,{Floating=true,AnchorWindow=self.SettingsWindow,Width=280,Height=360})end)
end for aB,aC in az do CreateFontRow(aC.Key,aC.Label,30+aB*0.1)end local aB=CreateRow(30+(#az+1)*
0.1)local aC=V:CreateInstance('TextButton',{Size=UDim2.new(1,0,0,24),BackgroundColor3=K.Field,
BorderSizePixel=0,AutoButtonColor=false,Font=aa.Medium,Text='Reset Fonts to Default',TextColor3=K.
TextDim,TextSize=12,ZIndex=203,Parent=aB})V:AddStroke(aC,'Border',1)aC.MouseEnter:Connect(function(
)V:Tween(aC,{TextColor3=K.Text})end)aC.MouseLeave:Connect(function()V:Tween(aC,{TextColor3=K.
TextDim})end)aC.MouseButton1Click:Connect(function()for aD,aE in ab do local aF=aa[aD]if aF~=aE
then aa[aD]=aE RebindFont(aF,aE)end end if self.SaveConfig then self:SaveConfig()end self:
CloseModal()self:OpenSettings()end)end function s:FormatFilterValue(ao)local ap=typeof(ao)if ap==
'string'then return`"{ao}"`elseif ap=='EnumItem'then return tostring(ao)elseif ap=='Instance'then
return`<{ao.ClassName}> {ao.Name}`elseif ap=='Color3'then return`Color3({math.floor(ao.R*255)}, {
math.floor(ao.G*255)}, {math.floor(ao.B*255)})`elseif ap=='Vector3'or ap=='Vector2'or ap=='UDim2'or
ap=='UDim'or ap=='CFrame'then return tostring(ao)elseif ap=='boolean'or ap=='number'then return
tostring(ao)end return`<{ap}>`end function s:OpenFiltersDropdown(ao)if self.FiltersDropdown then
self.FiltersDropdown:Destroy()if self.FiltersBlocker then self.FiltersBlocker:Destroy()end self.
FiltersDropdown=nil self.FiltersBlocker=nil return end local ap=V:CreateInstance('Frame',{Size=
UDim2.fromScale(1,1),BackgroundTransparency=1,ZIndex=150,Parent=self.ScreenGui})local aq local ar=
workspace.CurrentCamera local as=ar and ar.ViewportSize or Vector2.new(1366,768)local at=320 local
au=self.ExplorerWindow and self.ExplorerWindow.Frame local av,aw,ax if au then local ay=au.
AbsolutePosition.X local az=au.AbsoluteSize.X local aA=au.AbsoluteSize.Y local aB=au.Position.Y.
Offset local aC=as.X-(ay+az)local aD=ay if aC>=at+4 then av=ay+az+4 elseif aD>=at+4 then av=ay-at-4
else av=math.max(0,as.X-at)end aw=aB ax=aA else av=ao.AbsolutePosition.X aw=ao.AbsolutePosition.Y+
ao.AbsoluteSize.Y+4 ax=420 end local ay=V:CreateWindow({Parent=self.ScreenGui,Title='Filters',
BackgroundTransparency=1,Size=UDim2.fromOffset(at,ax),Position=UDim2.fromOffset(av,aw)})local az=ay
.Frame az.ZIndex=151 for aA,aB in WeakGetDescendants(az)do if aB:IsA('GuiObject')then aB.ZIndex=aB.
ZIndex+150 end end local function Close()if aq then aq:Disconnect()aq=nil end az:Destroy()ap:
Destroy()if self.FiltersDropdown==az then self.FiltersDropdown=nil self.FiltersBlocker=nil end end
aq=d.UserInputService.InputBegan:Connect(function(aA)if aA.UserInputType~=Enum.UserInputType.
MouseButton1 and aA.UserInputType~=Enum.UserInputType.MouseButton2 and aA.UserInputType~=Enum.
UserInputType.Touch then return end if not az or not az.Parent then Close()return end local aB=aA.
Position local aC=az.AbsolutePosition local aD=az.AbsoluteSize if aB.X>=aC.X and aB.X<=aC.X+aD.X
and aB.Y>=aC.Y and aB.Y<=aC.Y+aD.Y then return end Close()end)ay:AddTitleButton('X',26,true,Close,
'CloseIcon')local aA=V:CreateInstance('ScrollingFrame',{Size=UDim2.new(1,-16,1,-16),Position=UDim2.
new(0,8,0,8),BackgroundTransparency=1,BorderSizePixel=0,ScrollBarThickness=4,ScrollBarImageColor3=
Color3.fromRGB(40,40,40),ScrollBarImageTransparency=0.2,CanvasSize=UDim2.new(0,0,0,0),
AutomaticCanvasSize=Enum.AutomaticSize.Y,ZIndex=302,Parent=ay.Body})V:AddListLayout(aA,8,Enum.
FillDirection.Vertical)V:AddPadding(aA,0,8,0,0)self._FilterRowRefreshers={}local function 
CreateSection(aB,aC,aD)local aE=V:CreateInstance('Frame',{Size=UDim2.new(1,0,0,0),AutomaticSize=
Enum.AutomaticSize.Y,BackgroundTransparency=1,LayoutOrder=aC,ZIndex=152,Parent=aA})V:AddListLayout(
aE,6,Enum.FillDirection.Vertical)V:CreateInstance('TextLabel',{Size=UDim2.new(1,0,0,16),
BackgroundTransparency=1,Font=aa.Bold,Text=aB,TextColor3=K.Accent,TextSize=11,TextXAlignment=Enum.
TextXAlignment.Left,LayoutOrder=1,ZIndex=152,Parent=aE})local aF=V:CreateInstance('Frame',{Size=
UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,LayoutOrder=2,ZIndex
=152,Parent=aE})aD(aF)end local function CreateToggleRow(aB,aC,aD,aE,aF,aG,aH)local aI=V:
CreateInstance('TextButton',{Size=aD and UDim2.new(1,0,0,22)or UDim2.new(1,0,1,0),BackgroundColor3=
K.Selected,BackgroundTransparency=0.7,BorderSizePixel=0,AutoButtonColor=false,Text='',LayoutOrder=
aE or 0,ZIndex=152,Parent=aB})V:AddPadding(aI,0,6,0,6)local aJ=V:CreateInstance('Frame',{Size=UDim2
.new(0,12,0,12),Position=UDim2.new(0,0,0.5,-6),BackgroundColor3=aG()and K.Accent or K.Border,
BorderSizePixel=0,ZIndex=153,Parent=aI})local aK=18 if aF then local aL=V:CreateClassIcon(aF,aI)aL.
Size=UDim2.new(0,14,0,14)aL.Position=UDim2.new(0,18,0.5,-7)aL.ZIndex=153 aK=36 end V:
CreateInstance('TextLabel',{Size=UDim2.new(1,-(aK+2),1,0),Position=UDim2.new(0,aK,0,0),
BackgroundTransparency=1,Font=aa.Medium,Text=aC,TextColor3=K.Text,TextSize=11,TextXAlignment=Enum.
TextXAlignment.Left,TextTruncate=Enum.TextTruncate.AtEnd,ZIndex=153,Parent=aI})local function 
Refresh()aJ.BackgroundColor3=aG()and K.Accent or K.Border end aI.MouseButton1Click:Connect(function
()aH()Refresh()end)aI.MouseEnter:Connect(function()V:Tween(aI,{BackgroundTransparency=0.4})end)aI.
MouseLeave:Connect(function()V:Tween(aI,{BackgroundTransparency=0.7})end)table.insert(self.
_FilterRowRefreshers,function()if aI.Parent then Refresh()end end)end CreateSection('Nil Instances'
,1,function(aB)local aC=V:CreateInstance('Frame',{Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.
AutomaticSize.Y,BackgroundTransparency=1,ZIndex=152,Parent=aB})V:AddListLayout(aC,4,Enum.
FillDirection.Vertical)CreateToggleRow(aC,'Show Nil Instances Folder',true,1,nil,function()return
not self.HideNilContainer end,function()self:ToggleNilContainerFilter()end)CreateToggleRow(aC,
'Search Nil Instances',true,2,nil,function()return self.SearchIncludesNil==true end,function()self.
SearchIncludesNil=not self.SearchIncludesNil self._FilterChangedSinceLastSearch=true self:
SaveConfig()if self.SearchQuery~=''then self:RefreshAllSearchFilters()end end)local aD=V:
CreateInstance('TextBox',{Size=UDim2.new(1,0,0,22),BackgroundColor3=K.Field,BorderSizePixel=0,Font=
aa.Mono,PlaceholderText='Filter by ClassName...',PlaceholderColor3=K.TextFaded,Text=(self.
NilFilterClass or''):gsub('^%s+',''):gsub('%s+$',''),TextColor3=K.Text,TextSize=11,TextXAlignment=
Enum.TextXAlignment.Left,ClearTextOnFocus=false,LayoutOrder=3,ZIndex=153,Parent=aC})V:AddStroke(aD,
'Border',1)V:AddPadding(aD,0,6,0,6)self.FiltersClassFilterBox=aD aD:GetPropertyChangedSignal('Text'
):Connect(function()if self._SyncingClassFilter then return end self:SetNilFilterClass(aD.Text,aD)
self:SaveConfig()end)end)CreateSection('Freeze Search',2,function(aB)self:InitFreezeState()if self.
FreezeSearchMatchClass==nil then self.FreezeSearchMatchClass=false end local aC=V:CreateInstance(
'Frame',{Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,ZIndex
=152,Parent=aB})V:AddListLayout(aC,4,Enum.FillDirection.Vertical)local aD=V:CreateInstance(
'TextLabel',{Size=UDim2.new(1,0,0,28),BackgroundTransparency=1,Font=aa.Medium,Text=
[[Freezes the explorer when a descendant whose name (or ClassName) matches this term is added.]],
TextColor3=K.TextFaded,TextSize=10,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.
TextYAlignment.Top,TextWrapped=true,LayoutOrder=1,ZIndex=153,Parent=aC})BindTheme('TextFaded',
function(aE)if aD and aD.Parent then aD.TextColor3=aE end end)local aE=V:CreateInstance('TextBox',{
Size=UDim2.new(1,0,0,22),BackgroundColor3=K.Field,BorderSizePixel=0,Font=aa.Mono,PlaceholderText=
self.FreezeSearchMatchClass and'e.g. MeshPart'or'e.g. SkibidiPartMesh',PlaceholderColor3=K.
TextFaded,Text=self.FreezeSearchTerm or'',TextColor3=K.Text,TextSize=11,TextXAlignment=Enum.
TextXAlignment.Left,ClearTextOnFocus=false,LayoutOrder=2,ZIndex=153,Parent=aC})V:AddStroke(aE,
'Border',1)V:AddPadding(aE,0,6,0,6)BindTheme('Field',function(aF)if aE.Parent then aE.
BackgroundColor3=aF end end)BindTheme('Text',function(aF)if aE.Parent then aE.TextColor3=aF end end
)BindTheme('TextFaded',function(aF)if aE.Parent then aE.PlaceholderColor3=aF end end)self.
FreezeSearchBox=aE aE.FocusLost:Connect(function()self:SetFreezeSearchTerm(aE.Text)end)
CreateToggleRow(aC,'Match by ClassName (instead of Name)',true,3,nil,function()return self.
FreezeSearchMatchClass==true end,function()self.FreezeSearchMatchClass=not self.
FreezeSearchMatchClass if self.FreezeSearchBox and self.FreezeSearchBox.Parent then self.
FreezeSearchBox.PlaceholderText=self.FreezeSearchMatchClass and'e.g. MeshPart'or
'e.g. SkibidiPartMesh'end if self.FreezeSearchTerm and self.FreezeSearchTerm~=''then if self.
_StopFreezeSearchWatcher then pcall(function()self:_StopFreezeSearchWatcher()end)end if self.
_StartFreezeSearchWatcher then pcall(function()self:_StartFreezeSearchWatcher()end)end end pcall(
function()self:SaveConfig()end)end)local aF=V:CreateInstance('Frame',{Size=UDim2.new(1,0,0,24),
BackgroundTransparency=1,LayoutOrder=4,ZIndex=152,Parent=aC})local aG=V:CreateInstance('TextLabel',
{Size=UDim2.new(1,-120,1,0),BackgroundTransparency=1,Font=aa.SemiBold,Text=self.ExplorerFrozen and
'Status: FROZEN'or'Status: live',TextColor3=self.ExplorerFrozen and K.Accent or K.TextDim,TextSize=
11,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=153,Parent=aF})local aH=V:CreateInstance(
'TextButton',{Size=UDim2.new(0,110,1,0),Position=UDim2.new(1,-110,0,0),BackgroundColor3=K.Field,
BorderSizePixel=0,AutoButtonColor=false,Font=aa.SemiBold,Text=self.ExplorerFrozen and'Unfreeze'or
'Freeze Now',TextColor3=K.Text,TextSize=11,ZIndex=153,Parent=aF})V:AddStroke(aH,'Border',1)local 
function Refresh()if not aG.Parent then return end aG.Text=self.ExplorerFrozen and'Status: FROZEN'
or'Status: live'aG.TextColor3=self.ExplorerFrozen and K.Accent or K.TextDim aH.Text=self.
ExplorerFrozen and'Unfreeze'or'Freeze Now'end aH.MouseButton1Click:Connect(function()self:
ToggleExplorerFreeze()Refresh()end)self._FreezeUiRefreshers=self._FreezeUiRefreshers or{}table.
insert(self._FreezeUiRefreshers,Refresh)end)CreateSection('Search Behaviour',3,function(aB)local aC
=V:CreateInstance('Frame',{Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,
BackgroundTransparency=1,ZIndex=152,Parent=aB})V:AddListLayout(aC,4,Enum.FillDirection.Vertical)
CreateToggleRow(aC,'Match by ClassName',true,1,nil,function()return self.MatchByClassName==true end
,function()self:ToggleMatchByClassName()end)CreateToggleRow(aC,
'Match by Property (use Prop=Value syntax)',true,2,nil,function()return self.MatchByProperty==true
end,function()self:ToggleMatchByProperty()end)CreateToggleRow(aC,'Show only matches (flat list)',
true,3,nil,function()return self.FlatSearchResults==true end,function()self.FlatSearchResults=not
self.FlatSearchResults self:SaveConfig()if self.SearchQuery~=''then self:RefreshAllSearchFilters()
end end)local aD=V:CreateInstance('TextLabel',{Size=UDim2.new(1,0,0,14),BackgroundTransparency=1,
Font=aa.Medium,Text='Examples: WalkSpeed>10  Anchored=true  Name~Dio',TextColor3=K.TextFaded,
TextSize=10,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=3,ZIndex=153,Parent=aC})BindTheme(
'TextFaded',function(aE)if aD and aD.Parent then aD.TextColor3=aE end end)end)CreateSection(
'Search - ClassName Filter',4,function(aB)local aC=V:CreateInstance('Frame',{Size=UDim2.new(1,0,0,0
),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,ZIndex=152,Parent=aB})V:
CreateInstance('UIGridLayout',{CellSize=UDim2.new(0.5,-2,0,22),CellPadding=UDim2.new(0,4,0,2),
SortOrder=Enum.SortOrder.LayoutOrder,Parent=aC})for aD,aE in self.FilterClassOptions do
CreateToggleRow(aC,aE,false,aD,aE,function()return self.ActiveClassFilters[aE]==true end,function()
self:ToggleClassFilter(aE)end)end end)CreateSection('Hidden Services',5,function(aB)local aC=V:
CreateInstance('Frame',{Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,
BackgroundTransparency=1,ZIndex=152,Parent=aB})V:AddListLayout(aC,4,Enum.FillDirection.Vertical)
CreateToggleRow(aC,'Hide All Services',true,1,nil,function()return self.AllServicesHidden end,
function()self:ToggleAllServicesHidden()end)local aD={}for aE,aF in WeakGetChildren(game)do table.
insert(aD,{Name=aF.Name,ClassName=aF.ClassName})end for aE in self.HiddenServices do local aF=false
for aG,aH in aD do if aH.Name==aE then aF=true break end end if not aF then table.insert(aD,{Name=
aE,ClassName='Folder'})end end table.sort(aD,function(aE,aF)return aE.Name:lower()<aF.Name:lower()
end)local aE=V:CreateInstance('Frame',{Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,
BackgroundTransparency=1,LayoutOrder=2,ZIndex=152,Parent=aC})V:CreateInstance('UIGridLayout',{
CellSize=UDim2.new(0.5,-2,0,22),CellPadding=UDim2.new(0,4,0,2),SortOrder=Enum.SortOrder.LayoutOrder
,Parent=aE})for aF,aG in aD do local aH=aG.Name CreateToggleRow(aE,aH,false,aF,aG.ClassName,
function()return self.HiddenServices[aH]==true end,function()self:ToggleServiceFilter(aH)end)end
end)self.FiltersDropdown=az self.FiltersBlocker=ap end function s:InitFreezeState()if self.
_FreezeInitialized then return end self._FreezeInitialized=true self.ExplorerFrozen=false self.
FreezeSearchTerm=''self.FreezeSearchByClassName=false self.FrozenPendingAdds=setmetatable({},{
__mode='k'})self.FrozenPendingRemoves=setmetatable({},{__mode='k'})self._FreezeUiRefreshers=self.
_FreezeUiRefreshers or{}end function s:_FireFreezeUiRefreshers()if not self._FreezeUiRefreshers
then return end for ao,ap in self._FreezeUiRefreshers do pcall(ap)end if self.
_UpdateFreezeButtonVisual then self:_UpdateFreezeButtonVisual()end end function s:SetExplorerFrozen
(ao,ap)self:InitFreezeState()if self.ExplorerFrozen==ao then return end self.ExplorerFrozen=ao if
not ao then local aq=self.FrozenPendingAdds local ar=self.FrozenPendingRemoves self.
FrozenPendingAdds={}self.FrozenPendingRemoves={}self:Notify('Explorer unfrozen')else local aq=ap
and` ({ap})`or''self:Notify(`Explorer frozen{aq}`)end self:_UpdateFreezeButtonVisual()task.defer(
function()if self.FreezeButton and self.FreezeButton.Parent then self:_UpdateFreezeButtonVisual()
end end)self:_FireFreezeUiRefreshers()end function s:ToggleExplorerFreeze()self:InitFreezeState()
self:SetExplorerFrozen(not self.ExplorerFrozen)end function s:_UpdateFreezeButtonVisual()local ao=
self.FreezeButton if not ao or not ao.Parent then return end local ap=self.ExplorerFrozen==true
local aq=ao:FindFirstChildOfClass('ImageLabel')local ar=ao:FindFirstChildOfClass('UIStroke')if ap
then ao.BackgroundColor3=K.Accent ao.BackgroundTransparency=0.15 ao.TextColor3=K.Text if aq then aq
.ImageColor3=K.Text end if ar then ar.Color=K.Accent end ao.Text=(aq and aq.Image~='')and''or'F*'
else ao.BackgroundColor3=K.Border ao.BackgroundTransparency=math.clamp((M.TitleBar or 0)+0.12,0,1)
ao.TextColor3=K.TextDim if aq then aq.ImageColor3=K.TextDim end if ar then ar.Color=K.Border end ao
.Text=(aq and aq.Image~='')and''or'F'end end function s:_StartFreezeSearchWatcher()self:
_StopFreezeSearchWatcher()local ao,ap=pcall(function()return game.DescendantAdded:Connect(function(
ao)if typeof(ao)~='Instance'then return end if self.ExplorerFrozen then return end local ap=self.
FreezeSearchTerm if not ap or ap==''then return end local aq=self.FreezeSearchByClassName==true
local ar if aq then local as,at=pcall(function()return ao.ClassName end)if not as or type(at)~=
'string'then return end ar=at else local as,at=pcall(function()return ao.Name end)if not as or
type(at)~='string'then return end ar=at end if not string.find(string.lower(ar),string.lower(ap),1,
true)then return end local as=ClonerefInstance(ao)pcall(function()if self._VTreeRevealInstance then
self:_VTreeRevealInstance(as,{Select=false,Scroll=false,Expand=true})end end)task.defer(function()
if h then return end if self.ExplorerFrozen then return end local at=aq and`matched class "{ar}"`or
`matched "{ar}"`self:SetExplorerFrozen(true,at)pcall(function()self:JumpToInstance(as)end)end)end)
end)if ao and ap then self._FreezeSearchConn=ap Track(ap)end end function s:
_StopFreezeSearchWatcher()if self._FreezeSearchConn then pcall(function()self._FreezeSearchConn:
Disconnect()end)self._FreezeSearchConn=nil end end function s:SetFreezeSearchTerm(ao)self:
InitFreezeState()ao=tostring(ao or''):gsub('^%s+',''):gsub('%s+$','')self.FreezeSearchTerm=ao if
self.FreezeSearchBox and self.FreezeSearchBox.Parent and self.FreezeSearchBox.Text~=ao then self.
FreezeSearchBox.Text=ao end if ao==''then self:_StopFreezeSearchWatcher()else self:
_StartFreezeSearchWatcher()end if self.SaveConfig then pcall(function()self:SaveConfig()end)end end
function s:_StartFreezeWatcher()local ao=(self.FreezeSearchTerm or''):lower()if ao==''then return
end self._FreezeWatcherConnection=Track(game.DescendantAdded:Connect(function(ap)if self.
ExplorerFrozen then return end if typeof(ap)~='Instance'then return end local aq,ar=pcall(function(
)return ap.Name end)if not aq or type(ar)~='string'then return end if ar:lower():find(ao,1,true)
then self:SetExplorerFrozen(true,`matched "{ar}"`)end end))end function s:CreateSearchBar()local ao
=self.ExplorerHeader if not ao then return end local ap=GetUIAssetId('SearchIcon')local aq=ap and
28 or 8 local ar=64 local as=V:CreateInstance('TextBox',{Size=UDim2.new(1,-16,0,24),Position=UDim2.
new(0,8,0.5,-12),BackgroundColor3=K.Field,BorderSizePixel=0,Font=aa.Mono,PlaceholderText=
'Search instances...',PlaceholderColor3=K.TextFaded,Text='',TextColor3=K.Text,TextSize=11,
TextXAlignment=Enum.TextXAlignment.Left,ClearTextOnFocus=false,Parent=ao})V:AddStroke(as,'Border',1
)V:AddPadding(as,0,ar,0,aq)BindTheme('Field',function(at)as.BackgroundColor3=at end)BindTheme(
'Text',function(at)if as and as.Parent then as.TextColor3=at end end)BindTheme('TextFaded',function
(at)if as and as.Parent then as.PlaceholderColor3=at end end)if ap then local at=V:CreateInstance(
'ImageLabel',{Size=UDim2.new(0,14,0,14),Position=UDim2.new(0,7-aq,0.5,-7),BackgroundTransparency=1,
Image=ap,ImageColor3=K.TextFaded,ScaleType=Enum.ScaleType.Fit,Active=false,Parent=as})BindTheme(
'TextFaded',function(au)if at and at.Parent then at.ImageColor3=au end end)end local at=V:
CreateInstance('TextButton',{Size=UDim2.new(0,56,0,18),Position=UDim2.new(1,-68,0.5,-9),
BackgroundColor3=K.Border,BorderSizePixel=0,AutoButtonColor=false,Font=aa.Bold,Text='FILTERS',
TextColor3=K.TextDim,TextSize=10,ZIndex=3,Parent=ao})V:AddStroke(at,'Border',1)BindTheme('Border',
function(au)at.BackgroundColor3=au end)BindTheme('TextDim',function(au)at.TextColor3=au end)at.
MouseEnter:Connect(function()V:Tween(at,{BackgroundColor3=K.Selected,TextColor3=K.Text})end)at.
MouseLeave:Connect(function()V:Tween(at,{BackgroundColor3=K.Border,TextColor3=K.TextDim})end)self.
SearchBox=as self.FiltersButton=at self._SearchTextToken=self._SearchTextToken or 0 self.
_LastAppliedSearchQuery=self.SearchQuery or''local function RequestSearchRefresh(au)if self.
_SuppressSearchBoxChanged then return end self._SearchTextToken+=1 local av=self._SearchTextToken
local aw=(as.Text or''):lower()self.SearchQuery=aw local function Apply()if av~=self.
_SearchTextToken or h then return end if self._SuppressSearchBoxChanged then return end if self.
_LastAppliedSearchQuery==aw then return end self._LastAppliedSearchQuery=aw self:
RefreshAllSearchFilters()end if au then Apply()else task.delay(0.18,Apply)end end as:
GetPropertyChangedSignal('Text'):Connect(function()RequestSearchRefresh(false)end)as.FocusLost:
Connect(function(au)if self._SuppressSearchBoxChanged then return end self._SearchTextToken+=1
local av=(as.Text or''):lower()self.SearchQuery=av if self._LastAppliedSearchQuery~=av then self.
_LastAppliedSearchQuery=av self:RefreshAllSearchFilters()end if au then self:HandleSearchSubmit()
end end)at.MouseButton1Click:Connect(function()if self.FiltersDropdown then self.FiltersDropdown:
Destroy()if self.FiltersBlocker then self.FiltersBlocker:Destroy()end self.FiltersDropdown=nil self
.FiltersBlocker=nil return end self:OpenFiltersDropdown(at)end)end function s:
CreatePropertyFilterBar()local ao=self.PropertiesHeader if not ao then return end local ap=V:
CreateInstance('TextBox',{Size=UDim2.new(1,-16,0,24),Position=UDim2.new(0,8,0.5,-12),
BackgroundColor3=K.Field,BorderSizePixel=0,Font=aa.Mono,PlaceholderText='Filter properties...',
PlaceholderColor3=K.TextFaded,Text='',TextColor3=K.Text,TextSize=11,TextXAlignment=Enum.
TextXAlignment.Left,ClearTextOnFocus=false,Parent=ao})V:AddStroke(ap,'Border',1)V:AddPadding(ap,0,8
,0,8)BindTheme('Field',function(aq)if ap and ap.Parent then ap.BackgroundColor3=aq end end)
BindTheme('Text',function(aq)if ap and ap.Parent then ap.TextColor3=aq end end)BindTheme(
'TextFaded',function(aq)if ap and ap.Parent then ap.PlaceholderColor3=aq end end)self.
PropertiesFilterBox=ap ap:GetPropertyChangedSignal('Text'):Connect(function()self.PropertyFilter=ap
.Text if self.SelectedInstance then self:RenderProperties(self.SelectedInstance)end end)end
function s:BuildQuickAccessBar()local ao=82 local ap=26 local aq=V:CreateInstance('TextButton',{
Size=UDim2.fromOffset(ao,ap),Position=UDim2.new(0.5,-ao/2,0,6),BackgroundColor3=K.TitleBar,
BorderSizePixel=0,AutoButtonColor=false,Font=aa.Bold,Text='VEX',TextColor3=K.Text,TextSize=13,
ZIndex=300,Parent=self.ScreenGui})V:AddStroke(aq,'Border',1)BindTheme('TitleBar',function(ar)if aq.
Parent then aq.BackgroundColor3=ar end end)BindTheme('Text',function(ar)if aq.Parent then aq.
TextColor3=ar end end)self.QuickButton=aq local function CloseDropdown()if self._QuickDropdown and
self._QuickDropdown.Parent then self._QuickDropdown:Destroy()end self._QuickDropdown=nil end local
ar={}local as=setmetatable({},{__mode='k'})local function ApplyTileVisual(at,au,av)local aw=au and
K.Selected or K.Field local ax=au and 0.15 or(M.Field or 0)local ay=av and math.clamp(ax-0.1,0,1)or
ax at.BackgroundColor3=aw at.BackgroundTransparency=ay local az=as[at]if az then if az.Stroke then
az.Stroke.Color=au and K.SelectionBar or K.Border end if az.Label then az.Label.TextColor3=au and K
.Accent or K.TextDim end end end local function MakeTile(at,au,av,aw,ax)local ay=av()local az=V:
CreateInstance('TextButton',{BackgroundColor3=ay and K.Selected or K.Field,BackgroundTransparency=
ay and 0.15 or(M.Field or 0),BorderSizePixel=0,AutoButtonColor=false,Text='',LayoutOrder=aw,ZIndex=
302,Parent=at})local aA=V:AddStroke(az,ay and'SelectionBar'or'Border',1)local aB=V:CreateInstance(
'Frame',{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,ZIndex=302,Parent=az})local aC=V:
AddListLayout(aB,4,Enum.FillDirection.Vertical)aC.HorizontalAlignment=Enum.HorizontalAlignment.
Center aC.VerticalAlignment=Enum.VerticalAlignment.Center local aD=V:CreateInstance('TextLabel',{
Size=UDim2.new(1,-4,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,Font=aa.
SemiBold,Text=au,TextColor3=ay and K.Accent or K.TextDim,TextSize=11,TextXAlignment=Enum.
TextXAlignment.Center,TextWrapped=true,ZIndex=303,Parent=aB})as[az]={Stroke=aA,Label=aD}local aE=
false az.MouseEnter:Connect(function()aE=true ApplyTileVisual(az,av(),true)end)az.MouseLeave:
Connect(function()aE=false ApplyTileVisual(az,av(),false)end)az.MouseButton1Click:Connect(function(
)ax()for aF,aG in ar do ApplyTileVisual(aG.Tile,aG.GetActive(),false)end end)table.insert(ar,{Tile=
az,GetActive=av})return az end local function OpenDropdown()CloseDropdown()ar={}local at=220 local
au=V:CreateInstance('Frame',{Size=UDim2.fromOffset(at,0),AutomaticSize=Enum.AutomaticSize.Y,
AnchorPoint=Vector2.new(0.5,0),BackgroundColor3=K.Window,BackgroundTransparency=M.Window or 0,
BorderSizePixel=0,ZIndex=301,Parent=self.ScreenGui})local av=V:AddStroke(au,'Border',1)V:
AddPadding(au,4,10,12,10)V:AddListLayout(au,8,Enum.FillDirection.Vertical)BindTheme('Window',
function(aw)if au and au.Parent then au.BackgroundColor3=aw end end)BindTransparency('Window',
function(aw)if au and au.Parent then au.BackgroundTransparency=aw end end)BindTheme('Border',
function(aw)if av and av.Parent then av.Color=aw end end)self._QuickDropdown=au local function 
ReposPanel()if not au.Parent or not aq.Parent then return end local aw=aq.AbsolutePosition local ax
=aq.AbsoluteSize local ay=self.ScreenGui.AbsolutePosition local az=aw.X+ax.X/2-ay.X local aA=aw.Y+
ax.Y+6-ay.Y au.Position=UDim2.fromOffset(az,aA)end ReposPanel()task.defer(ReposPanel)local aw=V:
CreateInstance('TextLabel',{Size=UDim2.new(1,0,0,14),BackgroundTransparency=1,Font=aa.Bold,Text=
'QUICK ACCESS',TextColor3=K.TextHeader,TextSize=10,TextXAlignment=Enum.TextXAlignment.Left,
LayoutOrder=0,ZIndex=302,Parent=au})BindTheme('TextHeader',function(ax)if aw and aw.Parent then aw.
TextColor3=ax end end)local ax=V:CreateInstance('Frame',{Size=UDim2.new(1,0,0,0),AutomaticSize=Enum
.AutomaticSize.Y,BackgroundTransparency=1,LayoutOrder=1,ZIndex=301,Parent=au})V:CreateInstance(
'UIGridLayout',{CellSize=UDim2.fromOffset(94,60),CellPadding=UDim2.fromOffset(6,6),FillDirection=
Enum.FillDirection.Horizontal,HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.
SortOrder.LayoutOrder,Parent=ax})MakeTile(ax,'Explorer',function()return self.ExplorerWindow and
self.ExplorerWindow.Frame and self.ExplorerWindow.Frame.Visible~=false end,1,function()if self.
ExplorerWindow and self.ExplorerWindow.Frame then local ay=not self.ExplorerWindow.Frame.Visible
self.ExplorerWindow.Frame.Visible=ay self.WindowVisible=ay end end)MakeTile(ax,'Properties',
function()return self.PropertiesWindow and self.PropertiesWindow.Frame and self.PropertiesWindow.
Frame.Visible~=false end,2,function()if self.PropertiesWindow and self.PropertiesWindow.Frame then
self.PropertiesWindow.Frame.Visible=not self.PropertiesWindow.Frame.Visible end end)MakeTile(ax,
'Console',function()return self.ConsoleWindow~=nil and self.ConsoleWindow.Parent~=nil end,3,
function()if self.ToggleConsole then self:ToggleConsole()end end)MakeTile(ax,
'Click Part\nto Select',function()return self.ClickPartToSelect==true end,4,function()self:
ToggleClickPartToSelect()end)MakeTile(ax,'Click UI\nto Select',function()return self.
ClickUiToSelect==true end,5,function()self:ToggleClickUiToSelect()end)task.spawn(function()task.
wait(0.05)local ay ay=d.UserInputService.InputBegan:Connect(function(az)if az.UserInputType~=Enum.
UserInputType.MouseButton1 and az.UserInputType~=Enum.UserInputType.MouseButton2 then return end if
not au or not au.Parent then ay:Disconnect()return end local aA=az.Position.X local aB=az.Position.
Y local aC=au.AbsolutePosition local aD=au.AbsoluteSize local aE=aq.AbsolutePosition local aF=aq.
AbsoluteSize local aG=aA>=aC.X and aA<=aC.X+aD.X and aB>=aC.Y and aB<=aC.Y+aD.Y local aH=aA>=aE.X
and aA<=aE.X+aF.X and aB>=aE.Y and aB<=aE.Y+aF.Y if not aG and not aH then CloseDropdown()ay:
Disconnect()end end)end)end aq.MouseButton1Click:Connect(function()if self._QuickDropdown and self.
_QuickDropdown.Parent then CloseDropdown()else OpenDropdown()end end)end function s:
ToggleClickPartToSelect()self.ClickPartToSelect=not self.ClickPartToSelect if self.
ClickPartToSelect then self:_StartClickPartToSelect()self:Notify('Click Part to Select: ON')else
self:_StopClickPartToSelect()self:Notify('Click Part to Select: OFF')end end function s:
ToggleClickUiToSelect()self.ClickUiToSelect=not self.ClickUiToSelect if self.ClickUiToSelect then
self:_StartClickUiToSelect()self:Notify('Click UI to Select: ON')else self:_StopClickUiToSelect()
self:Notify('Click UI to Select: OFF')end end function s:_StartClickUiToSelect()self:
_StopClickUiToSelect()local ao=self.LocalPlayer:GetMouse()local function GatherHits(ap,aq)local ar=
{}local as=self.LocalPlayer:FindFirstChildOfClass('PlayerGui')if as then local at,au=pcall(function
()return as:GetGuiObjectsAtPosition(ap,aq)end)if at and type(au)=='table'then for av,aw in au do
table.insert(ar,aw)end end end local at,au=pcall(function()return d.CoreGui:
GetGuiObjectsAtPosition(ap,aq)end)if at and type(au)=='table'then for av,aw in au do table.insert(
ar,aw)end end return ar end self._ClickUiConnection=Track(ao.Button1Down:Connect(function()local ap
=GatherHits(ao.X,ao.Y)if#ap==0 then return end local aq for ar,as in ap do if self.ScreenGui and as
:IsDescendantOf(self.ScreenGui)then continue end aq=as break end if not aq then return end if self:
IsPointOverVexUi(ao.X,ao.Y)then return end self:JumpToInstance(ClonerefInstance(aq))end))end
function s:_StopClickUiToSelect()if self._ClickUiConnection then pcall(function()self.
_ClickUiConnection:Disconnect()end)self._ClickUiConnection=nil end end function s:IsPointOverVexUi(
ao,ap)if not self.ScreenGui then return false end local aq,ar=pcall(function()return self.ScreenGui
:GetGuiObjectsAtPosition(ao,ap)end)if not aq or type(ar)~='table'then return false end return#ar>0
end function s:_StartClickPartToSelect()self:_StopClickPartToSelect()self._ClickPartConnection=
Track(d.UserInputService.InputBegan:Connect(function(ao,ap)if ao.UserInputType~=Enum.UserInputType.
MouseButton1 or ao.UserInputType~=Enum.UserInputType.Touch then return end if ap then return end
local aq=self.LocalPlayer:GetMouse()if self:IsPointOverVexUi(aq.X,aq.Y)then return end local ar=aq.
Target if not ar then return end local as,at=pcall(function()return ar:IsA('BasePart')end)if not(as
and at)then return end local au,av=pcall(function()return self.ScreenGui~=nil and ar:
IsDescendantOf(self.ScreenGui)end)if au and av then return end local aw=ClonerefInstance(ar)self:
JumpToInstance(aw)end))end function s:_StopClickPartToSelect()if self._ClickPartConnection then
pcall(function()self._ClickPartConnection:Disconnect()end)self._ClickPartConnection=nil end end
function s:_PinPath(ao)if not ao then return nil end local ap,aq=pcall(function()return ao:
GetFullName()end)if ap and type(aq)=='string'and aq~=''then return aq end return nil end function s
:_ResolvePinPath(ao)if type(ao)~='string'or ao==''then return nil end local ap=string.split(ao,'.')
local aq=game for ar,as in ap do if ar==1 and as=='game'then continue end local at,au=pcall(
function()return aq:FindFirstChild(as)end)if not at or not au then return nil end aq=au end return
aq end function s:IsPinned(ao)local ap=self:_PinPath(ao)if not ap then return false end self.
PinnedPaths=self.PinnedPaths or{}for aq,ar in self.PinnedPaths do if ar==ap then return true end
end return false end function s:PinInstance(ao)local ap=self:_PinPath(ao)if not ap then return end
self.PinnedPaths=self.PinnedPaths or{}for aq,ar in self.PinnedPaths do if ar==ap then return end
end table.insert(self.PinnedPaths,ap)if self.SaveConfig then self:SaveConfig()end if self.
_RebuildPinBar then self:_RebuildPinBar()end end function s:UnpinInstance(ao)local ap=self:
_PinPath(ao)if not ap then return end self.PinnedPaths=self.PinnedPaths or{}for aq,ar in self.
PinnedPaths do if ar==ap then table.remove(self.PinnedPaths,aq)if self.SaveConfig then self:
SaveConfig()end if self._RebuildPinBar then self:_RebuildPinBar()end return end end end function s:
_RebuildPinBar()local ao=self.PinBar if not ao then return end for ap,aq in ao:GetChildren()do if
aq:IsA('GuiObject')then aq:Destroy()end end self.PinnedPaths=self.PinnedPaths or{}self:
_ApplyExplorerLayout()if#self.PinnedPaths==0 then return end for ap,aq in self.PinnedPaths do local
ar=self:_ResolvePinPath(aq)local as local at if ar then local au,av=pcall(function()return ar.Name
end)as=au and av or'?'local aw,ax=pcall(function()return ar.ClassName end)at=aw and ax or'Instance'
else local au=string.split(aq,'.')as=au[#au]or'?'at='Instance'end local au=V:CreateInstance(
'TextButton',{Size=UDim2.new(0,0,1,0),AutomaticSize=Enum.AutomaticSize.X,BackgroundColor3=K.Field,
BorderSizePixel=0,AutoButtonColor=false,Font=aa.Medium,Text='',LayoutOrder=ap,Parent=ao})V:
AddStroke(au,'Border',1)V:AddPadding(au,0,6,0,6)local av=V:CreateInstance('ImageLabel',{Size=UDim2.
new(0,14,0,14),Position=UDim2.new(0,0,0.5,-7),BackgroundTransparency=1,Parent=au})V:ApplyClassIcon(
av,at)local aw=V:CreateInstance('TextLabel',{Size=UDim2.new(0,0,1,0),Position=UDim2.new(0,18,0,0),
AutomaticSize=Enum.AutomaticSize.X,BackgroundTransparency=1,Font=aa.Medium,Text=as,TextColor3=ar
and K.Text or K.TextFaded,TextSize=11,TextXAlignment=Enum.TextXAlignment.Left,Parent=au})au.
MouseButton1Click:Connect(function()local ax=self:_ResolvePinPath(aq)if not ax then self:Notify(
'Pinned instance no longer exists')return end self:JumpToInstance(ax)end)au.MouseButton2Click:
Connect(function()local ax=self:_ResolvePinPath(aq)self:UnpinInstance(ax or{GetFullName=function()
return aq end})if not ax then for ay,az in self.PinnedPaths do if az==aq then table.remove(self.
PinnedPaths,ay)if self.SaveConfig then self:SaveConfig()end self:_RebuildPinBar()break end end end
end)au.TouchLongPress:Connect(function()local ax=self:_ResolvePinPath(aq)self:UnpinInstance(ax or{
GetFullName=function()return aq end})if not ax then for ay,az in self.PinnedPaths do if az==aq then
table.remove(self.PinnedPaths,ay)if self.SaveConfig then self:SaveConfig()end self:_RebuildPinBar()
break end end end end)end end function s:_ApplyExplorerLayout()local ao=self.PinnedPaths and#self.
PinnedPaths>0 local ap=ao and 22 or 0 local aq=ao and 4 or 0 if self._PinBar then self._PinBar.
Visible=ao end if self._SearchHolder then self._SearchHolder.Position=UDim2.new(0,0,0,38+ap+aq)end
if self._TreeHolder then local ar=74+ap+aq self._TreeHolder.Position=UDim2.new(0,0,0,ar)self.
_TreeHolder.Size=UDim2.new(1,0,1,-ar)end end function s:BuildExplorerWindow()local ao=workspace.
CurrentCamera local ap=ao and ao.ViewportSize or Vector2.new(1366,768)local aq=360 local ar=math.
min(580,math.floor((ap.Y-40)/2))local as=V:CreateWindow({Parent=self.ScreenGui,Title='Explorer',
BackgroundTransparency=1,Brand=true,Size=UDim2.fromOffset(aq,ar),Position=UDim2.fromOffset(ap.X-aq,
0)})self.ExplorerWindow=as local at=self.ExplorerWindow:AddTitleButton('',24,false,function()self:
ToggleExplorerFreeze()end,'FreezeIcon',10,18)self.FreezeButton=at self:InitFreezeState()local 
function ReapplyIfFrozen()if self.ExplorerFrozen then task.defer(function()if at and at.Parent then
self:_UpdateFreezeButtonVisual()end end)end end Track(at.MouseEnter:Connect(ReapplyIfFrozen))Track(
at.MouseLeave:Connect(ReapplyIfFrozen))Track(at.MouseButton1Click:Connect(ReapplyIfFrozen))
BindTheme('Border',ReapplyIfFrozen)BindTheme('Selected',ReapplyIfFrozen)BindTheme('Text',
ReapplyIfFrozen)BindTheme('TextDim',ReapplyIfFrozen)BindTheme('Accent',ReapplyIfFrozen)
BindTransparency('TitleBar',ReapplyIfFrozen)self._ReapplyFreezeVisual=ReapplyIfFrozen self:
_UpdateFreezeButtonVisual()as:AddTitleButton('C',26,false,function()self:ToggleConsole()end,
'ConsoleIcon',nil,16)as:AddTitleButton('...',26,false,function()self:OpenSettings()end,
'SettingsIcon',nil,14)as:AddTitleButton('X',26,true,function()self:Kill()end,'CloseIcon',nil,14)
self:InitFreezeState()self:_UpdateFreezeButtonVisual()local au=V:CreateInstance('Frame',{Size=UDim2
.new(1,-16,0,26),Position=UDim2.new(0,8,0,6),BackgroundTransparency=1,Parent=as.Body})local av=V:
AddListLayout(au,6,Enum.FillDirection.Horizontal)av.VerticalAlignment=Enum.VerticalAlignment.Center
local function MakeAction(aw,ax,ay)local az=V:CreateInstance('TextButton',{Size=UDim2.new(0,0,1,-4)
,AutomaticSize=Enum.AutomaticSize.X,BackgroundColor3=K.Field,BorderSizePixel=0,AutoButtonColor=
false,Font=aa.SemiBold,Text=aw,TextColor3=K.TextDim,TextSize=11,LayoutOrder=ax,Parent=au})V:
AddStroke(az,'Border',1)V:AddPadding(az,0,10,0,10)local aA=false local function ApplyActionVisual(
aB)local aC={BackgroundColor3=aA and K.FieldHover or K.Field,TextColor3=aA and K.Text or K.TextDim}
if aB then V:Tween(az,aC)else az.BackgroundColor3=aC.BackgroundColor3 az.TextColor3=aC.TextColor3
end end BindTheme('Field',function()ApplyActionVisual(false)end)BindTheme('FieldHover',function()
ApplyActionVisual(false)end)BindTheme('Text',function()ApplyActionVisual(false)end)BindTheme(
'TextDim',function()ApplyActionVisual(false)end)Track(az.MouseEnter:Connect(function()aA=true
ApplyActionVisual(true)end))Track(az.MouseLeave:Connect(function()aA=false ApplyActionVisual(true)
end))Track(az.MouseButton1Click:Connect(ay))return az end MakeAction('TP - PlaceId',1,function()
pcall(function()d.TeleportService:Teleport(game.PlaceId,self.LocalPlayer)end)end)MakeAction(
'TP - JobId',2,function()pcall(function()d.TeleportService:TeleportToPlaceInstance(game.PlaceId,
game.JobId,self.LocalPlayer)end)end)MakeAction('Kick Self',3,function()pcall(function()self.
LocalPlayer:Kick('Kicked via VEX Explorer')end)end)local aw=V:CreateInstance('ScrollingFrame',{Size
=UDim2.new(1,-16,0,22),Position=UDim2.new(0,8,0,36),BackgroundTransparency=1,BorderSizePixel=0,
ScrollBarThickness=0,ScrollingDirection=Enum.ScrollingDirection.X,CanvasSize=UDim2.new(0,0,0,0),
AutomaticCanvasSize=Enum.AutomaticSize.X,Visible=false,Parent=as.Body})local ax=V:AddListLayout(aw,
4,Enum.FillDirection.Horizontal)ax.VerticalAlignment=Enum.VerticalAlignment.Center self.PinBar=aw
local ay=V:CreateInstance('Frame',{Size=UDim2.new(1,0,0,36),Position=UDim2.new(0,0,0,62),
BackgroundTransparency=1,Parent=as.Body})self.ExplorerHeader=ay local az=V:CreateInstance('Frame',{
Size=UDim2.new(1,0,1,-98),Position=UDim2.new(0,0,0,98),BackgroundTransparency=1,Parent=as.Body})
self._PinBar=aw self._SearchHolder=ay self._TreeHolder=az local aA=V:CreateInstance(
'ScrollingFrame',{Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,BorderSizePixel=0,
ScrollBarThickness=6,ScrollBarImageColor3=K.Border,CanvasSize=UDim2.new(0,0,0,0),
AutomaticCanvasSize=Enum.AutomaticSize.Y,ScrollingDirection=Enum.ScrollingDirection.Y,Parent=az})V:
BindThemeColor(aA,'ScrollBarImageColor3','Border')V:AddPadding(aA,4,8,8,8)V:AddListLayout(aA,1,Enum
.FillDirection.Vertical)local aB=V:CreateInstance('TextButton',{Size=UDim2.new(1,-8,0,22),Position=
UDim2.new(0,4,0,0),BackgroundColor3=K.Window,BackgroundTransparency=M.Window,BorderSizePixel=0,
AutoButtonColor=false,Text='',Visible=false,ZIndex=10,Parent=az})BindTheme('Window',function(aC)aB.
BackgroundColor3=aC end)BindTransparency('Window',function(aC)aB.BackgroundTransparency=aC end)aB.
MouseButton1Click:Connect(function()local aC=self._StickyHeaderTarget if not aC then return end
local aD=self._VTreeRowsByInstance[aC]if aD then local aE=self._VTreeRowHeight or 22 local aF=math.
max(0,(aD-1)*aE)aA.CanvasPosition=Vector2.new(aA.CanvasPosition.X,aF)end end)local aC=V:
CreateInstance('Frame',{Size=UDim2.new(1,0,0,1),Position=UDim2.new(0,0,1,0),BackgroundColor3=K.
BorderSoft,BorderSizePixel=0,ZIndex=10,Parent=aB})BindTheme('BorderSoft',function(aD)aC.
BackgroundColor3=aD end)local aD=V:CreateInstance('ImageLabel',{Size=UDim2.new(0,16,0,16),Position=
UDim2.new(0,8,0.5,-8),BackgroundTransparency=1,Image='',ScaleType=Enum.ScaleType.Fit,ZIndex=12,
Parent=aB})local aE=V:CreateInstance('TextLabel',{Size=UDim2.new(1,-40,1,0),Position=UDim2.new(0,32
,0,0),BackgroundTransparency=1,Font=aa.SemiBold,Text='',TextColor3=K.TextDim,TextSize=12,
TextXAlignment=Enum.TextXAlignment.Left,TextTruncate=Enum.TextTruncate.AtEnd,ZIndex=11,Parent=aB})
BindTheme('TextDim',function(aF)aE.TextColor3=aF end)self.StickyHeader=aB self.StickyHeaderIcon=aD
self.StickyHeaderLabel=aE local function UpdateStickyHeader()local aF=self._VTreeFilterActive and
self._VTreeFilteredRows or self._VTreeRows if not aF or#aF==0 then aB.Visible=false return end
local aG=self._VTreeRowHeight or 22 local aH=aA.CanvasPosition.Y if aH<=0 then aB.Visible=false
return end local aI=math.floor(aH/aG)+1 if aI>#aF then aI=#aF end local aJ for aK=aI,1,-1 do local
aL=aF[aK]if aL and aL.Depth==0 and not aL.IsTruncationNotice and not aL.IsNilContainer then Anchor=
aL aJ=aK break end end if not Anchor or not Anchor.Instance or not aJ then aB.Visible=false return
end local aK=(aJ-1)*aG if aK>=aH then aB.Visible=false return end aB.Visible=true aE.Text=Anchor.
RawName or'?'V:ApplyClassIcon(aD,Anchor.ClassName)aD.Visible=true self._StickyHeaderTarget=Anchor.
Instance return end self.UpdateStickyHeader=UpdateStickyHeader self.ExplorerColumn={Content=aA,
Clear=function()for aF,aG in aA:GetChildren()do if aG:IsA('GuiObject')then aG:Destroy()end end end,
AddLabel=function(aF,aG)local aH=V:CreateInstance('TextLabel',{Size=UDim2.new(1,0,0,22),
BackgroundTransparency=1,Font=aa.Medium,Text=aG,TextColor3=K.TextDim,TextSize=12,TextXAlignment=
Enum.TextXAlignment.Left,Parent=aA})V:BindThemeColor(aH,'TextColor3','TextDim')return aH end}self.
ReparentIndicator=V:CreateInstance('TextLabel',{Size=UDim2.new(1,-16,0,22),Position=UDim2.new(0,8,1
,-28),BackgroundColor3=K.Accent,BackgroundTransparency=0.3,BorderSizePixel=0,Font=aa.Bold,Text='',
TextColor3=Color3.fromRGB(255,255,255),TextSize=11,Visible=false,ZIndex=5,Parent=as.Body})V:
BindThemeColor(self.ReparentIndicator,'BackgroundColor3','Accent')Track(aA:
GetPropertyChangedSignal('CanvasPosition'):Connect(function()if self.UpdateStickyHeader then self.
UpdateStickyHeader()end end))self:_RebuildPinBar()end function s:SetupDragHandlers()if self.
DragHandlersInstalled then return end self.DragHandlersInstalled=true Track(d.UserInputService.
InputChanged:Connect(function(ao)local ap=self.DragOperation if not ap then return end if ao.
UserInputType~=Enum.UserInputType.MouseMovement and ao.UserInputType~=Enum.UserInputType.Touch then
return end local aq=ao.Position.X-ap.StartX local ar=ao.Position.Y-ap.StartY if not ap.HasStarted
and(aq*aq+ar*ar)>64 then ap.HasStarted=true ap.GhostLabel=V:CreateInstance('TextLabel',{Size=UDim2.
fromOffset(200,22),BackgroundColor3=K.Window,BackgroundTransparency=0.05,BorderSizePixel=0,Font=aa.
SemiBold,Text=`  \226\135\132 {ap.SourceName}`,TextColor3=K.Accent,TextSize=12,TextXAlignment=Enum.
TextXAlignment.Left,ZIndex=500,Parent=self.ScreenGui})V:AddStroke(ap.GhostLabel,K.Accent,1)end if
ap.HasStarted and ap.GhostLabel then ap.GhostLabel.Position=UDim2.fromOffset(ao.Position.X+12,ao.
Position.Y+8)end end))Track(d.UserInputService.InputEnded:Connect(function(ao)if ao.UserInputType~=
Enum.UserInputType.MouseButton1 and ao.UserInputType~=Enum.UserInputType.Touch then return end
local ap=self.DragOperation if not ap then return end self.DragOperation=nil if ap.GhostLabel then
ap.GhostLabel:Destroy()end if not ap.HasStarted then return end self.JustDragged=true task.delay(
0.15,function()self.JustDragged=false end)local aq,ar=ao.Position.X,ao.Position.Y local as if self.
_VTreePool then for at,au in self._VTreePool do local av=au.Row local aw=au.Bound if av and av.
Visible and aw and aw.Instance and not aw.IsNilContainer then local ax=av.AbsolutePosition local ay
=av.AbsoluteSize if ay.Y>0 and aq>=ax.X and aq<=ax.X+ay.X and ar>=ax.Y and ar<=ax.Y+ay.Y then as=aw
.Instance break end end end end if as==nil then return end if as==ap.Source then return end local
at if self.SelectedSet[ap.Source]then at=self:GetSelectionList()else at={ap.Source}end local au=0
for av,aw in at do local ax=pcall(function()if aw~=as and not as:IsDescendantOf(aw)then aw.Parent=
as au+=1 end end)end if au>0 then self:Notify(`Reparented {au} into {as.Name}`)end end))end
function s:BuildPropertiesWindow()local ao=workspace.CurrentCamera local ap=ao and ao.ViewportSize
or Vector2.new(1366,768)local aq=360 local ar=self.ExplorerWindow and self.ExplorerWindow.Frame
local as=0 if ar then as=ar.Position.Y.Offset+ar.Size.Y.Offset end local at=math.max(280,ap.Y-as)
local au=V:CreateWindow({Parent=self.ScreenGui,Title='Properties',BackgroundTransparency=1,Size=
UDim2.fromOffset(aq,at),Position=UDim2.fromOffset(ap.X-aq,as)})self.PropertiesWindow=au local av=V:
CreateInstance('Frame',{Size=UDim2.new(1,-16,0,22),Position=UDim2.new(0,8,0,8),
BackgroundTransparency=1,Parent=au.Body})self.PropertiesTitleLabel=V:CreateInstance('TextLabel',{
Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,Font=aa.Mono,Text='(no selection)',TextColor3=K.
Accent,TextSize=12,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.
Center,TextTruncate=Enum.TextTruncate.AtEnd,Parent=av})BindTheme('Accent',function(aw)self.
PropertiesTitleLabel.TextColor3=aw end)local aw=V:CreateInstance('Frame',{Size=UDim2.new(1,-16,0,28
),Position=UDim2.new(0,8,0,30),BackgroundTransparency=1,Parent=au.Body})self.PropertiesHeader=aw
local ax=V:CreateInstance('Frame',{Size=UDim2.new(1,0,1,-64),Position=UDim2.new(0,0,0,64),
BackgroundTransparency=1,Parent=au.Body})local ay=V:CreateInstance('ScrollingFrame',{Size=UDim2.
new(1,0,1,0),BackgroundTransparency=1,BorderSizePixel=0,ScrollBarThickness=3,ScrollBarImageColor3=K
.Border,CanvasSize=UDim2.new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,ScrollingDirection=
Enum.ScrollingDirection.Y,Parent=ax})V:BindThemeColor(ay,'ScrollBarImageColor3','Border')V:
AddPadding(ay,4,8,8,8)V:AddListLayout(ay,0,Enum.FillDirection.Vertical)self.PropertiesContent=ay
end function s:CloseContextMenu()self._ContextMenuToken=nil if self.ContextMenuBlocker and self.
ContextMenuBlocker.Parent then self.ContextMenuBlocker:Destroy()end self.ContextMenuBlocker=nil if
self.ContextMenuFrame and self.ContextMenuFrame.Parent then self.ContextMenuFrame:Destroy()end self
.ContextMenuFrame=nil end function s:_GetReadableProperties(ao)local ap={}if not ao then return ap
end local aq if getproperties then local ar,as=pcall(getproperties,ao)if ar and type(as)=='table'
then aq=as end end if not aq and gethiddenproperties then local ar,as=pcall(gethiddenproperties,ao)
if ar and type(as)=='table'then aq=as end end if not aq then aq={'Name','ClassName','Parent',
'Archivable'}end for ar,as in aq do local at,au=pcall(function()return ao[as]end)if at then ap[as]=
au end end return ap end function s:SnapshotForDiff(ao)if not ao then return end self.
_DiffSnapshots=self._DiffSnapshots or setmetatable({},{__mode='k'})self._DiffSnapshots[ao]={Time=os
.clock(),Props=self:_GetReadableProperties(ao)}self:Notify(`Snapshot saved for {ao.Name}`)end
function s:HasSnapshot(ao)return self._DiffSnapshots and self._DiffSnapshots[ao]~=nil end function
s:_FormatDiffValue(ao)local ap=typeof(ao)if ap=='string'then return`"{ao}"`elseif ap=='Instance'
then local aq,ar=pcall(function()return ao:GetFullName()end)return aq and ar or'Instance'elseif ap
=='nil'then return'nil'elseif ap=='Color3'then return string.format('Color3(%.2f, %.2f, %.2f)',ao.R
,ao.G,ao.B)elseif ap=='Vector3'or ap=='Vector2'or ap=='UDim2'or ap=='UDim'or ap=='CFrame'then
return tostring(ao)elseif ap=='EnumItem'then return tostring(ao)elseif ap=='boolean'or ap=='number'
then return tostring(ao)end return`<{ap}>`end function s:_ValuesEqual(ao,ap)if ao==ap then return
true end if typeof(ao)~=typeof(ap)then return false end local aq=typeof(ao)if aq=='Color3'or aq==
'Vector3'or aq=='Vector2'or aq=='UDim2'or aq=='UDim'or aq=='CFrame'then return tostring(ao)==
tostring(ap)end return false end function s:OpenDiffViewer(ao)if not ao then return end local ap=
self._DiffSnapshots and self._DiffSnapshots[ao]if not ap then self:Notify(
'No snapshot for this instance')return end local aq,ar=self:CreateModalWindow(`Diff: {ao.Name}`,540
,480,{Resizable=true,MinWidth=360,MinHeight=260})local as=V:CreateInstance('TextLabel',{Size=UDim2.
new(1,-16,0,22),Position=UDim2.new(0,8,0,4),BackgroundTransparency=1,Font=aa.Medium,Text=string.
format('Snapshot taken %.1fs ago',os.clock()-ap.Time),TextColor3=K.TextDim,TextSize=11,
TextXAlignment=Enum.TextXAlignment.Left,Parent=ar})local at=V:CreateInstance('ScrollingFrame',{Size
=UDim2.new(1,-16,1,-34),Position=UDim2.new(0,8,0,30),BackgroundTransparency=1,BorderSizePixel=0,
ScrollBarThickness=4,ScrollBarImageColor3=K.Border,CanvasSize=UDim2.new(0,0,0,0),
AutomaticCanvasSize=Enum.AutomaticSize.Y,ScrollingDirection=Enum.ScrollingDirection.Y,Parent=ar})V:
AddListLayout(at,2,Enum.FillDirection.Vertical)V:AddPadding(at,4,4,4,4)local au=self:
_GetReadableProperties(ao)local av={}for aw,ax in ap.Props do local ay=au[aw]if not self:
_ValuesEqual(ax,ay)then table.insert(av,{Name=aw,Old=ax,New=ay,Type='changed'})end end for aw,ax in
au do if ap.Props[aw]==nil then table.insert(av,{Name=aw,Old=nil,New=ax,Type='added'})end end table
.sort(av,function(aw,ax)if aw.Type~=ax.Type then return aw.Type<ax.Type end return aw.Name<ax.Name
end)if#av==0 then V:CreateInstance('TextLabel',{Size=UDim2.new(1,0,0,32),BackgroundTransparency=1,
Font=aa.Medium,Text='No changes detected',TextColor3=K.TextDim,TextSize=12,Parent=at})return end as
.Text=string.format('%d change(s) - snapshot %.1fs ago',#av,os.clock()-ap.Time)for aw,ax in av do
local ay=V:CreateInstance('Frame',{Size=UDim2.new(1,0,0,42),BackgroundColor3=K.Field,
BackgroundTransparency=0.6,BorderSizePixel=0,Parent=at})V:AddPadding(ay,4,8,4,8)local az=V:
CreateInstance('TextLabel',{Size=UDim2.new(0,60,0,14),Position=UDim2.new(0,0,0,0),
BackgroundTransparency=1,Font=aa.Bold,Text=ax.Type:upper(),TextColor3=ax.Type=='added'and K.
PropNumber or K.Accent,TextSize=10,TextXAlignment=Enum.TextXAlignment.Left,Parent=ay})V:
CreateInstance('TextLabel',{Size=UDim2.new(1,-68,0,14),Position=UDim2.new(0,64,0,0),
BackgroundTransparency=1,Font=aa.SemiBold,Text=ax.Name,TextColor3=K.Text,TextSize=12,TextXAlignment
=Enum.TextXAlignment.Left,Parent=ay})local aA if ax.Type=='added'then aA=`+ {self:_FormatDiffValue(
ax.New)}`else aA=`{self:_FormatDiffValue(ax.Old)}  ->  {self:_FormatDiffValue(ax.New)}`end V:
CreateInstance('TextLabel',{Size=UDim2.new(1,0,0,16),Position=UDim2.new(0,0,0,18),
BackgroundTransparency=1,Font=aa.Mono,Text=aA,TextColor3=K.TextDim,TextSize=11,TextXAlignment=Enum.
TextXAlignment.Left,TextTruncate=Enum.TextTruncate.AtEnd,Parent=ay})end end function s:
OpenContextMenu(ao,ap)self:CloseContextMenu()local aq=self:GetSelectionList()if#aq==0 then return
end local ar=self.SelectedInstance and self.SelectedInstance.ClassName or''local as={}self.
_ContextMenuToken=as local at local au local function Close()if self._ContextMenuToken~=as then
return end self._ContextMenuToken=nil if au then au:Disconnect()au=nil end if at and at.Parent then
at:Destroy()end self.ContextMenuFrame=nil end at=V:CreateInstance('Frame',{Size=UDim2.fromOffset(
220,0),AutomaticSize=Enum.AutomaticSize.Y,Position=UDim2.fromOffset(ao,ap),BackgroundColor3=K.
Window,BorderSizePixel=0,ZIndex=201,Parent=self.ScreenGui})V:AddStroke(at,'Border',1)V:AddPadding(
at,6,6,6,6)V:AddListLayout(at,2,Enum.FillDirection.Vertical)BindTheme('Window',function(av)at.
BackgroundColor3=av end)self.ContextMenuFrame=at au=d.UserInputService.InputBegan:Connect(function(
av)if av.UserInputType~=Enum.UserInputType.MouseButton1 and av.UserInputType~=Enum.UserInputType.
MouseButton2 and av.UserInputType~=Enum.UserInputType.Touch then return end if not at or not at.
Parent then Close()return end local aw=av.Position.X local ax=av.Position.Y local ay=at.
AbsolutePosition local az=at.AbsoluteSize if aw>=ay.X and aw<=ay.X+az.X and ax>=ay.Y and ax<=ay.Y+
az.Y then return end Close()end)local function MakeItem(av,aw,ax)local ay=V:CreateInstance(
'TextButton',{Size=UDim2.new(1,0,0,24),BackgroundColor3=K.Field,BackgroundTransparency=1,
BorderSizePixel=0,AutoButtonColor=false,Font=aa.SemiBold,Text=av,TextColor3=aw and K.TextFaded or K
.Text,TextSize=12,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=202,Parent=at})V:AddPadding(ay,0,
10,0,10)if aw then return ay end Track(ay.MouseEnter:Connect(function()V:Tween(ay,{
BackgroundTransparency=0,BackgroundColor3=K.FieldHover})end))Track(ay.MouseLeave:Connect(function()
V:Tween(ay,{BackgroundTransparency=1})end))Track(ay.MouseButton1Click:Connect(function()Close()ax()
end))return ay end local function MakeSeparator()V:CreateInstance('Frame',{Size=UDim2.new(1,0,0,1),
BackgroundColor3=K.BorderSoft,BorderSizePixel=0,Parent=at})end MakeItem('Insert Object',false,
function()self:OpenInsertObject()end)MakeItem('Duplicate',false,function()local av=self:
DuplicateSelection()self:Notify(`Duplicated {av} instance(s)`)end)MakeItem('Copy',false,function()
self:CopySelection()self:Notify(`Copied {self.Clipboard and#self.Clipboard or 0} instance(s)`)end)
MakeItem('Paste Into',not(self.Clipboard and#self.Clipboard>0),function()local av=self.Clipboard
and#self.Clipboard or 0 self:PasteIntoSelection()self:Notify(`Pasted {av} clone(s)`)end)
MakeSeparator()MakeItem('Reparent',false,function()self:BeginReparent()end)local av=self.
SelectedInstance local aw=av and self:IsPinned(av)MakeItem(aw and'Unpin'or'Pin',not av,function()if
aw then self:UnpinInstance(av)self:Notify('Unpinned')else self:PinInstance(av)self:Notify('Pinned')
end end)MakeItem('Snapshot for Differences',not av,function()self:SnapshotForDiff(av)end)local ax=
av and self:HasSnapshot(av)MakeItem('Show Differences',not ax,function()self:OpenDiffViewer(av)end)
MakeItem('Select Children',false,function()self:SelectChildrenOfSelection()end)local ay=(self.
_LastAppliedSearchQuery or'')~=''or(self.SearchBox and self.SearchBox.Text~='')local az=typeof(self
.SelectedInstance)=='Instance'MakeItem('Clear Search & Jump',not(ay and az),function()self:
ClearSearchAndJumpTo()end)local aA=self.SelectedInstance local aB=false if aA then local aC,aD=
pcall(function()return aA:IsA('Player')end)aB=aC and aD end if aB then MakeItem('Jump to Character'
,false,function()self:JumpToCharacter(aA)self:CloseContextMenu()end)end local aC=self.
SelectedInstance local aD=false if aC then local aE,aF=pcall(function()return d.Players[aC.Name]end
)aD=aE and aF end if aC:IsA('Model')and aD then MakeItem('Jump to Player',false,function()self:
JumpToPlayer(aC)self:CloseContextMenu()end)end MakeSeparator()MakeItem('Copy Name',false,function()
if self.SelectedInstance then pcall(setclipboard,self.SelectedInstance.Name)self:Notify(
'Name copied')end end)MakeItem('Copy Path',false,function()if self.SelectedInstance then pcall(
setclipboard,self:FullPath(self.SelectedInstance))self:Notify('Path copied')end end)MakeItem(
'Copy ClassName',false,function()if self.SelectedInstance then pcall(setclipboard,self.
SelectedInstance.ClassName)self:Notify('ClassName copied')end end)MakeItem('Copy All Properties',
false,function()if self.SelectedInstance then local aE=SerializeInstance(self.SelectedInstance)
pcall(setclipboard,aE)self:Notify('All properties copied')end end)MakeSeparator()local aE=false if
aC then pcall(function()aE=aC:IsA('BasePart')or aC:IsA('Model')end)end local aF='View Object'if
self.ViewedObject==aC then aF='View Object  (middle-click to reset)'end MakeItem(aF,not aE,function
()self:ToggleViewObject(aC)end)MakeItem('3D Preview Object',not aE,function()self:Open3DPreview(aC)
end)MakeSeparator()MakeItem('Anchor',false,function()local aG=self:SetAnchorOnSelection(true)self:
Notify(`Anchored {aG} part(s)`)end)MakeItem('Unanchor',false,function()local aG=self:
SetAnchorOnSelection(false)self:Notify(`Unanchored {aG} part(s)`)end)local aG=self.SelectedInstance
and(self.SelectedInstance:IsA('BasePart')or self.SelectedInstance:IsA('Model')or self.
SelectedInstance:IsA('Tool')or self.SelectedInstance:IsA('Attachment'))MakeItem('Teleport Here',not
aG,function()local aH,aI=self:TeleportSelfTo(self.SelectedInstance)self:Notify(aH and`Teleported to {
self.SelectedInstance.Name}`or`Teleport failed: {aI}`)end)MakeSeparator()MakeItem('Call Function',
false,function()self:OpenCallFunction()end)local aH=(ar=='RemoteEvent'or ar==
'UnreliableRemoteEvent'or ar=='RemoteFunction'or ar=='BindableEvent'or ar=='BindableFunction')
MakeItem('Call Remote',not aH,function()self:OpenCallRemote()end)local aI=ar=='LocalScript'or ar==
'ModuleScript'if not aI and ar=='Script'and self.SelectedInstance then local aJ,aK=pcall(function()
return self.SelectedInstance.RunContext end)if aJ and aK==Enum.RunContext.Client then aI=true end
end MakeItem('Script View (Default)',not aI,function()self:OpenScriptViewer(self.SelectedInstance,
true)end)MakeItem('Script View (lua.expert)',not aI,function()self:OpenScriptViewer(self.
SelectedInstance)end)MakeSeparator()local aJ=self:GetSelectionList()local aK=#aJ>0 MakeItem(
'Collapse All Under Selection',not aK,function()local aL=self:CollapseAllUnder(aJ)self:Notify(`Collapsed {
aL} node(s)`)end)MakeItem('Collapse Entire Tree',false,function()local aL=self:CollapseAllRoots()
self:Notify(`Collapsed {aL} node(s)`)end)MakeItem('Refresh Properties',false,function()if self.
SelectedInstance then self:RenderProperties(self.SelectedInstance)end end)MakeItem('Destroy',false,
function()local aL=#self:GetSelectionList()self:DestroySelection()self:Notify(`Destroyed {aL} instance(s)`
)end)task.defer(function()local aL=at.AbsoluteSize.Y local aM=at.AbsoluteSize.X local aN=workspace.
CurrentCamera if not aN then return end local aO=aN.ViewportSize local aP=ao local aQ=ap if aP+aM>
aO.X then aP=aO.X-aM-4 end if aQ+aL>aO.Y then aQ=aO.Y-aL-4 end at.Position=UDim2.fromOffset(aP,aQ)
end)end function s:CollapseAllUnder(ao)if typeof(ao)=='Instance'then ao={ao}end if type(ao)~=
'table'or#ao==0 then return 0 end local ap={}for aq,ar in ao do if typeof(ar)=='Instance'then ap[ar
]=true end end for aq in self._VTreeExpanded do if not ap[aq]then local ar=aq local as=0 while ar
and as<128 do local at,au=pcall(function()return ar.Parent end)ar=at and au or nil if ar and ap[ar]
then self._VTreeExpanded[aq]=nil break end as+=1 end end end self._VTreeSuppressFilterRebuild=true
local aq=0 for ar,as in ao do local at=self._VTreeRowsByInstance[as]if at then local au=self.
_VTreeRows[at]if au and au.Expanded then self:_VTreeCollapse(au)aq+=1 end end end self.
_VTreeSuppressFilterRebuild=false if self._VTreeFilterActive then self:_VTreeBuildFiltered()end
self:_VTreeUpdateCanvasSize()self:_VTreeInvalidateVisibleCache()self:_VTreeScheduleRebuild()return
aq end function s:CollapseAllRoots()local ao=0 self._VTreeSuppressFilterRebuild=true local ap={}for
aq,ar in self._VTreeRows do if ar.Depth==0 and ar.Expanded and ar.Instance then ap[#ap+1]=ar.
Instance end end for aq,ar in ap do local as=self._VTreeRowsByInstance[ar]if as then local at=self.
_VTreeRows[as]if at and at.Expanded then self:_VTreeCollapse(at)ao+=1 end end end self.
_VTreeExpanded={}self._VTreeSuppressFilterRebuild=false if self._VTreeFilterActive then self:
_VTreeBuildFiltered()end self:_VTreeUpdateCanvasSize()self:_VTreeInvalidateVisibleCache()self:
_VTreeScheduleRebuild()return ao end function s:ShowNotification(ao,ap,aq)if not self.ScreenGui
then return end aq=aq or'info'local ar=aq=='error'and Color3.fromRGB(255,70,70)or K.Accent if not
self.NotificationHolder then self.NotificationHolder=V:CreateInstance('Frame',{Name='Notifications'
,Size=UDim2.new(0,320,1,-20),Position=UDim2.new(1,-330,0,10),BackgroundTransparency=1,ZIndex=300,
Parent=self.ScreenGui})local as=V:AddListLayout(self.NotificationHolder,6,Enum.FillDirection.
Vertical)as.HorizontalAlignment=Enum.HorizontalAlignment.Right as.VerticalAlignment=Enum.
VerticalAlignment.Bottom end local as=V:CreateInstance('Frame',{Size=UDim2.new(1,0,0,0),
AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=K.Window,BackgroundTransparency=1,
BorderSizePixel=0,ZIndex=300,Parent=self.NotificationHolder})local at=V:AddStroke(as,ar,1)at.
Transparency=1 V:AddPadding(as,9,12,9,12)V:AddListLayout(as,3,Enum.FillDirection.Vertical)local au=
V:CreateInstance('TextLabel',{Size=UDim2.new(1,0,0,14),BackgroundTransparency=1,Font=aa.Bold,Text=(
ao or'VEX'):upper(),TextColor3=ar,TextSize=11,TextXAlignment=Enum.TextXAlignment.Left,
TextTransparency=1,ZIndex=301,LayoutOrder=1,Parent=as})local av=V:CreateInstance('TextLabel',{Size=
UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,Font=aa.Medium,Text=
ap or'',TextColor3=K.Text,TextSize=11,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.
TextYAlignment.Top,TextWrapped=true,TextTransparency=1,ZIndex=301,LayoutOrder=2,Parent=as})V:Tween(
as,{BackgroundTransparency=0.05})V:Tween(at,{Transparency=0})V:Tween(au,{TextTransparency=0})V:
Tween(av,{TextTransparency=0})local aw=aq=='error'and 5 or 2.2 task.delay(aw,function()if not as or
not as.Parent then return end local ax=TweenInfo.new(0.25,Enum.EasingStyle.Quad,Enum.
EasingDirection.Out)V:Tween(as,{BackgroundTransparency=1},ax)V:Tween(at,{Transparency=1},ax)V:
Tween(au,{TextTransparency=1},ax)V:Tween(av,{TextTransparency=1},ax)task.wait(0.3)if as and as.
Parent then as:Destroy()end end)end function s:ShowErrorNotification(ao)self:ShowNotification(
'VEX ERROR',ao or'Unknown error','error')end function s:Notify(ao)self:ShowNotification('VEX',ao,
'success')end function s:SerializeColor(ao)return{math.floor(ao.R*255+0.5),math.floor(ao.G*255+0.5)
,math.floor(ao.B*255+0.5)}end function s:DeserializeColor(ao)if typeof(ao)~='table'or#ao<3 then
return nil end return Color3.fromRGB(ao[1],ao[2],ao[3])end function s:BuildConfigData()local ao={}
for ap,aq in K do if typeof(aq)=='Color3'then ao[ap]=self:SerializeColor(aq)end end local ap={}for
aq in self.ActiveClassFilters do table.insert(ap,aq)end local aq={}for ar in self.HiddenServices do
table.insert(aq,ar)end local ar={}for as,at in M do ar[as]=at end local as={}for at,au in aa do as[
at]=au.Name end return{Version=self.Version,ToggleKey=self.ToggleKey.Name,AutoRefreshProperties=
self.AutoRefreshProperties,RefreshDelay=self.RefreshDelay,UseLuaExpertDecompiler=self.
UseLuaExpertDecompiler,NilFilterClass=(self.NilFilterClass or''):gsub('^%s+',''):gsub('%s+$',''),
ActiveClassFilters=ap,HiddenServices=aq,HideNilContainer=self.HideNilContainer,SearchIncludesNil=
self.SearchIncludesNil~=false,ThemePresetName=self.ThemePresetName or'Custom',Theme=ao,
UITransparency=ar,UnlimitedFPS=self.UnlimitedFPS,MatchByClassName=self.MatchByClassName==true,
MatchByProperty=self.MatchByProperty==true,FlatSearchResults=self.FlatSearchResults==true,
PinnedPaths=self.PinnedPaths or{}}end function s:ApplyConfigData(ao)if typeof(ao)~='table'then
return end if typeof(ao.ToggleKey)=='string'then local ap=Enum.KeyCode[ao.ToggleKey]if ap then self
.ToggleKey=ap end end if typeof(ao.UnlimitedFPS)=='boolean'then self.UnlimitedFPS=ao.UnlimitedFPS
end ApplyFPSCap(self.UnlimitedFPS)if typeof(ao.AutoRefreshProperties)=='boolean'then self.
AutoRefreshProperties=ao.AutoRefreshProperties end if typeof(ao.RefreshDelay)=='number'then self.
RefreshDelay=math.clamp(ao.RefreshDelay,0,3)end if typeof(ao.NilFilterClass)=='string'then self.
NilFilterClass=ao.NilFilterClass:gsub('^%s+',''):gsub('%s+$','')end if typeof(ao.ActiveClassFilters
)=='table'then self.ActiveClassFilters={}for ap,aq in ao.ActiveClassFilters do if typeof(aq)==
'string'then self.ActiveClassFilters[aq]=true end end end if typeof(ao.HiddenServices)=='table'then
self.HiddenServices={}for ap,aq in ao.HiddenServices do if typeof(aq)=='string'then self.
HiddenServices[aq]=true end end end if typeof(ao.Fonts)=='table'then for ap,aq in ao.Fonts do if aa
[ap]and typeof(aq)=='string'then local ar,as=pcall(function()return Enum.Font[aq]end)if ar and as
then aa[ap]=as end end end end if typeof(ao.PinnedPaths)=='table'then self.PinnedPaths={}for ap,aq
in ao.PinnedPaths do if typeof(aq)=='string'then table.insert(self.PinnedPaths,aq)end end end if
typeof(ao.MatchByClassName)=='boolean'then self.MatchByClassName=ao.MatchByClassName end if typeof(
ao.FlatSearchResults)=='boolean'then self.FlatSearchResults=ao.FlatSearchResults end if typeof(ao.
MatchByProperty)=='boolean'then self.MatchByProperty=ao.MatchByProperty end if typeof(ao.
HideNilContainer)=='boolean'then self.HideNilContainer=ao.HideNilContainer end if typeof(ao.
SearchIncludesNil)=='boolean'then self.SearchIncludesNil=ao.SearchIncludesNil else self.
SearchIncludesNil=true end if typeof(ao.UseLuaExpertDecompiler)=='boolean'then self.
UseLuaExpertDecompiler=ao.UseLuaExpertDecompiler end if typeof(ao.Theme)=='table'then O=true for ap
,aq in ao.Theme do local ar=self:DeserializeColor(aq)if ar then SetThemeColor(ap,ar)end end O=false
end if typeof(ao.ThemePresetName)=='string'then self.ThemePresetName=ao.ThemePresetName else self.
ThemePresetName='Custom'end if typeof(ao.UITransparency)=='table'then O=true for ap,aq in ao.
UITransparency do if M[ap]~=nil and typeof(aq)=='number'then SetUITransparency(ap,aq)end end O=
false end end function s:SaveConfig()if not self.ConfigLoaded then return end Handle(function()if
not(writefile and isfolder and makefolder)then return end if not isfolder(self.ConfigFolder)then
makefolder(self.ConfigFolder)end local ao=d.HttpService:JSONEncode(self:BuildConfigData())
writefile(self.ConfigPath,BeautifyJson(ao))end,'SaveConfig')end N=function()if s.ConfigLoaded then
s:SaveConfig()end end function s:FetchVersion()local ao,ap=pcall(function()return loadstring(game:
HttpGet([[https://raw.githubusercontent.com/Vezise/2026/main/Vez/VexExplorer/VexVersion.lua]]))()
end)if not ao or typeof(ap)~='string'then return nil end local aq=ap:gsub('%s+','')return aq~=''and
aq or nil end function s:InitConfig()Handle(function()local ao=self:FetchVersion()self.Version=ao
or'unknown'local ap={Version=self.Version}local aq if not(isfile and writefile and readfile and
isfolder and makefolder)then self.ConfigLoaded=true return end if not isfolder(self.ConfigFolder)
then makefolder(self.ConfigFolder)end if not isfile(self.ConfigPath)then writefile(self.ConfigPath,
BeautifyJson(d.HttpService:JSONEncode(ap)))else local ar,as=pcall(readfile,self.ConfigPath)if ar
then local at,au=pcall(function()return d.HttpService:JSONDecode(as)end)if at then aq=au end end if
aq and aq.Version~=self.Version then local at=aq.Version aq.Version=self.Version task.delay(3,
function()self:ShowNotification(`NEW UPDATE!`,`VEX has updated to {aq.Version}`,'info')end)pcall(
writefile,self.ConfigPath,BeautifyJson(d.HttpService:JSONEncode(aq)))end end if aq then self:
ApplyConfigData(aq)end self.HideNilContainer=true for ar,as in a do self.HiddenServices[as]=true
end self.ConfigLoaded=true ApplyFPSCap(self.UnlimitedFPS)self:SaveConfig()end,'InitConfig')end
function s:Kill()h=true VexExecutedCheck=true for ao,ap in i do pcall(function()ap:Disconnect()end)
end i={}CompactConnections()self:_StopClickPartToSelect()self:_StopClickUiToSelect()self:
ClearPropertyConnections()self:ResetTasks()self:StopViewObject()for ao,ap in self.
SelectionHighlights or{}do pcall(function()ap:Destroy()end)end self.SelectionHighlights=
setmetatable({},{__mode='k'})if self.ScriptViewerWindows then for ao,ap in self.ScriptViewerWindows
do if ap.Window and ap.Window.Parent then ap.Window:Destroy()end end self.ScriptViewerWindows={}end
pcall(function()if self.NotificationHolder then self.NotificationHolder:Destroy()end end)pcall(
function()if self.ScreenGui then self.ScreenGui:Destroy()end end)self.SelectedSet=setmetatable({},{
__mode='k'})self.SelectedOrder={}self.SelectedInstance=nil end function s:SetWindowsVisible(ao)if
self.ExplorerWindow then self.ExplorerWindow:SetVisible(ao)end if self.PropertiesWindow then self.
PropertiesWindow:SetVisible(ao)end end function af:Create()Handle(function()self:InitConfig()self.
ScreenGui=V:CreateScreenGui()self.MatchSet={}self.SubtreeMatchSet={}self.SelectedSet=setmetatable({
},{__mode='k'})self:BuildQuickAccessBar()self:BuildExplorerWindow()self:BuildPropertiesWindow()self
:CreateSearchBar()self:CreatePropertyFilterBar()self:RebuildExplorer()self:AddPropertiesLabel(
'Select an instance.')self:_EnsureConsoleLog()BindTheme('Accent',function(ao)for ap,aq in s.
SelectionHighlights or{}do if aq and aq.Parent then aq.OutlineColor=ao end end end)self:
SetupDragHandlers()end,'Function Explorer.Create')end s:Create()Track(d.UserInputService.InputBegan
:Connect(function(ao,ap)local aq=d.UserInputService:GetFocusedTextBox()if aq then return end if ao.
KeyCode==Enum.KeyCode.LeftControl or ao.KeyCode==Enum.KeyCode.RightControl then s.CtrlHeld=true end
if ao.KeyCode==Enum.KeyCode.LeftShift or ao.KeyCode==Enum.KeyCode.RightShift then s.ShiftHeld=true
end if ao.KeyCode==Enum.KeyCode.Escape and s.ReparentMode then s:CancelReparent()return end if ap
then return end if ao.UserInputType~=Enum.UserInputType.Keyboard then return end if ao.KeyCode~=s.
ToggleKey then return end s.WindowVisible=not s.WindowVisible s:SetWindowsVisible(s.WindowVisible)
end))Track(d.UserInputService.InputEnded:Connect(function(ao)local ap=d.UserInputService:
GetFocusedTextBox()if ap then return end if ao.KeyCode==Enum.KeyCode.LeftControl or ao.KeyCode==
Enum.KeyCode.RightControl then s.CtrlHeld=false end if ao.KeyCode==Enum.KeyCode.LeftShift or ao.
KeyCode==Enum.KeyCode.RightShift then s.ShiftHeld=false end end))s:SpawnTask(
'AutoRefreshProperties',function()while true do if h then break end if s.RefreshDelay<=0 then d.
RunService.Heartbeat:Wait()else task.wait(s.RefreshDelay)end if h then break end if s.
AutoRefreshProperties and s.SelectedInstance then Handle(function()s:RefreshPropertyValues()end,
'AutoRefreshProperties Tick')end end end)s:SpawnTask('ConnectionsCompact',function()while not h do
task.wait(600)if h then break end CompactConnections()end end)s:SpawnTask(
'ScriptExecutedAgainCheck',function()VexExecutedCheck=true while not h do task.wait()if h then
break end if VexExecutedCheck==false then s:Kill()break end end end)
