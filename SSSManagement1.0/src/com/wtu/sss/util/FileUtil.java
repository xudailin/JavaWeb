package com.wtu.sss.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;


public class FileUtil {
	
	private ArrayList<String> resultData = new ArrayList<String>(); 

	public ArrayList<String> getData(String urlRef) {
		try {
			URL url = new URL(urlRef);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setDoInput(true);
			conn.connect();
			InputStream is = conn.getInputStream();
			InputStreamReader  isReader = new InputStreamReader(is);
			BufferedReader bReader = new BufferedReader(isReader);
			String input = "";
			while ((input = bReader.readLine()) != null) {
			resultData.add(input);
			}
		
			isReader.close();
			is.close();
			conn.disconnect();
		
		} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		}
		return resultData;
	}

	public String getInfo(String filePath){
		ArrayList<String> list = getData(filePath);
		StringBuffer sb=new StringBuffer("");
		for (int i = 0; i < list.size(); i++) {
			sb.append(list.get(i));
		}
		return sb.toString();
	}

}
