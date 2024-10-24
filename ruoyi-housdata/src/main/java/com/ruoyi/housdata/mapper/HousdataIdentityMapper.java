package com.ruoyi.housdata.mapper;

import java.util.List;
import com.ruoyi.housdata.domain.HousdataIdentity;

/**
 * 用户身份标识Mapper接口
 * 
 * @author ruoyi
 * @date 2024-10-24
 */
public interface HousdataIdentityMapper 
{
    /**
     * 查询用户身份标识
     * 
     * @param identityId 用户身份标识主键
     * @return 用户身份标识
     */
    public HousdataIdentity selectHousdataIdentityById(Long Id);

    /**
     * 查询用户身份标识列表
     * 
     * @param housdataIdentity 用户身份标识
     * @return 用户身份标识集合
     */
    public List<HousdataIdentity> selectHousdataIdentityList(HousdataIdentity housdataIdentity);

    /**
     * 新增用户身份标识
     * 
     * @param housdataIdentity 用户身份标识
     * @return 结果
     */
    public int insertHousdataIdentity(HousdataIdentity housdataIdentity);

    /**
     * 修改用户身份标识
     * 
     * @param housdataIdentity 用户身份标识
     * @return 结果
     */
    public int updateHousdataIdentity(HousdataIdentity housdataIdentity);

    /**
     * 删除用户身份标识
     * 
     * @param identityId 用户身份标识主键
     * @return 结果
     */
    public int deleteHousdataIdentityByIdentityId(Long identityId);

    /**
     * 批量删除用户身份标识
     * 
     * @param identityIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteHousdataIdentityByIds(Long[] identityIds);
}
