---------------
-- Package body
---------------

-- Includes
with Ada.Text_IO; use Ada.Text_IO;

package body Rasp_Code is

    -- Define constants
    MAX_TEMPERATURE : Float := 90.0;
    MIN_TEMPERATURE : Float := -10.0;
    AVG_TEMPERATURE : Float := 40.0;

    procedure control_temperature is
    begin
        -- check if the temperature is lower or higher
        if temperature < AVG_TEMPERATURE then
            -- set heater
            heater_on := 1;
        elsif temperature >= AVG_TEMPERATURE then
            -- unset heater
            heater_on := 0;
        end if;
    end control_temperature;

    procedure send_cmd_msg (cmd : Command) is
    begin
        loop
            case cmd is
                -- First we check if the command is SET_HEAT_CMD
                when SET_HEAT_CMD =>
                    -- We fill the variable next_cmd_msg to contain
                    -- the corresponding information.
                    next_cmd_msg.cmd := Command'Pos(SET_HEAT_CMD);
                    next_cmd_msg.set_heater := heater_on;
                    exit;

                when others =>
                    -- For the rest of the commands the field
                    -- set_heater is not necessary, but it is
                    -- specified to avoid undefined behaviour.
                    next_cmd_msg.cmd := Command'Pos(cmd);
                    next_cmd_msg.set_heater := 0;
                    exit;

            end case;
        end loop;
    end send_cmd_msg;

    procedure recv_res_msg is
    begin
        loop
            case last_res_msg.cmd is

                when Command'Pos(NO_CMD) =>
                    -- Do nothing
                    exit;

                when Command'Pos(SET_HEAT_CMD) =>
                    -- Read status
                    check_status (last_res_msg.status);
                    -- Clean the response
                    last_res_msg := (Command'Pos(NO_CMD), 0);
                    exit;

                when Command'Pos(READ_SUN_CMD) =>
                    -- Read status
                    check_status (last_res_msg.status);
                    -- Update sunlight_on variable
                    sunlight_on := last_res_msg.sunlight_on;
                    -- Clean the response
                    last_res_msg := (Command'Pos(NO_CMD), 0);
                    exit;

                when Command'Pos(READ_TEMP_CMD) =>
                    -- Read status
                    check_status (last_res_msg.status);
                    -- Update temperature variable
                    temperature := last_res_msg.temperature;
                    -- Clean the response
                    last_res_msg := (Command'Pos(NO_CMD), 0);
                    exit;
                
                when Command'Pos(READ_POS_CMD) =>
                    -- Read status
                    check_status (last_res_msg.status);
                    -- Update position variable
                    position.x := last_res_msg.position.x;
                    position.y := last_res_msg.position.y;
                    position.z := last_res_msg.position.z;
                    -- Clean the response
                    last_res_msg := (Command'Pos(NO_CMD), 0);
                    exit;
                
                when others =>
                    -- Acoid undefined behaviour
                    exit;

            end case;
        end loop;
    end recv_res_msg;

    procedure check_status (status : Integer) is
    begin
        loop
            case status is
                when 1 =>
                    -- The execution went well
                    Put_Line ("The operation was correctly performed.");
                    exit;
                when 0 =>
                    -- The execution went well
                    Put_Line ("ERROR: The operation could not be performed.");
                    exit;
                when others =>
                    -- The execution went well
                    Put_Line ("ERROR: Something really bad happened.");
                    exit;
            end case;
        end loop;
    end check_status;

end Rasp_Code;