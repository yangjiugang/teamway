package com.fc.flf.portal.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Calculator {

	// 公积金贷款计算器
		@RequestMapping(value = "/providentFundCredit")
		public String taxes() {
			return "/portal/ProvidentFundCredit";
		}

		@RequestMapping(value = "/applicationAmount")
		public String applicationAmount() {
			return "/portal/ApplicationAmount";
		}

		// 税费计算器
		@RequestMapping(value = "/taxesCalculator")
		public String taxesCalculator() {
			return "/portal/TaxesCalculator";
		}

		@RequestMapping(value = "/taxesResult")
		public String taxesResult() {
			return "/portal/TaxesResult";
		}

		// 提前还款计算器
		@RequestMapping(value = "/advanceRepayment")
		public String advanceRepayment() {
			return "/portal/AdvanceRepayment";
		}

		// 贷款计算器
		@RequestMapping(value = "/credit")
		public String credit() {
			return "/portal/CreditCalculator";
		}

		// 购房能力评估计算器
		@RequestMapping(value = "/capacityAssesCalc")
		public String capacityAssesCalc() {
			return "/portal/CapacityAssesCalc";
		}
	
}
