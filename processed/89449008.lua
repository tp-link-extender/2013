local function waitForChild(a,b)assert(a)assert(b)while not a:FindFirstChild(b)
do print('Waiting for ...',a,b)a.ChildAdded:wait()end return a:FindFirstChild(b)
end local function waitForProperty(a,b)assert(a)assert(b)while not a[b]do a.
Changed:wait()end end local function IsTouchDevice()local a=false pcall(function
()a=Game:GetService'UserInputService'.TouchEnabled end)return a end
waitForChild(game,'Players')waitForProperty(game.Players,'LocalPlayer')local a,b
,c=game.Players.LocalPlayer,LoadLibrary'RbxGui'if not b then print
'could not find RbxGui!'return end local d,e,f,g,h,i,j,k,l,m,n,o='gear',script.
Parent,{},{},false,false,{},{},nil,nil,nil,waitForChild(a,'Backpack')
waitForChild(e,'Tabs')waitForChild(e,'Gear')local p,q,r,s=waitForChild(e.Gear,
'GearPreview'),waitForChild(e.Gear,'GearGridScrollingArea'),waitForChild(e.
Parent,'CurrentLoadout'),waitForChild(e.Gear,'GearGrid')local t,u,v=
waitForChild(s,'GearButton'),waitForChild(script.Parent,'SwapSlot'),
waitForChild(script.Parent,'CoreScripts/BackpackScripts/BackpackManager')local w
,x,y,z,A,B,C,D,E,F=waitForChild(v,'BackpackOpenEvent'),waitForChild(v,
'BackpackCloseEvent'),waitForChild(v,'TabClickedEvent'),waitForChild(v,
'ResizeEvent'),waitForChild(v,'SearchRequestedEvent'),waitForChild(v,
'BackpackReady'),b.CreateScrollingFrame(nil,'grid',Vector2.new(6,6))C.Position=
UDim2.new(0,0,0,30)C.Size=UDim2.new(1,0,1,-30)C.Parent=e.Gear.GearGrid local G=
Instance.new'Frame'G.Name='ScrollBar'G.BackgroundTransparency=0.9 G.
BackgroundColor3=Color3.new(1,1,1)G.BorderSizePixel=0 G.Size=UDim2.new(0,17,1,-
36)G.Position=UDim2.new(0,0,0,18)G.Parent=q E.Position=UDim2.new(0,0,1,-17)D.
Parent=q E.Parent=q local H,I,J,K=b.CreateScrollingFrame()H.Position=UDim2.new(0
,0,0,0)H.Size=UDim2.new(1,0,1,0)H.Parent=e.Gear.GearLoadouts.LoadoutsList local
L=Instance.new'TextButton'L.RobloxLocked=true L.Name='LoadoutButton'L.Font=Enum.
Font.ArialBold L.FontSize=Enum.FontSize.Size14 L.Position=UDim2.new(0,0,0,0)L.
Size=UDim2.new(1,0,0,32)L.Style=Enum.ButtonStyle.RobloxButton L.Text=
'Loadout #1'L.TextColor3=Color3.new(1,1,1)L.Parent=H local M=L:clone()M.Text=
'Loadout #2'M.Parent=H local N=L:clone()N.Text='Loadout #3'N.Parent=H local O=L:
clone()O.Text='Loadout #4'O.Parent=H local P=Instance.new'Frame'P.Name=
'ScrollBarLoadout'P.BackgroundTransparency=0.9 P.BackgroundColor3=Color3.new(1,1
,1)P.BorderSizePixel=0 P.Size=UDim2.new(0,17,1,-36)P.Position=UDim2.new(0,0,0,18
)P.Parent=e.Gear.GearLoadouts.GearLoadoutsScrollingArea J.Position=UDim2.new(0,0
,1,-17)I.Parent=e.Gear.GearLoadouts.GearLoadoutsScrollingArea J.Parent=e.Gear.
GearLoadouts.GearLoadoutsScrollingArea function removeFromMap(Q,R)for S=1,#Q do
if Q[S]==R then table.remove(Q,S)break end end end function robloxLock(Q)Q.
RobloxLocked=true children=Q:GetChildren()if children then for R,S in ipairs(
children)do robloxLock(S)end end end function resize()local Q=0 if p.
AbsoluteSize.Y>p.AbsoluteSize.X then Q=p.AbsoluteSize.X*0.75 else Q=p.
AbsoluteSize.Y*0.75 end waitForChild(p,'GearImage')p.GearImage.Size=UDim2.new(0,
Q,0,Q)p.GearImage.Position=UDim2.new(0,p.AbsoluteSize.X/2-Q/2,0.75,-Q)
resizeGrid()end function addToGrid(Q)if not Q:IsA'Tool'then if not Q:IsA
'HopperBin'then return end end if Q:FindFirstChild'RobloxBuildTool'then return
end for R,S in pairs(f)do if S==Q then return end end table.insert(f,Q)local T,U
=Q.Changed:connect(function(T)if T=='Name'then if g[Q]then if g[Q].Image==''then
g[Q].GearText.Text=Q.Name end end end end),nil U=Q.AncestryChanged:connect(
function(V,W)local X=nil for Y,Z in pairs(f)do if Z==Q then X=Z break end end
waitForProperty(a,'Character')waitForChild(a,'Backpack')if Q.Parent~=a.Backpack
and Q.Parent~=a.Character then if U then U:disconnect()end if T then T:
disconnect()end for _,aa in pairs(f)do if aa==X then if j[g[aa]]then j[g[aa]]:
disconnect()end if k[g[aa]]then k[g[aa]]:disconnect()end g[aa].Parent=nil g[aa]=
nil break end end removeFromMap(f,X)resizeGrid()else resizeGrid()end
updateGridActive()end)resizeGrid()end function buttonClick(aa)if aa:
FindFirstChild'UnequipContextMenu'and not aa.Active then aa.UnequipContextMenu.
Visible=true i=true end end function previewGear(aa)if not i then p.Visible=
false p.GearImage.Image=aa.Image p.GearStats.GearName.Text=aa.GearReference.
Value.Name end end function findEmptySlot()local aa,Q=nil,r:GetChildren()for R=1
,#Q do if Q[R]:IsA'Frame'and#Q[R]:GetChildren()<=0 then local S=tonumber(string.
sub(Q[R].Name,5))if S==0 then S=10 end if not aa or(aa>S)then aa=S end end end
if aa==10 then aa=0 end return aa end function checkForSwap(aa,Q,R)local S=r:
GetChildren()for T=1,#S do if S[T]:IsA'Frame'and string.find(S[T].Name,'Slot')
then if Q>=S[T].AbsolutePosition.x and Q<=(S[T].AbsolutePosition.x+S[T].
AbsoluteSize.x)then if R>=S[T].AbsolutePosition.y and R<=(S[T].AbsolutePosition.
y+S[T].AbsoluteSize.y)then local U=tonumber(string.sub(S[T].Name,5))
swapGearSlot(U,aa)return true end end end end return false end function
resizeGrid()for aa,Q in pairs(f)do if not Q:FindFirstChild'RobloxBuildTool'then
if not g[Q]then local R=t:clone()R.Parent=s.ScrollingFrame R.Visible=true R.
Image=Q.TextureId if R.Image==''then R.GearText.Text=Q.Name end R.GearReference.
Value=Q R.Draggable=true g[Q]=R if not IsTouchDevice()then local S=
getGearContextMenu()S.Visible=false S.Parent=R end local S=nil R.DragBegin:
connect(function(T)waitForChild(R,'Background')R['Background'].ZIndex=10 R.
ZIndex=10 S=T end)R.DragStopped:connect(function(T,U)waitForChild(R,'Background'
)R['Background'].ZIndex=1 R.ZIndex=2 if S~=R.Position then if not checkForSwap(R
,T,U)then R:TweenPosition(S,Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.5,
true)R.Draggable=false delay(0.5,function()R.Draggable=true end)else R.Position=
S end end end)local T=tick()j[R]=R.MouseEnter:connect(function()previewGear(R)
end)k[R]=R.MouseButton1Click:connect(function()local U=tick()if R.Active and(U-T
)<0.5 then local W=findEmptySlot()if W then R.ZIndex=1 swapGearSlot(W,R)end else
buttonClick(R)end T=U end)end end end F()end function showPartialGrid(aa)for Q,R
in pairs(g)do R.Parent=nil end if aa then for S,T in pairs(aa)do T.Parent=s.
ScrollingFrame end end F()end function showEntireGrid()for aa,Q in pairs(g)do Q.
Parent=s.ScrollingFrame end F()end function inLoadout(aa)local Q=r:GetChildren()
for R=1,#Q do if Q[R]:IsA'Frame'then local S=Q[R]:GetChildren()if#S>0 then if S[
1].GearReference.Value and S[1].GearReference.Value==aa then return true end end
end end return false end function updateGridActive()for aa,Q in pairs(f)do if g[
Q]then local R,S=nil,g[Q]:FindFirstChild'GearReference'if S then R=S.Value end
if(not R)or inLoadout(R)then g[Q].Active=false else g[Q].Active=true end end end
end function centerGear(aa)local Q,R={},nil for S=1,#aa do if aa[S]:IsA'Frame'
and#aa[S]:GetChildren()>0 then if aa[S].Name=='Slot0'then R=aa[S]else table.
insert(Q,aa[S])end end end if R then table.insert(Q,R)end local S=(1-(#Q*0.1))/2
for T=1,#Q do Q[T]:TweenPosition(UDim2.new(S+((T-1)*0.1),0,0,0),Enum.
EasingDirection.Out,Enum.EasingStyle.Quad,0.25,true)end end function
tabClickHandler(aa)if aa==d then backpackOpenHandler(aa)else
backpackCloseHandler(aa)end end function backpackOpenHandler(aa)if aa and aa~=d
then e.Gear.Visible=false return end e.Gear.Visible=true updateGridActive()
resizeGrid()resize()B:Invoke()end function backpackCloseHandler(aa)if aa and aa
~=d then e.Gear.Visible=false return end e.Gear.Visible=false resizeGrid()
resize()B:Invoke()end function loadoutCheck(aa,Q)if not aa:IsA'ImageButton'then
return end for R,S in pairs(f)do if g[S]then if aa:FindFirstChild'GearReference'
and g[S]:FindFirstChild'GearReference'then if g[S].GearReference.Value==aa.
GearReference.Value then g[S].Active=Q break end end end end end function
clearPreview()p.GearImage.Image=''p.GearStats.GearName.Text=''end function
unequipGear(aa)aa.Parent=o updateGridActive()end function highlight(aa)aa.
TextColor3=Color3.new(0,0,0)aa.BackgroundColor3=Color3.new(0.8,0.8,0.8)end
function clearHighlight(aa)aa.TextColor3=Color3.new(1,1,1)aa.BackgroundColor3=
Color3.new(0,0,0)end function swapGearSlot(aa,Q)if not u.Value then u.Slot.Value
=aa u.GearButton.Value=Q u.Value=true updateGridActive()end end local aa=
function(aa,Q)if type(aa.Action)~='number'then return end local R=aa.Action if R
==1 then unequipGear(Q.Parent.GearReference.Value)local S=Q.Parent local T,U,W=S
.GearReference.Value,r:GetChildren(),-1 for X=1,#U do if U[X]:IsA'Frame'then
local Y=U[X]:GetChildren()if Y[1]and Y[1].GearReference.Value==T then W=Y[1].
SlotNumber.Text break end end end swapGearSlot(W,nil)end end function
setupCharacterConnections()if n then n:disconnect()end n=game.Players.
LocalPlayer.Backpack.ChildAdded:connect(function(Q)addToGrid(Q)end)local Q=game.
Players.LocalPlayer.Backpack:GetChildren()for R=1,#Q do addToGrid(Q[R])end if l
then l:disconnect()end l=game.Players.LocalPlayer.Character.ChildAdded:connect(
function(R)addToGrid(R)updateGridActive()end)if m then m:disconnect()end m=game.
Players.LocalPlayer.Character.ChildRemoved:connect(function(R)updateGridActive()
end)wait()centerGear(r:GetChildren())end function removeCharacterConnections()if
l then l:disconnect()end if m then m:disconnect()end if n then n:disconnect()end
end function trim(Q)return(Q:gsub('^%s*(.-)%s*$','%1'))end function filterGear(Q
)local R={}for S,T in pairs(f)do if g[T]then local U=string.lower(g[T].
GearReference.Value.Name)U=trim(U)for W=1,#Q do if string.match(U,Q[W])then
table.insert(R,g[T])break end end end end return R end function
splitByWhitespace(Q)if type(Q)~='string'then return nil end local R={}for S in
string.gmatch(Q,'[^%s]+')do if string.len(S)>0 then table.insert(R,S)end end
return R end function showSearchGear(Q)if not e.Gear.Visible then return end
local R,S=splitByWhitespace(Q),nil if R and(#R>0)then S=R else S=nil end if R==
nil then showEntireGrid()return end local T=filterGear(S)showPartialGrid(T)end
function nukeBackpack()while#g>0 do table.remove(g)end g={}while#f>0 do table.
remove(f)end f={}local Q=s.ScrollingFrame:GetChildren()for R=1,#Q do Q[R]:
remove()end end function getGearContextMenu()local Q=Instance.new'Frame'Q.Active
=true Q.Name='UnequipContextMenu'Q.Size=UDim2.new(0,115,0,70)Q.Position=UDim2.
new(0,-16,0,-16)Q.BackgroundTransparency=1 Q.Visible=false local R=Instance.new
'TextButton'R.Name='UnequipContextMenuButton'R.Text=''R.Style=Enum.ButtonStyle.
RobloxButtonDefault R.ZIndex=8 R.Size=UDim2.new(1,0,1,-20)R.Visible=true R.
Parent=Q local S,T,U=12,{},{'Remove Hotkey'}for W=1,#U do local X={}X.Type=
'Button'X.Text=U[W]X.Action=W X.DoIt=aa table.insert(T,X)end for W,X in ipairs(T
)do local Y=X if Y.Type=='Button'then local Z=Instance.new'TextButton'Z.Name=
'UnequipContextButton'..W Z.BackgroundColor3=Color3.new(0,0,0)Z.BorderSizePixel=
0 Z.TextXAlignment=Enum.TextXAlignment.Left Z.Text=' '..X.Text Z.Font=Enum.Font.
Arial Z.FontSize=Enum.FontSize.Size14 Z.Size=UDim2.new(1,8,0,S)Z.Position=UDim2.
new(0,0,0,S*W)Z.TextColor3=Color3.new(1,1,1)Z.ZIndex=9 Z.Parent=R if not
IsTouchDevice()then Z.MouseButton1Click:connect(function()if Z.Active and not Q.
Parent.Active then pcall(function()Y.DoIt(Y,Q)end)i=false Q.Visible=false
clearHighlight(Z)clearPreview()end end)Z.MouseEnter:connect(function()if Z.
Active and Q.Parent.Active then highlight(Z)end end)Z.MouseLeave:connect(
function()if Z.Active and Q.Parent.Active then clearHighlight(Z)end end)end X.
Button=Z X.Element=Z elseif Y.Type=='Label'then local Z=Instance.new'Frame'Z.
Name='ContextLabel'..W Z.BackgroundTransparency=1 Z.Size=UDim2.new(1,8,0,S)local
_=Instance.new'TextLabel'_.Name='Text1'_.BackgroundTransparency=1 _.
BackgroundColor3=Color3.new(1,1,1)_.BorderSizePixel=0 _.TextXAlignment=Enum.
TextXAlignment.Left _.Font=Enum.Font.ArialBold _.FontSize=Enum.FontSize.Size14 _
.Position=UDim2.new(0,0,0,0)_.Size=UDim2.new(0.5,0,1,0)_.TextColor3=Color3.new(1
,1,1)_.ZIndex=9 _.Parent=Z Y.Label1=_ if Y.GetText2 then _=Instance.new
'TextLabel'_.Name='Text2'_.BackgroundTransparency=1 _.BackgroundColor3=Color3.
new(1,1,1)_.BorderSizePixel=0 _.TextXAlignment=Enum.TextXAlignment.Right _.Font=
Enum.Font.Arial _.FontSize=Enum.FontSize.Size14 _.Position=UDim2.new(0.5,0,0,0)_
.Size=UDim2.new(0.5,0,1,0)_.TextColor3=Color3.new(1,1,1)_.ZIndex=9 _.Parent=Z Y.
Label2=_ end Z.Parent=R Y.Label=Z Y.Element=Z end end Q.ZIndex=4 Q.MouseLeave:
connect(function()i=false Q.Visible=false clearPreview()end)robloxLock(Q)return
Q end function coreGuiChanged(Q,R)if Q==Enum.CoreGuiType.Backpack or Q==Enum.
CoreGuiType.All then if not R then e.Gear.Visible=false end end end local Q=a.
Backpack:GetChildren()for R=1,#Q do addToGrid(Q[R])end z.Event:connect(function(
R)if h then return end h=true wait()resize()resizeGrid()h=false end)r.ChildAdded
:connect(function(R)loadoutCheck(R,false)end)r.ChildRemoved:connect(function(R)
loadoutCheck(R,true)end)r.DescendantAdded:connect(function(R)if not e.Visible
and(R:IsA'ImageButton'or R:IsA'TextButton')then centerGear(r:GetChildren())end
end)r.DescendantRemoving:connect(function(R)if not e.Visible and(R:IsA
'ImageButton'or R:IsA'TextButton')then wait()centerGear(r:GetChildren())end end)
s.MouseEnter:connect(function()clearPreview()end)s.MouseLeave:connect(function()
clearPreview()end)a.CharacterRemoving:connect(function()
removeCharacterConnections()nukeBackpack()end)a.CharacterAdded:connect(function(
)setupCharacterConnections()end)a.ChildAdded:connect(function(R)if R:IsA
'Backpack'then o=R if n then n:disconnect()end n=game.Players.LocalPlayer.
Backpack.ChildAdded:connect(function(S)addToGrid(S)end)end end)u.Changed:
connect(function()if not u.Value then updateGridActive()end end)local R=r:
GetChildren()for S=1,#R do if R[S]:IsA'Frame'and string.find(R[S].Name,'Slot')
then R[S].ChildRemoved:connect(function()updateGridActive()end)R[S].ChildAdded:
connect(function()updateGridActive()end)end end pcall(function()coreGuiChanged(
Enum.CoreGuiType.Backpack,Game.StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.
Backpack))Game.StarterGui.CoreGuiChangedSignal:connect(coreGuiChanged)end)
resize()resizeGrid()local S=r:GetChildren()for T=1,#S do loadoutCheck(S[T],false
)end if not e.Visible then centerGear(r:GetChildren())end if l==nil and game.
Players.LocalPlayer['Character']then setupCharacterConnections()end if not n
then n=game.Players.LocalPlayer.Backpack.ChildAdded:connect(function(T)
addToGrid(T)end)end w.Event:connect(backpackOpenHandler)x.Event:connect(
backpackCloseHandler)y.Event:connect(tabClickHandler)A.Event:connect(
showSearchGear)K()