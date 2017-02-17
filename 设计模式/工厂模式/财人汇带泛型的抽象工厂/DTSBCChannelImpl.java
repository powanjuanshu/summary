package com.cairh.xpe.sisap.channels.service.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cairh.xpe.context.constants.Constant;
import com.cairh.xpe.context.constants.Fields;
import com.cairh.xpe.context.user.model.UserPresence;
import com.cairh.xpe.context.user.service.IUserPresenceService;
import com.cairh.xpe.sisap.channels.model.ChannelAttrSysMapping;
import com.cairh.xpe.sisap.channels.model.ChannelAttributeMapping;
import com.cairh.xpe.sisap.channels.model.ChannelAttributeNameDefine;
import com.cairh.xpe.sisap.channels.model.ChannelAttributeSysDefine;
import com.cairh.xpe.sisap.channels.model.ChannelAttributeValueDefine;
import com.cairh.xpe.sisap.channels.service.IChannelAttrSysMappingService;
import com.cairh.xpe.sisap.channels.service.IChannelAttributeMappingService;
import com.cairh.xpe.sisap.channels.service.IChannelAttributeNameDefineService;
import com.cairh.xpe.sisap.channels.service.IChannelAttributeValueDefineService;
import com.cairh.xpe.sisap.channels.service.IChannelDefineService;
import com.cairh.xpe.sisap.channels.service.IChannelStatDayLogService;

/**
 * 功能说明: 大同证券渠道<br>
 * 系统版本: v1.0<br>
 * 开发人员: @author tanglj<br>
 * 开发时间: 2015年9月10日<br>
 */
@Service
public class DTSBCChannelImpl extends ChannelDefaultImpl {

	@Autowired
	private IUserPresenceService userPresenceService;
	@Autowired
	private IChannelAttributeNameDefineService channelAttributeNameDefineService;
	@Autowired
	private IChannelAttributeValueDefineService channelAttributeValueDefineService;
	@Autowired
	private IChannelAttributeMappingService channelAttributeMappingService;
	@Autowired
	private IChannelDefineService channelDefineService;
	@Autowired
	private IChannelStatDayLogService channelStatDayLogService;
	@Autowired
	IChannelAttrSysMappingService channelAttrSysMappingService;

	Logger logger = LoggerFactory.getLogger(getClass());

	@Override
	public void calRegHitCount(String user_id, String short_url, boolean isNewRegAccount) {
		// 用户注册时统计渠道
		boolean next = super.calRegHitCount(user_id, short_url);
		// 判断程序是否继续往下执行
		if (!next) {
			return;
		}
		// 将渠道营业部作为用户开户营业部
		UserPresence userPresence = userPresenceService.qryByUserId(user_id);
		// 根据渠道属性代码（attribute_code）查询渠道属性名称定义
		ChannelAttributeNameDefine attrNameDefine = channelAttributeNameDefineService.getByAttributeCode(Constant.ATTR_BRANCH);
		if (userPresence != null && userPresence.getChannel_id() != null && attrNameDefine != null) {
			// 根据渠道编号(channel_id)渠道属性代码(attribute_code)获取渠道指定属性的值
			List<ChannelAttributeMapping> attributeMapping = channelAttributeMappingService.getByChannelIdAndAttrNameCode(userPresence.getChannel_id(), attrNameDefine.getAttribute_code());
			if (attributeMapping != null) {
				// 根据渠道主键查询渠道属性取值定义
				ChannelAttributeValueDefine channelAttributeValueDefine = channelAttributeValueDefineService.getById(attributeMapping.get(0).getChannel_attribute_id());
				if (channelAttributeValueDefine != null &&
					StringUtils.isNotBlank(channelAttributeValueDefine.getAttribute_value()) && 
					channelAttributeValueDefine.getAttribute_value().matches("\\d+")) {
					userPresence.setOpen_org_id(channelAttributeValueDefine.getAttribute_value());
					userPresenceService.update(userPresence);
					logger.info("操作成功");
				}
			}
		}
	}

	@Override
	public void calSubmitHitCount(String user_id, String short_url) {
		// 根据用户id查询用户信息
		UserPresence userPresence = userPresenceService.qryByUserId(user_id);
		// 基本资料提交时，如用户所选营业部和渠道营业部不一致，则取消用户为渠道用户
		ChannelAttributeSysDefine attrBranchDefine = channelAttributeSysDefineService.getByAttributeCode(Fields.ATTR_BRANCH).get(0);
		if (userPresence.getChannel_id() != null && attrBranchDefine != null) {
			// 根据渠道编号(channel_id)渠道属性代码(attribute_code)获取渠道指定属性的值
			ChannelAttrSysMapping attrSysMapping = channelAttrSysMappingService.getByChannelIdAndCode(userPresence.getChannel_id(), attrBranchDefine.getAttribute_sys_id()).get(0);
			if (attrSysMapping != null) {
				if (!String.valueOf(userPresence.getOpen_org_id()).equals(attrSysMapping.getAttribute_code_id())
						&& attrSysMapping.getAttribute_code_id().matches("\\d+")) {
					userPresence.setChannel_id("-1");
					userPresenceService.update(userPresence);
					logger.info("操作成功");
				}
			}
		}
	}
}
