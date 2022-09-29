// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract JennyCoins {

    string public name;
    string public symbol;
    uint256 public decimals;
    uint256 public totalSupply;

    address public owner ;

    mapping (address => uint256) balances;
    mapping(address => mapping(address => uint256)) allowance;


    constructor(){
        name = "JennyCoins";
        symbol = "JCN";
        decimals = 18;
        totalSupply = 2000000;
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(owner == msg.sender);
        _;
    }

    function balanceOf(address account) public view returns(uint256 balance_){
        return balance_ = balances[account];
    }

    function transfer(address from, address to, uint256 amount) external {
        require(from != address(0), "ERC20: cannot transfer from address zero");
        require(to != address(0), "ERC20: cannot transfer to address zero");
        uint256 fromBalance = balances[from];
        require(fromBalance > amount, "Insufficient Balance");


        balances[from] = fromBalance - amount;
        balances[to] += amount;
        
    }

    function mint(address account, uint256 amount) external onlyOwner {
        require(account != address(0), "ERC20: cannot mint to address zero");

        totalSupply += amount;
        balances[account] += amount;
    }
    
    function approve(address _owner, address _spender, uint256 amount) external{
        require(_owner != address(0), "ERC20: cannot approve address zero");
        require(_spender != address(0), "ERC20: cannot approve address zero");

        allowance[owner][_spender] = amount;
    }




}