// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IERC20 {
    
    
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address to, uint256 amount) external returns (bool);

    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) external returns (bool);
}

interface IERC721 {
    function balanceOf(address owner) external view returns (uint256 balance);
}
contract staking {

    IERC20 stakedToken;

    address BoredApes = 0xBC4CA0EdA7647A8aB7C2061c2E118A18a936f13D;

    struct stakeDetails {
        uint256 amount;
        uint256 stakedTime;
    }

    mapping(address => stakeDetails) stakers;

    constructor(IERC20 _token){
        stakedToken = _token;
    }


        function stake(uint256 amount) external view {

            stakeDetails storage staker = stakers[msg.sender];

            require(IERC20(stakedToken).balanceOf(msg.sender) > amount, "ERC20: Insufficient balance");
            require(IERC721(BoredApes).balanceOf(msg.sender) > 1, "ERC721: You don not posses a BoredApe token");

            

        }

}