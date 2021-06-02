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
    bool public initialized;

    /**
     * @dev Indicates that the contract is in the process of being initialized.
     */
    bool public initializing;

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
    function isConstructor() public view returns (bool) {
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


contract mintRewardLogic  is CEO,Initializable{
    using SafeMath for uint256;
    using SafeERC20 for IERC20;

    address public implementation;

    address public massetAddress;

    uint256 public CreateWithdrawTime = 0;

    //用户信息
    struct UserInfo {

        //上一次记录的区块区间id
        uint256 lastBlockIntervalId;

        //待领取sameCoin
        uint256 unclaimedSameCoin;

        //未结算sameCoin
        uint256 pendingSameCoin;
        
        //
        uint256 lastRewardInterval;
    }

    struct MintBlockIdInfo {
        uint256 totalMintAmt;
        uint256 lastRewardInterval;
        uint256 nowdegree_;
        bool noNull;
        bool noCut;
    }

    //用户信息 userInfo[addr]
    mapping (address => UserInfo) public userInfo;

    //在某区块区间的总存款净值 totalMintAmt[id]
    mapping (uint256 => MintBlockIdInfo) public mintBlockIdInfo;

    //在某区块区间（个人）的总存款净值 totalPerMintAmt[id][addr]
    mapping (uint256 => mapping (address => uint256)) public totalPerMintAmt;

    address public sameCoinAddress;

    //奖励间隔 例如，15分钟间隔，因为以太每15秒更新一次区块，15分钟相当于60次更新
    uint256 public rewardInterval;

    //发奖难度系数(单位%)（注意：难度系数中途跨越或修改会影响到没有取出奖励）
    uint256[6] public degree ;

    //难度级别对应的区块区间奖励多少个scoin
    uint256[6] public sameCoinPerBlock ;

    //总的已经发奖量
    uint256 public totalAwards = 0;

    //初始奖池资金量(SameCoin)
    uint256 public initialSameCoin = 0;

    //上一次纪录被挖区块号ID
    uint256 public lastMintBlockIntervalId = 0;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event show(uint256 val1,uint256 val2);
    event BonusPoolWithdrawApply(uint256 amount);

    //创建时设置
    constructor () public {}

    function initialize(address sameCoinAddress_ , address massetAddress_) public initializer{
        rewardInterval = 10;
        degree = [50,50,0,0,0,0];
        sameCoinPerBlock = [1000000000000000000,500000000000000000,0,0,0,0];
        sameCoinAddress = sameCoinAddress_;
        massetAddress = massetAddress_;
        CreateWithdrawTime = 0;
        lastMintBlockIntervalId = 0;
    }

    /*function setMassetAddress (address addr) public onlyCEO{
        massetAddress = addr;
    }*/
    

    modifier nolyLockingAddress() { 
        require (isLockingAddress(),"You are not the LockingAddress"); 
        _; 
    }

    function isLockingAddress () public view returns (bool){
        return (
            massetAddress ==  msg.sender ||
            OwnerAddress == msg.sender
            ) ;
    }

    //当前难度级别
    function nowdegree() public view returns(uint256){
        uint256 degreeLength = degree.length;
        uint256 tolatDegree = 0;
        for(uint256 x = 0; x<degreeLength;x++){
            tolatDegree=tolatDegree.add(degree[x]);
        }
        //当前发奖总额占初总奖池百分比
        uint256 awardProportion = totalAwards.mul(1e27).div(initialSameCoin);
        uint256 a = 0;
        if(degreeLength==0){
            return 0;
        }
        for(uint256 i = 0; i<degreeLength;i++){
            a=a.add(degree[i]);
            uint256 ratio = a.mul(1e27).div(tolatDegree);
            if(awardProportion < ratio){
                return i;
            }
        }
        return degreeLength.sub(1);
    }

    //修改难度
    function updataDegree (uint256 i ,uint256 val) public onlyCEO {
        require (i < degree.length , 'Is the index out of range' );
        degree[i] = val;
    }
    

    //设置sameCoinPerBlock
    function updataSameCoinPerBlock (uint256 i ,uint256 val) public onlyCEO {
        require (i < sameCoinPerBlock.length , 'Is the index out of range' );
        sameCoinPerBlock[i] = val;
    }

    //奖池充值
    function bonusPoolRecharge (uint256 amt) public onlyCEO  {
        //增加初开始值
        initialSameCoin = initialSameCoin.add(amt);
        //转SameCoin到奖金池
        IERC20(sameCoinAddress).safeTransferFrom(address(msg.sender), address(this), amt);
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

        uint256 sameCoinSupply = IERC20(sameCoinAddress).balanceOf(address(this));
        require (sameCoinSupply >= amt,"Amt no good");
        //增加初始值
        initialSameCoin = initialSameCoin.sub(amt);
        IERC20(sameCoinAddress).safeTransfer(address(msg.sender),amt);
        emit Transfer(address(this),address(msg.sender),amt);

    }
    //设置SameCoinERC20 地址
   /* function set_SameCoinERC20(address addr) public onlyCEO {
        sameCoinAddress = addr;
    }*/
    
    //设置奖励间隔rewardInterval
    function updataRewardInterval (uint256 val) public onlyCEO {
        rewardInterval = val;
    }
    
    //function查看当前区块区间id
    function nowBlockId () public view returns(uint256){
        return block.number.div(rewardInterval);
    }
    
    //function区块区间ID与当前区块区间id是否不同
    function BlockIdDiff(address addr) public view returns(bool) {
        if(userInfo[addr].lastBlockIntervalId != nowBlockId()){
            return true;
        }else{
            return false;
        }
    }
    
    //function查看当前地址sameCoin奖励剩余
    function getSameCoinBalanceOf(address addr) public view returns (uint256) {
        return IERC20(sameCoinAddress).balanceOf(addr);
    }

    //function查看当前合约剩余sameCoin奖励剩余
    function getSameCoinTotalBalanceOf() public view returns (uint256) {
        return getSameCoinBalanceOf(address(this));
    }

    //function查看个人未结算samecoin利润
    function pendingSameCoin(address addr) public view returns (uint256){
        UserInfo storage user = userInfo[addr];
        
        uint256 lastBlockIntervalId_ = user.lastBlockIntervalId;
        uint256 totalPerMintAmt_ = totalPerMintAmt[lastBlockIntervalId_][addr];
        uint256 totalMintAmt_ = mintBlockIdInfo[lastBlockIntervalId_].totalMintAmt;
        
        if(totalMintAmt_ == 0){
            return 0;
        }
        //先看看区块区间id有没有差，
        if(!BlockIdDiff(addr)){
            return 0;
        }
        //uint256 nowdegree_ = nowdegree();
        uint256 nowdegree_ = mintBlockIdInfo[lastBlockIntervalId_].nowdegree_;
        uint256 a = sameCoinPerBlock[nowdegree_].mul(1e27).div(totalMintAmt_);
        return totalPerMintAmt_.mul(a).div(1e27);
    }

    //检查区间id系数是否人为改动，如果是，累积数据清0
    function checkIntervalIdDiff (address addr) public  {
        UserInfo storage user = userInfo[addr];
        uint256 lastBlockIntervalId_ = user.lastBlockIntervalId;
        uint256 nowBlockId_ = nowBlockId();
        MintBlockIdInfo storage mintBlockIdInfo_ = mintBlockIdInfo[nowBlockId_];
        if(mintBlockIdInfo_.lastRewardInterval != rewardInterval){
            mintBlockIdInfo_.lastRewardInterval = rewardInterval;
            mintBlockIdInfo_.totalMintAmt = 0;
        }
        if(user.lastRewardInterval != rewardInterval){
            user.lastRewardInterval = rewardInterval;
            totalPerMintAmt[lastBlockIntervalId_][addr] = 0;
        }
    }
    
    //更新以挖总数量
    function updateTotalAwards (bool addTotalAwardsType) public returns(uint256) {
        if(lastMintBlockIntervalId != nowBlockId() && addTotalAwardsType){
            lastMintBlockIntervalId = nowBlockId();
            //累积当前每个块发放奖励
            totalAwards = totalAwards.add(sameCoinPerBlock[nowdegree()]);
            if(totalAwards>initialSameCoin){
                totalAwards = initialSameCoin;
            }
        }
        return totalAwards;
    }

    
    //个人结算 settle
    function settle (address addr,bool addTotalAwardsType) public {
        UserInfo storage user = userInfo[addr];
        uint256 pendingSameCoin_ = pendingSameCoin(addr);
        //防止更新以挖总数量超过 initialSameCoin初始 先记录更改前的TotalAwards为oldTotalAwards，再更新updateTotalAwards
        /*uint256 oldTotalAwards = totalAwards;
        if(oldTotalAwards>initialSameCoin){
            uint256 pendingSameCoin_ = initialSameCoin.sub(oldTotalAwards);
        }*/
        uint256 oldTotalAwards = totalAwards;
        totalAwards = updateTotalAwards(addTotalAwardsType);
        if(totalAwards>initialSameCoin){
            pendingSameCoin_ = initialSameCoin.sub(oldTotalAwards);
        }
        user.pendingSameCoin = pendingSameCoin_;
        uint256 nowBlockId_ = nowBlockId();
        if(BlockIdDiff(addr)){
            checkIntervalIdDiff (addr);
            user.unclaimedSameCoin = user.unclaimedSameCoin.add(pendingSameCoin_);
            user.pendingSameCoin = 0;
            user.lastBlockIntervalId = nowBlockId_;
            return;
        }
        checkIntervalIdDiff (addr);
        return;
    }
    

    //转移sameCoin
    function safeScoinTransfer(address _to,uint256 _amount) internal {
        uint256 _SameCoin = getSameCoinBalanceOf(address(this));
        if (_amount > _SameCoin) {
            IERC20(sameCoinAddress).safeTransfer( _to, _SameCoin);
        } else {
            IERC20(sameCoinAddress).safeTransfer( _to, _amount);
        }
    }

    //领奖
    function receivePrize (address addr) public {
        settle(addr,false);
        uint256 _unclaimedSameCoin = userInfo[addr].unclaimedSameCoin;
        uint256 _pendingSameCoin = pendingSameCoin(addr);
        uint256 _amount = _unclaimedSameCoin.add(_pendingSameCoin);
        safeScoinTransfer(addr,_amount);
        userInfo[addr].unclaimedSameCoin = 0;
        userInfo[addr].pendingSameCoin = 0;
        userInfo[addr].lastBlockIntervalId = nowBlockId();
    }
    

    //function兑换mint时，进行加净值
    function sameUSDToMint(address addr,uint256 amt) public nolyLockingAddress{
        uint256 nowBlockId_ = nowBlockId();
        if(!mintBlockIdInfo[nowBlockId_].noNull){
            mintBlockIdInfo[nowBlockId_].nowdegree_ = nowdegree();
        }
        mintBlockIdInfo[nowBlockId_].noNull = true;
        mintBlockIdInfo[nowBlockId_].noCut = true;
        settle(addr,true);
        totalPerMintAmt[nowBlockId_][addr] = totalPerMintAmt[nowBlockId_][addr].add(amt);
        mintBlockIdInfo[nowBlockId_].totalMintAmt = mintBlockIdInfo[nowBlockId_].totalMintAmt.add(amt);
    }
    

    //function兑换redeem时，进行减净值
    function sameUSDToRredeem (address addr,uint256 amt) public nolyLockingAddress{
        
        uint256 nowBlockId_ = nowBlockId();
        if(totalPerMintAmt[nowBlockId_][addr]<amt){
            amt = totalPerMintAmt[nowBlockId_][addr];
        }
        totalPerMintAmt[nowBlockId_][addr] = totalPerMintAmt[nowBlockId_][addr].sub(amt);
        mintBlockIdInfo[nowBlockId_].totalMintAmt = mintBlockIdInfo[nowBlockId_].totalMintAmt.sub(amt);
        //检查赎回后，是否还有人在挖，没人挖的话扣回累积挖矿数量
        if(lastMintBlockIntervalId == nowBlockId_ && mintBlockIdInfo[nowBlockId_].totalMintAmt == 0 && mintBlockIdInfo[nowBlockId_].noNull&& mintBlockIdInfo[nowBlockId_].noCut){
            uint256 nowdegree_ = mintBlockIdInfo[nowBlockId_].nowdegree_;
            totalAwards = totalAwards.sub(sameCoinPerBlock[nowdegree_]);
            mintBlockIdInfo[nowBlockId_].noCut = false;
        }
        settle(addr,false);

    }
}





