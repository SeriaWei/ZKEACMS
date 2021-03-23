/* http://www.zkea.net/ 
 * Copyright 2020 ZKEASOFT 
 * http://www.zkea.net/licenses */

using Microsoft.IdentityModel.Tokens;
using System;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace ZKEACMS.Api
{
    public class JwtBearerTokenHelper
    {
        public JwtToken BuildToken(string userId)
        {
            var key = Encoding.ASCII.GetBytes(JwtBearerDefaults.IssuerSigningKey);
            DateTime expires = DateTime.UtcNow.AddDays(JwtBearerDefaults.ExpireDays);
            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Issuer = JwtBearerDefaults.Issuer,
                Audience = JwtBearerDefaults.Audience,
                Subject = new ClaimsIdentity(new[] { new Claim(ClaimTypes.Name, userId) }),
                Expires = expires,
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256)
            };
            var tokenHandler = new JwtSecurityTokenHandler();
            var token = tokenHandler.CreateToken(tokenDescriptor);
            
            return new JwtToken
            {
                Token = tokenHandler.WriteToken(token),
                Expires = expires
            };
        }
    }
}
