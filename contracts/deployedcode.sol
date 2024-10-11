pragma solidity ^0.8.0;

contract BytecodeAnalysis {
    function deploy() public payable returns (address) {
        bytes memory bytecode = "0x60806040525f80fdfea2646970667358221220f5d698acddff3e9777c853db91f558070af2d38afe87141e37c479733ba5a8a864736f6c63430008150033";
        address addr;
        assembly {
            addr := create(0, add(bytecode, 0x20), mload(bytecode))
        }
        return addr;
    }
}