<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- Generated by NCL Eclipse -->
<ncl id="exemplo04d" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
<head>
<regionBase>
	<region id="rgTV">
		<region id="rgVPrincipal" />
		<region id="rgInteratividade" right="5%" bottom="5%" width="40" height="40" zIndex="3" />
		<region id="rgMenu" bottom="5" left="0" width="120" height="50" zIndex="4"/>
	</region>
</regionBase>

<descriptorBase>
	<descriptor id="dVPrincipal" region="rgVPrincipal" />
	<descriptor id="dImgInteratividade" region="rgInteratividade">
		<descriptorParam name="transparency" value="20%" />
	</descriptor>
	<descriptor id="dImgMenu" region="rgMenu"/>
	
</descriptorBase>

<connectorBase>
	<causalConnector id="onBeginStart_vDelay">
		<connectorParam name="vDelay" />
			<simpleCondition role="onBegin" />
			<simpleAction role="start" delay="$vDelay" max="unbounded" qualifier="par" />
	</causalConnector>
	<causalConnector id="onEndStop">
		<simpleCondition role="onEnd" />
		<simpleAction role="stop" />
	</causalConnector>
	
	<causalConnector id="onKeySelectionStartStop">
		<connectorParam name="vKey" />
		<simpleCondition role="onSelection" key="$vKey" />
		<compoundAction operator="par">
			<simpleAction role="start" max="unbounded" qualifier="par"/>
			<simpleAction role="stop" max="unbounded" qualifier="par"/>
		</compoundAction>	
	</causalConnector>
	
	<causalConnector id="onEndStart">
		<simpleCondition role="onEnd" />
		<simpleAction role="start" max="unbounded" qualifier="par"/>
	</causalConnector>
</connectorBase>
</head>
<body>
	<port id="pVideoPrincipal" component="videoPrincipal" />
	<media id="videoPrincipal" src="media/shoes.mp4" descriptor="dVPrincipal" />
	<media id="imgInteratividade" src="media/intOff.png" descriptor="dImgInteratividade"/>
	<media id="imgMenu" src="media/imageMenu1.png" descriptor="dImgMenu"/>
	
	<link id="lVideoAberturaInicia" xconnector="onBeginStart_vDelay">
		<linkParam name="vDelay" value="5s" />
		<bind role="onBegin" component="videoPrincipal" />
		<bind role="start" component="imgInteratividade" />	
	</link>

	<link id="lVideoAberturaTermina" xconnector="onEndStop">
		<bind role="onEnd" component="videoPrincipal" />
		<bind role="stop" component="videoPrincipal" />
	</link>
	
	<link id="lREdStopAbertura" xconnector="onKeySelectionStartStop">
		<bind role="onSelection" component="videoPrincipal">
			<bindParam name="vKey" value="RED" />
		</bind>
		<bind role="stop" component="imgInteratividade" />
		<bind role="start" component="imgMenu" />
	</link>
	
</body>
</ncl>
