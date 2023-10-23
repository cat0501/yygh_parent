package com.yygh.hosp.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;

/**
 * @author cat
 * @description
 * @date 2023/10/21 20:19
 */
@Configuration
@MapperScan("com.yygh.hosp.mapper")
public class HospConfig {
}
