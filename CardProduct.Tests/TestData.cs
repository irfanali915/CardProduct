using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace CardProduct.Tests
{
    /// <summary>
    /// Test data for unit test 
    /// </summary>
    internal class TestData
    {

        /// <summary>
        /// Input test card number
        /// </summary>
        public string CardNumber { get; }

        /// <summary>
        /// Expected card type
        /// </summary>
        public string CardType { get; }

        ///
        public string Status { get; }

        /// <summary>
        /// Get the data from test context
        /// </summary>
        /// <param name="testContext">TestContext</param>
        public TestData(TestContext testContext)
        {
            CardNumber = Convert.ToString(testContext.DataRow["CardNumber"]);
            CardType = Convert.ToString(testContext.DataRow["CardType"]);
            Status = Convert.ToString(testContext.DataRow["Status"]);
        }
    }
}
