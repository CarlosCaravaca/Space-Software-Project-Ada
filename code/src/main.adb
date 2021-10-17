with Rasp_Code; use Rasp_Code;
with Ada.Text_IO; use Ada.Text_IO;

procedure Main is

    test : PositionType := (2.0, 1.0, -1.0);
    test2: integer := Command'Pos(READ_SUN_CMD);
    test3: Command := Command'Val(4);
    test4: ResMsg := (Command'Pos(READ_TEMP_CMD), 1, 1.0);

begin

    test.X := -0.0;
    -- Put_Line (Float'Image (test.x));
    -- Put_Line (test2'Image);
    -- Put_Line (test3'Image);
    -- Put_Line (Float'Image (test4.temperature));
    -- control_temperature;
    -- Put_Line (Float'Image(temperature));
    -- Put_Line (Integer'Image(next_cmd_msg.cmd));
    -- heater_on := 0;
    -- temperature := 20.0;
    -- control_temperature;
    -- Put_Line (Integer'Image(heater_on));
    -- temperature := 70.0;
    -- control_temperature;
    -- Put_Line (Integer'Image(heater_on));
    -- Put_Line (Integer'Image(next_cmd_msg.cmd));
    -- heater_on := 1;
    -- send_cmd_msg (READ_POS_CMD);
    -- Put_Line (Integer'Image(next_cmd_msg.cmd));
    -- position := (0.0, 0.0, 0.0);
    -- last_res_msg := (Command'Pos(READ_POS_CMD), 1, (2.0, 1.0, -1.0));
    -- Put_Line ("X:" & Float'Image (position.x)
    --         & ", Y: " & Float'Image (position.y)
    --         & ", Z:" & Float'Image (position.z));
    -- Put_Line (Integer'Image(last_res_msg.cmd));
    -- recv_res_msg;
    -- Put_Line ("X:" & Float'Image (position.x)
    --             & ", Y: " & Float'Image (position.y)
    --             & ", Z:" & Float'Image (position.z));
    -- Put_Line (Integer'Image(last_res_msg.cmd));

end Main;