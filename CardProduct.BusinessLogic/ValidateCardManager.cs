using CardProduct.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CardProduct.DataAccess;

namespace CardProduct.BusinessLogic
{
    public class ValidateCardManager
    {
        #region Public Method

        /// <summary>
        /// Validate card based on card number
        /// </summary>
        /// <param name="cardNumber"></param>
        /// <returns>ValidateCardDto</returns>
        public ValidateCardDto ValidateCard(string cardNumber)
        {
            return CardValidation.Instance.ValidateCard(cardNumber);
        }

        #endregion
    }
}
