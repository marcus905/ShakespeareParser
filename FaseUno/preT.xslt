<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<play>
			
			<!-- titolo del play -->		
			<title>
				<xsl:value-of select="PLAY/TITLE"></xsl:value-of>
			</title>
			
			<!-- GESTIONE DELL'OGGETTO "PERSONAE" -->
			<personae>
			
				<!-- for each sui tag "persona" figli di "personae" -->
				<xsl:for-each select="PLAY/PERSONAE/PERSONA">
				<persona>
					
					<xsl:choose>
					<xsl:when test="contains(string(text()),',')">
						<name>
							<xsl:value-of select="substring-before(text(),',')"/>
						</name>
						<alias>
							<xsl:value-of select="substring-after(text(),',')"/>
						</alias>
					</xsl:when>
					<xsl:otherwise>
						<name>
							<xsl:value-of select="text()"/>
						</name>
					</xsl:otherwise>
					</xsl:choose>
										
				</persona>
				</xsl:for-each>
				
				<!-- Iterazione sugli oggetti "pgroup" per estrarre i tag "persona" in essi contenuti-->
				<xsl:for-each select="PLAY/PERSONAE/PGROUP">
					<xsl:for-each select="PERSONA">
						<persona>
							
							<name>
								<xsl:value-of select="text()"/>
							</name>
							
							<!-- alias dei nomi comune per ogni "pgroup" ed è costituito dal "grpdescr" -->
							<alias>
								<xsl:value-of select="../GRPDESCR"/>
							</alias>
							
						</persona>
					</xsl:for-each>
				</xsl:for-each>		
				
			</personae>
			
			<!--  GESTIONE DEGLI ELEMENTI "ACT" -->
			<xsl:for-each select="PLAY/ACT">
			<act>
				<number><xsl:call-template name="numberAct"/></number>
				
				<!-- SELEZIONE DEGLI OGGETTI "SCENE" CONTENUTI NEI SINGOLI "ACT" -->
				<xsl:for-each select=".//SCENE">
					<scene>
						<title> <xsl:value-of select="./TITLE"/></title>
						
						<!-- GESTIONE SPEECHES E STAGEDIR -->
						<xsl:apply-templates select="SPEECH"/>
																							
					</scene>
				</xsl:for-each>
				
			</act>
			</xsl:for-each>
			
		</play>
	</xsl:template>
	
	<!--  Template=speecher: gestione del contenuto di ogni singolo speech -->
			
	<!-- Template=numberAct: estrae il numero dell'atto dal titolo dell'atto stesso eliminando la parola "act" e lasciando il numero romano -->
	<xsl:template name="numberAct" match="PLAY/ACT/TITLE[.='ACT']">
		<xsl:value-of select="substring-after(TITLE,'T')"/>
	</xsl:template>
	
	
	<!-- TEMPLATE SPEECHES -->
	
	<xsl:template match="SPEECH">
	
	<!-- titolo stagedir che lo precede --> 
	<xsl:param name="xxx">
		<xsl:value-of select="preceding-sibling::STAGEDIR[1]" />
	</xsl:param>
	
	<!--  titolo scena di riferimento -->
	<xsl:param name="scN">
		<xsl:value-of select="preceding-sibling::TITLE[1]"/>
	</xsl:param>
	
	<speech>
		<stagedir>  
			<xsl:value-of select="$xxx"/>
		</stagedir>
		
		<sceneN>
			<xsl:value-of select="$scN"/>
		</sceneN>
         
         <xsl:for-each select="SPEAKER">
			<persona>
				<xsl:value-of select="text()"/>
			</persona>
			<text>
			<xsl:for-each select="following-sibling::LINE">
				
					<xsl:value-of select="text()"/>
					<!-- METTE SPAZIO BIANCO TRA UNA LINE E L'ALTRA -->
					<xsl:text>&#10;</xsl:text>
				
			</xsl:for-each>
			</text>
		</xsl:for-each>
         
    </speech>
	</xsl:template>
	
</xsl:stylesheet>

