package com.cairh.xpe.sisap.channels.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.collections.Predicate;
import org.apache.commons.lang3.StringUtils;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cairh.xpe.context.constants.Constant;
import com.cairh.xpe.context.constants.ErrorCode;
import com.cairh.xpe.context.constants.Fields;
import com.cairh.xpe.context.constants.SisapFunctions;
import com.cairh.xpe.context.constants.TextConstant;
import com.cairh.xpe.context.user.cache.BaseBankCache;
import com.cairh.xpe.context.user.model.BaseOrganization;
import com.cairh.xpe.context.user.service.IBaseOrganizationService;
import com.cairh.xpe.core.annotation.NoLogin;
import com.cairh.xpe.core.exception.BizException;
import com.cairh.xpe.core.validator.annotation.Num;
import com.cairh.xpe.sisap.channels.dao.ChannelAttrSysMappingMapper;
import com.cairh.xpe.sisap.channels.factory.ChannelFactory;
import com.cairh.xpe.sisap.channels.model.ChannelAttrSysMapping;
import com.cairh.xpe.sisap.channels.model.ChannelAttributeNameDefine;
import com.cairh.xpe.sisap.channels.model.ChannelAttributeValueDefine;
import com.cairh.xpe.sisap.channels.model.ChannelDefine;
import com.cairh.xpe.sisap.channels.service.IBaseBrokerService;
import com.cairh.xpe.sisap.channels.service.IChannelAttributeNameDefineService;
import com.cairh.xpe.sisap.channels.service.IChannelAttributeValueDefineService;
import com.cairh.xpe.sisap.channels.service.IChannelDefineService;

/**
 * 功能说明: 渠道推广<br>
 * 系统版本: v1.0<br>
 * 开发人员: @author zhougz<br>
 * 开发时间: 2015年8月10日<br>
 */
@Controller
public class ChannelAction {

	@Autowired
	IChannelDefineService channelDefineService;

	@Autowired
	IBaseOrganizationService baseOrganizationService;

	@Autowired
	IChannelAttributeNameDefineService iChannelAttributeNameDefineService;

	@Autowired
	IChannelAttributeValueDefineService iChannelAttributeValueDefineService;

	@Autowired
	IBaseBrokerService iBaseBrokerService;

	@Autowired
	BaseBankCache baseBankCache;
	
	@Autowired
	ChannelFactory channelFactory;

	@Autowired
	ChannelAttrSysMappingMapper channelAttrSysMappingMapper;
	/**
	 * 渠道信息获取 <code>CRH-KH0011(channels/CRH-MC0001)</code>
	 * @return
	 */
	@NoLogin
	@RequestMapping(SisapFunctions.CRH_MC0001)
	@ResponseBody
	public Map<String, Object> qryChannelInfo(String short_url, @Valid @NotBlank @Num String channel_id) {

		Map<String, Object> resMap = new HashMap<String, Object>();

		ChannelDefine channelDefine = channelDefineService.getById(channel_id);

		if (channelDefine == null && StringUtils.isNotBlank(short_url)) {
			channelDefine = channelDefineService.getByShortUrl(short_url);
		}

		if (channelDefine != null) {
			channel_id = channelDefine.getChannel_id();
		} else {
			throw new BizException("-1", "short_url[" + short_url + "], channel_id[" + channel_id + "] 对应渠道不存在！");
		}

		resMap.put(Fields.CHANNEL_CODE, channelDefine.getChannel_code());
		resMap.put(Fields.SHORT_URL, channelDefine.getShort_url());

		if (StringUtils.isNotBlank(channelDefine.getModel_id())) {
			resMap.put(Fields.CHANNEL_MODEL_ID, channelDefine.getModel_id());
		}

		if (StringUtils.isNotBlank(channelDefine.getOrg_id())) {

			BaseOrganization baseOrganization = baseOrganizationService.getById(channelDefine.getOrg_id());
			if (baseOrganization != null && StringUtils.isNotBlank(baseOrganization.getOrg_code())) {
				resMap.put(Fields.CHANNEL_ORG_CODE, baseOrganization.getOrg_code());
			}

		}

		List<ChannelAttrSysMapping> channelAttrSysMappList = channelAttrSysMappingMapper.getByChannelId(channel_id);
		
		List<String> attributeCodeList = channelAttrSysMappingMapper.getAttributeCode(channel_id);
		
		List<Map<String, Object>> nameMapList = new ArrayList<Map<String, Object>>();

		for(int i=0;i<attributeCodeList.size();i++){
			Map<String, Object> nameMap = new HashMap<String, Object>();
			nameMap.put(Fields.ATTR_NAME, attributeCodeList.get(i));
			nameMap.put(Fields.ATTR_CODE, attributeCodeList.get(i));
			List<Map<String, Object>> valMapList = channelDefineService.dealSysAttrList(channelAttrSysMappList, attributeCodeList.get(i));
            nameMap.put(Fields.ATTR_VALUE, valMapList);
			nameMapList.add(nameMap);
			resMap.put(Fields.CHANNEL_ATTRS, nameMapList);
		}
		return resMap;
	}
	
	/**
	 * 用户开户成功时统计渠道<code>channels/CRH-MC0002</code>
	 * @author yejg
	 * @param user_id
	 * @return
	 */
	@NoLogin
	@RequestMapping(SisapFunctions.CRH_MC0002)
	@ResponseBody
	public Map<String, Object> calOpenSuccessCount(@Valid @NotBlank @Num String user_id) {
		channelFactory.getInstance().calOpenSuccessCount(user_id);
		return new HashMap<String, Object>();
	}
	
	/**
	 * 用户修改资料时统计渠道<code>channels/CRH-MC0003</code>
	 * @author yejg
	 * @param user_id
	 * @return
	 */
	@RequestMapping(SisapFunctions.CRH_MC0003)
	@ResponseBody
	public Map<String, Object> calSubmitHitCount(@Valid @NotBlank @Num String user_id, String short_url) {
		channelFactory.getInstance().calSubmitHitCount(user_id, short_url);
		return new HashMap<String, Object>();
	}
	
	/**
	 * 判断是否有营业部挂接属性
	 * @author yejg
	 * @param channel_id
	 * @return
	 */
	@RequestMapping(SisapFunctions.CRH_MC0005)
	@ResponseBody
	public Map<String, Object> checkChannelDefine(@Valid @NotBlank @Num String channel_id) {
		Map<String, Object> resMap = new HashMap<String, Object>();
		// 是否有营业部挂接属性
		boolean channelBranchFlag = false;
		ChannelDefine channelDefine = channelDefineService.getById(channel_id);
		if (channelDefine != null) {
			List<ChannelAttributeValueDefine> list = iChannelAttributeValueDefineService.getChlValByAttrNameCode(channel_id, Constant.ATTR_BRANCH);
			if (list != null && list.size() > 0) {
				BaseOrganization org = baseOrganizationService.getById(list.get(0).getAttribute_value());
				if (org != null) {
					channelBranchFlag = true;
				}
			}
			resMap.put(Fields.ERROR_NO, channelBranchFlag ? "0" : ErrorCode.NO_CHANNEL_BRANCH);
			resMap.put(Fields.ERROR_INFO, channelBranchFlag ? TextConstant.HAS_CHANNEL_BRANCH : TextConstant.NO_CHANNEL_BRANCH);
		} else {
			resMap.put(Fields.ERROR_NO, ErrorCode.NO_CHANNEL_DEFINE);
			resMap.put(Fields.ERROR_INFO, TextConstant.NO_CHANNEL_DEFINE);
		}

		return resMap;
	}
	

	/**
	 * 用户开户注册时统计渠道 <新增接口><code>channels/CRH-MC0006</code>
	 * @author hufeng
	 * @param user_id
	 * @param short_url
	 * @param is_first_reg
	 * @return
	 */
	@NoLogin
	@RequestMapping(SisapFunctions.CRH_MC0006)
	@ResponseBody
	public Map<String, Object> calRegHitCount(@Valid @NotBlank @Num String user_id, String short_url,boolean is_first_reg) {
		channelFactory.getInstance().calRegHitCount(user_id,short_url,is_first_reg);
		return new HashMap<String, Object>();
	}
}
