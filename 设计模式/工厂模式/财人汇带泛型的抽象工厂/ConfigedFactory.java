package com.cairh.xpe.core.factory;

import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.cairh.xpe.core.utils.PropertiesUtils;
import com.cairh.xpe.core.utils.SpringContext;


/**
 * 功能说明: 配置化工厂基类<br>
 * 系统版本: v1.0<br>
 * 开发人员: @author 德勇<br>
 * 开发时间: 2015年7月14日<br>
 */
public abstract class ConfigedFactory<T> {
	
	private Logger logger = LoggerFactory.getLogger(ConfigedFactory.class);

	@Autowired
	private SpringContext springContext;

	protected T getBean() {
		String config = PropertiesUtils.get(getConfigKey());
		T bean = (T)springContext.getBean(getConfigMapping().get(config));
		if (bean == null) {
			logger.error("系统配置项[{}={}],但获取不到相应的实现类,请检查系统配置", getConfigKey(), config);
			throw new NullPointerException("系统配置有误导致空指针异常");
		}
		return bean;
	}
	
	/**
	 * 默认配置为空,取默认值
	 * @author hufeng
	 * @param defaultConfigKey
	 * @return
	 */
	protected T getBean(String defaultConfigValue) {
		String config = PropertiesUtils.get(getConfigKey());
		if (StringUtils.isBlank(config)) {
			logger.info("当前系统配置的{}为空,默认赋值为[{}]", getConfigKey(), defaultConfigValue);
			config = defaultConfigValue;
		}

		T bean = (T)springContext.getBean(getConfigMapping().get(config));
		if (bean == null) {
			logger.error("系统配置项[{}={}],但获取不到相应的实现类,请检查系统配置", getConfigKey(), config);
			throw new NullPointerException("系统配置有误导致空指针异常");
		}
		return bean;
	}

	protected abstract String getConfigKey();

	protected abstract Map<String, Class> getConfigMapping();

}
