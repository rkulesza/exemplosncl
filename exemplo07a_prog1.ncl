<?xml version="1.0" encoding="ISO-8859-1"?>
<ncl id="exemplo07a_prog1.ncl" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
	<head>
		<regionBase>
			<region id="rgTV">
				<region id="rgTelaInteira" zIndex="6"/>
				<region id="rgLegenda" left="25%" width="50%" top="90%" zIndex="7"/>
				<region id="rgBotao" right="2%" bottom="2%" width="167" height="66" zIndex="99"/>
			</region>
		</regionBase>
		<descriptorBase>
			<descriptor id="dTelaInteira" region="rgTelaInteira" explicitDur="15s"/>
			<descriptor id="dLegenda" region="rgLegenda">
				<descriptorParam name="border" value="none"/>
			</descriptor>
			<descriptor id="dBotao" region="rgBotao"/>
		</descriptorBase>
		<connectorBase>
			<importBase alias="meusConectores" documentURI="meusConectores.ncl"/>
		</connectorBase>
	</head>
	<body>
		<port id="pProg1" component="prog1"/>
		<context id="prog1">
			<port id="pVideo1" component="video1"/>
			<media id="noSettings" type="application/x-ginga-settings">
				<property name="legenda" value="ligada"/>
			</media>
			<media id="video1" src="media/abertura.mp4" descriptor="dTelaInteira">
				<area id="a1" begin="2s" end="5s"/>
				<area id="a2" begin="7s" end="9s"/>
				<area id="a3" begin="11s" end="13s"/>
			</media>
			<media id="legenda1" src="media/legenda01.html" descriptor="dLegenda"/>
			<media id="legenda2" src="media/legenda02.html" descriptor="dLegenda"/>
			<media id="legenda3" src="media/legenda03.html" descriptor="dLegenda"/>
			<media id="imgLegendaLigar" src="media/on.png" descriptor="dBotao"/>
			<media id="imgLegendaDesligar" src="media/off.png" descriptor="dBotao"/>
			<link xconnector="meusConectores#onBeginStart">
				<bind component="video1" role="onBegin"/>
				<bind component="imgLegendaLigar" role="start"/>
			</link>
			<!-- legenda 1 -->
			<!-- elo para testar se a legenda esta ligada e inicar a legenda -->
			<link xconnector="meusConectores#onBeginAttNodeTestStartN">
				<bind component="video1" interface="a1" role="onBegin"/>
				<bind component="noSettings" interface="legenda" role="attNodeTest">
					<bindParam name="value" value="ligada"/>
				</bind>
				<bind component="legenda1" role="start"/>
			</link>
			<link xconnector="meusConectores#onEndStop">
				<bind component="video1" interface="a1" role="onEnd"/>
				<bind component="legenda1" role="stop"/>
			</link>
			<!-- legenda 2 -->
			<link xconnector="meusConectores#onBeginAttNodeTestStartN">
				<bind component="video1" interface="a2" role="onBegin"/>
				<bind component="noSettings" interface="legenda" role="attNodeTest">
					<bindParam name="value" value="ligada"/>
				</bind>
				<bind component="legenda2" role="start"/>
			</link>
			<link xconnector="meusConectores#onEndStop">
				<bind component="video1" interface="a2" role="onEnd"/>
				<bind component="legenda2" role="stop"/>
			</link>
			<!-- legenda 3 -->
			<link xconnector="meusConectores#onBeginAttNodeTestStartN">
				<bind component="video1" interface="a3" role="onBegin"/>
				<bind component="noSettings" interface="legenda" role="attNodeTest">
					<bindParam name="value" value="ligada"/>
				</bind>
				<bind component="legenda3" role="start"/>
			</link>
			<link xconnector="meusConectores#onEndStop">
				<bind component="video1" interface="a3" role="onEnd"/>
				<bind component="legenda3" role="stop"/>
			</link>
			<!-- elos para alternar o estado de ativação da legenda -->
			<link xconnector="meusConectores#onKeySelectionSetVarNStartNStopNDelay">
				<linkParam name="oRetardo" value="0.5s"/>
				<bind component="imgLegendaDesligar" role="onSelection">
					<bindParam name="aTecla" value="RED"/>
				</bind>
				<bind component="noSettings" interface="legenda" role="set">
					<bindParam name="oValor" value="ligada"/>
				</bind>
				<bind component="imgLegendaLigar" role="start"/>
				<bind component="imgLegendaDesligar" role="stop"/>
			</link>
			<link xconnector="meusConectores#onKeySelectionSetVarNStartNStopNDelay">
				<linkParam name="oRetardo" value="0.5s"/>
				<bind component="imgLegendaLigar" role="onSelection">
					<bindParam name="aTecla" value="GREEN"/>
				</bind>
				<bind component="noSettings" interface="legenda" role="set">
					<bindParam name="oValor" value="desligada"/>
				</bind>
				<bind component="imgLegendaDesligar" role="start"/>
				<bind component="imgLegendaLigar" role="stop"/>
			</link>
			<!-- elo para desativar botão quando o vídeo temrinar -->
			<link xconnector="meusConectores#onEndStopN">
				<bind component="video1" role="onEnd"/>
				<bind component="imgLegendaDesligar" role="stop"/>
				<bind component="imgLegendaLigar" role="stop"/>
			</link>
		</context>
	</body>
</ncl>
