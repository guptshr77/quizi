package com.quizi.bo;

import java.util.List;

import com.quizi.dal.ReportDAO;
import com.quizi.model.Report;

/*
 * Class: ReportBO
 * Description: This class gets the list of users' responses with correct answers and sends to the controller.  
 */
public class ReportBO {

	public List<Report> getReportData(int userId) {
		ReportDAO reponse = new ReportDAO();
		return reponse.getReport(userId, true);
	}			
}
