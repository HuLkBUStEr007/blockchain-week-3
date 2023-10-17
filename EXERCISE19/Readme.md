# **Reasons for the error**
- The burn function in the provided code does not check whether the tokens are locked before allowing a burn. Therefore, even if tokens are locked, a user can still attempt to burn them.
```sh
 function burn(uint256 _amount) public {
        require(balances[msg.sender] >= _amount, "Not enough tokens");        
        balances[msg.sender] -= _amount;
        totalSupply -= _amount;

```
# **Fixing The error**
- We will add the following line in our code
 ```sh
  if (lockedUntil[msg.sender] >= block.timestamp) {
    revert("Tokens are locked");
}
```
- **Explanation :** This line of code ensures that the tokens are not locked for the **msg.sender** at the current timestamp. If the tokens are still locked, the transaction will be reverted with the error message "Tokens are locked".

# **Test Script Hardhat file**
1. In folder `test`
   - File: `AdvancedToken-test.js`

#
