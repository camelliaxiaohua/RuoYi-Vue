package com.ruoyi.housdata.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.housdata.domain.QueryUser;
import com.ruoyi.housdata.mapper.QueryUserMapper;
import com.ruoyi.housdata.service.IQueryUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


/**
 * 信息查询Service业务层处理
 *
 * @author camellia
 * @date 2024-10-24
 */
@Service
public class QueryUserServiceImpl implements IQueryUserService
{
    @Autowired
    private QueryUserMapper queryUserMapper;

    /**
     * 查询信息查询
     *
     * @param id 信息查询主键
     * @return 信息查询
     */
    @Override
    public QueryUser selectQueryUserById(Long id)
    {
        return queryUserMapper.selectQueryUserById(id);
    }

    /**
     * 查询信息查询列表
     *
     * @param queryUser 信息查询
     * @return 信息查询
     */
    @Override
    public List<QueryUser> selectQueryUserList(QueryUser queryUser)
    {
        return queryUserMapper.selectQueryUserList(queryUser);
    }

    /**
     * 新增信息查询
     *
     * @param queryUser 信息查询
     * @return 结果
     */
    @Override
    public int insertQueryUser(QueryUser queryUser)
    {
        queryUser.setCreateTime(DateUtils.getNowDate());
        return queryUserMapper.insertQueryUser(queryUser);
    }

    /**
     * 修改信息查询
     *
     * @param queryUser 信息查询
     * @return 结果
     */
    @Override
    public int updateQueryUser(QueryUser queryUser)
    {
        queryUser.setUpdateTime(DateUtils.getNowDate());
        return queryUserMapper.updateQueryUser(queryUser);
    }

    /**
     * 批量删除信息查询
     *
     * @param ids 需要删除的信息查询主键
     * @return 结果
     */
    @Override
    public int deleteQueryUserByIds(Long[] ids) {
        // 检查参数是否为空
        if (ids == null || ids.length == 0) {
            throw new RuntimeException("参数为空");
        }

        // 查询用户的身份信息
        List<QueryUser> queryUsers = queryUserMapper.selectUsersWithIdentity(ids[0]);

        // 如果查询到有身份，则禁止删除
        if (queryUsers != null && !queryUsers.isEmpty()) {
            throw new RuntimeException("该用户已关联身份，无法删除");
        }

        // 执行删除操作
        return queryUserMapper.deleteQueryUserByIds(ids);
    }


    /**
     * 删除信息查询信息
     *
     * @param id 信息查询主键
     * @return 结果
     */
    @Override
    public int deleteQueryUserById(Long id)
    {
        return queryUserMapper.deleteQueryUserById(id);
    }
}
