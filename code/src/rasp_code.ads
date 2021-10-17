------------------------
-- Package specification
------------------------
package Rasp_Code is

    -- Types declaration

    -- Structure of a position on the orbit
    type PositionType is record
        x, y, z : Float;
    end record;

    -- List of commands to be send
    type Command is (
            NO_CMD,
            SET_HEAT_CMD,
            READ_SUN_CMD,
            READ_TEMP_CMD,
            READ_POS_CMD
        );

    -- Representation clause for Command definition
    for Command use (
        NO_CMD          => 0,
        SET_HEAT_CMD    => 1,
        READ_SUN_CMD    => 2,
        READ_TEMP_CMD   => 3,
        READ_POS_CMD    => 4
    );

    -- Structure of command message
    type CmdMsg is record
        cmd         : Integer; -- Command to execute
        set_heater  : Integer; -- Boolean to set/unset the heater
    end record;

    -- Structure of response message
    -- type ResMsg;                            -- Forward declaration of ResMsg
    -- type ResMsg_Access is access ResMsg;    -- Access to a ResMsg

    type ResMsg (cmd : Integer := 0) is record
        status  : Integer; -- Boolean to state if the execution went well
        case cmd is
            when Command'Pos(READ_SUN_CMD) =>
                sunlight_on : Integer;
            when Command'Pos(READ_TEMP_CMD) =>
                temperature : Float;
            when Command'Pos(READ_POS_CMD) =>
                position : PositionType;
            when others =>
                null;
        end case;
    end record;

    -- Public status (Global variables)

    -- Boolean with the status of the heater
    heater_on : Integer := 0;
    -- Boolean with the status of the sunlight
    sunlight_on : Integer := 0;
    -- Store the actual temperature of the spacecraft
    temperature : Float := 0.0;
    -- Store the position of the spacecraft
    position : PositionType;

    -- Declare next command to be sent
    next_cmd_msg : CmdMsg := (Command'Pos(NO_CMD), 0);
    -- Declare last response message received
    last_res_msg : ResMsg := (Command'Pos(NO_CMD), 0);

    -- Main functions

    -- Procedure: control_temperature
    procedure control_temperature;

    -- Function: send_cmd_msg
    procedure send_cmd_msg (cmd : Command);

    -- Procedure: recv_res_msg
    procedure recv_res_msg;

    -- Procedure: check_status
    procedure check_status (status : Integer);

end Rasp_Code;
