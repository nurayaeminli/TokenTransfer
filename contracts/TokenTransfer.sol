// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol';

contract TransferToken {
    function Transfer(uint amount) external {
       IERC20 token = IERC20(0xb7797693B4D02B8eB6fDCF65f65aB9e89bf673C8);
        token.transfer(msg.sender, amount);
    }

    function transferfrom(address recipient, uint amount) external {
        IERC20 token = IERC20(0xb7797693B4D02B8eB6fDCF65f65aB9e89bf673C8);
        token.transferFrom(msg.sender, recipient, amount);
    }
}

contract Owner {
    function Transfer(address recipient, uint amount) external {
       IERC20 token = IERC20(0xb7797693B4D02B8eB6fDCF65f65aB9e89bf673C8);
        token.approve(0x599Ea0fFd42D953b7207b5d927589c05d69243D8, amount);
        TransferToken transferToken = TransferToken(0x599Ea0fFd42D953b7207b5d927589c05d69243D8);
        transferToken.transferfrom(recipient, amount);
    }
}
