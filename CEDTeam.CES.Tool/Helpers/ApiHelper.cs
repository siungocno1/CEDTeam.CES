﻿using Newtonsoft.Json;
using System;
using System.IO;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;
using HtmlAgilityPack;

namespace CEDTeam.CES.Tool.Helpers
{
    public class ApiHelper
    {
        public ApiHelper(string baseUrl)
        {
            BASE_URL = baseUrl;
        }
        public string BASE_URL;
        public async Task<T> GetAsync<T>(string requestUri, string contentType = "application/json")
        {
            var client = new HttpClient();
            client.BaseAddress = new Uri(BASE_URL);
            client.DefaultRequestHeaders.Accept.Clear();
            client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue(contentType));
            var request = new HttpRequestMessage
            {
                Method = HttpMethod.Get,
                RequestUri = new Uri($"{BASE_URL}{requestUri}"),
                Headers = {
                    { HttpRequestHeader.Accept.ToString(), "application/json" },
                    { HttpRequestHeader.UserAgent.ToString(), "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36" }
                }
            };
            var response = await client.SendAsync(request);
            if (!response.IsSuccessStatusCode) return default(T);
            var result = await response.Content.ReadAsStringAsync();
            if (string.IsNullOrWhiteSpace(result)) return default(T);
            result = FixApiResponseString(result);
            return JsonConvert.DeserializeObject<T>(result);

        }

        private static string FixApiResponseString(string input)
        {
            input = input.Replace("\\r\\n", string.Empty).Replace(@"\", string.Empty);
            input = input.Trim('"');
            return input;
        }

        public T Get<T>(string uri, bool isAllowRedirect = false)
        {
            string result = "";
            try
            {
                var url = uri.Contains("://") ? uri : (BASE_URL + uri);
                HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
                request.Method = "GET";
                if (!isAllowRedirect) request.AllowAutoRedirect = false;
                request.Headers.Add("Upgrade-Insecure-Requests: 1");
                request.Accept = "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8";
                request.UserAgent = "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/66.4.120 Chrome/60.4.3112.120 Safari/537.36";
                request.Headers.Add("Accept-Language:vi-VN,vi;q=0.8,fr-FR;q=0.6,fr;q=0.4,en-US;q=0.2,en;q=0.2");
                if(url.Contains("lazada.vn"))
                {
                    request.Headers.Add("Cookie", "client_type=desktop; l=dBgVRWWPqXuiGEO0BOfZdurza77TWQdfCsPzaNbMiICPsD5NdH_hWZp5Qs8eCnMNn6kBR3P5zp3_BU362yC5ilLDeh5oLXOn3dTh.; isg=BIaGZG33J0SDlPN8W9TST3R613zIT8vIpNhFE3CsiahZcyON2HcRsChCS_caW8K5; lzd_cid=de5be1a1-986b-4b5c-8124-c7543f0b10e8; t_uid=de5be1a1-986b-4b5c-8124-c7543f0b10e8; t_fv=1574260517255; t_sid=FUJMi3UuQQOl4QRmvlFtf8beyWYe88XG; utm_channel=NA; lzd_sid=1bf30f83fd9b9f210b2fc429563aa3a7; _tb_token_=7787a1deee637; hng=VN|vi|VND|704; cna=yOkQFmr6mloCAXG5bIjvywsr");
                }
                HttpWebResponse response = (HttpWebResponse)request.GetResponse();
                if (!HttpStatusCode.OK.Equals(response.StatusCode)) return default(T);
                var dataStream = response.GetResponseStream();
                var reader = new StreamReader(dataStream);
                 result = reader.ReadToEnd();
                if (string.IsNullOrWhiteSpace(result)) return default(T);
                return JsonConvert.DeserializeObject<T>(result);
            } 
            catch (Exception e)
            {
                return default(T);
            }
        }

        public HtmlDocument Get(string uri, bool isAllowRedirect = false)
        {
            string result = "";
            try
            {
                var url = uri.Contains("://") ? uri : (BASE_URL + uri);
                HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
                request.Method = "GET";
                if (!isAllowRedirect) request.AllowAutoRedirect = false;
                request.Headers.Add("Upgrade-Insecure-Requests: 1");
                request.Accept = "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8";
                request.UserAgent = "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/66.4.120 Chrome/60.4.3112.120 Safari/537.36";
                request.Headers.Add("Accept-Language:vi-VN,vi;q=0.8,fr-FR;q=0.6,fr;q=0.4,en-US;q=0.2,en;q=0.2");
                HttpWebResponse response = (HttpWebResponse)request.GetResponse();
                if (!HttpStatusCode.OK.Equals(response.StatusCode)) return null;
                var dataStream = response.GetResponseStream();
                var reader = new StreamReader(dataStream);
                result = result = FixApiResponseString(reader.ReadToEnd());
                if (!string.IsNullOrWhiteSpace(result)) return Html.StringToHtmlDoc(result);
                return null;
            }
            catch (Exception e)
            {
                return null;
            }
        }

        public string GetString(string uri, bool isAllowRedirect = false)
        {
            string result = "";
            try
            {
                var url = uri.Contains("://") ? uri : (BASE_URL + uri);
                HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
                request.Method = "GET";
                request.AllowAutoRedirect = isAllowRedirect;
                request.Accept = "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8";
                request.UserAgent = "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/66.4.120 Chrome/60.4.3112.120 Safari/537.36";
                request.Headers.Add("Accept-Language:vi-VN,vi;q=0.8,fr-FR;q=0.6,fr;q=0.4,en-US;q=0.2,en;q=0.2");
                HttpWebResponse response = (HttpWebResponse)request.GetResponse();
                var dataStream = response.GetResponseStream();
                var reader = new StreamReader(dataStream);
                result = reader.ReadToEnd();
                if (!string.IsNullOrWhiteSpace(result)) return result;
                return null;
            }
            catch (Exception e)
            {
                return null;
            }
        }

        //public async Task<T> PostAsync<T>(string requestUri, object content)
        //{
        //    //var handler = new HttpClientHandler
        //    //{
        //    //    UseProxy = true,
        //    //    Proxy = new WebProxy
        //    //    {
        //    //        Address = new Uri(Proxy)
        //    //    },
        //    //};
        //    using (var client = new HttpClient())
        //    {
        //        client.BaseAddress = new Uri($"{CoreApiBaseUrl}{requestUri}");
        //        client.DefaultRequestHeaders.Accept.Clear();
        //        client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
        //        var responseMessage = await client.PostAsJsonAsync($"{CoreApiBaseUrl}{requestUri}", content);
        //        if (!responseMessage.IsSuccessStatusCode) return default(T);
        //        var responseData = responseMessage.Content.ReadAsStringAsync().Result;

        //        var apiResult = JsonConvert.DeserializeObject<APIResult<T>>(responseData);
        //        return apiResult.IsSuccess ? apiResult.Result : default(T);
        //    }
        //}

        public static string Serialize(object obj, bool isFormating = false)
        {
            var jsonSerializerSettings = new JsonSerializerSettings
            {
                NullValueHandling = NullValueHandling.Ignore
            };

            return isFormating ? JsonConvert.SerializeObject(obj, Formatting.Indented, jsonSerializerSettings) : JsonConvert.SerializeObject(obj, jsonSerializerSettings);
        }
    }
}