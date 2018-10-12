using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using CardProduct.BusinessLogic;
using NLog;

namespace CardProduct.Controllers
{
    public class CardController : ApiController
    {
        private static ILogger _logger = LogManager.GetCurrentClassLogger(typeof(CardController));

        //public CardController(ILogger logger)
        //{
        //    _logger = logger;
        //}

        /// <summary>
        /// Validate card based on card number
        /// </summary>
        /// <param name="cardNumber">card number for validation</param>
        /// <returns>Result will contain information about card type and validation status</returns>
        [HttpGet]
        public IHttpActionResult ValidateCard(string cardNumber)
        {
            var val = new ValidateCardManager();
            var cardValidationStatus = val.ValidateCard(cardNumber);
            return Ok(cardValidationStatus);
        }
    }
}
