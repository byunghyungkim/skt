package com.bitceramics.skt;

import java.text.*;
import java.util.*;

import org.slf4j.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.bitceramics.skt.dashboard.model.*;
import com.luuf.core.utils.*;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate );

		return "home";
	}

	@RequestMapping(value="/", method=RequestMethod.GET)
	public String landing() {
		return "landing";
	}
	@RequestMapping(value="/test", method=RequestMethod.POST)
	public @ResponseBody String test() {

		List<dummydata> dd = new ArrayList<dummydata>();

		dd.add(new dummydata("1", "ÇÑ±Û1", "B1", "C1", "D1", "E1") );
		dd.add(new dummydata("2", "A2", "B2", "C2", "D2", "E2") );
		dd.add(new dummydata("3", "A3", "B3", "C3", "D3", "E3") );
		dd.add(new dummydata("4", "A4", "B4", "C4", "D4", "E4") );
		dd.add(new dummydata("5", "A5", "B5", "C5", "D5", "E5") );

		return StringUtil.toJsonString(dd);
	}

	@RequestMapping(value="/jqchart", method=RequestMethod.GET)
	public @ResponseBody String jqchart() {

		List<dummydata> dd = new ArrayList<dummydata>();

		dd.add(new dummydata(Long.toString(Math.round(Math.random() * 20 -50)), "0", "0", "0", "0", "0 ") );
		Math.round(Math.random() * 20 - 10);
		dd.add(new dummydata(Long.toString(Math.round(Math.random() * 20 -50)),"0", "0", "0", "0", "E2") );
		List<JsonDataForJqchart> jsd = new ArrayList<JsonDataForJqchart>();

		Date now = new Date();
		jsd.add(new JsonDataForJqchart(now.toString(), (int) Math.round(Math.random() * 20 - 10)) );
		jsd.add(new JsonDataForJqchart(now.toString(), (int) Math.round(Math.random() * 20 + 10)) );
		return StringUtil.toJsonString(dd);
	}

	@RequestMapping(value="/jsonData", method=RequestMethod.POST)
	public @ResponseBody String jsonData() {

		List<JsonDataForJqchart> jsd = new ArrayList<JsonDataForJqchart>();

		jsd.add(new JsonDataForJqchart("12/20/2012", 20) );
		jsd.add(new JsonDataForJqchart("12/21/2012", 30) );
		jsd.add(new JsonDataForJqchart("12/22/2012", 80) );
		jsd.add(new JsonDataForJqchart("12/23/2012", 90) );
		jsd.add(new JsonDataForJqchart("12/24/2012", 50) );
		jsd.add(new JsonDataForJqchart("12/25/2012", 10) );

		return StringUtil.toJsonString(jsd);
	}
}
