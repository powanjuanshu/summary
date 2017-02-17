package com.cairh.xpe.sisap.channels.factory;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.cairh.xpe.core.exception.BizException;
import com.cairh.xpe.core.factory.ConfigedFactory;
import com.cairh.xpe.sisap.channels.service.IChannelService;
import com.cairh.xpe.sisap.channels.service.impl.CFZQChannelImpl;
import com.cairh.xpe.sisap.channels.service.impl.CICCChannelImpl;
import com.cairh.xpe.sisap.channels.service.impl.ChannelDefaultImpl;
import com.cairh.xpe.sisap.channels.service.impl.DTSBCChannelImpl;
import com.cairh.xpe.sisap.channels.service.impl.JHZQChannelImpl;
import com.cairh.xpe.sisap.channels.service.impl.KYZQChannelImpl;
import com.cairh.xpe.sisap.channels.service.impl.NESCChannelImpl;

/**
 * 功能说明: 渠道工厂类（只在用户注册及开户成功后计算 ）<br>
 * 系统版本: v1.0<br>
 * 开发人员: @author hufeng<br>
 * 开发时间: Aug 25, 2015<br>
 */
@Service
public class ChannelFactory extends ConfigedFactory<IChannelService> {

	Logger logger = LoggerFactory.getLogger(getClass());

	private Map<String, Class> configMapping = new HashMap<String, Class>();

	public static final String CONFIG_KEY = "interface.channel.bean.ref";

	@Override
	protected String getConfigKey() {
		return CONFIG_KEY;
	}

	@Override
	protected Map<String, Class> getConfigMapping() {
		configMapping.put("defaultChannel", ChannelDefaultImpl.class);
		configMapping.put("jhzqChannel", JHZQChannelImpl.class);
		configMapping.put("ciccChannel", CICCChannelImpl.class);
		configMapping.put("dtsbcChannel", DTSBCChannelImpl.class);
		configMapping.put("nescChannel", NESCChannelImpl.class);
		configMapping.put("kyzqChannel", KYZQChannelImpl.class);
		configMapping.put("cfzqChannel", CFZQChannelImpl.class);
		return configMapping;
	}

	/**
	 * 获取默认的配置
	 * @author hufeng
	 * @return
	 */
	public IChannelService getInstance() {
		try {
			return getBean("defaultChannel");
		} catch (Exception e) {
			logger.error(e.getMessage());
			throw new BizException("-1", e.getMessage());
		}
	}

}
