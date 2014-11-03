package com.bitceramics.skt.dashboard.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitceramics.skt.dashboard.mapper.*;
import com.bitceramics.skt.dashboard.model.*;
import com.luuf.core.spring.service.ServiceCore;

@Service
public class DashBoardService extends ServiceCore {

	@Resource
	@Autowired
	private DashBoardMapper dashBoardMapper;

	/**
	 * Searching Region
	 * @param
	 * @return List<DashBoardModel>
	 */
	public List<DashBoardModel> getRegion() {
		List<DashBoardModel> list = null;

		try {
			list = dashBoardMapper.getRegion();
		} catch (Exception e) {
			LOG.fatal("Exception occurred while fetching region", e);
			return null;
		}

		return list;
	}

	/**
	 * Searching DU
	 * @param
	 * @return List<DuModel>
	 */
	public List<DuModel> getDu(DuModel duModel) {
		List<DuModel> list = null;

		try {
			list = dashBoardMapper.getDu(duModel);
		} catch (Exception e) {
			LOG.fatal("Exception occurred while fetching DU", e);
			return null;
		}

		return list;
	}
}
