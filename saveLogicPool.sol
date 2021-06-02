pragma solidity 0.5.16;


library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     * - Subtraction cannot overflow.
     *
     * _Available since v2.4.0._
     */
    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     *
     * _Available since v2.4.0._
     */
    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return mod(a, b, "SafeMath: modulo by zero");
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts with custom message when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     *
     * _Available since v2.4.0._
     */
    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }
}

interface IERC20 {
    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `recipient`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function safeTransfer(IERC20 token, address to, uint256 value) internal {
        callOptionalReturn(token, abi.encodeWithSelector(token.transfer.selector, to, value));
    }

    function safeTransferFrom(IERC20 token, address from, address to, uint256 value) internal {
        callOptionalReturn(token, abi.encodeWithSelector(token.transferFrom.selector, from, to, value));
    }

    function safeApprove(IERC20 token, address spender, uint256 value) internal {
        // safeApprove should only be called when setting an initial allowance,
        // or when resetting it to zero. To increase and decrease it, use
        // 'safeIncreaseAllowance' and 'safeDecreaseAllowance'
        // solhint-disable-next-line max-line-length
        require((value == 0) || (token.allowance(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, value));
    }

    function safeIncreaseAllowance(IERC20 token, address spender, uint256 value) internal {
        uint256 newAllowance = token.allowance(address(this), spender).add(value);
        callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, newAllowance));
    }

    function safeDecreaseAllowance(IERC20 token, address spender, uint256 value) internal {
        uint256 newAllowance = token.allowance(address(this), spender).sub(value, "SafeERC20: decreased allowance below zero");
        callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, newAllowance));
    }

    /**
     * @dev Imitates a Solidity high-level call (i.e. a regular function call to a contract), relaxing the requirement
     * on the return value: the return value is optional (but if data is returned, it must not be false).
     * @param token The token targeted by the call.
     * @param data The call data (encoded using abi.encode or one of its variants).
     */
    function callOptionalReturn(IERC20 token, bytes memory data) private {
        // We need to perform a low level call here, to bypass Solidity's return data size checking mechanism, since
        // we're implementing it ourselves.

        // A Solidity high level call has three parts:
        //  1. The target address is checked to verify it contains contract code
        //  2. The call itself is made, and success asserted
        //  3. The return value is decoded, which in turn checks the size of the returned data.
        // solhint-disable-next-line max-line-length
        require(address(token).isContract(), "SafeERC20: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success, "SafeERC20: low-level call failed");

        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

library Address {
    /**
     * @dev Returns true if `account` is a contract.
     *
     * [IMPORTANT]
     * ====
     * It is unsafe to assume that an address for which this function returns
     * false is an externally-owned account (EOA) and not a contract.
     *
     * Among others, `isContract` will return false for the following 
     * types of addresses:
     *
     *  - an externally-owned account
     *  - a contract in construction
     *  - an address where a contract will be created
     *  - an address where a contract lived, but was destroyed
     * ====
     */
    function isContract(address account) internal view returns (bool) {
        // According to EIP-1052, 0x0 is the value returned for not-yet created accounts
        // and 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470 is returned
        // for accounts without code, i.e. `keccak256('')`
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash := extcodehash(account) }
        return (codehash != accountHash && codehash != 0x0);
    }

    /**
     * @dev Converts an `address` into `address payable`. Note that this is
     * simply a type cast: the actual underlying value is not changed.
     *
     * _Available since v2.4.0._
     */
    function toPayable(address account) internal pure returns (address payable) {
        return address(uint160(account));
    }

    /**
     * @dev Replacement for Solidity's `transfer`: sends `amount` wei to
     * `recipient`, forwarding all available gas and reverting on errors.
     *
     * https://eips.ethereum.org/EIPS/eip-1884[EIP1884] increases the gas cost
     * of certain opcodes, possibly making contracts go over the 2300 gas limit
     * imposed by `transfer`, making them unable to receive funds via
     * `transfer`. {sendValue} removes this limitation.
     *
     * https://diligence.consensys.net/posts/2019/09/stop-using-soliditys-transfer-now/[Learn more].
     *
     * IMPORTANT: because control is transferred to `recipient`, care must be
     * taken to not create reentrancy vulnerabilities. Consider using
     * {ReentrancyGuard} or the
     * https://solidity.readthedocs.io/en/v0.5.11/security-considerations.html#use-the-checks-effects-interactions-pattern[checks-effects-interactions pattern].
     *
     * _Available since v2.4.0._
     */
    function sendValue(address payable recipient, uint256 amount) internal {
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-call-value
        (bool success, ) = recipient.call.value(amount)("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
}

contract Initializable {

    /**
     * @dev Indicates that the contract has been initialized.
     */
    bool private initialized;

    /**
     * @dev Indicates that the contract is in the process of being initialized.
     */
    bool private initializing;

    /**
     * @dev Modifier to use in the initializer function of a contract.
     */
    modifier initializer() {
        require(initializing || isConstructor() || !initialized, "Contract instance has already been initialized");

        bool isTopLevelCall = !initializing;
        if (isTopLevelCall) {
            initializing = true;
            initialized = true;
        }

        _;

        if (isTopLevelCall) {
            initializing = false;
        }
    }

    /// @dev Returns true if and only if the function is running in the constructor
    function isConstructor() private view returns (bool) {
        // extcodesize checks the size of the code stored in an address, and
        // address returns the current address. Since the code is still not
        // deployed when running a constructor, any checks on its code size will
        // yield zero, making it an effective way to detect if a contract is
        // under construction or not.
        address self = address(this);
        uint256 cs;
        assembly { cs := extcodesize(self) }
        return cs == 0;
    }

    // Reserved storage space to allow for layout changes in the future.
    uint256[50] private ______gap;
}

  contract CEO {
    address public OwnerAddress;
    address public WaitingAddress;
    uint256 public CreateUpdataTime;
    constructor () internal {//建立合同需要运行的
        OwnerAddress = msg.sender;
        WaitingAddress = msg.sender;
        CreateUpdataTime = 0;
    }
    event UpdateCEOApply(address CEOAddress,uint256 CreateUpdataTime);
    event UpdataConfirm(address CEOAddress);
    
    modifier onlyCEO() { 
        require (isCEO(),"You are not the CEO"); 
        _; 
    }
    
    function isCEO () public view returns (bool){
        return OwnerAddress ==  msg.sender;
    }

    function updateCEOApply (address CEOAddress) public onlyCEO{ //提交更新CEO
        require(CEOAddress != address(0), "GOV: new CEO is address(0)");
        WaitingAddress = CEOAddress;
        CreateUpdataTime = block.timestamp;
        emit UpdateCEOApply(WaitingAddress,CreateUpdataTime);
    }

    function updataConfirm () public  {//等24小时后，
        require( block.timestamp > CreateUpdataTime + (60*60*24) && CreateUpdataTime!=0, "Time has not expired");
        require (WaitingAddress == msg.sender,'You are not to update the address');
        OwnerAddress = WaitingAddress;
        CreateUpdataTime = 0;
        emit UpdataConfirm(OwnerAddress);
    }
}


contract saveRewardLogic  is CEO,Initializable{
    using SafeMath for uint256;
    using SafeERC20 for IERC20;

    address public implementation;

    //用户信息
    struct UserInfo {

        //存了多少sameToken
        uint256 amount;

        //偿还债务
        uint256 rewardDebt; 
        
    }
    uint256 public initialize_;

    //持有sameToken的每个用户的信息
    mapping (address => UserInfo)public userInfo;

    //上一次发生分配的区块编号
    uint256 public lastRewardBlock ;  

    //每股兑换价累积
    uint256 public accScoinPerShare = 0;

    //lptoken地址
    address public LpTokenAddress;

    //same地址
    address public SameCoinAddress;

    //一个区块奖励多少个scoin
    uint256 public scoinPerBlock = 0;

    //待发奖励额度
    uint256 public waitReward = 0;

    //初始奖池资金量(SameCoin)
    uint256 public initialSameCoin = 0;

    //发奖难度系数(单位%)
    uint256[6] public degree ;

    //难度级别对应的区块区间奖励一个区块的奖励系数
    uint256[6] public BONUS_MULTIPLIER ;

    uint256 public CreateWithdrawTime = 0;

    uint256 public temporaryDeduction = 0;

    //开始开采时的区块号
    uint256 public startBlock;

    

    event Deposit(address indexed user, uint256 amount);
    event Withdraw(address indexed user, uint256 amount);
    event UpdateScoinPerBlock_(address indexed user, uint256 amount);
    event Transfer(address indexed from, address indexed to, uint256 value);
    event BonusPoolWithdrawApply(uint256 amount);
    

    //创建时设置
    constructor () public {}

    function initialize(address sameCoinAddress_,address lpTokenAddress_) public initializer{
        scoinPerBlock = 1;
        lastRewardBlock = block.number;
        degree = [50,30,20,0,0,0];
        BONUS_MULTIPLIER = [3000000000000000000,1600000000000000000,1200000000000000000,0,0,0];
        CreateWithdrawTime = 0;
        temporaryDeduction = 0;
        startBlock = 0;
        LpTokenAddress = lpTokenAddress_;
        SameCoinAddress = sameCoinAddress_;
    }
    

    /**
    * 最高权限可设置 ⬇️
    */
    //修改难度
    function updataDegree (uint256 i ,uint256 val) public onlyCEO {
        require (i < degree.length , 'Is the index out of range' );
        degree[i] = val;
    }
    
    //设置一个区块的奖励系数
    function updateBONUS_MULTIPLIER(uint256 i ,uint256 val)  public onlyCEO {
        require (i < BONUS_MULTIPLIER.length , 'Is the index out of range' );
        BONUS_MULTIPLIER[i] = val;
    }

    //CEO往奖池充值
    function bonusPoolRecharge (uint256 amt) public onlyCEO  {
        //增加初开始值
        initialSameCoin = initialSameCoin.add(amt);
        //转SameCoin到奖金池
        IERC20(SameCoinAddress).safeTransferFrom(address(msg.sender), address(this), amt);
        emit Transfer(address(msg.sender), address(this), amt);
    }


    //CEO往奖池提款申请
    function bonusPoolWithdrawApply () public onlyCEO  {
        CreateWithdrawTime = now;
        emit BonusPoolWithdrawApply(CreateWithdrawTime);
    }

    //CEO往奖池提款申请确认
    function bonusPoolWithdrawConfirm (uint256 amt) public onlyCEO {
        
        require( now > CreateWithdrawTime + (60*60*24) && CreateWithdrawTime!=0, "Time has not expired");//1小时

        CreateWithdrawTime = 0;

        uint256 sameCoinSupply = IERC20(SameCoinAddress).balanceOf(address(this));
        require (sameCoinSupply >= amt,"Amt no good");
        //增加初始值
        initialSameCoin = initialSameCoin.sub(amt);
        //转SameCoin到奖金池
        safeScoinTransfer(address(msg.sender), amt);
        emit Transfer(address(this),address(msg.sender), amt);

    }
    



    /*function set_LpTokenAddr(address addr) public onlyCEO {
        LpTokenAddress = addr;
    }

    function set_SameCoinERC20Addr(address addr) public onlyCEO {
        SameCoinAddress = addr;
    }*/

    //设置 sameToken的每个用户的信息 
    /*function updateUserInfo(address addr,uint256 amount,uint256 rewardDebt)  public onlyCEO{
        userInfo[addr] = UserInfo({
            amount : amount,
            rewardDebt:rewardDebt
            });
    }*/

    //设置 最后一次记录区块数
    /*function updateLastRewardBlock (uint256 val)  public onlyCEO {
        lastRewardBlock = val;
    }*/

    //设置 每个scoin累积股数 accScoinPerShare
    /*function updateAccScoinPerShare (uint256 val)  public onlyCEO {
        accScoinPerShare = val;
    }*/

    //设置一个区块共有奖励
    function updateScoinPerBlock(uint256 val)  public onlyCEO {
        scoinPerBlock = val;
        emit UpdateScoinPerBlock_(address(msg.sender), val);
    }
    
    
    //查询难度系数 
    function nowdegree() public view returns(uint256){
        uint256 sameCoinSupply = IERC20(SameCoinAddress).balanceOf(address(this));
        uint256 lpSupply = IERC20(LpTokenAddress).balanceOf(address(this));
        uint256 awardProportion =  ((initialSameCoin.sub(sameCoinSupply).add((lpSupply.mul(accScoinPerShare).div(1e12)).sub(temporaryDeduction))).mul(1e27)).div(initialSameCoin);
        uint256 degreeLength = degree.length;
        uint256 tolatDegree = 0;
        for(uint256 x = 0; x<degreeLength;x++){
            tolatDegree=tolatDegree.add(degree[x]);
        }
        uint256 a = 0;
        uint256 ratio = 0;
        if(degreeLength==0){
            return 0;
        }
        for(uint256 i = 0; i<degreeLength;i++){
            a=a.add(degree[i]);
            ratio = a.mul(1e27).div(tolatDegree);
            if(awardProportion < ratio){
                return i;
            }
        }
        return degreeLength.sub(1);
    }

    //查SameCoin剩余   
    function getSameCoinBalanceOf(address addr) public view returns (uint256) {
        return IERC20(SameCoinAddress).balanceOf(addr);
    }

    //查LP剩余
    function getLPBalanceOf(address addr) public view returns (uint256) {
        return IERC20(LpTokenAddress).balanceOf(addr);
    }

    //查当前blocknumber
    function nowBlockNumber ()public view returns(uint256 val)  {
        return block.number;
    }
    
    
    //向某地址发samecoin 
    function safeScoinTransfer(address _to,uint256 _amount) internal {
        uint256 _SameCoin = getSameCoinBalanceOf(address(this));
        if (_amount > _SameCoin) {
            IERC20(SameCoinAddress).safeTransfer( _to, _SameCoin);
        } else {
            IERC20(SameCoinAddress).safeTransfer( _to, _amount);
        }
    }

    //向某地址发Lp
    function safeLpTransfer(address _to,uint256 _amount) internal {
        uint256 _LpToken_ = getLPBalanceOf(address(this));
        if (_amount > _LpToken_) {
            IERC20(LpTokenAddress).safeTransfer( _to, _LpToken_);
        } else {
            IERC20(LpTokenAddress).safeTransfer( _to, _amount);
        }
    }


    //区块差 = (当前区块数 - 上一次记录区块数) * 奖励系数
    function getMultiplier(uint256 _from, uint256 _to) public view returns (uint256) {
        //to为当前区块号 _from为上一个区块号
        //结束区块号数组
        uint256[] memory slowDownEndBlock;   

        uint256 degreeLength = degree.length;

        slowDownEndBlock = new uint256[](degreeLength);        
        
        uint256 tolatDegree = 0;
        for(uint256 x = 0; x<degreeLength;x++){
            tolatDegree=tolatDegree.add(degree[x]);
        }
        uint256 allMultiplier = 0;
        uint256 endNumber = 0;
        uint256 ratio = 0;


        for(uint256 i = 0; i<degreeLength;i++){
            if(BONUS_MULTIPLIER[i]*scoinPerBlock>0){
                //endNumber += (initialSameCoin*degree[i]/tolatDegree)/(BONUS_MULTIPLIER[i]*scoinPerBlock);
                endNumber += (initialSameCoin.mul(degree[i]).div(tolatDegree)).div(BONUS_MULTIPLIER[i].mul(scoinPerBlock));
            }else{
                endNumber += 0;
            }            
            slowDownEndBlock[i] = startBlock+endNumber;
        }

        for(uint256 a = 0; a<slowDownEndBlock.length;a++){
            if(_from < slowDownEndBlock[a] ){
                if(_to < slowDownEndBlock[a]){
                    allMultiplier += _to.sub(_from).mul(BONUS_MULTIPLIER[a]);
                    break;
                }else{
                    allMultiplier += slowDownEndBlock[a].sub(_from).mul(BONUS_MULTIPLIER[a]);
                    for(uint256 b = a+1; b<slowDownEndBlock.length;b++){
                        
                        if(_to < slowDownEndBlock[b]){
                            allMultiplier += _to.sub(slowDownEndBlock[b.sub(1)]).mul(BONUS_MULTIPLIER[b]);
                            break;
                        }
                        allMultiplier += slowDownEndBlock[b].sub(slowDownEndBlock[b.sub(1)]).mul(BONUS_MULTIPLIER[b]);
                    }
                    break;
                }        
            }
        }
        return allMultiplier;
        //return _to.sub(_from).mul(BONUS_MULTIPLIER[nowdegree()]);
    }

    //更新资金池数据updatePool
    function updatePool() public {
        if(startBlock == 0){
            startBlock = block.number;
        }
        //PoolInfo storage pool = poolInfo[_pid];
        if (block.number <= lastRewardBlock) {
            //如果当前区块 还没到下一次奖励区块
            //跳出
            return;
        }
        //这个合约里的对应币的lp余额
        uint256 lpSupply = IERC20(LpTokenAddress).balanceOf(address(this));

        if (lpSupply == 0) {
            lastRewardBlock = block.number;
            return;
        }
        //区块差
        uint256 multiplier = getMultiplier(lastRewardBlock, block.number);
        //可发总奖励蛋糕 = 多少个区块待发奖 * 一个区块多少个蛋糕 
        uint256 scoinReward = multiplier.mul(scoinPerBlock);
        //池里面的每股lp累积蛋糕 = 池里面的每股累积蛋糕 + （可发总奖励蛋糕 * 1000000000000 / 这个合约里的对应币的lp余额）
        accScoinPerShare = accScoinPerShare.add(scoinReward.mul(1e12).div(lpSupply));
        lastRewardBlock = block.number;
    }

    //存款（存SameUSD）
    function deposit( uint256 _amount) public {
        UserInfo storage user = userInfo[msg.sender];
        updatePool();
        if (user.amount > 0) {
            //等待分配数量 = 用户lp余额*该pid用户充值
            uint256 pending = user.amount.mul(accScoinPerShare).div(1e12).sub(user.rewardDebt);
            if(pending > 0) {
                //去资金池发钱
                safeScoinTransfer(address(msg.sender), pending);
            }
        }
        if (_amount > 0) {
            //在lptoken币合约上，转lptoken到资金池合约上
            IERC20(LpTokenAddress).safeTransferFrom(address(msg.sender), address(this), _amount);
            user.amount = user.amount.add(_amount);
        }
        user.rewardDebt = user.amount.mul(accScoinPerShare).div(1e12);
        temporaryDeduction = temporaryDeduction.add(user.rewardDebt);
        updatePool();
        emit Deposit(msg.sender, _amount);
    }

    //提币（提SameUSD 并且获得奖励）
    function withdraw(uint256 _amount) public {

        UserInfo storage user = userInfo[msg.sender];
        require(user.amount >= _amount, "withdraw: not good");

        updatePool();
        //pending = 当前用户pl存款 * 每股pl获得蛋糕份额 / 1000000000000 - 负债
        //总奖励 * (个人pl/总lp）
        uint256 pending = user.amount.mul(accScoinPerShare).div(1e12).sub(user.rewardDebt);
        if(pending > 0) {
            uint256 sameCoinSupply = IERC20(SameCoinAddress).balanceOf(address(this));
            if(pending > sameCoinSupply){
                pending = sameCoinSupply;
            }
            //去资金池发钱
            safeScoinTransfer(address(msg.sender), pending);
        }
        if(_amount > 0) {
            user.amount = user.amount.sub(_amount);
            //从资金盘取出pltoken
            IERC20(LpTokenAddress).transfer(address(msg.sender),_amount);
        }
        temporaryDeduction = temporaryDeduction.sub(user.rewardDebt);
        user.rewardDebt = user.amount.mul(accScoinPerShare).div(1e12);
        updatePool();
        emit Withdraw(msg.sender, _amount);
    }

    //查看待提取奖励
    function pendingRewards(address _user) external view returns (uint256) {
        UserInfo storage user = userInfo[_user];

        uint256 lpSupply = IERC20(LpTokenAddress).balanceOf(address(this));
        uint256 accScoinPerShare_ = accScoinPerShare;
        //当前区块号 > 发生分配的最后一个块编号 并且 该地址lp余额不为0时
        if (block.number > lastRewardBlock && lpSupply != 0) {

            //区块数量差 = (当前区块数 - 上一次记录区块数) * 奖励系数
            uint256 multiplier = getMultiplier(lastRewardBlock, block.number);
            //奖励 = 区块数量差 * 一个区块奖励多少个量 *该币奖金池分配点总和/总共分配点
            uint256 scoinReward = multiplier.mul(scoinPerBlock);

            accScoinPerShare_ = accScoinPerShare_.add(scoinReward.mul(1e12).div(lpSupply));
        }
        return user.amount.mul(accScoinPerShare_).div(1e12).sub(user.rewardDebt);
    }
    
    //只提取全部收益
    function claimAllRewards () public {
        UserInfo storage user = userInfo[msg.sender];
        updatePool();
        uint256 pending = user.amount.mul(accScoinPerShare).div(1e12).sub(user.rewardDebt);
        if(pending > 0) {
            //去资金池发钱
            safeScoinTransfer(address(msg.sender), pending);
        }
        updatePool();
        temporaryDeduction = temporaryDeduction.sub(user.rewardDebt);
        user.rewardDebt = user.amount.mul(accScoinPerShare).div(1e12);
    }
}


