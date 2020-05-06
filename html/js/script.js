var moneyactuelle = 0;
var dirtymoneyactuelle = 0;
var bankbalanceactuelle = 0;
var jobactuelle = 'police';
$(function() {
    window.addEventListener("message", function(event) {
        var mess = event.data;

        if (typeof mess.initialise !== 'undefined') {
            $('#money').html('<img src="icons/money.png" style="padding-right: 3px;" height="25" width="35">' + mess.money + ' $');
            $('#dirtymoney').html('<img src="icons/dirtymoney.png" style="padding-right: 3px;" height="25" width="35">' + mess.dirtymoney + ' $');
            $('#bankbalance').html('<img src="icons/bank.png" style="padding-right: 3px;" height="25" width="35">' + mess.bankbalance + ' $');
            $('#job').html(mess.job);
            moneyactuelle = mess.money;
            dirtymoneyactuelle = mess.dirtymoneyinfo;
            bankbalanceactuelle = mess.bankbalanceinfo;
            jobactuelle = mess.job;
        }

        if (typeof mess.moneyinfo !== 'undefined') {
            $('#money').html('<img src="icons/money.png" style="padding-right: 3px;" height="25" width="35">' + mess.moneyinfo + ' $');
            moneyactuelle = mess.moneyinfo;
        }

        if (typeof mess.dirtymoneyinfo !== 'undefined') {
            $('#dirtymoney').html('<img src="icons/dirtymoney.png" style="padding-right: 3px;" height="25" width="35">' + mess.dirtymoneyinfo + ' $');
            dirtymoneyactuelle = mess.dirtymoneyinfo;
        }

        if (typeof mess.jobinfo !== 'undefined') {
            $('#job').html(mess.jobinfo);
            jobactuelle = mess.jobinfo;
        }

        if (typeof mess.bankbalanceinfo !== 'undefined') {
            $('#bankbalance').html('<img src="icons/bank.png" style="padding-right: 3px;" height="25" width="35">' + mess.bankbalanceinfo + ' $');
            bankbalanceactuelle = mess.bankbalanceinfo;
        }

        if (typeof mess.rmvBankForMoney !== 'undefined') {
            bankbalanceactuelle = Math.round(bankbalanceactuelle - mess.rmvBankForMoney);
            moneyactuelle = Math.round(moneyactuelle + mess.rmvBankForMoney);
            $('#bankbalance').html('<img src="icons/bank.png" style="padding-right: 3px;" height="25" width="35">' + bankbalanceactuelle + ' $');
            $('#money').html('<img src="icons/money.png" style="padding-right: 3px;" height="25" width="35">' + moneyactuelle + ' $');
        }

        if (typeof mess.rmvMoneyForBank !== 'undefined') {
            bankbalanceactuelle = Math.round(bankbalanceactuelle + mess.rmvMoneyForBank);
            moneyactuelle = Math.round(moneyactuelle - mess.rmvMoneyForBank);
            $('#bankbalance').html('<img src="icons/bank.png" style="padding-right: 3px;" height="25" width="35">' + bankbalanceactuelle + ' $');
            $('#money').html('<img src="icons/money.png" style="padding-right: 3px;" height="25" width="35">' + moneyactuelle + ' $');
        }

        if (typeof mess.addBank !== 'undefined') {
            bankbalanceactuelle = Math.round(bankbalanceactuelle + mess.addBank);
            $('#addBankMoney').html('+' + mess.addBank + '$');
            $('#bankbalance').html('<img src="icons/bank.png" style="padding-right: 3px;" height="25" width="35">' + bankbalanceactuelle + ' $');
            $("#addBankMoney").fadeIn("slow", function() {
                setTimeout(function() {
                    $("#addBankMoney").fadeOut("slow", function() {});
                }, 2000);
            });
        }

        if (typeof mess.rmvBank !== 'undefined') {
            bankbalanceactuelle = Math.round(bankbalanceactuelle - mess.rmvBank);
            $('#rmvBankMoney').html('-' + mess.rmvBank + '$');
            $('#bankbalance').html('<img src="icons/bank.png" style="padding-right: 3px;" height="25" width="35">' + bankbalanceactuelle + ' $');
            $("#rmvBankMoney").fadeIn("slow", function() {
                setTimeout(function() {
                    $("#rmvBankMoney").fadeOut("slow", function() {});
                }, 2000);
            });
        }

        if (typeof mess.addDirtyMoney !== 'undefined') {
            dirtymoneyactuelle = Math.round(dirtymoneyactuelle + mess.addDirtyMoney);
            $('#dirtymoney').html('<img src="icons/dirtymoney.png" style="padding-right: 3px;" height="25" width="35">' + dirtymoneyactuelle + ' $');
        }

        if (typeof mess.rmvDirtyMoney !== 'undefined') {
            dirtymoneyactuelle = Math.round(dirtymoneyactuelle - mess.rmvDirtyMoney);
            $('#dirtymoney').html('<img src="icons/dirtymoney.png" style="padding-right: 3px;" height="25" width="35">' + dirtymoneyactuelle + ' $');
        }

        if (typeof mess.addMoney !== 'undefined') {
            $('#addMoney').html('+' + mess.addMoney + '$');
            var newMoney = Math.round(moneyactuelle + mess.addMoney);
            moneyactuelle = newMoney;
            $('#money').html('<img src="icons/money.png" style="padding-right: 3px;" height="25" width="35">' + newMoney + ' $');
            $("#addMoney").fadeIn("slow", function() {
                setTimeout(function() {
                    $("#addMoney").fadeOut("slow", function() {});
                }, 2000);
            });
        }

        if (typeof mess.rmvMoney !== 'undefined') {
            $('#rmvMoney').html('-' + mess.rmvMoney + '$');
            var newMoney = Math.round(moneyactuelle - mess.rmvMoney);
            moneyactuelle = newMoney;
            $('#money').html('<img src="icons/money.png" style="padding-right: 3px;" height="25" width="35">' + newMoney + ' $');
            $("#rmvMoney").fadeIn("slow", function() {
                setTimeout(function() {
                    $("#rmvMoney").fadeOut("slow", function() {});
                }, 2000);
            });
        }

        if (typeof mess.addItem !== 'undefined') {
            $('#addItem').html('+' + mess.addItem);
            $("#addItem").slideToggle("slow", function() {
                setTimeout(function() {
                    $("#addItem").fadeOut("slow", function() {});
                }, 2000);
            });
        }

        if (typeof mess.rmvItem !== 'undefined') {
            $('#rmvItem').html('-' + mess.rmvItem);
            $("#rmvItem").slideToggle("slow", function() {
                setTimeout(function() {
                    $("#rmvItem").fadeOut("slow", function() {});
                }, 2000);
            });
        }

        if (typeof mess.hud !== 'undefined') {
            console.log(mess.hud)
            if (mess.hud == true) {
                $('#money').fadeIn();
                $('#bankbalance').fadeIn();
                $('#dirtymoney').fadeIn();
                $('#job').fadeIn();
            } else {
                $('#money').fadeOut();
                $('#bankbalance').fadeOut();
                $('#dirtymoney').fadeOut();
                $('#job').fadeOut();
                $('#rmvMoney').fadeOut();
                $('#addMoney').fadeOut();
                $('#addBankMoney').fadeOut();
                $('#rmvBankMoney').fadeOut();
                $('#addItem').fadeOut();
                $('#rmvItem').fadeOut();
            }
        }
    });

});