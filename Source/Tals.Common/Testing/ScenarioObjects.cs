using System;

namespace Tals.Common.Testing
{
    public class ScenarioObjects {
        protected static void EstablishContext(Action assignFakes, Action assignDeliberateValues,
                                               Action assignArbitraryValues, Action assignSystemsUnderTest) {
            assignFakes();
            assignDeliberateValues();
            assignArbitraryValues();
            assignSystemsUnderTest();
        }
    }
}
