<?xml version="1.0" encoding="ISO-8859-1"?>
<ncl id="nclClicks" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">

<head>

<regionBase>
    <region width="20%"  height="20%"  left="10%"  top="40%" id="rgWin"/>
    <region width="20%"  height="100%"  left="0%" top="0%" id="rgMenu"/>
</regionBase>

<descriptorBase>
    <descriptor id="dsMenu" region="rgMenu" focusIndex="luaIdx"/>
    <descriptor id="dsWin" region="rgWin"/>
</descriptorBase>

<connectorBase>
	<causalConnector id="onBeginStart">
		<simpleCondition role="onBegin"/>
		<simpleAction role="start"/>
	</causalConnector>
</connectorBase>

</head>

<body>
    <port id="entryPoint" component="MenuLua"/>

	<media type="application/x-ginga-settings" id="programSettings">
        <property name="service.currentKeyMaster" value="luaIdx"/>
	</media>

    <media id="MenuLua" src="menu.lua" descriptor="dsMenu">
        <area id="menu"/>
    </media>

    <media id="win" src="win.jpg" descriptor="dsWin"/>

    <link xconnector="onBeginStart">
        <bind role="onBegin" component="MenuLua" interface="menu"/>
		<bind role="start" component="win"/>
	</link>
</body>

</ncl>
