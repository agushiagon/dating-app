using System;
using System.Collections.Generic;
using System.Net;
using System.Threading.Tasks;
using DatingApp.API.Data;
using DatingApp.API.Models;
using Microsoft.AspNetCore.Identity;
using Xunit;

namespace DatingApp.Tests
{
    public class AuthRepositoryTests
    {
        //private readonly UserManager<User> _userManager;

        //public AuthRepositoryTests(UserManager<User> userManager)
        //{
        //    _userManager = userManager;
        //}

        private List<User> _users = new List<User>
        {
      new User
            {
                Gender = "male",
                KnownAs = "agonagushi30s",
                DateOfBirth = new DateTime(1994, 09, 18),
                City = "Prishtine",
                Country = "Kosovo",
                Created = DateTime.Today,
                LastActive = DateTime.Today,
                Introduction = "no need for intro",
                Interests = "music, film",
                LookingFor = "female"
            }
        };
      

        [Fact]
        public async Task RegisterUser()
        {
            var userManager = Helper.MockUserManager(_users);
            async Task<int> CreateUser(User user, string password) => (await userManager.CreateAsync(user, password)).Succeeded ? user.Id : -1;
            var user1 = new User
            {
                Gender = "male",
                KnownAs = "agonagushi30s",
                DateOfBirth = new DateTime(1994, 09, 18),
                City = "Prishtine",
                Country = "Kosovo",
                Created = DateTime.Today,
                LastActive = DateTime.Today,
                Introduction = "no need for intro",
                Interests = "music, film",
                LookingFor = "female"
            };

            var password1 = "test";

            userManager.


            Assert.True(registeredUser.Succeeded);
        }

    }
}
