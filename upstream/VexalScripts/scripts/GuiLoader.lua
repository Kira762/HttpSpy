-- processed with darklua for better performance

local a=cloneref or function(a)return a end local b=a(game:GetService('Lighting'))local c=a(game:
GetService('TweenService'))local d=a(game:GetService('Players'))local e=d.LocalPlayer local f=
Instance.new('ScreenGui',e:WaitForChild('PlayerGui'))local g=Instance.new('BlurEffect',b)local h=
Instance.new('Frame',f)local i=Instance.new('UIGradient',h)local j=Instance.new('Frame',f)local k=
Instance.new('UIGradient',j)local l=Instance.new('TextLabel',f)local m=Instance.new('Frame',f)local
n=Instance.new('Frame',m)local o=Instance.new('UIGradient',n)local p=Instance.new('TextButton',f)
local q=Instance.new('UIGradient',p)local r=TweenInfo.new(1,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out)local s=c:Create(n,TweenInfo.new(5,Enum.EasingStyle.Quad,Enum.EasingDirection.
Out),{Size=UDim2.new(1,0,1,0)})local function SetCornerRadius(t,u)local v=Instance.new('UICorner',t
)v.CornerRadius=UDim.new(0,u)end local function CloseGui()local t=TweenInfo.new(0.7,Enum.
EasingStyle.Quad,Enum.EasingDirection.In)c:Create(g,t,{Size=0}):Play()c:Create(l,t,{
TextTransparency=1,TextStrokeTransparency=1,Size=UDim2.new(1.2,0,1.2,0),Position=UDim2.new(-0.1,0,-
0.1,0)}):Play()c:Create(h,t,{BackgroundTransparency=1}):Play()c:Create(j,t,{BackgroundTransparency=
1}):Play()c:Create(m,t,{BackgroundTransparency=1,Position=UDim2.new(0.5,-200,0.8,0)}):Play()c:
Create(n,t,{BackgroundTransparency=1}):Play()c:Create(p,t,{BackgroundTransparency=1,
TextTransparency=1,Position=UDim2.new(0.5,-60,0.9,0)}):Play()task.delay(0.7,function()f:Destroy()g:
Destroy()end)end f.IgnoreGuiInset=true g.Size=0 h.Size=UDim2.new(1,0,1,0)h.BackgroundTransparency=1
h.BackgroundColor3=Color3.fromRGB(30,30,30)h.BorderSizePixel=0 i.Color=ColorSequence.new({
ColorSequenceKeypoint.new(0,Color3.fromRGB(70,70,70)),ColorSequenceKeypoint.new(0.5,Color3.fromRGB(
45,45,45)),ColorSequenceKeypoint.new(1,Color3.fromRGB(25,25,25))})i.Transparency=NumberSequence.
new({NumberSequenceKeypoint.new(0,0.45),NumberSequenceKeypoint.new(0.5,0.35),NumberSequenceKeypoint
.new(1,0.45)})i.Rotation=135 j.Size=UDim2.new(1,0,1,0)j.BackgroundTransparency=1 j.BackgroundColor3
=Color3.fromRGB(0,0,0)j.BorderSizePixel=0 k.Color=ColorSequence.new(Color3.fromRGB(0,0,0))k.
Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,0.65),NumberSequenceKeypoint.new(0.5,
0.95),NumberSequenceKeypoint.new(1,0.65)})k.Rotation=45 l.Size=UDim2.new(0.8,0,0.8,0)l.Position=
UDim2.new(0.1,0,0.1,0)l.BackgroundTransparency=1 l.Text='VEXAL SCRIPTS'l.TextColor3=Color3.fromRGB(
255,255,255)l.TextSize=120 l.Font=Enum.Font.LuckiestGuy l.TextTransparency=1 l.
TextStrokeTransparency=1 l.TextStrokeColor3=Color3.fromRGB(0,0,0)local t=Instance.new('UIGradient',
l)t.Color=ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(200,200,200)),ColorSequenceKeypoint.new(1,Color3.
fromRGB(100,100,100))})t.Rotation=90 m.Size=UDim2.new(0,400,0,12)m.Position=UDim2.new(0.5,-200,0.8,
0)m.BackgroundColor3=Color3.fromRGB(30,30,30)m.BackgroundTransparency=1 m.BorderSizePixel=0
SetCornerRadius(m,6)n.Size=UDim2.new(0,0,1,0)n.BackgroundColor3=Color3.fromRGB(255,255,255)n.
BackgroundTransparency=1 n.BorderSizePixel=0 SetCornerRadius(n,6)o.Color=ColorSequence.new({
ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255)),ColorSequenceKeypoint.new(1,Color3.
fromRGB(160,160,160))})p.Size=UDim2.new(0,140,0,45)p.Position=UDim2.new(0.5,-70,0.88,0)p.
BackgroundColor3=Color3.fromRGB(255,255,255)p.TextColor3=Color3.fromRGB(255,255,255)p.Text='SKIP'p.
Font=Enum.Font.GothamBold p.TextSize=16 p.BackgroundTransparency=1 p.TextTransparency=1
SetCornerRadius(p,22)q.Color=ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(50,50,50
)),ColorSequenceKeypoint.new(1,Color3.fromRGB(30,30,30))})q.Rotation=90 local u=Instance.new(
'UIStroke',p)u.Thickness=2 u.Color=Color3.fromRGB(255,255,255)u.Transparency=1 local v=Instance.
new('UIGradient',u)v.Color=ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,
255)),ColorSequenceKeypoint.new(0.5,Color3.fromRGB(120,120,120)),ColorSequenceKeypoint.new(1,Color3
.fromRGB(255,255,255))})c:Create(g,r,{Size=15}):Play()c:Create(h,r,{BackgroundTransparency=0}):
Play()c:Create(j,r,{BackgroundTransparency=0}):Play()c:Create(l,r,{TextTransparency=0,
TextStrokeTransparency=0.2,Size=UDim2.new(1,0,1,0),Position=UDim2.new(0,0,0,0)}):Play()c:Create(m,r
,{BackgroundTransparency=0,Position=UDim2.new(0.5,-200,0.75,0)}):Play()c:Create(n,r,{
BackgroundTransparency=0}):Play()c:Create(p,r,{BackgroundTransparency=0,TextTransparency=0,Position
=UDim2.new(0.5,-70,0.83,0)}):Play()c:Create(u,r,{Transparency=0}):Play()s:Play()p.MouseEnter:
Connect(function()c:Create(p,TweenInfo.new(0.2),{Size=UDim2.new(0,150,0,48),Position=UDim2.new(0.5,
-75,0.828,0)}):Play()c:Create(u,TweenInfo.new(0.2),{Thickness=3}):Play()end)p.MouseLeave:Connect(
function()c:Create(p,TweenInfo.new(0.2),{Size=UDim2.new(0,140,0,45),Position=UDim2.new(0.5,-70,0.83
,0)}):Play()c:Create(u,TweenInfo.new(0.2),{Thickness=2}):Play()end)p.MouseButton1Down:Connect(
function()c:Create(p,TweenInfo.new(0.1),{Size=UDim2.new(0,135,0,42),Position=UDim2.new(0.5,-67.5,
0.832,0)}):Play()end)p.MouseButton1Click:Connect(CloseGui)s.Completed:Connect(CloseGui)
