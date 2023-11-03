class Extended_PreStart_EventHandlers {
    class ADDON {
        // The PreStart event handlers will run once per game session, before the main menu is shown.
        // Note that these events are executed in uiNamespace by default. This is because their main purpose is to do function caching.
        init = QUOTE( call COMPILE_FILE(XEH_preStart) );
    };
};

class Extended_PreInit_EventHandlers {
    class ADDON {
        // The PreInit event handlers will run once at a point in time before all the mission units and vehicles have their own init event handlers processed.
        init = QUOTE( call COMPILE_FILE(XEH_preInit) );
    };
};

class Extended_PostInit_EventHandlers {
    class ADDON {
        // The PostInit event handlers will run once and after all the units and vehicles have had both their init event handlers and the code in the mission editor "init" lines processed.
        init = QUOTE( call COMPILE_FILE(XEH_postInit) );
    };
};

class Extended_InitPost_EventHandlers
{
    class CAManBase
    {
        class ADDON
        {
            init = QUOTE( _this call FUNC(initUnit) );
        };
    };
};
