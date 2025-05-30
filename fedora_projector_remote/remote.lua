
dragging = false;

local mouse = libs.mouse;
local kb = libs.keyboard;

function update (r)
	--server.update({id = "touch", text = r });
end

actions.down = function ()
	update("down");
end

actions.up = function ()
	update("up");
end

actions.tap = function ()
    update("tap");
    if (dragging) then
        dragging = false;
        mouse.dragend();
        mouse.up();
    else
        mouse.down();
        mouse.up();
    end
end

actions.double = function ()
	update("double");
	mouse.double("left");
end

actions.hold = function ()
	update("hold");
	mouse.down();
	mouse.dragbegin();
	dragging = true;
end

actions.delta = function  (id, x, y)
	update("delta: " .. x .. " " .. y);
	mouse.moveraw(x, y);
end

actions.left = function ()
    mouse.down();
    mouse.up();
end

actions.right = function ()
    mouse.down("right");
    mouse.up("right");
end

actions.scrollup = function ()
    mouse.vscroll(5)
end

actions.scrolldown = function ()
    mouse.vscroll(-5)
end

actions.close_window = function()
    kb.stroke("control", "w")
end

actions.pause = function()
    kb.press("space")
end

actions.subs_on_off = function()
    kb.press("v")
end

actions.rewind = function()
    kb.press("left")
end

actions.fastforward = function()
    kb.press("right")
end
