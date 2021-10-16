with Rasp_Code; use Rasp_Code;
with Ada.Text_IO; use Ada.Text_IO;

procedure Main is

    test : Position := (2.0, 1.0, -1.0);
    test2: integer := Command'Pos(READ_SUN_CMD);
    test3: Command := Command'Val(4);
    test4: ResMsg := (Command'Pos(READ_TEMP_CMD), 1, 1.0);

begin

    -- test.X := -1.0;
    -- Put_Line (Float'Image (test.x));
    -- Put_Line (test2'Image);
    -- Put_Line (test3'Image);
    -- Put_Line (Float'Image (test4.temperature));

end Main;