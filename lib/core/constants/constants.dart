typedef JsonMap = Map<String, dynamic>;
const String kBaseUrl = 'https://api.useaccrue.com/graphql';

const JsonMap kCyptos = 
  {
    'Bitcoin': 'bitcoin',
    'Ethereum': 'ethereum',
    'Binance Coin' : 'binancecoin',
    'Litecoin': 'litecoin',
    'Chainlink': 'chainlink',
    'Cardona': 'cardona',
    'XRP': 'ripple',
    'Solana': 'solana',
    'Polygon': 'matic_network',
    'AAVE': 'aave',
    'Polkadot': 'polkadot',
    'Tezos': 'tezos',
    'TRON': 'tron'
  }
;

const JsonMap kFrequencies = 
  {
    'Every day': 'daily',
    'Every week': 'weekly',
    'Every two weeks': 'biweekly',
    'Every month': 'monthly',
  }
;

const JsonMap kDuration = 
  {
    '6 months ago': '0.6',
    '1 year ago': '1.0',
    '2 years ago': '2.0',
    '3 years ago': '3.0',
    '4 years ago': '4.0',
    '5 years ago': '5.0',
    '6 years ago': '6.0',
  }
;
// const List<JsonMap> kCyptos = [
//   {'Bitcoin': 'bitcoin'},
//   {'Ethereum': 'ethereum'},
//   {'Binance Coin': 'binancecoin'},
//   {'Litecoin': 'litecoin'},
//   {'Chainlink': 'chainlink'},
//   {'Cardona': 'cardona'},
//   {'XRP': 'ripple'},
//   {'Solana': 'solana'},
//   {'Polygon': 'matic_network'},
//   {'AAVE': 'aave'},
//   {'Polkadot': 'polkadot'},
//   {'Tezos': 'tezos'},
//   {'TRON': 'tron'},
// ];

// const List<JsonMap> kFrequencies = [
//   {'Every day': 'daily'},
//   {'Every week': 'weekly'},
//   {'Every two weeks': 'biweekly'},
//   {'Every month': 'monthly'},
// ];

// const List<JsonMap> kDuration = [
//   {'6 months ago': '0.6'},
//   {'1 year ago': '1.0'},
//   {'2 years ago': '2.0'},
//   {'3 years ago': '3.0'},
//   {'4 years ago': '4.0'},
//   {'5 years ago': '5.0'},
//   {'6 years ago': '6.0'},
// ];
