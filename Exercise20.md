# **Exercise - 20**
# What's Happening in AdvancedToken
- The contract inherits from the standard ERC-20 token contract and also from Ownable for ownership functionality.
- It has a mapping named lockedUntil, which maps addresses to timestamps indicating when tokens are locked until for each address.
- The constructor sets up the token with the name "AdvancedToken" and the symbol "AT" during deployment, and the initial owner is set as specified in the initialOwner parameter.
- The mint function allows the owner to mint (create) new tokens and assign them to a specified address. It also sets a lock period of 2 days for the recipient.
- The burn function allows the burning (destruction) of a specified amount of tokens.
- The transfer function overrides the ERC-20 transfer function to add a condition that restricts transfers if the sender's tokens are still locked.
- The transferFrom function overrides the ERC-20 transferFrom function to add a condition that restricts transfers if the sender's tokens are still locked.

- **This contract provides basic ERC-20 token functionalities like minting, burning, and transferring. It adds a feature to lock tokens for a certain period after being minted. Additionally, it enforces that transfers are restricted if the tokens are still in a locked state.**
- **Interaction:**
Users interact with this contract to deposit, lend, borrow, and burn "AdvancedToken."

# **LendingPool Contract:**
- **Primary Functions:**
 Manages the lending pool where users can deposit "AdvancedToken" to earn interest & Calculates and distributes interest to lenders based on their deposited amounts.
- **Interaction:**
 Users can interact with this contract to deposit "AdvancedToken" and start earning interest.

# **BorrowingPlatform Contract:**
- **Primary Functions:**
 Allows users to borrow against their "AdvancedToken" holdings and also manages the borrowing process, which includes securing of collateral and handling payments.
- **Interaction:**
Users interact with this contract to borrow against their "AdvancedToken" holdings.

