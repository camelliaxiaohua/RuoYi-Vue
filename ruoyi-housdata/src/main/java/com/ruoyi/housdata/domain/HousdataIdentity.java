package com.ruoyi.housdata.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 用户身份标识对象 housdata_identity
 * 
 * @author ruoyi
 * @date 2024-10-24
 */
public class HousdataIdentity extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 身份主键 */
    @Excel(name = "身份主键")
    private Long identityId;

    /** 主键 */
    private Long id;

    /** 身份名称 */
    @Excel(name = "身份名称")
    private String identityName;

    /** 身份标识 */
    @Excel(name = "身份标识")
    private String identityType;

    public void setIdentityId(Long identityId) 
    {
        this.identityId = identityId;
    }

    public Long getIdentityId() 
    {
        return identityId;
    }
    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setIdentityName(String identityName) 
    {
        this.identityName = identityName;
    }

    public String getIdentityName() 
    {
        return identityName;
    }
    public void setIdentityType(String identityType) 
    {
        this.identityType = identityType;
    }

    public String getIdentityType() 
    {
        return identityType;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("identityId", getIdentityId())
            .append("id", getId())
            .append("identityName", getIdentityName())
            .append("identityType", getIdentityType())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
