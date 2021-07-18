#!/usr/bin/env sh

DATE=$(date +%m-%d-%Y)
echo $DATE

trade_qty=$(curl https://newweb.nepalstock.com.np/api/nots/top-ten/trade-qty -H 'accept: application/json, text/plain, */*'   -H 'user-agent: Mozilla / 5.0 (compatible; MSIE 11.0; Windows; U; Windows NT 6.0; Trident / 7.0)' --compressed)
supplydemand=$(curl https://newweb.nepalstock.com.np/api/nots/nepse-data/supplydemand -H 'accept: application/json, text/plain, */*'   -H 'user-agent: Mozilla / 5.0 (compatible; MSIE 11.0; Windows; U; Windows NT 6.0; Trident / 7.0)'      --compressed)
market_summary=$(curl https://newweb.nepalstock.com.np/api/nots/market-summary -H 'accept: application/json, text/plain, */*'   -H 'user-agent: Mozilla / 5.0 (compatible; MSIE 11.0; Windows; U; Windows NT 6.0; Trident / 7.0)'      --compressed)
turnover=$(curl https://newweb.nepalstock.com.np/api/nots/top-ten/turnover -H 'accept: application/json, text/plain, */*'   -H 'user-agent: Mozilla / 5.0 (compatible; MSIE 11.0; Windows; U; Windows NT 6.0; Trident / 7.0)'      --compressed)
top_gainer=$(curl https://newweb.nepalstock.com.np/api/nots/top-ten/top-gainer -H 'accept: application/json, text/plain, */*'   -H 'user-agent: Mozilla / 5.0 (compatible; MSIE 11.0; Windows; U; Windows NT 6.0; Trident / 7.0)'      --compressed)
nepse_index=$(curl https://newweb.nepalstock.com.np/api/nots/nepse-index -H 'accept: application/json, text/plain, */*'   -H 'user-agent: Mozilla / 5.0 (compatible; MSIE 11.0; Windows; U; Windows NT 6.0; Trident / 7.0)'      --compressed)
floorsheet=$(curl "https://newweb.nepalstock.com.np/api/nots/nepse-data/floorsheet?&sort=contractId,desc" -H 'accept: application/json, text/plain, */*'   -H 'user-agent: Mozilla / 5.0 (compatible; MSIE 11.0; Windows; U; Windows NT 6.0; Trident / 7.0)'      --compressed)
trading_average=$(curl https://newweb.nepalstock.com.np/api/nots/nepse-data/trading-average?nDays=120 -H 'accept: application/json, text/plain, */*'   -H 'user-agent: Mozilla / 5.0 (compatible; MSIE 11.0; Windows; U; Windows NT 6.0; Trident / 7.0)'      --compressed)

mkdir -p data
echo "{\"trade_qty\":$trade_qty,\"supplydemand\":$supplydemand,\"market_summary\":$market_summary,\"turnover\":$turnover,\"top_gainer\":$top_gainer,\"nepse_index\":$nepse_index,\"floorsheet\":$floorsheet,\"trading_average\":$trading_average}" > data/$DATE.json
