package com.ruoyi.housdata.mapper;

import java.util.List;
import com.ruoyi.housdata.domain.QueryUser;
import org.apache.ibatis.annotations.Param;

/**
 * 用户信息Mapper接口
 * 
 * @author ruoyi
 * @date 2024-10-22
 */
public interface QueryUserMapper 
{
    /**
     * 查询用户信息
     * 
     * @param id 用户信息主键
     * @return 用户信息
     */
    public QueryUser selectQueryUserById(Long id);

    /**
     * 查询用户信息列表
     * 
     * @param queryUser 用户信息
     * @return 用户信息集合
     */
    public List<QueryUser> selectQueryUserList(QueryUser queryUser);

    /**
     * 新增用户信息
     * 
     * @param queryUser 用户信息
     * @return 结果
     */
    public int insertQueryUser(QueryUser queryUser);

    /**
     * 修改用户信息
     * 
     * @param queryUser 用户信息
     * @return 结果
     */
    public int updateQueryUser(QueryUser queryUser);

    /**
     * 删除用户信息
     * 
     * @param id 用户信息主键
     * @return 结果
     */
    public int deleteQueryUserById(Long id);

    /**
     * 批量删除用户信息
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteQueryUserByIds(Long[] ids);

    List<QueryUser> selectUsersWithIdentity(@Param("id") Long identityId);
}
