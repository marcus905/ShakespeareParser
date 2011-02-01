import java.io.FileOutputStream;

import javax.xml.transform.TransformerFactory;
import javax.xml.transform.Transformer;
import javax.xml.transform.stream.StreamSource;
import javax.xml.transform.stream.StreamResult;

/**
 * Tale classe permette la trasformazione di documenti XML usando fogli di stile
 * XSL.
 * 
 * @author GiuseppeDEIS
 * 
 */
public class XmlTransformer {

	private TransformerFactory tFactory;
	private Transformer transformer;

	/**
	 * 
	 * @param sourceFile
	 *            File XML di partenza
	 * @param transformFile
	 *            File XSLT che descrive la trasformazione
	 * @param outputFile
	 *            File Trasformato (potrebbe essere XML o HTML a seconda della
	 *            trasformazione)
	 * @throws Exception
	 */
	public void performTransformation(String sourceFile, String transformFile,
			String outputFile) throws Exception {

		tFactory = TransformerFactory.newInstance();

		// Usa TransformerFactory per istanziare a Transformer che lavorerà con
		// lo stylesheet specificato.

		transformer = tFactory.newTransformer(new StreamSource(transformFile));

		// Usa l'oggetto Transformer per trasformare il documento in input
		// e scriverlo in un file di output.

		transformer.transform(new StreamSource(sourceFile), new StreamResult(
				new FileOutputStream(outputFile)));

		System.out.println("************* The result is in " + transformFile
				+ " *************");
	}

	/**
	 * Esempio di utilizzo
	 * 
	 * @param args
	 * @throws Exception
	 */
	public static void main(String[] args) throws Exception {
		// Use the static TransformerFactory.newInstance() method to instantiate
		// a TransformerFactory. The javax.xml.transform.TransformerFactory
		// system property setting determines the actual class to instantiate --

		XmlTransformer xmlToXmlConversion = new XmlTransformer();

		String sourceFile = "C:/Directory/ProgettoLaboratorioAlgoritmi/src/XML_Original/two_gent.xml";
		String transformFile = "C:/Directory/ProgettoLaboratorioAlgoritmi/src/preT.xslt";
		String outputFile = "C:/Directory/ProgettoLaboratorioAlgoritmi/src/XML_Transformed/two_gentT.xml";

		xmlToXmlConversion.performTransformation(sourceFile, transformFile,
				outputFile);
		
		xmlToXmlConversion = new XmlTransformer();
		
		sourceFile = "C:/Directory/ProgettoLaboratorioAlgoritmi/src/XML_Transformed/two_gentT.xml";
		transformFile = "C:/Directory/ProgettoLaboratorioAlgoritmi/src/t.xslt";
		outputFile = "C:/Directory/ProgettoLaboratorioAlgoritmi/src/XML_Transformed/two_gentTT.xml";
		
		xmlToXmlConversion.performTransformation(sourceFile, transformFile,
				outputFile);
		
		xmlToXmlConversion = new XmlTransformer();
		
		sourceFile = "C:/Directory/ProgettoLaboratorioAlgoritmi/src/XML_Original/hen_iv_3.xml";
		transformFile = "C:/Directory/ProgettoLaboratorioAlgoritmi/src/preT.xslt";
		outputFile = "C:/Directory/ProgettoLaboratorioAlgoritmi/src/XML_Transformed/hen_iv_3T.xml";
		
		xmlToXmlConversion.performTransformation(sourceFile, transformFile,
				outputFile);
		
		xmlToXmlConversion = new XmlTransformer();
		
		sourceFile = "C:/Directory/ProgettoLaboratorioAlgoritmi/src/XML_Transformed/hen_iv_3T.xml";
		transformFile = "C:/Directory/ProgettoLaboratorioAlgoritmi/src/t.xslt";
		outputFile = "C:/Directory/ProgettoLaboratorioAlgoritmi/src/XML_Transformed/hen_iv_3TT.xml";
		
		xmlToXmlConversion.performTransformation(sourceFile, transformFile,
				outputFile);


	}
}
