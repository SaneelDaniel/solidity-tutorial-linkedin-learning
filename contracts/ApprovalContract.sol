pragma solidity ^0.5.16;

contract ApprovalContract {
    address payable public sender;
    address payable public receiver;
    address
        public constant approver = 0xdc1F729f139ef73E1712C40f2884aDB4F2cf232b;

    function deposit(address payable _receiver) external payable {
        require(msg.value > 0);
        sender = msg.sender;
        receiver = _receiver;
    }

    function viewApprover() external pure returns (address) {
        return (approver);
    }

    function approve() external {
        require(msg.sender == approver);
        receiver.transfer(address(this).balance);
    }
}
