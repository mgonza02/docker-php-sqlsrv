# Node.js Builder - Generic JavaScript App Builder

A generic Docker setup for building JavaScript applications (React, Vue, Angular, Next.js, etc.) using Node.js 24.

## Structure

- `Dockerfile.builder` - Multi-stage Dockerfile for building JS apps
- `docker-compose.builder.yml` - Docker Compose configuration for easy usage

## Usage

### 1. Setup Your Project

Create a directory structure:
```
node/24/
├── Dockerfile.builder
├── docker-compose.builder.yml
└── app/              # Your JavaScript project goes here
    ├── package.json
    ├── yarn.lock (or package-lock.json)
    └── src/
```

### 2. Place Your App

Copy your JavaScript application into the `app/` directory.

### 3. Build the Image

```bash
docker-compose -f docker-compose.builder.yml build node-builder
```

### 4. Run the Builder

**Option A: Interactive mode (recommended)**
```bash
# Start the container
docker-compose -f docker-compose.builder.yml up -d node-builder

# Install dependencies
docker-compose -f docker-compose.builder.yml exec node-builder yarn install --frozen-lockfile

# Build the app
docker-compose -f docker-compose.builder.yml exec node-builder yarn build

# The build output will be in ./build/ directory
```

**Option B: Automatic build**
Edit `docker-compose.builder.yml` and uncomment the automatic build command:
```yaml
command: sh -c "yarn install --frozen-lockfile --production=false && yarn build"
```

Then run:
```bash
docker-compose -f docker-compose.builder.yml up node-builder
```

### 5. Development Mode

For development with hot-reload:
```bash
docker-compose -f docker-compose.builder.yml up node-dev
```

Access your app at http://localhost:3000

## Environment Variables

You can customize the build with environment variables:

```bash
# In docker-compose.builder.yml
environment:
  - NODE_ENV=production
  - NODE_OPTIONS=--openssl-legacy-provider  # For older React apps
  - GENERATE_SOURCEMAP=false
  - REACT_APP_API_URL=https://api.example.com
```

## Examples

### React App
```bash
cd node/24/app
npx create-react-app .
cd ..
docker-compose -f docker-compose.builder.yml up -d node-builder
docker-compose -f docker-compose.builder.yml exec node-builder yarn build
```

### Next.js App
```bash
cd node/24/app
npx create-next-app@latest .
cd ..
docker-compose -f docker-compose.builder.yml up -d node-builder
docker-compose -f docker-compose.builder.yml exec node-builder yarn build
```

### Vue App
```bash
cd node/24/app
npm init vue@latest .
cd ..
docker-compose -f docker-compose.builder.yml up -d node-builder
docker-compose -f docker-compose.builder.yml exec node-builder yarn build
```

## Customization

### For React Projects with Specific Dependencies

Uncomment the optional dependencies section in `Dockerfile.builder`:
```dockerfile
RUN yarn add --dev \
    web-vitals \
    @babel/eslint-parser \
    # ... other dependencies
```

### Custom Ports

Edit the ports section in `docker-compose.builder.yml`:
```yaml
ports:
  - "8080:3000"  # Map container port 3000 to host port 8080
```

## Volumes

- `node_modules` - Persists installed dependencies
- `./app` - Your source code
- `./build` - Build output (accessible on host)

## Clean Up

```bash
# Stop and remove containers
docker-compose -f docker-compose.builder.yml down

# Remove volumes (this will delete node_modules)
docker-compose -f docker-compose.builder.yml down -v
```

## Tips

1. **Faster builds**: Node modules are cached in a volume, so subsequent builds are faster
2. **Different Node versions**: Change the base image in `Dockerfile.builder` to use different Node versions
3. **Production deployment**: Copy the `./build` directory to your production server or use a multi-stage build with nginx
4. **CI/CD**: Use this setup in your CI/CD pipeline for consistent builds

## Troubleshooting

**Out of memory errors:**
```bash
# Increase Node memory limit
docker-compose -f docker-compose.builder.yml exec node-builder sh
export NODE_OPTIONS="--max-old-space-size=4096"
yarn build
```

**Permission issues:**
```bash
# Fix ownership of build files
sudo chown -R $USER:$USER ./build
```

**Yarn not found:**
The image uses yarn by default. If your project uses npm:
```bash
docker-compose -f docker-compose.builder.yml exec node-builder npm install
docker-compose -f docker-compose.builder.yml exec node-builder npm run build
```
