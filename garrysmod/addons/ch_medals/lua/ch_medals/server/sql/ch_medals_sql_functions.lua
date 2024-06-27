CH_Medals.SQL = CH_Medals.SQL or {}

--[[
	Configure your SQL details
--]]
CH_Medals.SQL.UseMySQLOO = false

CH_Medals.SQL.Host = ""
CH_Medals.SQL.Username = ""
CH_Medals.SQL.Password = ""
CH_Medals.SQL.Database = ""
CH_Medals.SQL.Port = 3306

--[[
	Require mysqloo if enabled, connect to database and add the sqlquery and create table functions.
	
	Or else just create query and create table functions for sqlite 
--]]
local function CH_Medals_CreateSQLTables()
	CH_Medals.SQL.CreateTables( "ch_medals_player", [[
		Nick VARCHAR(32) NOT NULL,
		Medals TEXT NOT NULL,
		SteamID VARCHAR(20) NOT NULL PRIMARY KEY
	]] )
	
	CH_Medals.SQL.CreateTables( "ch_medals_logs", [[
		Medal VARCHAR(20) NOT NULL,
		Nick VARCHAR(32) NOT NULL,
		SteamID VARCHAR(20) NOT NULL,
		TargetNick VARCHAR(32) NOT NULL,
		TargetSteamID VARCHAR(20) NOT NULL,
		GiveTake INT NOT NULL,
		Timestamp TIMESTAMP NOT NULL
	]] )
end

if CH_Medals.SQL.UseMySQLOO then
    require( "mysqloo" )
	
	-- Setup the sql connection
    CH_Medals.SQL.DB = mysqloo.connect( CH_Medals.SQL.Host, CH_Medals.SQL.Username, CH_Medals.SQL.Password, CH_Medals.SQL.Database, CH_Medals.SQL.Port )
	
	-- What to do if successfully connected
    CH_Medals.SQL.DB.onConnected = function() 
        print( "[CH Medals MySQL] Database has connected!" ) 
        CH_Medals_CreateSQLTables()
    end
	
	-- Print error to console if we fail
    CH_Medals.SQL.DB.onConnectionFailed = function( db, err )
		print( "[CH Medals MySQL] Connection to database failed! Error: " .. err )
	end
	
	-- Connect
    CH_Medals.SQL.DB:connect()
    
	-- Here's our MySQL query function
    function CH_Medals.SQL.Query( query, func, singleRow )
        local query = CH_Medals.SQL.DB:query( query )
		
        if func then
            function query:onSuccess( data ) 
                if singleRow then
                    data = data[1]
                end
    
                func( data ) 
            end
        end
		
        function query:onError( err )
			print( "[CH Medals MySQL] An error occured while executing the query: " .. err )
		end
		
        query:start()
    end

    function CH_Medals.SQL.CreateTables( tableName, sqlLiteQuery, mySqlQuery )
        CH_Medals.SQL.Query( "CREATE TABLE IF NOT EXISTS " .. tableName .. " ( " .. ( mySqlQuery or sqlLiteQuery ) .. " );" )
        print( "[CH Medals MySQL] " .. tableName .. " table validated!" )
    end    
else
    function CH_Medals.SQL.Query( querystr, func, singleRow )
        local query
        if not singleRow then
            query = sql.Query( querystr )
        else
            query = sql.QueryRow( querystr, 1 )
        end
        
        if query == false then
            print( "[CH Medals SQLite] ERROR", sql.LastError() )
        elseif func then
            func( query )
        end
    end

    function CH_Medals.SQL.CreateTables( tableName, sqlLiteQuery, mySqlQuery )
        if not sql.TableExists( tableName ) then
            CH_Medals.SQL.Query( "CREATE TABLE " .. tableName .. " ( " .. ( sqlLiteQuery or mySqlQuery ) .. " );" )
        end

        print( "[CH Medals SQLite] " .. tableName .. " table validated!" )
    end
	
	CH_Medals_CreateSQLTables()
end

--[[
	Escape function based on sql
--]]
function CH_Medals.SQL.Escape( input )
    return CH_Medals.SQL.UseMySQLOO and CH_Medals.SQL.DB:escape( input ) or SQLStr( input, true )
end