
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

-- title
ActionCamOptions.title = ActionCamOptions:CreateFontString(nil, 'OVERLAY');
ActionCamOptions.title:SetFontObject('GameFontHighlight');
ActionCamOptions.title:SetPoint('LEFT', ActionCamOptions.TitleBg, 'LEFT', 5, -1);
ActionCamOptions.title:SetText('Action Camera Options');

--toggle ActionCam
ActionCamOptions.toggle = CreateFrame('Button', nil, ActionCamOptions, 'GameMenuButtonTemplate');
ActionCamOptions.toggle:SetPoint('CENTER', ActionCamOptions, 'TOP', 0, -70);
ActionCamOptions.toggle:SetSize(130, 30);
ActionCamOptions.toggle:SetText('Enable ActionCam');
ActionCamOptions.toggle:SetNormalFontObject('GameFontNormal');
ActionCamOptions.toggle:SetHighlightFontObject('GameFontHighlight');
--onClick handler
ActionCamOptions.toggle:SetScript("OnClick", onToggleActionCam);

-- CheckButton
-- ChatConfigCheckButtonTemplate

-- button
ActionCamOptions.saveBtn = CreateFrame('Button', nil, ActionCamOptions, 'GameMenuButtonTemplate');
ActionCamOptions.saveBtn:SetPoint('LEFT', ActionCamOptions, 'TOP', -135, -140);
ActionCamOptions.saveBtn:SetSize(100, 30);
ActionCamOptions.saveBtn:SetText('Toggle');
ActionCamOptions.saveBtn:SetNormalFontObject('GameFontNormal');
ActionCamOptions.saveBtn:SetHighlightFontObject('GameFontHighlight');

ActionCamOptions.resetBtn = CreateFrame('Button', nil, ActionCamOptions, 'GameMenuButtonTemplate');
ActionCamOptions.resetBtn:SetPoint('TOP', ActionCamOptions.saveBtn, 'BOTTOM', 0, -10);
ActionCamOptions.resetBtn:SetSize(100, 30);
ActionCamOptions.resetBtn:SetText('asd');
ActionCamOptions.resetBtn:SetNormalFontObject('GameFontNormal');
ActionCamOptions.resetBtn:SetHighlightFontObject('GameFontHighlight');

ActionCamOptions.resetBtn3 = CreateFrame('Button', nil, ActionCamOptions, 'GameMenuButtonTemplate');
ActionCamOptions.resetBtn3:SetPoint('TOP', ActionCamOptions.resetBtn, 'BOTTOM', 0, -10);
ActionCamOptions.resetBtn3:SetSize(130, 30);
ActionCamOptions.resetBtn3:SetText('heavyHeadMove');
ActionCamOptions.resetBtn3:SetNormalFontObject('GameFontNormal');
ActionCamOptions.resetBtn3:SetHighlightFontObject('GameFontHighlight');

-- Check Button 1:
ActionCamOptions.checkBtn1 = CreateFrame("CheckButton", nil, ActionCamOptions, "UICheckButtonTemplate");
ActionCamOptions.checkBtn1:SetPoint("TOPLEFT", ActionCamOptions.resetBtn3, "BOTTOMLEFT", 10, -40);
ActionCamOptions.checkBtn1.text:SetText("heavyHeadMove");
ActionCamOptions.checkBtn1.tooltip = "Check to enable heavy head movement.";

ActionCamOptions.checkBtn1:SetScript("OnClick", function (self, arg2, arg3)
    local isChecked = self:GetChecked();
    print(self.isChecked)

end);

ActionCamOptions.checkBtn1:SetScript('OnEnter', showTooltip);

ActionCamOptions.checkBtn1:SetScript('OnLeave', hideTooltip);






-- local texture = myFrame:CreateTexture(nil, 'BACKGROUND');
-- local fontString = myFrame:CreateFonrString(nil, 'BACKGROUND');


-- Syntax: ActionCam [option]
-- Action Camera [option] options:
-- heavyHeadMove - heavy head movement
--   noHeadMove - disable head movement
--  lowHeadMove - enable head movement only while moving
--     headMove - enable head movement
--     focusAll - enable all target focusing
--   focusEnemy - enable enemy target focusing
-- focusInteract - enable interact target focusing
--     focusOff - disable target focusing
--         full - All action cam features on
--        basic - Basic ActionCam
--          off - Disable action cam features
--           on - ActionCam
--      default - Default ActionCam settings