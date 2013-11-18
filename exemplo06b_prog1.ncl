<?xml version="1.0" encoding="ISO-8859-1"?>
<ncl id="exemplo06b_prog1.ncl" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
	<head>
		<regionBase>
			<region id="rgTV">
				<region id="rgTelaInteira" zIndex="6"/>
				<region id="rgLegenda" left="25%" width="50%" top="90%" zIndex="7"/>
			</region>
		</regionBase>
		<descriptorBase>
			<descriptor id="dTelaInteira" region="rgTelaInteira" explicitDur="15s"/>
			<descriptor id="dLegenda" region="rgLegenda">
				<descriptorParam name="border" value="none"/>
			</descriptor>
		</descriptorBase>
		<connectorBase>
			<importBase alias="meusConectores" documentURI="meusConectores.ncl"/>
		</connectorBase>
	</head>
	<body>
		<port id="pProg1" component="prog1"/>
		<context id="prog1">
			<port id="pVideo1" component="video1"/>
			<media id="video1" src="media/abertura.mp4" descriptor="dTelaInteira">
				<area id="a1" begin="2s" end="5s"/>
				<area id="a2" begin="7s" end="9s"/>
				<area id="a3" begin="11s" end="13s"/>
			</media>
			<media id="legenda1" src="media/legenda01.html" descriptor="dLegenda"/>
			<media id="legenda2" src="media/legenda02.html" descriptor="dLegenda"/>
			<media id="legenda3" src="media/legenda03.html" descriptor="dLegenda"/>
			
			<!-- legenda 1 -->
		<link xconnector="meusConectores#onBeginStart">
			<bind component="video1" interface="a1" role="onBegin"/>
			<bind component="legenda1" role="start"/>
		</link>
		<link xconnector="meusConectores#onEndStop">
			<bind component="video1" interface="a1" role="onEnd"/>
			<bind component="legenda1" role="stop"/>
		</link>
		<!-- legenda 2 -->
		<link xconnector="meusConectores#onBeginStart">
			<bind component="video1" interface="a2" role="onBegin"/>
			<bind component="legenda2" role="start"/>
		</link>
		<link xconnector="meusConectores#onEndStop">
			<bind component="video1" interface="a2" role="onEnd"/>
			<bind component="legenda2" role="stop"/>
		</link>
		<!-- legenda 3 -->
		<link xconnector="meusConectores#onBeginStart">
			<bind component="video1" interface="a3" role="onBegin"/>
			<bind component="legenda3" role="start"/>
		</link>
		<link xconnector="meusConectores#onEndStop">
			<bind component="video1" interface="a3" role="onEnd"/>
			<bind component="legenda3" role="stop"/>
		</link>
		</context>
		
	</body>
</ncl>
