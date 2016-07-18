module SCX
  class MyStrResEnum
    class << self
      # 登录相关 1001 - 1100
      def MYSTR_ROLE_REPEAT
        'Err1001'#'角色名重复'
      end
      def MYSTR_ROLE_EXISTS
        'Err1002'#'角色已存在'
      end
      def MYSTR_ROLE_EMPTY
        'Err1003'#'名称不能为空'
      end
      def MYSTR_ACCOUNT_EXISTS
        'Err1004'#'帐号已存在'
      end
      def MYSTR_GUILD_NAME_ERROR
        'Err1005'#'名称不合法！'
      end
      def MYSTR_GUILD_NAME_ERROR2
        'Err1006'#'名称已存在！'
      end
      def MYSTR_ACCOUNT_ERROR
        'Err1007'#'帐号或密码不正确'
      end

      # 好友模块 1101 - 1200
      def MYSTR_FRIEND_SELF
        'Err1101'#'不能添加自己为好友！'
      end
      def MYSTR_FRIEND_CANNOT_DEL_1
        'Err1102'#'对方不是你的好友！'
      end
      def MYSTR_FRIEND_APPLY_FORBID
        'Err1103'#'对方不允许申请'
      end
      def MYSTR_FRIEND_ALREADY_1
        'Err1104'#'对方已经是你的好友！'
      end
      def MYSTR_FRIEND_ALREADY_4
        'Err1105'#'成功发送申请信息！'
      end
      def MYSTR_FRIEND_ALREADY_5
        'Err1106'#'您已向该玩家发送好友申请，请耐心等待！'
      end
      def MYSTR_FRIEND_REFUSED_REQUEST
        'Err1107'#'拒绝你的好友申请！'
      end
      def MYSTR_FRIEND_MAX_COUNT
        'Err1108'#'您的好友已达到最大数%s个！'
      end
      def MYSTR_FRIEND_MAX_COUNT1
        'Err1109'#'对方的好友已达到最大数量！'
      end
      def MYSTR_FRIEND_NOT_EXISTS
        'Err1110'#'玩家不存在！'
      end
      def MYSTR_FRIEND_INFO_ERROR
        'Err1111'#'玩家信息错误！'
      end
      # 物品模块
      def MYSTR_ITEM_USE
        'Err2701'#'今天已使用过！'
      end
      # 商店
      def MYSTR_SHOP_REFRESH
        'Err2801'#'兑换失败，商店已刷新！'
      end

      # 邮件相关 1201 - 1300
      def MYSTR_MAIL_UPLV_TITLE
        'Mail1201'#'升级奖励'
      end
      def MYSTR_MAIL_UPLV_CONTENT
        'Mail1202'#'*14恭喜您达到*09%s*14级，请收下这些奖励吧！'
      end

      # 聊天相关 3901 - 4000
      def MYSTR_CAN_NOT_TALK
        'Err3901'#'你已被禁言！！'
      end

      def MYSTR_TXTART_ALL_CD
        'Err3902'#'世界频道发言需要间隔%s秒，请稍后再试。'
      end

      def MYSTR_TXTART_PRIVATE_LIMIT
        'Err3903'#'没有该玩家，请确认后重试。'
      end

      def MYSTR_TXTART_PRIVATE_LIMIT2
        'Err3904'#'该玩家处于离线状态'
      end

      def MYSTR_NOT_EXIST
        'Err3905'#'该玩家不在你的黑名单中'
      end

      # 排名赛
      def MYSTR_SYATEM_NOT_OPEN
        'Err4301'#'此功能在%s_%s开放'
      end

      def MYSTR_RANK_CHALLENGE_OTHER_RANK_CHANGE
        'Err4302'#'该排名对手已经改变,将为您刷新对手'
      end

      def MYSTR_RANK_CHANGE_NOT_SELF
        'Err4303'#'不能挑战自己'
      end

      def MYSTR_RANK_CHALLENGE_CD
        'Err4304'#'您的挑战时间未到'
      end

      def MYSTR_RANK_CHALLENGE_SELF_BE_CHALLENGED
        'Err4305'#'您正在被挑战中,无法挑战'
      end

      def MYSTR_RANK_CHALLENGE_OTHER_BE_CHALLENGED
        'Err4306'#'该玩家正在被挑战,无法挑战'
      end

      def MYSTR_RANK_CHALLENGE_COUNT
        'Err4307'#'挑战次数不足'
      end

      def MYSTR_RANK_CHANGE_NOT_CHALLENGE
        'Err4308'#'不能挑战比自己名次低的'
      end

      def MYSTR_RANK_CHALLENGE_MY_RANK_CHANGE
        'Err4309'#'您的排名已经改变,将为您刷新对手'
      end
      def MYSTR_RANK_MATCH_REWARD_NAME
        'Sys4310'#'排名赛奖励'
      end

      def MYSTR_ARENA_ALREADY_CHALLENGE
        'Err4401'#'打过啦'
      end
      def MYSTR_ARENA_ALREADY_GET
        'Err4402'#'领取过了'
      end
      def MYSTR_ARENA_NOT_GET
        'Err4403'#'不能领取'
      end

      # 活动
      def MYSTR_CDKEY_SUCCESS
        'Err4500'#'兑换成功！'
      end
      def MYSTR_CDKEY_FAIL
        'Err4501'#'无效激活码！'
      end
      def MYSTR_CDKEY_USED
        'Err4502'#'礼包码已被人用过！'
      end
      def MYSTR_CDKEY_RECEIVED
        'Err4503'#'您已经领取过礼包码！'
      end
      def MYSTR_CDKEY_OUTTIME
        'Err4504'#'礼包码已过期！'
      end
      def MYSTR_ACTIVITY_AIM_GETED
        'Err4505'#'已领取过奖励'
      end
      def MYSTR_ACTIVITY_FAILD
        'Err4506'#'未达到领取条件'
      end
      def MYSTR_ACTIVITY_INVALID
        'Err4507'#'活动未生效'
      end
      def MYSTR_ACTIVITY_NOT_EXIT
        'Err4508'#'活动不存在'
      end
      def MYSTR_ACTIVITY_NOT_START
        'Err4509'#'活动未开始'
      end
      def MYSTR_ACTIVITY_NOT_EXIT2
        'Err4510'#'档位不存在'
      end


      def MYSTR_SYSTEM_NOTICE_GETHERO
        'Sys1302'
        #*11【系统】*00皇天不负有心人，*09%s*00成功签约了*09%s*00，大展宏图，指日可待！
      end
      def MYSTR_SYSTEM_NOTICE__ARENA
        'Sys1303'
        #*11【系统】*00爱拼才会赢，*09%s*00旗下艺人成功击败各路大咖，登顶竞技场第一名！
      end
      def MYSTR_SYSTEM_NOTICE_LEVELUP
        'Sys1304'
        #*11【系统】*09%s*00励精图治，成功升级至*09%s*00级，可喜可贺！
      end
      def MYSTR_SYSTEM_NOTICE_HEROEVOUP
        'Sys1305'
        #*11【系统】*00台上十分钟，台下十年功，经过*09%s*00的全面包装，*09%s*00成功晋升至*00%s*00阶！
      end
      def MYSTR_SYSTEM_NOTICE_TREUP
        'Sys1306'#*11【系统】*09%s*00将*09%s*00精炼至*09%s*00阶，可谓财力雄厚！
      end

      def MYSTR_BATTLEARRAY_NAME
        '阵容%s'
      end
    end
  end
end
