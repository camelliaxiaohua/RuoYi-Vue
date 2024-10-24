package com.ruoyi.housdata.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.housdata.mapper.HousdataIdentityMapper;
import com.ruoyi.housdata.domain.HousdataIdentity;
import com.ruoyi.housdata.service.IHousdataIdentityService;

/**
 * 用户身份标识Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-10-24
 */
@Service
public class HousdataIdentityServiceImpl implements IHousdataIdentityService 
{
    @Autowired
    private HousdataIdentityMapper housdataIdentityMapper;

    /**
     * 查询用户身份标识
     * 
     * @param id 主键
     * @return 用户身份标识
     */
    @Override
    public HousdataIdentity selectHousdataIdentityById(Long id)
    {
        return housdataIdentityMapper.selectHousdataIdentityById(id);
    }

    /**
     * 查询用户身份标识列表
     * 
     * @param housdataIdentity 用户身份标识
     * @return 用户身份标识
     */
    @Override
    public List<HousdataIdentity> selectHousdataIdentityList(HousdataIdentity housdataIdentity)
    {
        return housdataIdentityMapper.selectHousdataIdentityList(housdataIdentity);
    }

    /**
     * 新增用户身份标识
     * 
     * @param housdataIdentity 用户身份标识
     * @return 结果
     */
    @Override
    public int insertHousdataIdentity(HousdataIdentity housdataIdentity)
    {
        housdataIdentity.setCreateTime(DateUtils.getNowDate());
        housdataIdentity.setIdentityId(housdataIdentity.getIdentityId());
        return housdataIdentityMapper.insertHousdataIdentity(housdataIdentity);
    }

    /**
     * 修改用户身份标识
     * 
     * @param housdataIdentity 用户身份标识
     * @return 结果
     */
    @Override
    public int updateHousdataIdentity(HousdataIdentity housdataIdentity)
    {
        housdataIdentity.setUpdateTime(DateUtils.getNowDate());
        return housdataIdentityMapper.updateHousdataIdentity(housdataIdentity);
    }

    /**
     * 批量删除用户身份标识
     * 
     * @param identityIds 需要删除的用户身份标识主键
     * @return 结果
     */
    @Override
    public int deleteHousdataIdentityByIds(Long[] identityIds)
    {
        return housdataIdentityMapper.deleteHousdataIdentityByIds(identityIds);
    }

    /**
     * 删除用户身份标识信息
     * 
     * @param identityId 用户身份标识主键
     * @return 结果
     */
    @Override
    public int deleteHousdataIdentityById(Long id)
    {
        return housdataIdentityMapper.deleteHousdataIdentityByIdentityId(id);
    }
}
