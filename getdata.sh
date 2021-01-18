#!/usr/bin/env sh

DATE=$(date +%m-%d-%Y)
echo $DATE

trade_qty=$(curl https://newweb.nepalstock.com.np/api/nots/top-ten/trade-qty)
supplydemand=$(curl https://newweb.nepalstock.com.np/api/nots/nepse-data/supplydemand)
market_summary=$(curl https://newweb.nepalstock.com.np/api/nots/market-summary)
turnover=$(curl https://newweb.nepalstock.com.np/api/nots/top-ten/turnover)
top_gainer=$(curl https://newweb.nepalstock.com.np/api/nots/top-ten/top-gainer)
nepse_index=$(curl https://newweb.nepalstock.com.np/api/nots/nepse-index)
floorsheet=$(curl "https://newweb.nepalstock.com.np/api/nots/nepse-data/floorsheet?&sort=contractId,desc")
trading_average=$(curl https://newweb.nepalstock.com.np/api/nots/nepse-data/trading-average?nDays=120)

mkdir -p data
echo "{\"trade_qty\":$trade_qty,\"supplydemand\":$supplydemand,\"market_summary\":$market_summary,\"turnover\":$turnover,\"top_gainer\":$top_gainer,\"nepse_index\":$nepse_index,\"floorsheet\":$floorsheet,\"trading_average\":$trading_average}" > data/$DATE.json
