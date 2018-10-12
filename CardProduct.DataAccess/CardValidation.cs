using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CardProduct.Data;

namespace CardProduct.DataAccess
{
    public class CardValidation
    {
        #region Singleton Instance

        private static readonly Lazy<CardValidation> Lazy = new Lazy<CardValidation>(() => new CardValidation());

        public static CardValidation Instance => Lazy.Value;

        static CardValidation()
        {

        }

        #endregion

        #region Private Method

        private List<ppValidateCard_Result> ValidateCardDb(string cardNumber)
        {
            using (var ctx = new CardDatabaseEntities())
            {
                return ctx.ppValidateCard(cardNumber).ToList();
            }
        }

        #endregion

        #region Public Method

        /// <summary>
        /// Validate card based on card number
        /// </summary>
        /// <param name="cardNumber"></param>
        /// <returns></returns>
        public ValidateCardDto ValidateCard(string cardNumber)
        {
            var result = ValidateCardDb(cardNumber);
            return result.Select(r => new ValidateCardDto
            {
                CardType = r.CardType,
                Status = r.Status
            }).FirstOrDefault();
        }

        #endregion
    }
}
