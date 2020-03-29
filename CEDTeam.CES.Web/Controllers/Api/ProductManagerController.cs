﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using CEDTeam.CES.Core.Interfaces;
using CEDTeam.CES.Web.Helpers;
using Microsoft.AspNetCore.Mvc;

namespace CEDTeam.CES.Web.Controllers.Api
{
    [Produces("application/json")]
    [Route("/api/v{version:apiVersion}/[controller]/[action]")]
    public class ProductManagerController : BaseAPIController
    {
        private readonly IProductService _productService;
        private readonly IApiService _apiService;
        public ProductManagerController(IProductService productService, IApiService apiService)
        {
            _productService = productService;
            _apiService = apiService;
    }
        
        //[Route("get-product")]
        //[HttpPost]
        //public async Task<IActionResult> GetProduct()
        //{
        //    int draw = int.Parse(Request.Form["draw"]);
        //    int start = int.Parse(Request.Form["start"]);
        //    int length = int.Parse(Request.Form["length"]);
        //    string search = Request.Form["search[value]"];
        //    int columnOrder = int.Parse(Request.Form["order[0][column]"]);
        //    bool isAsc = "asc".Equals(Request.Form["order[0][dir]"]);
        //    var result = await _productService.GetProductAsync(start, length, search, columnOrder, isAsc);
        //    result.Draw = draw;
        //    return new ObjectResult(result);
        //}

        [HttpPost]
        public IActionResult GetShopeeProduct(string categoryId, int page = 1)
        {
            var result = _apiService.Shopee_GetTopProductByCategoryId(categoryId.Split("_")[1], page);
            return new ObjectResult(result);
        }

        [HttpPost]
        public IActionResult GetTikiProduct(string categoryId, int page = 1)
        {
            var result = _apiService.Tiki_GetTopProductByCategoryId(categoryId.Split("_")[1], page);
            return new ObjectResult(result);
        }

        //[Route("get-sendo-product")]
        //[HttpPost]
        //public async Task<IActionResult> GetSendoProduct()
        //{
        //    int draw = int.Parse(Request.Form["draw"]);
        //    int start = int.Parse(Request.Form["start"]);
        //    int length = int.Parse(Request.Form["length"]);
        //    string search = Request.Form["search[value]"];
        //    int columnOrder = int.Parse(Request.Form["order[0][column]"]);
        //    bool isAsc = "asc".Equals(Request.Form["order[0][dir]"]);
        //    var result = await _productService.GetProductWithSiteIdAsync(start, length, search, columnOrder, 4, isAsc);
        //    result.Draw = draw;
        //    return new ObjectResult(result);
        //}
    }
}