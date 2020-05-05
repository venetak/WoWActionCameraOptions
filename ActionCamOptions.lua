
local ActionCamOptions = CreateFrame(
    'FRAME',
    'ActionCamOptions',
    UIParent,
    'BasicFrameTemplateWithInset');

    -- ActionCamOptions:SetBackdrop( { 
    --     bgFile = "./Barbershop.BLP", 
    --     insets = { left = 0, right = 0, top = 0, bottom = 0 }
    --   });

    -- ActionCamOptions:SetAlpha(0.7);
    -- ActionCamOptions:SetBackdropColor(0.5,0.3,0.2,0.3);

-- local function ToggleActionCamOptions()
    ActionCamOptions:SetSize(300, 360);
    ActionCamOptions:SetPoint('TOPLEFT', UIParent, 'TOPLEFT', 0, -150);
-- end

local isActionCamOn = false;

local function onToggleActionCam(self)
    local command = 'ActionCam on';

    if isActionCamOn == true then command = 'ActionCam off' end
    ConsoleExec(command);
  
    isActionCamOn = not isActionCamOn;
    local buttonText = 'Enable ActionCam';

    if isActionCamOn == true then buttonText = 'Disable ActionCam' end
    self:SetText(buttonText);
end


local function showTooltip(self)
    print('OnEnter');
    GameTooltip:Show();
    GameTooltip:SetOwner(self, "ANCHOR_TOPLEFT");
    GameTooltip:SetText(self.tooltip, nil, nil, nil, nil, true);
end

local function hideTooltip()
    print('OnLeave');
    GameTooltip:Hide();
end


local function RegisterForTooltips(frame)
    frame:SetScript('OnEnter', showTooltip);
    frame:SetScript('OnLeave', hideTooltip);
end

-------------------------------buttons--------------------------------------------------
-- title
ActionCamOptions.title = ActionCamOptions:CreateFontString(nil, 'OVERLAY');
ActionCamOptions.title:SetFontObject('GameFontHighlight');
ActionCamOptions.title:SetPoint('LEFT', ActionCamOptions.TitleBg, 'LEFT', 5, -1);
ActionCamOptions.title:SetText('Action Camera Options');

--toggle ActionCam
ActionCamOptions.toggle = CreateFrame('Button', nil, ActionCamOptions, 'GameMenuButtonTemplate');
ActionCamOptions.toggle:SetPoint('CENTER', ActionCamOptions, 'TOP', 0, -50);
ActionCamOptions.toggle:SetSize(130, 30);
ActionCamOptions.toggle:SetText('Enable ActionCam');
ActionCamOptions.toggle:SetNormalFontObject('GameFontNormal');
ActionCamOptions.toggle:SetHighlightFontObject('GameFontHighlight');
--onClick handler
ActionCamOptions.toggle:SetScript("OnClick", onToggleActionCam);

-- CheckButton
-- ChatConfigCheckButtonTemplate

-- button
-- ActionCamOptions.saveBtn = CreateFrame('Button', nil, ActionCamOptions, 'GameMenuButtonTemplate');
-- ActionCamOptions.saveBtn:SetPoint('LEFT', ActionCamOptions, 'TOP', -135, -140);
-- ActionCamOptions.saveBtn:SetSize(100, 30);
-- ActionCamOptions.saveBtn:SetText('Toggle');
-- ActionCamOptions.saveBtn:SetNormalFontObject('GameFontNormal');
-- ActionCamOptions.saveBtn:SetHighlightFontObject('GameFontHighlight');

-- ActionCamOptions.resetBtn = CreateFrame('Button', nil, ActionCamOptions, 'GameMenuButtonTemplate');
-- ActionCamOptions.resetBtn:SetPoint('TOP', ActionCamOptions.saveBtn, 'BOTTOM', 0, -10);
-- ActionCamOptions.resetBtn:SetSize(100, 30);
-- ActionCamOptions.resetBtn:SetText('asd');
-- ActionCamOptions.resetBtn:SetNormalFontObject('GameFontNormal');
-- ActionCamOptions.resetBtn:SetHighlightFontObject('GameFontHighlight');

-- ActionCamOptions.resetBtn3 = CreateFrame('Button', nil, ActionCamOptions, 'GameMenuButtonTemplate');
-- ActionCamOptions.resetBtn3:SetPoint('TOP', ActionCamOptions.resetBtn, 'BOTTOM', 0, -10);
-- ActionCamOptions.resetBtn3:SetSize(130, 30);
-- ActionCamOptions.resetBtn3:SetText('heavyHeadMove');
-- ActionCamOptions.resetBtn3:SetNormalFontObject('GameFontNormal');
-- ActionCamOptions.resetBtn3:SetHighlightFontObject('GameFontHighlight');

-- default -------------------------------------------------
ActionCamOptions.defaults = CreateFrame('Button', nil, ActionCamOptions, 'GameMenuButtonTemplate');
ActionCamOptions.defaults:SetPoint('TOPLEFT', ActionCamOptions, 'BOTTOMLEFT', 20, 40);
ActionCamOptions.defaults:SetSize(100, 25);
ActionCamOptions.defaults:SetText('Defaults');
ActionCamOptions.defaults:SetNormalFontObject('GameFontNormal');
ActionCamOptions.defaults:SetHighlightFontObject('GameFontHighlight');
ActionCamOptions.defaults.tooltip = 'Restore the action camera options.';
RegisterForTooltips(ActionCamOptions.defaults);
ActionCamOptions.defaults:SetScript("OnClick", function (self)
    ConsoleExec('ActionCam default');
end);
-- default -------------------------------------------------
-- SetPoint(self origin, relative to, relative to origin, x, y);


-- Radio Button full:
ActionCamOptions.full = CreateFrame("CheckButton", nil, ActionCamOptions, "UICheckButtonTemplate");
ActionCamOptions.full:SetPoint("TOPLEFT", ActionCamOptions, "TOPLEFT", 20, -80);
ActionCamOptions.full.text:SetText("Full");
ActionCamOptions.full.tooltip = "Enable all action camera options.";

ActionCamOptions.full:SetSize(25, 25);
RegisterForTooltips(ActionCamOptions.full);

ActionCamOptions.full:SetScript("OnClick", function (self)
    ActionCamOptions.basic:SetChecked(false);
    ConsoleExec('ActionCam full');
end);
-- Radio Button basic:
ActionCamOptions.basic = CreateFrame("CheckButton", nil, ActionCamOptions, "UICheckButtonTemplate");
ActionCamOptions.basic:SetPoint("TOPRIGHT", ActionCamOptions, "TOPLEFT", 200, -80);
ActionCamOptions.basic.text:SetText("Basic");
ActionCamOptions.basic.tooltip = "Enable the basic action camera options.";

ActionCamOptions.basic:SetSize(25, 25);
RegisterForTooltips(ActionCamOptions.basic);

ActionCamOptions.basic:SetScript("OnClick", function (self)
    ActionCamOptions.full:SetChecked(false);
    ConsoleExec('ActionCam basic');
end);
-- Check Button head movement:
ActionCamOptions.headMovement = CreateFrame("CheckButton", nil, ActionCamOptions, "UICheckButtonTemplate");
ActionCamOptions.headMovement:SetPoint("TOPLEFT", ActionCamOptions.full, "TOPLEFT", 0, -40);
ActionCamOptions.headMovement.text:SetText("Head Movement");
ActionCamOptions.headMovement.tooltip = "Enable head movement.";

ActionCamOptions.headMovement:SetSize(25, 25);
RegisterForTooltips(ActionCamOptions.headMovement);

ActionCamOptions.headMovement:SetScript("OnClick", function (self)
    local isChecked = self:GetChecked();
    if isChecked then
        ConsoleExec('ActionCam headMove');
    else
        ConsoleExec('ActionCam noHeadMove');
    end
end);

-- Radio Button heavy head movement:
ActionCamOptions.heavyHeadMove = CreateFrame("CheckButton", nil, ActionCamOptions, "UICheckButtonTemplate");
ActionCamOptions.heavyHeadMove:SetPoint("TOPLEFT", ActionCamOptions.headMovement, "TOPLEFT", 0, -35);
ActionCamOptions.heavyHeadMove.text:SetText("Heavy Head Move");
ActionCamOptions.heavyHeadMove.tooltip = "Enable heavy head movement.";

ActionCamOptions.heavyHeadMove:SetSize(25, 25);
RegisterForTooltips(ActionCamOptions.heavyHeadMove);

ActionCamOptions.heavyHeadMove:SetScript("OnClick", function (self)
    ActionCamOptions.lowHeadMove:SetChecked(false);
    ConsoleExec('ActionCam heavyHeadMove');
end);
-- Radio Button low head movement:
ActionCamOptions.lowHeadMove = CreateFrame("CheckButton", nil, ActionCamOptions, "UICheckButtonTemplate");
ActionCamOptions.lowHeadMove:SetPoint("TOPRIGHT", ActionCamOptions.headMovement, "TOPLEFT", 180, -35);
ActionCamOptions.lowHeadMove.text:SetText("Low Head Move");
ActionCamOptions.lowHeadMove.tooltip = "Enable head movement only while moving.";

ActionCamOptions.lowHeadMove:SetSize(25, 25);
RegisterForTooltips(ActionCamOptions.lowHeadMove);

ActionCamOptions.lowHeadMove:SetScript("OnClick", function (self)
    ActionCamOptions.heavyHeadMove:SetChecked(false);
    ConsoleExec('ActionCam lowHeadMove');
end);

----------------------------------------------------------------
----------------------------------------------------------------
----------------------------------------------------------------
----------------------------------------------------------------

--     focusAll - enable all target focusing
--     focusOff - disable target focusing
--   focusEnemy - enable enemy target focusing
-- focusInteract - enable interact target focusing                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     

-- Check Button focus all:
ActionCamOptions.focusAll = CreateFrame("CheckButton", nil, ActionCamOptions, "UICheckButtonTemplate");
ActionCamOptions.focusAll:SetPoint("TOPLEFT", ActionCamOptions.heavyHeadMove, "TOPLEFT", 0, -40);
ActionCamOptions.focusAll.text:SetText("Focus");
ActionCamOptions.focusAll.tooltip = "Toggle all target focusing.";

ActionCamOptions.focusAll:SetSize(25, 25);
RegisterForTooltips(ActionCamOptions.focusAll);

ActionCamOptions.focusAll:SetScript("OnClick", function (self)
    local isChecked = self:GetChecked();
    if isChecked then
        ConsoleExec('ActionCam focusAll');
    else
        ConsoleExec('ActionCam focusOff');
    end
end);

-- Check Button heavy head movement:
ActionCamOptions.focusEnemy = CreateFrame("CheckButton", nil, ActionCamOptions, "UICheckButtonTemplate");
ActionCamOptions.focusEnemy:SetPoint("TOPLEFT", ActionCamOptions.focusAll, "TOPLEFT", 0, -35);
ActionCamOptions.focusEnemy.text:SetText("Focus Enemy");
ActionCamOptions.focusEnemy.tooltip = "Enable enemy target focusing.";

ActionCamOptions.focusEnemy:SetSize(25, 25);
RegisterForTooltips(ActionCamOptions.focusEnemy);

ActionCamOptions.focusEnemy:SetScript("OnClick", function (self)
    ActionCamOptions.focusInteract:SetChecked(false);
    ConsoleExec('ActionCam focusEnemy');
end);
-- Radio Button low head movement:
ActionCamOptions.focusInteract = CreateFrame("CheckButton", nil, ActionCamOptions, "UICheckButtonTemplate");
ActionCamOptions.focusInteract:SetPoint("TOPRIGHT", ActionCamOptions.focusAll, "TOPLEFT", 180, -35);
ActionCamOptions.focusInteract.text:SetText("Focus Interact");
ActionCamOptions.focusInteract.tooltip = "Enable interact target focusing .";

ActionCamOptions.focusInteract:SetSize(25, 25);
RegisterForTooltips(ActionCamOptions.focusInteract);

ActionCamOptions.focusInteract:SetScript("OnClick", function (self)
    ActionCamOptions.focusEnemy:SetChecked(false);
    ConsoleExec('ActionCam focusInteract');
end);


-- -- Check Button 1:
-- ActionCamOptions.checkBtn1 = CreateFrame("CheckButton", nil, ActionCamOptions, "UICheckButtonTemplate");
-- ActionCamOptions.checkBtn1:SetPoint("TOPLEFT", ActionCamOptions.resetBtn3, "BOTTOMLEFT", 10, -40);
-- ActionCamOptions.checkBtn1.text:SetText("heavyHeadMove");
-- ActionCamOptions.checkBtn1.tooltip = "Check to enable heavy head movement.";

-- ActionCamOptions.checkBtn1:SetSize(20, 20);
-- RegisterForTooltips(ActionCamOptions.checkBtn1);

-- ActionCamOptions.checkBtn1:SetScript("OnClick", function (self, arg2, arg3)
--     local isChecked = self:GetChecked();
--     print(self.isChecked)
-- end);
-- -- Check Button 2:
-- ActionCamOptions.checkBtn2 = CreateFrame("CheckButton", nil, ActionCamOptions, "UICheckButtonTemplate");
-- ActionCamOptions.checkBtn2:SetPoint("TOPLEFT", ActionCamOptions.checkBtn1, "BOTTOMLEFT", 10, -10);
-- ActionCamOptions.checkBtn2.text:SetText("heavyHeadMove");
-- ActionCamOptions.checkBtn2.tooltip = "Check to enable heavy head movement.";

-- ActionCamOptions.checkBtn2:SetSize(20, 20);
-- RegisterForTooltips(ActionCamOptions.checkBtn2);

-- ActionCamOptions.checkBtn2:SetScript("OnClick", function (self, arg2, arg3)
--     local isChecked = self:GetChecked();
--     print(self.isChecked)
-- end);



 


function SetCheckButtonIsRadio(button, isRadio)
	if ( isRadio ) then
		button:SetNormalTexture("Interface\\Buttons\\UI-RadioButton");
		button:GetNormalTexture():SetTexCoord(0, 0.25, 0, 1);

		button:SetHighlightTexture("Interface\\Buttons\\UI-RadioButton");
		button:GetHighlightTexture():SetTexCoord(0.5, 0.75, 0, 1);

		button:SetCheckedTexture("Interface\\Buttons\\UI-RadioButton");
		button:GetCheckedTexture():SetTexCoord(0.25, 0.5, 0, 1);

		button:SetPushedTexture("Interface\\Buttons\\UI-RadioButton");
		button:GetPushedTexture():SetTexCoord(0, 0.25, 0, 1);

		button:SetDisabledCheckedTexture("Interface\\Buttons\\UI-RadioButton");
		button:GetDisabledCheckedTexture():SetTexCoord(0.75, 1, 0, 1);
	end
end

SetCheckButtonIsRadio(ActionCamOptions.full, true);
SetCheckButtonIsRadio(ActionCamOptions.basic, true);
SetCheckButtonIsRadio(ActionCamOptions.heavyHeadMove, true);
SetCheckButtonIsRadio(ActionCamOptions.lowHeadMove, true);
SetCheckButtonIsRadio(ActionCamOptions.focusEnemy, true);
SetCheckButtonIsRadio(ActionCamOptions.focusInteract, true);

-- local texture = myFrame:CreateTexture(nil, 'BACKGROUND');
-- local fontString = myFrame:CreateFonrString(nil, 'BACKGROUND');


-- Syntax: ActionCam [option]
-- Action Camera [option] options:

------------------------------------------------------------------
-- enable/disable head move - checkbox
-- radio heavy |||| radio low
------------------------------------------------------------------

------------------------------------------------------------------
-- enable/disable focusAll - checkbox
-- radio heavy |||| radio low
------------------------------------------------------------------


--     headMove - enable head movement
--   noHeadMove - disable head movement
-- heavyHeadMove - heavy head movement
--  lowHeadMove - enable head movement only while moving

--     focusAll - enable all target focusing
--     focusOff - disable target focusing
--   focusEnemy - enable enemy target focusing
-- focusInteract - enable interact target focusing

--         full - All action cam features on
--        basic - Basic ActionCam

--          off - Disable action cam features
--           on - ActionCam
--      default - Default ActionCam settings