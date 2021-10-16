package Rasp_Code is

    -- Types declaration

    -- Structure of a position on the orbit
    type Position is record
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

    type ResMsg (cmd : Integer) is record
        status  : Integer; -- Boolean to state if the execution went well
        case cmd is
            when Command'Pos(READ_SUN_CMD) =>
                sunlight_on : Integer;
            when Command'Pos(READ_TEMP_CMD) =>
                temperature : Float;
            when Command'Pos(READ_POS_CMD) =>
                pos : Position;
            when others =>
                null;
        end case;
    end record;

end Rasp_Code;
-- // structure of response message
-- struct res_msg {
--     short int cmd;  // command to respond to
--     short int status;        // boolean to state if execution went well
--     union {
--     	short int sunlight_on;   // boolean to state if sunlight is on
--     	double temperature;   // value of the temperature
--     	struct position position;   // value of the position
--    } data;
-- };