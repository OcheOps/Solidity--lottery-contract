# Solidity--lottery-contract
Building a lottery contract with solidity
Newly added  changes
Here are the changes that were made:

Added a minimumAmount variable to set the minimum amount of ether required to participate in the lottery. This makes it clearer to participants how much they need to send.

Changed the constructor function name to constructor to match the latest version of Solidity.

Changed the require statement in the enter() function to check for msg.value >= minimumAmount instead of msg.value > .01 ether. This ensures that participants send at least the minimum amount required to participate.

Added error messages to the require statements to provide more information about why a transaction may fail.

Added a getPlayers() function to allow anyone to view the list of players.

Added a setMinimumAmount() function to allow the manager to update the minimum amount required to participate.

Added a getBalance() function to allow anyone to view the balance of the contract.
