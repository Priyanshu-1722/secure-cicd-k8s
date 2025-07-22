// Jenkins Groovy script for basic security setup

import jenkins.model.*
import hudson.security.*

def instance = Jenkins.getInstance()

// Create local admin user
def hudsonRealm = new HudsonPrivateSecurityRealm(false)
hudsonRealm.createAccount("admin", "admin123")  // Change in production!
instance.setSecurityRealm(hudsonRealm)

// Configure authorization strategy
def strategy = new FullControlOnceLoggedInAuthorizationStrategy()
strategy.setAllowAnonymousRead(false)
instance.setAuthorizationStrategy(strategy)

instance.save()
