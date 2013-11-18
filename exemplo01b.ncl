<?xml version="1.0" encoding="ISO-8859-1"?>
<ncl id="exemplo01b" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
	<head>
		<regionBase>
			<region id="rgTV">ì
				<region id="rgVideo" left="10%" top="10%" width="80%" height="80%"/>
			</region>
		</regionBase>
		<descriptorBase>
				<descriptor id="dTV" region="rgTV"/>
				<descriptor id="dVideo" region="rgVideo">
					<descriptorParam name="fit" value="hidden"/>
				</descriptor>
		</descriptorBase>
	</head>
	<body>
		<port id="pInicio" component="video"/>
		<media id="video" src="media/abertura.mp4" descriptor="dVideo" />
		
	</body>
</ncl>
