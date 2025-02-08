contract theRun {
        uint private Balance = 0;
        uint private Payout_id = 0;
        uint private Last_Payout = 0;
        uint private WinningPot = 0;
        uint private Min_multiplier = 1100; //110%
        

     
    }
    function WatchBalance() constant returns(uint TotalBalance) {
        TotalBalance = Balance /  1 wei;
    }
    
    function WatchBalanceInEther() constant returns(uint TotalBalanceInEther) {
        TotalBalanceInEther = Balance /  1 ether;
    }
    
    
    //Fee functions for creator
    function CollectAllFees() onlyowner {
        if (fees == 0) throw;
        admin.send(fees);
        feeFrac-=1;
        fees = 0;
    }
    
    function GetAndReduceFeesByFraction(uint p) onlyowner {
        if (fees == 0) feeFrac-=1; //Reduce fees.
        admin.send(fees / 1000 * p);//send a percent of fees
        fees -= fees / 1000 * p;
    }
        

//---Contract informations
function NextPayout() constant returns(uint NextPayout) {
    NextPayout = players[Payout_id].payout /  1 wei;
}

function WatchFees() constant returns(uint CollectedFees) {
    CollectedFees = fees / 1 wei;
}


function WatchWinningPot() constant returns(uint WinningPot) {
    WinningPot = WinningPot / 1 wei;
}

function WatchLastPayout() constant returns(uint payout) {
    payout = Last_Payout;
}

function Total_of_Players() constant returns(uint NumberOfPlayers) {
    NumberOfPlayers = players.length;
}

function PlayerInfo(uint id) constant returns(address Address, uint Payout, bool UserPaid) {
    if (id <= players.length) {
        Address = players[id].addr;
        Payout = players[id].payout / 1 wei;
        UserPaid=players[id].paid;
    }
}

function PayoutQueueSize() constant returns(uint QueueSize) {
    QueueSize = players.length - Payout_id;
}


}
