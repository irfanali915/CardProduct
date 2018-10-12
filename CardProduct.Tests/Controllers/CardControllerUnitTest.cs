using System;
using System.Threading;
using System.Web.Http.Results;
using CardProduct.Controllers;
using CardProduct.Data;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace CardProduct.Tests.Controllers
{
    /// <summary>
    /// Test case class for Card controller
    /// </summary>
    [TestClass]
    public class CardControllerUnitTest
    {

        private static CardController _cardController;
        private TestData _testData;
        public TestContext TestContext { get; set; }


        /// <summary>
        /// Initialize all property and field that we are going to use throughout this class 
        /// </summary>
        /// <param name="testContext"></param>
        [ClassInitialize]
        public static void InitializeClass(TestContext testContext)
        {
            testContext.WriteLine($"Initialize test class - {nameof(CardControllerUnitTest)}");
            _cardController = new CardController();
        }

        [ClassCleanup]
        public static void CleanUpClass()
        {
            _cardController.Dispose();
        }

        // Use TestInitialize to run code before running each test 
        [TestInitialize]
        public void TestInitialize()
        {
            TestContext.WriteLine("TestInitialize for test data");
            _testData = new TestData(TestContext);
            //workaround for loading SqlProviderServices
            var x = typeof(System.Data.Entity.SqlServer.SqlProviderServices);
            TestContext.WriteLine("TestInitialize finish for test data");
        }

        private void TestCards(string cardType)
        {
            TestContext.WriteLine($"Started test cases for {cardType} card - {_testData.CardNumber}");
            var result = _cardController.ValidateCard(_testData.CardNumber) as OkNegotiatedContentResult<ValidateCardDto>;
            Assert.IsNotNull(result?.Content);
            ValidateCardDto dto = result.Content;
            Assert.AreEqual(_testData.Status, dto.Status);
            if (!string.IsNullOrEmpty(_testData.CardType))
            {
                Assert.AreEqual(_testData.CardType, dto.CardType);
            }

            TestContext.WriteLine($"Finish test cases for {cardType} card - {_testData.CardNumber}");
        }

        #region Test Methods

        /// <summary>
        /// Test VISA card based on excel test data
        /// </summary>
        [TestMethod]
        [DataSource("DataSourceVISACard")]
        [DeploymentItem("TestContext\\CardProducts.xls")]
        public void TestVisaCard()
        {
            TestCards("VISA");
        }

        /// <summary>
        /// Test MasterCard card based on excel test data
        /// </summary>
        [TestMethod]
        [DataSource("DataSourceMasterCardCard")]
        [DeploymentItem("TestContext\\CardProducts.xls")]
        public void TestMasterCardCard()
        {
            TestCards("MasterCard");
        }

        /// <summary>
        /// Test JCB card based on excel test data
        /// </summary>
        [TestMethod]
        [DataSource("DataSourceJCBCard")]
        [DeploymentItem("TestContext\\CardProducts.xls")]
        public void TestJcbCard()
        {
            TestCards("JCB");
        }

        /// <summary>
        /// Test Amex card based on excel test data
        /// </summary>
        [TestMethod]
        [DataSource("DataSourceAmexCard")]
        [DeploymentItem("TestContext\\CardProducts.xls")]
        public void TestAmexCard()
        {
            TestCards("Amex");
        }

        #endregion
    }
}
