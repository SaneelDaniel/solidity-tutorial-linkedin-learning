# My Personal Guide To Solidity

**# Linkedin Learning Tutorials - Blockchain, Smart Contracts, Solidity, DApps**

## **Solidity**

- Solidity is an object-oriented, high-level language for implementing smart contracts. Smart contracts are programs which govern the behaviour of accounts within the Ethereum state.
- Solidity is a curly-bracket language. It is influenced by C++, Python and JavaScript, and is designed to target the Ethereum Virtual Machine (EVM). You can find more details about which languages Solidity has been inspired by in the language influences section.
- Solidity is statically typed, supports inheritance, libraries and complex user-defined types among other features.
- With Solidity you can create contracts for uses such as voting, crowdfunding, blind auctions, and multi-signature wallets

> (https://docs.soliditylang.org/en/v0.8.7/)

## **Types in Solidity**

Solidity is aesthetically typed language. In other words, each variable types must be specified. Let's take a look at the major types.

- **String:** And it's basically string and then the name of your string, and then, if you want to initialize it, you can put a string.

  ```jsx
  string name = "Saneel";
  ```

- **Integers** and you have the uint and you can initialize like we've done before.

  ```jsx
  number = 1111;
  ```

- **Booleans:** you declare it with bool and then the name of the boolean.

  ```jsx
  bool myBoolean = false;
  ```

- **Addresses:** and this is really something that's useful for solidity or ethereum because you have addresses all the time, and they usually are called wallets or wallet address.

  ```jsx
  address myAddress = 0x72ba772899b;
  ```

- **Arrays:** An arrays can be declared in any of the types like integers, strings, addresses, structs, etc.

  ```jsx
  string[] names;
  ```

- **Bytes:** The value types bytes1, bytes2, bytes3, …, bytes32 hold a sequence of bytes from one to up to 32.

  ```jsx
  bytes1 myByte;
  ```

- **Struct:** If you want to create and declare you own types you can do so with something that's called struct.

  ```jsx
  struct User {
  	string firstName;
  	string lastName;
  	address walletAddress;
  }
  ```

- **Enums:** Enums are one way to create a user-defined type in Solidity. They are explicitly convertible to and from all integer types but implicit conversion is not allowed. The explicit conversion from integer checks at runtime that the value lies inside the range of the enum and causes a Panic error otherwise. Enums require at least one member, and its default value when declared is the first member. Enums cannot have more than 256 members.

  ```jsx
  // definition or initialization

  enum usertype {buyer, seller}

  // Example Contract
  contract test {
      enum ActionChoices { GoLeft, GoRight, GoStraight, SitStill }
      ActionChoices choice;
      ActionChoices constant defaultChoice = ActionChoices.GoStraight;

      function setGoStraight() public {
          choice = ActionChoices.GoStraight;
      }

      // Since enum types are not part of the ABI, the signature of "getChoice"
      // will automatically be changed to "getChoice() returns (uint8)"
      // for all matters external to Solidity.
      function getChoice() public view returns (ActionChoices) {
          return choice;
      }

      function getDefaultChoice() public pure returns (uint) {
          return uint(defaultChoice);
      }
  }
  ```

- **Mapping Types:**

  - Mapping types use the syntax mapping (\_KeyType => \_ValueType). The \_KeyType can be any built-in value type, bytes, string, or any contract or enum type. Other user-defined or complex types, such as mappings, structs or array types are not allowed. \_ValueType can be any type, including mappings, arrays and structs.

  ```jsx
  contract MappingExample {
      mapping(address => uint) public balances;

      function update(uint newBalance) public {
          balances[msg.sender] = newBalance;
      }
  }

  contract MappingUser {
      function f() public returns (uint) {
          MappingExample m = new MappingExample();
          m.update(100);
          return m.balances(address(this));
      }
  }
  ```

## Units and Globally Available Variables

- **Ether Units:** A literal number can take a suffix of wei, gwei or ether to specify a sub denomination of Ether, where Ether numbers without a postfix are assumed to be Wei.

  ```jsx
    assert(1 wei == 1);
    assert(1 gwei == 1e9);
    assert(1 ether == 1e18);
  ```

- **Time Units:** Suffixes like seconds, minutes, hours, days and weeks after literal numbers can be used to specify units of time where seconds are the base unit

  ```jsx
    bool isTime = (1 == 1 seconds)

    // similarly
    {
      1 == 1 seconds;
      1 minutes == 60 seconds;
      1 hours == 60 minutes;
      1 days == 24 hours;
      1 weeks == 7 days;
    }

    // if you want to interpret a function parameter in days, you can in the following way:

    function f(uint start, uint daysAfter) public {
        if (block.timestamp >= start + daysAfter * 1 days) {
          // ...
        }
    }
  ```

- **Block and Transaction Properties:**

  ```jsx
    blockhash(uint blockNumber) returns (bytes32): hash of the given block when blocknumber is one of the 256 most recent blocks; otherwise returns zero

    block.basefee (uint): current block’s base fee (EIP-3198 and EIP-1559)

    block.chainid (uint): current chain id

    block.coinbase (address payable): current block miner’s address

    block.difficulty (uint): current block difficulty

    block.gaslimit (uint): current block gaslimit

    block.number (uint): current block number

    block.timestamp (uint): current block timestamp as seconds since unix epoch

    gasleft() returns (uint256): remaining gas

    msg.data (bytes calldata): complete calldata

    msg.sender (address): sender of the message (current call)

    msg.sig (bytes4): first four bytes of the calldata (i.e. function identifier)

    msg.value (uint): number of wei sent with the message

    tx.gasprice (uint): gas price of the transaction

    tx.origin (address): sender of the transaction (full call chain)
  ```
