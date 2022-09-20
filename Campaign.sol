// SPDX-License-Identifier: UNLICENSED

pragma solidity >0.7.0 <0.9.0;

import "Donation.sol";

contract Campaign {

    Donation[] donations;

    function createDonation(string memory name, uint amountNeeded, bool accept, uint minAMount) public returns(address) {
        Donation donation = new Donation(
            name, minAMount, accept, amountNeeded, msg.sender
        );
        donations.push(donation);
        return address(donation);
    }

    function getCampainName(address campaignAddress) public view returns(string memory) {
        Donation donation = Donation(campaignAddress);
        return donation.getDonationName();
    }

    function getCampainBalance(address campaignAddress) public view returns(uint) {
        Donation donation = Donation(campaignAddress);
        return donation.donationBalance();
    }

    function getCampaigns() view public returns(Donation[] memory) {
        return donations;
    }

    function donateToCampaign(address campaignAddress) payable public {
        Donation donation = Donation(campaignAddress);
        donation.donate{value: msg.value}();
    }

    function withdrawFromCampaign(address campaignAddress) public {
        Donation donation = Donation(campaignAddress);
        donation.withdraw(msg.sender);
    }

    function getCampainOwner(address campaignAddress) public view returns(address) {
        Donation donation = Donation(campaignAddress);
        return donation.getOwner();
    }
}