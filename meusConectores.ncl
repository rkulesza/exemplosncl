<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- Generated by NCL Eclipse -->
<ncl id="meusConectores" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
	<head>
		<connectorBase>
			<causalConnector id="onBeginStart">
				<simpleCondition role="onBegin"/>
				<simpleAction role="start"/>
			</causalConnector>
			<causalConnector id="onBeginStartDelayed">
				<connectorParam name="delay"/>
				<simpleCondition role="onBegin"/>
				<simpleAction role="start" delay="$delay"/>
			</causalConnector>
			<causalConnector id="onEndStop">
				<simpleCondition role="onEnd"/>
				<simpleAction role="stop"/>
			</causalConnector>
			<causalConnector id="onEndStart">
				<simpleCondition role="onEnd"/>
				<simpleAction role="start"/>
			</causalConnector>
			<causalConnector id="onKeySelectionStop">
				<connectorParam name="vKey"/>
				<simpleCondition role="onSelection" key="$vKey"/>
				<simpleAction role="stop"/>
			</causalConnector>
			<causalConnector id="onKeySelectionStartStop">
				<connectorParam name="vKey"/>
				<simpleCondition role="onSelection" key="$vKey"/>
				<compoundAction operator="par">
					<simpleAction role="start"/>
					<simpleAction role="stop"/>
				</compoundAction>
			</causalConnector>
			<causalConnector id="onSelectionStartNStopN">
				<simpleCondition role="onSelection"/>
				<compoundAction operator="seq">
					<simpleAction role="start" max="unbounded" qualifier="par"/>
					<simpleAction role="stop" max="unbounded" qualifier="par"/>
				</compoundAction>
			</causalConnector>
			<causalConnector id="onEndAbort">
				<simpleCondition role="onEnd"/>
				<simpleAction role="abort"/>
			</causalConnector>
			<causalConnector id="onBeginSet">
				<connectorParam name="oValor"/>
				<simpleCondition role="onBegin"/>
				<simpleAction role="set" value="$oValor"/>
			</causalConnector>
			<causalConnector id="onEndStopN">
				<simpleCondition role="onEnd"/>
				<simpleAction role="stop" max="unbounded"/>
			</causalConnector>
			<causalConnector id="onBeginPropertyTestStart">
				<connectorParam name="oValor"/>
				<compoundCondition operator="and">
					<simpleCondition role="onBegin"/>
					<assessmentStatement comparator="eq">
						<attributeAssessment role="testaProp" eventType="attribution" attributeType="nodeProperty"/>
						<valueAssessment value="$oValor"/>
					</assessmentStatement>
				</compoundCondition>
				<simpleAction role="start"/>
			</causalConnector>
			<causalConnector id="onBeginAttNodeTestStartN">
				<connectorParam name="value"/>
				<compoundCondition operator="and">
					<simpleCondition role="onBegin"/>
					<assessmentStatement comparator="eq">
						<attributeAssessment role="attNodeTest" eventType="attribution" attributeType="nodeProperty"/>
						<valueAssessment value="$value"/>
					</assessmentStatement>
				</compoundCondition>
				<simpleAction role="start" max="unbounded" qualifier="par"/>
			</causalConnector>
			<causalConnector id="onKeySelectionSetVarNStartNStopNDelay">
				<connectorParam name="oValor"/>
				<connectorParam name="aTecla"/>
				<connectorParam name="oRetardo"/>
				<simpleCondition role="onSelection" key="$aTecla"/>
				<compoundAction operator="par">
					<simpleAction role="set" value="$oValor" delay="$oRetardo"/>
					<simpleAction role="start" delay="$oRetardo"/>
					<simpleAction role="stop" delay="$oRetardo"/>
				</compoundAction>
			</causalConnector>
		</connectorBase>
	</head>
</ncl>
