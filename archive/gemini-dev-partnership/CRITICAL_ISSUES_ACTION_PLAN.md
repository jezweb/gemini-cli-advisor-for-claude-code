# 🚨 Critical Issues Action Plan - Central AI V2

## Executive Summary

This action plan addresses the most critical issues identified through comprehensive visual testing and code analysis. Issues are prioritized by severity and impact, with specific implementation steps and success criteria.

## 🎯 Priority Matrix

### 🔴 **CRITICAL - Fix Immediately (Day 1)**
- **Security vulnerabilities** that could lead to data breaches
- **Broken core functionality** that makes the application unusable
- **Authentication failures** preventing user access

### 🟡 **HIGH - Fix This Week (Days 2-7)**
- **Missing core features** that impact user experience
- **Performance issues** affecting user satisfaction
- **Development blockers** preventing team productivity

### 🟠 **MEDIUM - Fix This Month (Weeks 2-4)**
- **Code quality issues** affecting maintainability
- **Testing gaps** reducing confidence in changes
- **Documentation issues** slowing development

### 🟢 **LOW - Technical Debt (Ongoing)**
- **Refactoring opportunities** for long-term maintainability
- **Optimization potential** for future scaling
- **Process improvements** for team efficiency

## 🔴 **CRITICAL ISSUES - Fix Immediately**

### 1. **Firebase Storage Rules Security Vulnerability**
**Severity:** 🔴 **CRITICAL** - Data breach risk  
**Impact:** Any authenticated user can access any company's documents  
**File:** `storage.rules`

#### **Current Vulnerable Code:**
```javascript
match /companies/{companyId}/{allPaths=**} {
  allow read: if isAuthenticated() || isServiceAccount();
  allow write: if isAuthenticated() && isOwnerOrAdmin();
}
```

#### **Immediate Fix:**
```javascript
match /companies/{companyId}/{allPaths=**} {
  allow read: if isAuthenticated() && 
    (request.auth.token.companyId == companyId || 
     hasCompanyAccess(request.auth.uid, companyId));
  allow write: if isAuthenticated() && 
    (request.auth.token.companyId == companyId || 
     hasCompanyAccess(request.auth.uid, companyId)) &&
    isOwnerOrAdmin();
}

function hasCompanyAccess(userId, companyId) {
  return exists(/databases/$(database)/documents/companies/$(companyId)/users/$(userId));
}
```

#### **Implementation Steps:**
1. **Update storage rules** with proper company access checks
2. **Add Firebase Auth custom claims** for company membership
3. **Test with multiple company accounts** to verify isolation
4. **Deploy rules immediately** to production

#### **Success Criteria:**
- [ ] Users can only access their own company's data
- [ ] Cross-company access attempts are blocked
- [ ] Service accounts maintain appropriate access
- [ ] No existing functionality is broken

---

### 2. **Document Upload Permission Bypass**
**Severity:** 🔴 **CRITICAL** - Unauthorized document access  
**Impact:** Any user can upload documents to any workspace  
**File:** `backend/app/api/documents.py`, line 29

#### **Current Vulnerable Code:**
```python
# TODO: Add permission check to ensure user can upload to this workspace_id
document_data = DocumentCreate(
    name=name or file.filename,
    workspace_id=workspace_id,
    owner_id=current_user.id,
    file_type=file.content_type,
    description=description,
)
```

#### **Immediate Fix:**
```python
# Add permission check before document creation
workspace = await workspace_service.get_workspace(db, workspace_id)
if not workspace:
    raise HTTPException(status_code=404, detail="Workspace not found")

if not await workspace_service.user_has_access(db, current_user.id, workspace_id):
    raise HTTPException(status_code=403, detail="Access denied to workspace")

# Verify user belongs to same company as workspace
if workspace.company_id != current_user.company_id:
    raise HTTPException(status_code=403, detail="Cross-company access denied")

document_data = DocumentCreate(
    name=name or file.filename,
    workspace_id=workspace_id,
    owner_id=current_user.id,
    file_type=file.content_type,
    description=description,
)
```

#### **Implementation Steps:**
1. **Create `workspace_service.user_has_access()`** method
2. **Add company-level access validation**
3. **Update all document endpoints** with consistent permission checks
4. **Add unit tests** for permission scenarios

#### **Success Criteria:**
- [ ] Users can only upload to workspaces they have access to
- [ ] Cross-company document uploads are blocked
- [ ] Appropriate error messages for denied access
- [ ] All document endpoints have consistent permission checks

---

### 3. **Missing Authentication Headers in Frontend**
**Severity:** 🔴 **CRITICAL** - API calls fail  
**Impact:** All protected API endpoints return 401/403 errors  
**File:** `frontend/src/stores/workspace.ts`, lines 18, 29

#### **Current Broken Code:**
```typescript
// Missing authentication headers
const response = await axios.get(`${API_URL}/workspaces`)
```

#### **Immediate Fix:**
```typescript
// Create authenticated API client
// File: frontend/src/services/api.ts
import axios from 'axios'
import { getAuth } from 'firebase/auth'

const API_URL = import.meta.env.VITE_API_URL || 'http://localhost:57000/api'

const apiClient = axios.create({
  baseURL: API_URL,
  timeout: 10000,
})

// Add authentication interceptor
apiClient.interceptors.request.use(async (config) => {
  const auth = getAuth()
  const user = auth.currentUser
  
  if (user) {
    const token = await user.getIdToken()
    config.headers.Authorization = `Bearer ${token}`
  }
  
  return config
})

export { apiClient }
```

#### **Update All Store Files:**
```typescript
// File: frontend/src/stores/workspace.ts
import { apiClient } from '@/services/api'

export const useWorkspaceStore = defineStore('workspace', () => {
  async function fetchWorkspaces() {
    loading.value = true
    error.value = null
    try {
      const response = await apiClient.get('/workspaces')
      workspaces.value = response.data
    } catch (e) {
      error.value = 'Failed to fetch workspaces'
      console.error(e)
    } finally {
      loading.value = false
    }
  }
})
```

#### **Implementation Steps:**
1. **Create centralized API client** with authentication
2. **Update all store files** to use authenticated client
3. **Add error handling** for authentication failures
4. **Test with protected endpoints** to verify functionality

#### **Success Criteria:**
- [ ] All API calls include authentication headers
- [ ] Protected endpoints return data instead of 401/403
- [ ] Authentication errors are handled gracefully
- [ ] Token refresh works automatically

---

### 4. **Post-Login Navigation Broken**
**Severity:** 🔴 **CRITICAL** - Application unusable  
**Impact:** Users cannot access any features after login  
**File:** `frontend/src/router/index.ts`, `frontend/src/stores/auth.ts`

#### **Current Broken Flow:**
```typescript
// Users stay on login page after successful authentication
// No redirect to dashboard or main application
```

#### **Immediate Fix:**
```typescript
// File: frontend/src/stores/auth.ts
import { useRouter } from 'vue-router'

export const useAuthStore = defineStore('auth', () => {
  const router = useRouter()
  
  async function login(email: string, password: string) {
    try {
      const userCredential = await signInWithEmailAndPassword(auth, email, password)
      user.value = userCredential.user
      
      // Redirect to dashboard after successful login
      router.push('/dashboard')
      
    } catch (error) {
      throw new Error('Login failed')
    }
  }
  
  function init() {
    onAuthStateChanged(auth, (firebaseUser) => {
      user.value = firebaseUser
      loading.value = false
      
      if (firebaseUser) {
        // User is logged in, redirect away from login page
        if (router.currentRoute.value.path === '/login') {
          router.push('/dashboard')
        }
      } else {
        // User is logged out, redirect to login if on protected route
        if (router.currentRoute.value.meta.requiresAuth) {
          router.push('/login')
        }
      }
    })
  }
})
```

#### **Add Dashboard Route:**
```typescript
// File: frontend/src/router/index.ts
const routes = [
  {
    path: '/login',
    name: 'Login',
    component: () => import('@/views/LoginView.vue'),
    meta: { requiresAuth: false }
  },
  {
    path: '/dashboard',
    name: 'Dashboard',
    component: () => import('@/views/DashboardView.vue'),
    meta: { requiresAuth: true }
  },
  {
    path: '/',
    redirect: '/dashboard'
  }
]
```

#### **Create Dashboard Component:**
```vue
<!-- File: frontend/src/views/DashboardView.vue -->
<template>
  <div class="dashboard">
    <h1>Welcome to Central AI</h1>
    
    <!-- Quick Actions -->
    <div class="quick-actions">
      <ActionCard 
        title="Upload Document"
        description="Add new documents for AI analysis"
        icon="FileUp"
        @click="$router.push('/documents/upload')"
      />
      <ActionCard 
        title="Create Workspace"
        description="Organize projects and collaborate"
        icon="FolderPlus"
        @click="$router.push('/workspaces/create')"
      />
      <ActionCard 
        title="AI Assistant"
        description="Ask questions about your documents"
        icon="MessageSquare"
        @click="$router.push('/chat')"
      />
    </div>
    
    <!-- Recent Activity -->
    <RecentActivity />
  </div>
</template>
```

#### **Implementation Steps:**
1. **Fix authentication store** to handle login redirects
2. **Create dashboard view** with feature navigation
3. **Update router configuration** with protected routes
4. **Add navigation guard** for authentication requirements

#### **Success Criteria:**
- [ ] Users are redirected to dashboard after login
- [ ] Dashboard shows available features and navigation
- [ ] Protected routes require authentication
- [ ] Login page redirects authenticated users away

## 🟡 **HIGH PRIORITY - Fix This Week**

### 5. **WebSocket Authentication in URL**
**Severity:** 🟡 **HIGH** - Token exposure risk  
**Impact:** Authentication tokens logged in server logs and browser history  
**File:** `backend/app/api/chat.py`, line 690

#### **Current Vulnerable Code:**
```python
async def chat_websocket(websocket: WebSocket, token: str = Query(...)):
    # Token exposed in URL
```

#### **Secure Fix:**
```python
async def chat_websocket(websocket: WebSocket):
    # Get token from WebSocket headers
    token = websocket.headers.get("Authorization")
    
    if not token:
        await websocket.close(code=1008, reason="Authentication required")
        return
    
    # Remove "Bearer " prefix if present
    if token.startswith("Bearer "):
        token = token[7:]
    
    try:
        # Verify token
        user_info = await auth_service.verify_firebase_id_token(token)
        await websocket.accept()
        # Continue with authenticated WebSocket logic
    except Exception as e:
        await websocket.close(code=1008, reason="Invalid token")
```

#### **Frontend Update:**
```typescript
// File: frontend/src/services/websocket.ts
export class ChatWebSocket {
  private ws: WebSocket | null = null
  
  async connect() {
    const user = getAuth().currentUser
    if (!user) throw new Error('Not authenticated')
    
    const token = await user.getIdToken()
    
    this.ws = new WebSocket('ws://localhost:57000/api/chat/ws')
    
    // Send token in first message instead of URL
    this.ws.onopen = () => {
      this.ws?.send(JSON.stringify({
        type: 'auth',
        token: token
      }))
    }
  }
}
```

### 6. **Remove Hardcoded Test Credentials**
**Severity:** 🟡 **HIGH** - Security risk  
**Impact:** Known backdoor account if run in production  
**File:** `backend/create_firebase_test_user.py`, lines 18-19

#### **Current Vulnerable Code:**
```python
email = "test@example.com"
password = "testpass123"
```

#### **Secure Fix:**
```python
import os
import secrets

# Use environment variables or generate secure password
email = os.getenv("TEST_USER_EMAIL", "test@example.com")
password = os.getenv("TEST_USER_PASSWORD")

if not password:
    password = secrets.token_urlsafe(32)
    print(f"Generated secure password: {password}")
    print("Set TEST_USER_PASSWORD environment variable to reuse this password")

# Add environment check
if os.getenv("ENVIRONMENT") == "production":
    print("ERROR: Test user creation not allowed in production")
    exit(1)
```

### 7. **Add Environment Protection for Destructive Operations**
**Severity:** 🟡 **HIGH** - Data loss risk  
**Impact:** Accidental data deletion in production  
**File:** `backend/app/api/onboarding.py`, line 447

#### **Current Vulnerable Code:**
```python
@router.post("/reset-company-content")
async def reset_company_content(confirm: bool = False):
    # No environment check
```

#### **Secure Fix:**
```python
@router.post("/reset-company-content")
async def reset_company_content(
    confirm: bool = False,
    current_user: User = Depends(get_current_admin_user)
):
    # Environment protection
    if os.getenv("ENVIRONMENT") == "production":
        raise HTTPException(
            status_code=403, 
            detail="Destructive operations not allowed in production"
        )
    
    # Additional confirmation
    if not confirm:
        raise HTTPException(
            status_code=400,
            detail="Must confirm destructive operation"
        )
    
    # Log the operation
    logger.warning(f"Company content reset initiated by user {current_user.id}")
    
    # Proceed with reset logic
```

### 8. **Fix Hardcoded API URLs**
**Severity:** 🟡 **HIGH** - Environment configuration  
**Impact:** Cannot deploy to different environments  
**File:** `frontend/src/stores/workspace.ts`, line 5

#### **Current Hardcoded Code:**
```typescript
const API_URL = 'http://localhost:57000/api'
```

#### **Environment-Aware Fix:**
```typescript
// File: frontend/src/config/env.ts
export const config = {
  API_URL: import.meta.env.VITE_API_URL || 'http://localhost:57000/api',
  WS_URL: import.meta.env.VITE_WS_URL || 'ws://localhost:57000/api/chat/ws',
  ENVIRONMENT: import.meta.env.VITE_ENVIRONMENT || 'development',
  DEBUG: import.meta.env.VITE_DEBUG === 'true',
}
```

#### **Update Environment Files:**
```bash
# File: frontend/.env.development
VITE_API_URL=http://localhost:57000/api
VITE_WS_URL=ws://localhost:57000/api/chat/ws
VITE_ENVIRONMENT=development
VITE_DEBUG=true

# File: frontend/.env.production
VITE_API_URL=https://api.centralai.com/api
VITE_WS_URL=wss://api.centralai.com/api/chat/ws
VITE_ENVIRONMENT=production
VITE_DEBUG=false
```

### 9. **Remove Duplicate API Router Registration**
**Severity:** 🟡 **HIGH** - Broken endpoints  
**Impact:** User context endpoints are inaccessible  
**File:** `backend/app/main.py`, lines 180 & 182

#### **Current Broken Code:**
```python
app.include_router(user_context.router, prefix="/api/user-context", tags=["user-context"])
app.include_router(user_context.router, prefix="/api/user-context", tags=["user-context"])  # Duplicate
```

#### **Simple Fix:**
```python
# Remove duplicate line - keep only one
app.include_router(user_context.router, prefix="/api/user-context", tags=["user-context"])
```

## 🔧 **Implementation Timeline**

### **Day 1 (Critical Security Fixes)**
- [ ] **Morning:** Fix Firebase storage rules
- [ ] **Afternoon:** Add document upload permissions
- [ ] **Evening:** Fix authentication headers and test API calls

### **Day 2 (Core Functionality)**
- [ ] **Morning:** Fix post-login navigation
- [ ] **Afternoon:** Create dashboard with basic navigation
- [ ] **Evening:** Test complete user journey

### **Day 3-4 (Security Hardening)**
- [ ] Remove hardcoded credentials
- [ ] Add environment protection
- [ ] Fix WebSocket authentication
- [ ] Add comprehensive security tests

### **Day 5-7 (Configuration & Testing)**
- [ ] Fix hardcoded URLs and environment configuration
- [ ] Remove duplicate router registration
- [ ] Comprehensive testing of all fixes
- [ ] Deploy to staging environment

## 📊 **Success Metrics**

### **Security Metrics:**
- [ ] 0 critical vulnerabilities in security scan
- [ ] 100% of API endpoints have proper authentication
- [ ] No hardcoded credentials in codebase
- [ ] All destructive operations have environment protection

### **Functionality Metrics:**
- [ ] Users can successfully log in and access features
- [ ] All core API endpoints return data correctly
- [ ] Navigation works across all major user journeys
- [ ] Application works in development and staging environments

### **Code Quality Metrics:**
- [ ] No duplicate code or registrations
- [ ] Consistent error handling across all endpoints
- [ ] All TODO comments for security are resolved
- [ ] Environment configuration is properly abstracted

## 🧪 **Testing Requirements**

### **Security Tests:**
```bash
# Test Firebase rules
firebase emulators:exec --only firestore,storage "npm run test:security"

# Test API permissions
pytest tests/test_permissions.py -v

# Test authentication flow
pytest tests/test_auth.py -v
```

### **Functionality Tests:**
```bash
# Test user journey
npx playwright test auth-flow.spec.ts

# Test API endpoints
pytest tests/test_api_endpoints.py -v

# Test environment configuration
npm run test:env
```

### **Integration Tests:**
```bash
# Full application test
npm run test:e2e

# Cross-browser testing
npx playwright test --project=chromium --project=firefox
```

## 🔄 **Rollback Plan**

### **If Issues Occur:**
1. **Firebase rules rollback:** Keep backup of current rules
2. **API changes rollback:** Tag current state before changes
3. **Frontend rollback:** Maintain working branch
4. **Database rollback:** Backup before permission changes

### **Monitoring:**
- [ ] Set up error monitoring for authentication failures
- [ ] Monitor API response times and error rates
- [ ] Track user login success rates
- [ ] Monitor security scan results

## 🎯 **Next Steps After Critical Fixes**

1. **Week 2:** Implement missing core features (document upload UI, workspace management)
2. **Week 3:** Add user onboarding and improved UX
3. **Week 4:** Accessibility improvements and performance optimization
4. **Ongoing:** Continuous security monitoring and code quality improvements

---

**Action Plan Created:** July 9, 2025  
**Critical Fix Timeline:** 7 days  
**Success Criteria:** 100% of critical issues resolved  
**Validation:** Comprehensive testing and security audit