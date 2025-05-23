// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Invariants} from './Invariants.t.sol';
import {Setup} from './Setup.t.sol';

/// @title Tester
/// @notice Entry point for invariant testing, inherits all contracts, invariants & handler
/// @dev Mono contract that contains all the testing logic
contract Tester is Invariants, Setup {
  bool public IS_TEST = true;

  constructor() payable {
    // Deploy protocol contracts and protocol actors
    setUp();
  }

  /// @dev Foundry compatibility faster setup debugging
  function setUp() internal {
    // Deploy protocol contracts and protocol actors
    _setUp();

    // Deploy actors
    _setUpActors();

    // Initialize handler contracts
    _setUpHandlers();

    // Initialize the actor to the first user
    _setUpHooks();
  }
}
