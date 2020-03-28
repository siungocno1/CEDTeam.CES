﻿using System.Threading.Tasks;
using CEDTeam.CES.Core.Configs;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Options;

namespace CEDTeam.CES.Web.Middlewares
{
    public class ApiAuthenticationMiddleware
    {
        private readonly RequestDelegate _next;
        private readonly IOptions<AppConfig> _config;

        public ApiAuthenticationMiddleware(RequestDelegate next, IOptions<AppConfig> config)
        {
            _next = next;
            _config = config;
        }

        public async Task Invoke(HttpContext context)
        {
            if (context.User.Identity.IsAuthenticated)
            {
                await _next.Invoke(context);
            }
            else
            {
                context.Response.StatusCode = 401;
            }
        }
    }
}
