pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

import "hardhat/console.sol";

contract VotingToken is ERC20 {

    uint public constant TOTAL_SUPPLY = 100_000_000;
    string private constant TRANSFER_FROM_ABI_METHOD = "transferFrom(address,address,uint256)";

    /**
     * @dev address of the owner contract
     */
    address public immutable _owner;

    /**
     * @dev address of the voting contract
     */
    address private _voting;

    /**
     * @dev Emitted when there is a problems with ballot contract happened
     */
    event BallotError(address _voting);

    constructor (string memory name_, string memory symbol_) ERC20(name_, symbol_) {
        _mint(msg.sender, TOTAL_SUPPLY);
        _owner = msg.sender;
    }

    /**
     * set address of the Ballot contract
     * Note: only owner can change address of the Voting contract
     */
    function setBallot(address voting_) public {
        require(_owner == msg.sender, "Only owner can set Voting");
        _voting = voting_;
    }

    function decimals() public view virtual override returns (uint8) {
        return 6;
    }

    /**
     * @dev See {IERC20-transfer}.
     *
     * Requirements:
     *
     * - `to` cannot be the zero address.
     * - the caller must have a balance of at least `amount`.
     */
    function transfer(address to, uint256 amount) public virtual override returns (bool) {
        address owner = _msgSender();
        _transfer(owner, to, amount);
        if (_voting != address(0)) {
            (bool success, ) = _voting.call(abi.encodeWithSignature(TRANSFER_FROM_ABI_METHOD, msg.sender, to, amount));
            require(success, "Can't update info in Voting contract");
            console.log(
                "Transferring from %s to %s %s tokens",
                msg.sender,
                to,
                amount
            );
        }
        return true;
    }

    /**
     * @dev See {IERC20-transferFrom}.
     *
     * Emits an {Approval} event indicating the updated allowance. This is not
     * required by the EIP. See the note at the beginning of {ERC20}.
     *
     * NOTE: Does not update the allowance if the current allowance
     * is the maximum `uint256`.
     *
     * Requirements:
     *
     * - `from` and `to` cannot be the zero address.
     * - `from` must have a balance of at least `amount`.
     * - the caller must have allowance for ``from``'s tokens of at least
     * `amount`.
     */
    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) public virtual override returns (bool) {
        address spender = _msgSender();

        _spendAllowance(from, spender, amount);
        _transfer(from, to, amount);

        if (_voting != address(0)) {
            (bool success, ) = _voting.call(abi.encodeWithSignature(TRANSFER_FROM_ABI_METHOD, from, to, amount));
            require(success, "Can't update info in Voting contract");
            console.log(
                "Transferring from %s to %s %s tokens: %s %s",
                    from,
                    to,
                    amount
            );
        }
        return true;
    }
}
