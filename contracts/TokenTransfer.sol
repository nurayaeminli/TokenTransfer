// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

interface IERC20 {
    function transfer(address _to, uint _amount) external returns(bool);
    function balanceOf(address _account) external returns (uint);
    function allowance(address _owner, address _spender) external returns (uint);
    function transferFrom(address _from, address _to, uint _amount) external returns(bool);
}

contract Task1 {
    /mmm
    mapping(address => uint) tokenBalance;

    event DirectSend(address _tokenAddress, address _to, uint _amount);
    event SendFrom(address _tokenAddress, address _to, uint _amount);

    function direct_sender(address _tokenAddress, address _to, uint _amount) public {
        IERC20 tokenContract = IERC20(_tokenAddress);
        // tokendan bana gelmiş mi?
        require(tokenBalance[_tokenAddress] > 0, "Token gelmemis");
        tokenContract.transfer(_to, _amount);
        tokenBalance[_tokenAddress] = tokenContract.balanceOf(_tokenAddress) - _amount;
        
        // event at
        emit DirectSend(_tokenAddress, _to, _amount);
    }

    function send_from(address _tokenAddress, address _to, uint _amount) public {
          IERC20 tokenContract = IERC20(_tokenAddress);
        // iznim var mı?
         require(tokenContract.allowance(msg.sender, address(this)) >= _amount, "Izin yok");
        // userın bakiyesi var mı
        require(tokenContract.balanceOf(msg.sender) >= _amount, "Bakiye yetersiz");
        tokenContract.transferFrom(_tokenAddress, _to, _amount);
        // event at
        emit SendFrom(_tokenAddress, _to, _amount);
    }

}