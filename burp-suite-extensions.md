# Burp Suite Extensions - Recommended for Bug Bounty
# For authorized security testing only

## ============================================
## ESSENTIAL EXTENSIONS
## ============================================

### 1. Autorize
- **Purpose**: Authorization testing (IDOR, privilege escalation)
- **Category**: Authorization
- **Key Features**:
  - Automated IDOR detection
  - Tests access control between different user roles
  - Highlights authorization vulnerabilities
  - Compares responses between users
- **Use Case**: Testing horizontal and vertical privilege escalation

### 2. Active Scan++
- **Purpose**: Enhanced active scanning
- **Category**: Scanning
- **Key Features**:
  - Additional scan checks
  - Better detection of vulnerabilities
  - Custom scan rules
  - Reduced false positives
- **Use Case**: Comprehensive vulnerability scanning

### 3. InQL
- **Purpose**: GraphQL security testing
- **Category**: API Security
- **Key Features**:
  - GraphQL introspection
  - Query analysis
  - Vulnerability detection
  - Custom query building
- **Use Case**: Testing GraphQL endpoints

### 4. Turbo Intruder
- **Purpose**: High-speed attack engine
- **Category**: Attack
- **Key Features**:
  - Parallel request processing
  - Race condition testing
  - Custom attack scripts
  - High-performance fuzzing
- **Use Case**: Rate limit bypass, race conditions, brute force

### 5. Collaborator Everywhere
- **Purpose**: Out-of-band testing
- **Category**: Detection
- **Key Features**:
  - Collaborator payload injection
  - DNS/HTTP interaction detection
  - Blind vulnerability detection
  - SSRF/XXE detection
- **Use Case**: Blind SSRF, XXE, blind injection

### 6. Reflected Parameters
- **Purpose**: Parameter reflection detection
- **Category**: Analysis
- **Key Features**:
  - Detects reflected parameters
  - Highlights input reflection
  - Identifies injection points
  - Custom reflection rules
- **Use Case**: Finding XSS, SSTI, and other injection points

### 7. Retire.js
- **Purpose**: JavaScript vulnerability detection
- **Category**: Analysis
- **Key Features**:
  - Detects vulnerable JS libraries
  - Version identification
  - CVE mapping
  - Client-side vulnerability detection
- **Use Case**: Finding vulnerable JavaScript dependencies

### 8. Software Vulnerability Scanner
- **Purpose**: Software version detection
- **Category**: Analysis
- **Key Features**:
  - Detects software versions
  - Maps to known CVEs
  - Identifies outdated components
  - Generates vulnerability reports
- **Use Case**: Finding known vulnerabilities

### 9. Logger++
- **Purpose**: Enhanced logging
- **Category**: Analysis
- **Key Features**:
  - Comprehensive request/response logging
  - Custom logging rules
  - Log filtering and search
  - Export functionality
- **Use Case**: Detailed traffic analysis

### 10. Request Smuggler
- **Purpose**: HTTP request smuggling detection
- **Category**: Attack
- **Key Features**:
  - CL.TE detection
  - TE.CL detection
  - H2.CL detection
  - H2.TE detection
- **Use Case**: Finding HTTP request smuggling vulnerabilities

## ============================================
## AUTHENTICATION & AUTHORIZATION
## ============================================

### 11. AuthMatrix
- **Purpose**: Authorization matrix testing
- **Category**: Authorization
- **Key Features**:
  - Defines user roles and permissions
  - Tests access control
  - Identifies broken authorization
  - Comprehensive reporting
- **Use Case**: Testing RBAC implementations

### 12. Token Extractor
- **Purpose**: Token extraction and analysis
- **Category**: Authentication
- **Key Features**:
  - Extracts tokens from requests
  - Analyzes token structure
  - Identifies weak tokens
  - Token comparison
- **Use Case**: Analyzing authentication tokens

### 13. JWT Editor
- **Purpose**: JWT token manipulation
- **Category**: Authentication
- **Key Features**:
  - JWT decoding/editing
  - Algorithm manipulation
  - Key testing
  - Token forgery
- **Use Case**: Testing JWT vulnerabilities

### 14. JWT Attacker
- **Purpose**: JWT attack automation
- **Category**: Authentication
- **Key Features**:
  - Automated JWT attacks
  - Algorithm confusion
  - Key brute force
  - Token manipulation
- **Use Case**: Testing JWT security

## ============================================
## API TESTING
## ============================================

### 15. OpenAPI Scanner
- **Purpose**: OpenAPI/Swagger testing
- **Category**: API Security
- **Key Features**:
  - Parses OpenAPI specs
  - Generates test cases
  - API vulnerability detection
  - Endpoint enumeration
- **Use Case**: Testing REST APIs

### 16. GraphQL Scanner
- **Purpose**: GraphQL vulnerability scanning
- **Category**: API Security
- **Key Features**:
  - GraphQL introspection
  - Query complexity analysis
  - Vulnerability detection
  - Custom query testing
- **Use Case**: Testing GraphQL APIs

### 17. JSON Web Tokens
- **Purpose**: JWT analysis and testing
- **Category**: API Security
- **Key Features**:
  - JWT decoding
  - Token validation
  - Algorithm detection
  - Key extraction
- **Use Case**: Analyzing JWT implementation

## ============================================
## INJECTION TESTING
## ============================================

### 18. SQLiPy
- **Purpose**: SQL injection testing
- **Category**: Injection
- **Key Features**:
  - SQL injection detection
  - Database fingerprinting
  - Data extraction
  - Time-based blind SQLi
- **Use Case**: Testing SQL injection vulnerabilities

### 19. SSTI Scanner
- **Purpose**: Server-side template injection
- **Category**: Injection
- **Key Features**:
  - Template engine detection
  - SSTI payload generation
  - RCE via SSTI
  - Multiple template engines
- **Use Case**: Testing SSTI vulnerabilities

### 20. XSS Scanner
- **Purpose**: Cross-site scripting detection
- **Category**: Injection
- **Key Features**:
  - XSS detection
  - Payload generation
  - Filter bypass
  - DOM-based XSS
- **Use Case**: Testing XSS vulnerabilities

### 21. Command Injection
- **Purpose**: OS command injection testing
- **Category**: Injection
- **Key Features**:
  - Command injection detection
  - Payload generation
  - Blind command injection
  - Time-based detection
- **Use Case**: Testing command injection vulnerabilities

## ============================================
## INFORMATION DISCLOSURE
## ============================================

### 22. Information Disclosure
- **Purpose**: Information leakage detection
- **Category**: Information
- **Key Features**:
  - Detects sensitive data exposure
  - Identifies debug information
  - Finds internal paths
  - Maps information leaks
- **Use Case**: Finding information disclosure vulnerabilities

### 23. Secret Finder
- **Purpose**: Secret and key detection
- **Category**: Information
- **Key Features**:
  - Finds API keys
  - Detects secrets
  - Identifies tokens
  - Locates credentials
- **Use Case**: Finding hardcoded secrets

### 24. JS Link Finder
- **Purpose**: JavaScript endpoint discovery
- **Category**: Information
- **Key Features**:
  - Parses JavaScript files
  - Extracts API endpoints
  - Identifies parameters
  - Maps hidden APIs
- **Use Case**: Finding hidden endpoints

### 25. Endpoint Extractor
- **Purpose**: API endpoint extraction
- **Category**: Information
- **Key Features**:
  - Extracts endpoints
  - Identifies parameters
  - Maps API surface
  - Generates endpoint list
- **Use Case**: API reconnaissance

## ============================================
## ATTACK & EXPLOITATION
## ============================================

### 26. SQLMap
- **Purpose**: Automated SQL injection
- **Category**: Attack
- **Key Features**:
  - Automated SQL injection
  - Database fingerprinting
  - Data extraction
  - OS command execution
- **Use Case**: Automated SQL injection testing

### 27. Autorize
- **Purpose**: Authorization testing
- **Category**: Attack
- **Key Features**:
  - IDOR detection
  - Privilege escalation testing
  - Access control bypass
  - Response comparison
- **Use Case**: Testing access control

### 28. Turbo Intruder
- **Purpose**: High-speed attacks
- **Category**: Attack
- **Key Features**:
  - Parallel requests
  - Race conditions
  - Rate limit bypass
  - Custom scripts
- **Use Case**: High-performance attacks

### 29. InQL
- **Purpose**: GraphQL attacks
- **Category**: Attack
- **Key Features**:
  - GraphQL exploitation
  - Introspection abuse
  - Query manipulation
  - Data extraction
- **Use Case**: GraphQL security testing

### 30. Request Smuggler
- **Purpose**: Request smuggling attacks
- **Category**: Attack
- **Key Features**:
  - CL.TE attacks
  - TE.CL attacks
  - H2.CL attacks
  - H2.TE attacks
- **Use Case**: HTTP request smuggling

## ============================================
## BYPASS & EVASION
## ============================================

### 31. WAF Bypass
- **Purpose**: WAF bypass techniques
- **Category**: Bypass
- **Key Features**:
  - Encoding techniques
  - Case variations
  - Comment injection
  - Double encoding
- **Use Case**: Bypassing web application firewalls

### 32. Autorize
- **Purpose**: Authorization bypass
- **Category**: Bypass
- **Key Features**:
  - Access control bypass
  - Privilege escalation
  - IDOR exploitation
  - Role-based bypass
- **Use Case**: Testing authorization controls

### 33. JWT Editor
- **Purpose**: JWT bypass techniques
- **Category**: Bypass
- **Key Features**:
  - Algorithm confusion
  - Key brute force
  - Token manipulation
  - Signature bypass
- **Use Case**: JWT security bypass

## ============================================
## REPORTING & DOCUMENTATION
## ============================================

### 34. Logger++
- **Purpose**: Traffic logging and analysis
- **Category**: Reporting
- **Key Features**:
  - Comprehensive logging
  - Custom log rules
  - Export functionality
  - Traffic analysis
- **Use Case**: Documentation and analysis

### 35. Collaborator Everywhere
- **Purpose**: Out-of-band evidence
- **Category**: Reporting
- **Key Features**:
  - DNS/HTTP interaction logs
  - Proof of vulnerability
  - Collaborator payloads
  - Evidence collection
- **Use Case**: Generating proof of vulnerability

### 36. Software Vulnerability Scanner
- **Purpose**: Vulnerability reporting
- **Category**: Reporting
- **Key Features**:
  - CVE identification
  - Version detection
  - Vulnerability mapping
  - Report generation
- **Use Case**: Vulnerability documentation

## ============================================
## INSTALLATION GUIDE
## ============================================

### BApp Store Installation
1. Open Burp Suite
2. Go to Extender tab
3. Click on BApp Store
4. Search for extension name
5. Click Install

### Manual Installation
1. Download JAR file
2. Go to Extender tab
3. Click Options
4. Add extension path
5. Configure settings

### Recommended Extensions for Bug Bounty

**Essential (Must Have)**:
- Autorize
- Active Scan++
- InQL
- Turbo Intruder
- Collaborator Everywhere
- Reflected Parameters
- Retire.js
- Logger++

**Authentication**:
- JWT Editor
- JWT Attacker
- Token Extractor

**API Testing**:
- OpenAPI Scanner
- GraphQL Scanner
- JSON Web Tokens

**Injection**:
- SQLiPy
- SSTI Scanner
- XSS Scanner
- Command Injection

**Information Disclosure**:
- Information Disclosure
- Secret Finder
- JS Link Finder
- Endpoint Extractor

**Attack**:
- SQLMap
- Autorize
- Turbo Intruder
- InQL
- Request Smuggler

**Bypass**:
- WAF Bypass
- JWT Editor
- Autorize

**Reporting**:
- Logger++
- Collaborator Everywhere
- Software Vulnerability Scanner

## ============================================
## TIPS & TRICKS
## ============================================

### Extension Configuration
- Configure Collaborator for out-of-band testing
- Set up logging rules for traffic analysis
- Configure scan checks for comprehensive testing
- Set up custom payloads for specific tests

### Performance Optimization
- Disable unnecessary extensions
- Configure scan threads appropriately
- Use Turbo Intruder for high-speed attacks
- Optimize logging rules

### Workflow Integration
- Use Logger++ for traffic analysis
- Export findings to reports
- Integrate with other tools
- Document all findings

### Best Practices
- Test extensions in isolation first
- Configure extensions properly
- Update extensions regularly
- Report bugs to developers

## ============================================
## COMMON WORKFLOWS
## ============================================

### Authorization Testing
1. Configure Autorize with user sessions
2. Define access control rules
3. Run automated tests
4. Review authorization bypasses
5. Document findings

### API Testing
1. Import OpenAPI/Swagger spec
2. Run OpenAPI Scanner
3. Test with GraphQL Scanner
4. Analyze JWT implementation
5. Document vulnerabilities

### Injection Testing
1. Identify injection points
2. Run SQLiPy for SQL injection
3. Test SSTI with SSTI Scanner
4. Check XSS with XSS Scanner
5. Test command injection

### Information Disclosure
1. Run Secret Finder
2. Analyze with JS Link Finder
3. Check Endpoint Extractor
4. Review Information Disclosure
5. Document findings

## ============================================
## TROUBLESHOOTING
## ============================================

### Common Issues
- Extension conflicts
- Performance issues
- Configuration problems
- Update failures

### Solutions
- Disable conflicting extensions
- Optimize scan settings
- Reset extension settings
- Reinstall extensions

### Getting Help
- Check extension documentation
- Review BApp Store comments
- Contact extension developers
- Search community forums
