﻿using System;
using System.Collections.Generic;
using System.Text;

namespace CEDTeam.CES.Core.Dtos
{
    public class StockItem
    {
        public double? qty { get; set; }
        public double? min_sale_qty { get; set; }
        public double? max_sale_qty { get; set; }
        public bool? preorder_date { get; set; }
    }

    public class CustomAttribute
    {
        public string attribute { get; set; }
        public string display_name { get; set; }
        public string value { get; set; }
    }

    public class CurrentSeller
    {
        public double? id { get; set; }
        public string sku { get; set; }
        public double? store_id { get; set; }
        public string name { get; set; }
        public string slug { get; set; }
        public string link { get; set; }
        public bool? is_best_store { get; set; }
        public string logo { get; set; }
        public string product_id { get; set; }
        public double? price { get; set; }
        public object is_offline_installment_supported { get; set; }
    }

    public class TikiProductDetailDto
    {
        public double? id { get; set; }
        public double? price { get; set; }
        public double? list_price { get; set; }
        public double? discount_percent { get; set; }
        public bool? is_book { get; set; }
        public string type { get; set; }
        public string name { get; set; }
        public string sku { get; set; }
        public StockItem stock_item { get; set; }
        public bool? installment { get; set; }
        public bool? is_offline_installment { get; set; }
        public List<CustomAttribute> custom_attributes { get; set; }
        public string inventory_status { get; set; }
        public double? seller_rating { get; set; }
        public string promotion { get; set; }
        public string installment_message { get; set; }
        public object installment_info { get; set; }
        public string count_down_2h { get; set; }
        public string gift_message { get; set; }
        public string free_gift { get; set; }
        public string installation_service { get; set; }
        public object tag_discount { get; set; }
        public CurrentSeller current_seller { get; set; }
        public List<object> other_sellers { get; set; }
        public string description { get; set; }
        public string review { get; set; }
        public List<object> chiTiet { get; set; }
    }
}