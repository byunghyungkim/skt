package com.bitceramics.skt.dashboard.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.bitceramics.skt.dashboard.model.*;


public interface DashBoardMapper {
	@Select("select reg_no, reg_name, reg_desc from skt.test_reg")
	public List<DashBoardModel> getRegion();

	@Select("SELECT du_no, reg_no, du_name, du_desc FROM skt.test_du WHERE reg_no = #{REG_NO}")
	public List<DuModel> getDu(DuModel duModel);
}
