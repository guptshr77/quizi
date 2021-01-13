package com.quizi.bo;

import java.util.List;

import com.quizi.dal.ReportDAO;
import com.quizi.model.Report;

public class ReportBO {

	public List<Report> getReportData(int userId) {
		ReportDAO reponse = new ReportDAO();
		return reponse.getReport(userId, true);
	}			
}
