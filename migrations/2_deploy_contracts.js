var ApprovalContract = artifacts.reqiore("ApprovalContract")


module.exports = function(deployer){
    deployer.deploy(ApprovalContract)
}