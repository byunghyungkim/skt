package com.bitceramics.skt.dashboard.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

import com.bitceramics.skt.dashboard.model.*;
import com.bitceramics.skt.dashboard.service.*;
import com.luuf.core.utils.*;
import com.luuf.core.spring.controller.ControllerCore;;


/**
 * Dashboard Controller
 * @author patrick
 *
 */
@Controller
@RequestMapping("/dashboard")
public class DashboardController extends ControllerCore {

	@Resource
	@Autowired
	private DashBoardService dashBoardService;

	@RequestMapping(value="/")
	public String dashboard() {
		return "dashboard/dashboard_bhkim";
	}

	@RequestMapping( value="/getregion", method={ RequestMethod.POST } )
	public @ResponseBody String getRegion () {
		List<DashBoardModel> list =  dashBoardService.getRegion();
		return StringUtil.toJsonString(list);
	}

	@RequestMapping( value="/getdu", method={ RequestMethod.POST } )
	public @ResponseBody String getDu (DuModel duModel) {
		List<DuModel> list =  dashBoardService.getDu(duModel);
		return StringUtil.toJsonString(list);
	}
}
