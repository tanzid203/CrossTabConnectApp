package com.tanuj.crosstab;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.channels.Channels;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.google.appengine.tools.cloudstorage.GcsFileOptions;
import com.google.appengine.tools.cloudstorage.GcsFilename;
import com.google.appengine.tools.cloudstorage.GcsOutputChannel;
import com.google.appengine.tools.cloudstorage.GcsService;
import com.google.appengine.tools.cloudstorage.GcsServiceFactory;
import com.google.appengine.tools.cloudstorage.RetryParams;

public class UploadServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private static final Logger log = Logger.getLogger(UploadServlet.class.getName());

	private final GcsService gcsService = GcsServiceFactory.createGcsService(new RetryParams.Builder()
			.initialRetryDelayMillis(10).retryMaxAttempts(10).totalRetryPeriodMillis(15000).build());

	private String bucketName = "crosstabconnect.appspot.com";

	/**
	 * Used below to determine the size of chucks to read in. Should be > 1kb
	 * and < 10MB
	 */
	private static final int BUFFER_SIZE = 2 * 1024 * 1024;

	@SuppressWarnings("unchecked")
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		String sctype = null, sfieldname, sname = null;
		ServletFileUpload upload;
		FileItemIterator iterator;
		FileItemStream item;
		try {
			upload = new ServletFileUpload();
			res.setContentType("text/plain");

			iterator = upload.getItemIterator(req);
			while (iterator.hasNext()) {
				item = iterator.next();
				if (item.isFormField()) {
					log.warning("Got a form field: " + item.getFieldName());
				} else {
					log.warning("Got an uploaded file: " + item.getFieldName() + ", name = " + item.getName());

					sfieldname = item.getFieldName();
					sname = item.getName();

					sctype = item.getContentType();

					GcsOutputChannel outputChannel = gcsService.createOrReplace(new GcsFilename(bucketName, sname),
							new GcsFileOptions.Builder().acl("public-read").mimeType(sctype).build());
					//outputChannel.write(ByteBuffer.wrap(bytes));
					//outputChannel.close();
					copy(item.openStream(), Channels.newOutputStream(outputChannel));
					  
				
					res.sendRedirect("/");
				}
			}
		} catch (Exception ex) {
			throw new ServletException(ex);
		}
	}

	private void copy(InputStream input, OutputStream output) throws IOException {
		try {
			byte[] buffer = new byte[BUFFER_SIZE];
			int bytesRead = input.read(buffer);
			while (bytesRead != -1) {
				output.write(buffer, 0, bytesRead);
				bytesRead = input.read(buffer);
			}
		} finally {
			input.close();
			output.close();
		}
	}

}