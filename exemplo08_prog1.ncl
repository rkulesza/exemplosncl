<?xml version="1.0" encoding="ISO-8859-1"?>
<ncl id="exemplo08b_prog1.ncl" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
	<head>
		<ruleBase>
			<!-- regras sobre ligar/desligar legenda -->
			<rule id="rLegendaLigada" var="legenda" comparator="eq" value="ligada"/>
			<rule id="rLegendaDesligada" var="legenda" comparator="eq" value="desligada"/>
			<!-- regras sobre idioma -->
			<rule id="rPortugues" var="idioma" comparator="eq" value="pt-br"/>
			<rule id="rIngles" var="idioma" comparator="eq" value="eng"/>
		</ruleBase>
		<regionBase>
			<region id="rgTV">
				<region id="rgTelaInteira" zIndex="6"/>
				<region id="rgLegenda" left="25%" width="50%" top="90%" zIndex="7"/>
				<region id="rgBotao" right="2%" bottom="0%" width="167" height="66" zIndex="8"/>
				<region id="rgBotao2" right="2%" top="0" width="80" height="80" zIndex="9"/>
			</region>
		</regionBase>
		<descriptorBase>
			<descriptor id="dTelaInteira" region="rgTelaInteira" explicitDur="15s"/>
			<descriptor id="dBotao" region="rgBotao"/>
			<descriptor id="dBotao2" region="rgBotao2"/>
			<descriptor id="dLegenda" region="rgLegenda">
				<descriptorParam name="fontSize" value="32"/>
				<descriptorParam name="fontWeight" value="bold"/>
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
			<media id="noSettings" type="application/x-ginga-settings">
				<property name="legenda" value="ligada"/>
				<property name="idioma" value="pt-br"/>
			</media>
			<media id="video1" src="media/abertura.mp4" descriptor="dTelaInteira">
				<area id="a1" begin="2s" end="5s"/>
				<area id="a2" begin="7s" end="9s"/>
				<area id="a3" begin="11s" end="13s"/>
			</media>
			<media id="imgLegendaPortugues" src="media/pt-br.png" descriptor="dBotao2"/>
			<media id="imgLegendaIngles" src="media/en.png" descriptor="dBotao2"/>
			<switch id="legenda1">
				<bindRule constituent="legenda1pt" rule="rPortugues"/>
				<bindRule constituent="legenda1en" rule="rIngles"/>
				<defaultComponent component="legenda1pt"/>
				<media id="legenda1pt" src="media/legenda01.txt" descriptor="dLegenda"/>
				<media id="legenda1en" src="media/legenda01en.txt" descriptor="dLegenda"/>
			</switch>
			<switch id="legenda2">
				<bindRule constituent="legenda2pt" rule="rPortugues"/>
				<bindRule constituent="legenda2en" rule="rIngles"/>
				<defaultComponent component="legenda2pt"/>
				<media id="legenda2pt" src="media/legenda02.txt" descriptor="dLegenda"/>
				<media id="legenda2en" src="media/legenda02en.txt" descriptor="dLegenda"/>
			</switch>
			<switch id="legenda3">
				<bindRule constituent="legenda3pt" rule="rPortugues"/>
				<bindRule constituent="legenda3en" rule="rIngles"/>
				<defaultComponent component="legenda3pt"/>
				<media id="legenda3pt" src="media/legenda03.txt" descriptor="dLegenda"/>
				<media id="legenda3en" src="media/legenda03en.txt" descriptor="dLegenda"/>
			</switch>
			<!-- inicia botao dos idiomas -->
			<link xconnector="meusConectores#onBeginStart">
				<bind component="video1" role="onBegin"/>
				<bind component="imgLegendaIngles" role="start"/>
			</link>
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
			<!-- elos para alternar o idioma das legenda -->
			<link xconnector="meusConectores#onKeySelectionSetVarNStartNStopNDelay">
				<linkParam name="oRetardo" value="0.5s"/>
				<bind component="imgLegendaPortugues" role="onSelection">
					<bindParam name="aTecla" value="GREEN"/>
				</bind>
				<bind component="noSettings" interface="idioma" role="set">
					<bindParam name="oValor" value="pt-br"/>
				</bind>
				<bind component="imgLegendaIngles" role="start"/>
				<bind component="imgLegendaPortugues" role="stop"/>
			</link>
			<link xconnector="meusConectores#onKeySelectionSetVarNStartNStopNDelay">
				<linkParam name="oRetardo" value="0.5s"/>
				<bind component="imgLegendaIngles" role="onSelection">
					<bindParam name="aTecla" value="RED"/>
				</bind>
				<bind component="noSettings" interface="idioma" role="set">
					<bindParam name="oValor" value="eng"/>
				</bind>
				<bind component="imgLegendaPortugues" role="start"/>
				<bind component="imgLegendaIngles" role="stop"/>
			</link>
			<!-- elo para desativar botao quando o video temrinar -->
			<link xconnector="meusConectores#onEndStopN">
				<bind component="video1" role="onEnd"/>
				<bind component="imgLegendaPortugues" role="stop"/>
				<bind component="imgLegendaIngles" role="stop"/>
			</link>
		</context>
	</body>
</ncl>
