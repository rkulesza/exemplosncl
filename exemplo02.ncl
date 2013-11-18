<?xml version="1.0" encoding="ISO-8859-1"?>
<ncl id="exemplo02" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
	<head>
		<regionBase>
			<region id="rgTV" zIndex="0">
				<region id="rgVideo1" zIndex="0"/>
				<region id="rgTitulo1" top="10%" zIndex="1"/>
			</region>
		</regionBase>
		<descriptorBase>
			<descriptor id="dVideo1" region="rgVideo1"/>
			<descriptor id="dTitulo1" region="rgTitulo1">
				<descriptorParam name="fontSize" value="26"/>
				<descriptorParam name="fontColor" value="yellow"/>				
			</descriptor>
				
		</descriptorBase>
		<connectorBase>
			<causalConnector id="onBeginStart">
				<simpleCondition role="onBegin"/>
				<simpleAction role="start"/>
			</causalConnector>
			<causalConnector id="onEndStop">
				<simpleCondition role="onEnd"/>
				<simpleAction role="stop"/>
			</causalConnector>
		</connectorBase>
	</head>
	<body>
		<port id="pInicio" component="video1"/>
		<media id="video1" src="media/gewinner.mp4" descriptor="dVideo1"/>
		<media type="text/plain" id="titulo1" src="media/titulo1.txt" descriptor="dTitulo1"/>
		<link id="lBeginVideo1StartTitulo1" xconnector="onBeginStart">
			<bind component="video1" role="onBegin"/>
			<bind component="titulo1" role="start"/>
		</link>
		<link id="lEndVideo1StopTitulo1" xconnector="onEndStop">
			<bind component="video1" role="onEnd"/>
			<bind component="titulo1" role="stop"/>
		</link>
	</body>
</ncl>
